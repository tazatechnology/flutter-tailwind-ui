import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:url_launcher/link.dart';

final _captureGroupsRegExp = RegExp(r'(?<!\\)\((?!\?:)(.*?)\)');

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
    /// Start with the globally defined builders in the Tailwind theme
    final effectiveFormatters = context.tw.text.richFormatters.toList();

    /// Get the effective extensions by merging the global and local builders
    if (formatters != null) {
      for (final ext in formatters ?? <TRichFormatter>[]) {
        final index =
            effectiveFormatters.indexWhere((e) => e.regex == ext.regex);
        if (index != -1) {
          effectiveFormatters[index] = ext;
        } else {
          effectiveFormatters.add(ext);
        }
      }
    }

    /// Create a regular expression to match all the patterns
    final patterns = effectiveFormatters.map((e) => e.regex.pattern);
    final regex = RegExp('(?:${patterns.join('|')})');

    /// Compute the capture group offset once
    final captureGroupOffsets = <int>[];
    for (var ii = 0; ii < effectiveFormatters.length; ii++) {
      captureGroupOffsets.add(
        effectiveFormatters.take(ii).fold(0, (acc, e) => acc + e.captureGroups),
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
  }) {
    // Count the number of capturing groups in the regular expression
    captureGroups = _captureGroupsRegExp
        .allMatches(regex.pattern)
        .map((match) => match.group(1) ?? '')
        .length;
  }

  /// The regular expression to match custom patterns in the text.
  final RegExp regex;

  /// A function that builds a [InlineSpan] for the given match.
  final InlineSpan Function(TRichFormatterMatch details)? builder;

  /// The style to use for the text.
  final TextStyle? style;

  /// The total number of capturing groups in the regular expression.
  late final int captureGroups;

  /// The default formatters for the [TRichParser.parse] method.
  static List<TRichFormatter> defaultFormatters = List.unmodifiable([
    // Bold: **text**
    TRichFormatter(
      regex: RegExp(r'\*\*([^*]+)\*\*'),
      style: const TextStyle(fontWeight: TFontWeight.bold),
    ),
    TRichFormatter(
      regex: RegExp('__([^_]+)__'),
      style: const TextStyle(fontWeight: TFontWeight.bold),
    ),
    // Italic: _text_
    TRichFormatter(
      regex: RegExp('_([^_]+)_'),
      style: const TextStyle(fontStyle: FontStyle.italic),
    ),
    TRichFormatter(
      regex: RegExp(r'\*([^*]+)\*'),
      style: const TextStyle(fontStyle: FontStyle.italic),
    ),
    // Monospace: ``text``
    TRichFormatter(
      regex: RegExp('``([^`]+)``'),
      // Use a builder so that context can be used to look up the monospace font
      builder: (match) {
        return TRichParser(formatters: match.formatters).parse(
          context: match.context,
          text: match.textMatch,
          style: match.baseStyle.copyWith(
            fontFamily: match.context.tw.text.fontFamilyMono,
            height: TLineHeight.normal,
          ),
        );
      },
    ),
    // Code: `text`
    TRichFormatter(
      regex: RegExp('`([^`]+)`'),
      builder: (match) {
        final context = match.context;
        final tw = context.tw;
        final backgroundColor =
            tw.light ? const Color(0xfff5f5f5) : const Color(0xff333333);
        final fontSize = match.baseStyle.fontSize ?? TFontSize.text_md;
        final codeSpan = TRichParser(formatters: match.formatters).parse(
          context: match.context,
          text: match.textMatch,
          style: match.baseStyle.copyWith(
            fontSize: fontSize,
            fontFamily: tw.text.fontFamilyMono,
            height: TLineHeight.none,
          ),
        );

        return WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: TOffset.x2,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: TBorderRadius.rounded_sm,
                ),
                // Hidden span to align span with surrounding text
                child: Text.rich(
                  codeSpan,
                  style: const TextStyle(color: Colors.transparent),
                ),
              ),
              // Overlay the formatted code span with smaller font size
              SelectionContainer.disabled(
                child: Text.rich(
                  codeSpan,
                  textScaler: const TextScaler.linear(0.85),
                ),
              ),
            ],
          ),
        );
      },
    ),
    // Link: [text](url)
    TRichFormatter(
      regex: RegExp(r'\[([^\]]+)\]\(([^)]+)\)'),
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
                      height: TLineHeight.none,
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
