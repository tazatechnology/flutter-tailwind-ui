import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:url_launcher/link.dart';

// =============================================================================
// CLASS: TRichParser
// =============================================================================

/// Text
class TRichParser {
  /// Text
  TRichParser({
    this.builders,
  });

  /// Text
  final List<TRichBuilder>? builders;

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
    final effectiveBuilders = context.tw.text.richBuilders.toList();

    /// Get the effective extensions by merging the global and local builders
    if (builders != null) {
      for (final ext in builders ?? <TRichBuilder>[]) {
        final index = effectiveBuilders.indexWhere((e) => e.regex == ext.regex);
        if (index != -1) {
          effectiveBuilders[index] = ext;
        } else {
          effectiveBuilders.add(ext);
        }
      }
    }

    /// Create a regular expression to match all the patterns
    final patterns = effectiveBuilders.map((e) => e.regex.pattern);
    final regex = RegExp('(${patterns.join('|')})');

    return TextSpan(
      children: _parseMatch(
        context: context,
        regex: regex,
        builders: effectiveBuilders,
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
    required List<TRichBuilder> builders,
    required String text,
    TextStyle? currentStyle,
  }) {
    final style = const TextStyle().merge(currentStyle);

    final spans = <InlineSpan>[];
    int currentIndex = 0;

    text.splitMapJoin(
      regex,
      onMatch: (Match match) {
        for (var ii = 0; ii < builders.length; ii++) {
          final matchIndex = (2 + ii).clamp(0, match.groupCount);
          final currentMatch = match.group(matchIndex);
          if (currentMatch != null) {
            if (builders[ii].builder != null) {
              spans.add(
                builders[ii].builder!(
                  TRichBuilderMatch(
                    context: context,
                    builders: builders,
                    text: text,
                    baseStyle: style,
                    builderMatch: builders[ii],
                    textMatch: currentMatch,
                  ),
                ),
              );
            } else {
              spans.addAll(
                _parseMatch(
                  regex: regex,
                  builders: builders,
                  text: currentMatch,
                  context: context,
                  currentStyle: style.merge(builders[ii].style),
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
class TRichBuilderMatch {
  /// Creates a [TRichBuilderMatch] object.
  const TRichBuilderMatch({
    required this.context,
    required this.builders,
    required this.builderMatch,
    required this.text,
    required this.textMatch,
    required this.baseStyle,
  });

  /// The current build context.
  final BuildContext context;

  /// The composed extensions defined by the wrapping [TText] widget.
  final List<TRichBuilder> builders;

  /// The custom extensions defined by the wrapping [TText] widget.
  final TRichBuilder builderMatch;

  /// The entire text of the wrapping [TText] widget.
  final String text;

  /// The text of the current match.
  final String textMatch;

  /// The style defined by the wrapping [TText] widget.
  final TextStyle baseStyle;
}

// =============================================================================
// CLASS: TRichBuilder
// =============================================================================

/// A class that represents a custom extension for [TText]
class TRichBuilder {
  /// Creates a [TRichBuilder] object.
  const TRichBuilder({
    required this.regex,
    this.builder,
    this.style,
  });

  /// The regular expression to match custom patterns in the text.
  final RegExp regex;

  /// A function that builds a [InlineSpan] for the given match.
  final InlineSpan Function(TRichBuilderMatch details)? builder;

  /// The style to use for the text.
  final TextStyle? style;

  /// The default extensions for the [TRichParser.parse] method.
  static List<TRichBuilder> markdown = List.unmodifiable([
    /// Bold: **text**
    TRichBuilder(
      regex: RegExp(r'\*\*([^*]+)\*\*'),
      style: const TextStyle(fontWeight: TFontWeight.bold),
    ),
    TRichBuilder(
      regex: RegExp('__([^_]+)__'),
      style: const TextStyle(fontWeight: TFontWeight.bold),
    ),

    /// Italic: _text_
    TRichBuilder(
      regex: RegExp('_([^_]+)_'),
      style: const TextStyle(fontStyle: FontStyle.italic),
    ),
    TRichBuilder(
      regex: RegExp(r'\*([^*]+)\*'),
      style: const TextStyle(fontStyle: FontStyle.italic),
    ),

    /// Monospace: ``text``
    TRichBuilder(
      regex: RegExp('``([^`]+)``'),
      // Use a builder so that context can be used to look up the monospace font
      // It is possible for a use to define a custom monospace font in the theme
      builder: (details) {
        return TRichParser(builders: details.builders).parse(
          context: details.context,
          text: details.textMatch,
          style: details.baseStyle.copyWith(
            fontFamily: details.context.tw.text.fontFamilyMono,
            height: TLineHeight.normal,
          ),
        );
      },
    ),

    /// Code: `text`
    TRichBuilder(
      regex: RegExp('`([^`]+)`'),
      builder: (details) {
        final context = details.context;
        final tw = context.tw;
        final backgroundColor =
            tw.light ? const Color(0xfff5f5f5) : const Color(0xff333333);
        return WidgetSpan(
          child: Container(
            padding: TOffset.x4,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: TBorderRadius.rounded,
            ),
            // Pass to another TRichParser to parse the text inside the code block
            child: Text.rich(
              TRichParser(builders: details.builders).parse(
                context: details.context,
                text: details.textMatch,
                style: details.baseStyle.copyWith(
                  fontFamily: tw.text.fontFamilyMono,
                  height: 1.5,
                ),
              ),
              textScaler: const TextScaler.linear(0.85),
            ),
          ),
        );
      },
    ),

    /// Link: [text](url)
    TRichBuilder(
      regex: RegExp(r'\[([^\]]+)\]\(([^)]+)\)'),
      builder: (details) {
        final tw = details.context.tw;
        final linkColor = tw.light ? TColors.sky : TColors.sky.shade400;
        // Create a regular expression to match for the URL
        final urlRegex = RegExp(
          r'\[' + RegExp.escape(details.textMatch) + r'\]\(([^)]+)\)',
        );
        final match = urlRegex.firstMatch(details.text);
        Uri? uri;
        if (match != null) {
          uri = Uri.parse(match.group(1)!);
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
                  TRichParser(builders: details.builders).parse(
                    context: details.context,
                    text: details.textMatch,
                    style: details.baseStyle.copyWith(
                      color: linkColor,
                      height: 0,
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
