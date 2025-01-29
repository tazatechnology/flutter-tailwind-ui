import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:url_launcher/link.dart';

/// Count the number of capturing groups in a regular expression pattern.
int _countCaptureGroups(String pattern) {
  return RegExp(r'(?<!\\)\((?!\?:)(.*?)\)')
      .allMatches(pattern)
      .map((match) => match.group(1) ?? '')
      .length;
}

/// Unpacks the formatters by expanding each regex pattern into its own formatter.
List<TRichFormatter> _unpack(List<TRichFormatter> formatters) {
  final List<TRichFormatter> effectiveFormatters = [];
  for (final f in formatters) {
    if (f.regex.isEmpty) {
      continue;
    }
    for (final r in f.regex) {
      effectiveFormatters.add(
        TRichFormatter(regex: [r], builder: f.builder, style: f.style),
      );
    }
  }

  return effectiveFormatters;
}

/// Unpack the default formatters once for performance.
List<TRichFormatter> _unpackedDefaultFormatters = List.unmodifiable(
  _unpack(TRichFormatter.defaultFormatters),
);

// =============================================================================
// CLASS: TRichParser
// =============================================================================

/// Text
class TRichParser {
  /// Text
  TRichParser({this.formatters});

  /// Text
  final List<TRichFormatter>? formatters;

  // ---------------------------------------------------------------------------
  // METHOD: parse
  // ---------------------------------------------------------------------------

  /// Parses the text and returns a rich [TextSpan] object.
  TextSpan parse({
    required BuildContext context,
    required String text,
    TextStyle? style,
  }) {
    /// Unpack the default formatters
    final effectiveFormatters = _unpackedDefaultFormatters.toList();

    /// Get the effective formatters by merging the default and user provided
    for (final f in _unpack(formatters ?? <TRichFormatter>[])) {
      // Replace the formatter with matching regex if it already exists
      final index = effectiveFormatters.indexWhere(
        (e) => e.regex.first == f.regex.first,
      );
      if (index != -1) {
        effectiveFormatters[index] = f;
      } else {
        effectiveFormatters.add(f);
      }
    }

    /// Create a regular expression to match all the patterns
    final patterns = effectiveFormatters.map((e) => e.regex[0].pattern);
    final regex = RegExp('(?:${patterns.join('|')})');

    /// Compute the capture group offset once
    final captureGroupOffsets = <int>[];
    for (var ii = 0; ii < effectiveFormatters.length; ii++) {
      captureGroupOffsets.add(
        effectiveFormatters
            .take(ii)
            .fold(0, (acc, e) => acc + _countCaptureGroups(e.regex[0].pattern)),
      );
    }

    return TextSpan(
      children: _parseMatch(
        context: context,
        regex: regex,
        formatters: effectiveFormatters,
        captureGroupOffsets: captureGroupOffsets,
        text: text,
        currentStyle: style,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: _parseMatch
  // ---------------------------------------------------------------------------

  List<InlineSpan> _parseMatch({
    required BuildContext context,
    required RegExp regex,
    required List<TRichFormatter> formatters,
    required List<int> captureGroupOffsets,
    required String text,
    TextStyle? currentStyle,
  }) {
    final style = const TextStyle().merge(currentStyle);

    final spans = <InlineSpan>[];
    int currentIndex = 0;

    text.splitMapJoin(
      regex,
      onMatch: (Match match) {
        for (var ii = 0; ii < formatters.length; ii++) {
          final currentMatch = match.group(1 + captureGroupOffsets[ii]);
          if (currentMatch != null) {
            if (formatters[ii].builder != null) {
              spans.add(
                formatters[ii].builder!(
                  TRichFormatterMatch(
                    context: context,
                    formatters: formatters,
                    text: text,
                    baseStyle: style,
                    formatterMatch: formatters[ii],
                    textMatch: currentMatch,
                  ),
                ),
              );
            } else {
              spans.addAll(
                _parseMatch(
                  regex: regex,
                  formatters: formatters,
                  captureGroupOffsets: captureGroupOffsets,
                  text: currentMatch,
                  context: context,
                  currentStyle: style.merge(formatters[ii].style),
                ),
              );
            }
          }
        }
        currentIndex = match.end;
        return '';
      },
      onNonMatch: (String other) {
        if (currentIndex < text.length) {
          spans.add(TextSpan(text: other, style: style));
        }
        currentIndex = text.length;
        return '';
      },
    );

    return spans;
  }
}

// =============================================================================
// CLASS: TRichBuilderMatch
// =============================================================================

/// A class that represents the context of a text match.
class TRichFormatterMatch {
  /// Creates a [TRichFormatterMatch] object.
  const TRichFormatterMatch({
    required this.context,
    required this.formatters,
    required this.formatterMatch,
    required this.text,
    required this.textMatch,
    required this.baseStyle,
  });

  /// The current build context.
  final BuildContext context;

  /// The composed extensions defined by the wrapping [TText] widget.
  final List<TRichFormatter> formatters;

  /// The custom extensions defined by the wrapping [TText] widget.
  final TRichFormatter formatterMatch;

  /// The entire text of the wrapping [TText] widget.
  final String text;

  /// The text of the current match.
  final String textMatch;

  /// The style defined by the wrapping [TText] widget.
  final TextStyle baseStyle;
}

// =============================================================================
// CLASS: TRichFormatter
// =============================================================================

/// A class that represents a custom extension for [TText]
class TRichFormatter {
  /// Creates a [TRichFormatter] object.
  TRichFormatter({
    required this.regex,
    this.builder,
    this.style,
  });

  /// The regular expressions to match for this formatter.
  final List<RegExp> regex;

  /// A function that builds a [InlineSpan] for the given match.
  final InlineSpan Function(TRichFormatterMatch details)? builder;

  /// The style to use for the text.
  final TextStyle? style;

  /// The default formatters for the [TRichParser.parse] method.
  static List<TRichFormatter> defaultFormatters = List.unmodifiable([
    // Bold
    TRichFormatter(
      regex: [
        RegExp(r'\*\*([^*]+)\*\*'),
        RegExp('__([^_]+)__'),
        RegExp(r'<strong>(.*?)<\/strong>'),
      ],
      style: const TextStyle(fontWeight: TFontWeight.bold),
    ),
    // Italic
    TRichFormatter(
      regex: [
        RegExp('_([^_]+)_'),
        RegExp(r'\*([^*]+)\*'),
        RegExp(r'<em>(.*?)<\/em>'),
      ],
      style: const TextStyle(fontStyle: FontStyle.italic),
    ),
    // Underline
    TRichFormatter(
      regex: [
        RegExp(r'<u>(.*?)<\/u>'),
        RegExp(r'<ins>(.*?)<\/ins>'),
      ],
      style: const TextStyle(decoration: TextDecoration.underline),
    ),
    // Monospace
    TRichFormatter(
      regex: [
        RegExp('``([^`]+)``'),
        RegExp(r'<mono>(.*?)<\/mono>'),
      ],
      style: const TextStyle(fontFamily: TTextStyle.fontFamilyMono),
    ),
    // Code
    TRichFormatter(
      regex: [
        RegExp('`([^`]+)`'),
        RegExp(r'<code>(.*?)<\/code>'),
      ],
      builder: (match) {
        final fontSize = DefaultTextStyle.of(match.context).style.fontSize ??
            TFontSize.text_md;
        return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Container(
            padding: TOffset.x4,
            decoration: BoxDecoration(
              borderRadius: TBorderRadius.rounded_sm,
              color: match.context.tw.light
                  ? const Color(0xfff5f5f5)
                  : const Color(0xff333333),
            ),
            child: Text(
              match.textMatch,
              style: match.baseStyle.copyWith(
                fontSize: fontSize * 0.85,
                fontFamily: TTextStyle.fontFamilyMono,
              ),
            ),
          ),
        );
      },
    ),
    // Link
    TRichFormatter(
      regex: [
        RegExp(r'\[([^\]]+)\]\(([^)]+)\)'),
      ],
      builder: (match) {
        final tw = match.context.tw;
        // Create a regular expression to match for the URL
        final urlRegex = RegExp(
          r'\[' + RegExp.escape(match.textMatch) + r'\]\(([^)]+)\)',
        );
        final urlMatch = urlRegex.firstMatch(match.text);
        Uri? uri;
        if (urlMatch != null) {
          uri = Uri.parse(urlMatch.group(1)!);
        }
        return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Link(
            uri: uri,
            target: kIsWeb ? LinkTarget.blank : LinkTarget.defaultTarget,
            builder: (context, followLink) {
              return InkWell(
                onTap: followLink,
                // Pass to another TRichParser to parse the text inside the link
                child: Text.rich(
                  TRichParser(formatters: match.formatters).parse(
                    context: match.context,
                    text: match.textMatch,
                    style: match.baseStyle.copyWith(
                      color: tw.colors.link,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    ),
  ]);
}
