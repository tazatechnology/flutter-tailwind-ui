import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:url_launcher/link.dart';

/// A function that builds a [InlineSpan] for the given match.
typedef TTextBuilder = InlineSpan Function(String match, TextStyle style);

// =================================================
// CLASS: TText
// =================================================

/// A widget that renders text with markdown rich formatting.
///
/// Under the hood, [TText] uses the [Text.rich] widget to render text with
/// predefined [RegExp] patterns for various markdown elements.
///
/// The supported markdown elements are:
/// - Bold: `**text**` or `__text__`
/// - Italic: `_text_` or `*text*`
/// - Code: `` `text` ``
/// - Link: `[text](url)`
///
/// For more details on the supported markdown elements:
///
/// https://www.markdownguide.org/basic-syntax
class TText extends StatelessWidget {
  /// Creates a [TText] widget.
  ///
  /// The [data] parameter must not be null.
  const TText(
    this.data, {
    this.style,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.strutStyle,
    this.softWrap = true,
    this.locale,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.extensions = const [],
    super.key,
  });

  /// The text to be displayed, which may contain markdown-like syntax.
  final String data;

  /// The style to use for the text.
  ///
  /// If no style is provided, the default text style will be used.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// The strut style to use for the text.
  final StrutStyle? strutStyle;

  /// Whether the text should break at soft line breaks.
  final bool softWrap;

  /// An optional object that provides semantics information about the text.
  final Locale? locale;

  /// How overflowing text should be handled.
  final TextOverflow? overflow;

  /// The text scaling factor.
  final TextScaler? textScaler;

  /// The number of lines the text should span.
  final int? maxLines;

  /// The semantic label for the text.
  final String? semanticsLabel;

  /// The width basis for the text.
  final TextWidthBasis? textWidthBasis;

  /// The height behavior for the text.
  final TextHeightBehavior? textHeightBehavior;

  /// The color to use when painting the selection.
  final Color? selectionColor;

  /// Custom extensions to parse the text.
  final List<TTextExtension> extensions;

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      _parse(text: data, context: context),
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }

  // -------------------------------------------------
  // METHOD: _getExtensions
  // -------------------------------------------------

  List<TTextExtension> _getExtensions() {
    final userRegexExp = extensions.map((e) => e.regex);
    final regExBold1 = RegExp(r'\*\*([^*]+)\*\*');
    final regExBold2 = RegExp('__([^_]+)__');
    final regExItalic1 = RegExp('_([^_]+)_');
    final regExItalic2 = RegExp(r'\*([^*]+)\*');
    final regExCode = RegExp('`([^`]+)`');
    final regExLink = RegExp(r'\[([^\]]+)\]\(([^)]+)\)');
    return [
      /// Bold: **text**
      if (!userRegexExp.contains(regExBold1))
        TTextExtension(
          regex: regExBold1,
          style: const TextStyle().bold,
        ),
      if (!userRegexExp.contains(regExBold2))
        TTextExtension(
          regex: regExBold2,
          style: const TextStyle().bold,
        ),

      /// Italic: _text_
      if (!userRegexExp.contains(regExItalic1))
        TTextExtension(
          regex: regExItalic1,
          style: const TextStyle().italic,
        ),
      if (!userRegexExp.contains(regExItalic2))
        TTextExtension(
          regex: regExItalic2,
          style: const TextStyle().italic,
        ),

      /// Code: `text`
      if (!userRegexExp.contains(regExCode))
        TTextExtension(
          regex: regExCode,
          builder: (details) {
            final tw = details.context.tw;
            final baseFontSize =
                details.style.fontSize ?? tw.text.style_md.fontSize ?? 16;
            return WidgetSpan(
              child: Container(
                padding: TOffset.x4,
                decoration: BoxDecoration(
                  color: tw.light
                      ? Colors.black.withOpacity(0.05)
                      : Colors.white.withOpacity(0.1),
                  borderRadius: TBorderRadius.rounded,
                ),
                // Pass to another TText widget to parse any nested patterns
                child: TText(
                  details.textMatch,
                  // Scale text down to line up with surrounding text
                  extensions: _getExtensions(),
                  textScaler: const TextScaler.linear(0.85),
                  style: details.style.mono(details.context).copyWith(
                        height: 1.5,
                        fontSize: baseFontSize,
                      ),
                ),
              ),
            );
          },
        ),

      /// Link: [text](url)
      if (!userRegexExp.contains(regExLink))
        TTextExtension(
          regex: regExLink,
          builder: (details) {
            final tw = details.context.tw;

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
                    child: TText(
                      details.textMatch,
                      extensions: _getExtensions(),
                      style: details.style
                          .copyWith(color: tw.colors.link, height: 0),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ...extensions,
    ];
  }

  // -------------------------------------------------
  // METHOD: _parse
  // -------------------------------------------------

  TextSpan _parse({
    required String text,
    required BuildContext context,
  }) {
    final effectiveExtensions = _getExtensions();
    final patterns = effectiveExtensions.map((e) => e.regex.pattern);
    final regex = RegExp('(${patterns.join('|')})');
    return TextSpan(
      children: _parseMatch(
        context: context,
        regex: regex,
        effectiveExtensions: effectiveExtensions,
        text: text,
      ),
    );
  }

  // -------------------------------------------------
  // METHOD: _parseMatch
  // -------------------------------------------------

  List<InlineSpan> _parseMatch({
    required BuildContext context,
    required RegExp regex,
    required List<TTextExtension> effectiveExtensions,
    required String text,
    TextStyle? currentStyle,
  }) {
    final style =
        (this.style ?? DefaultTextStyle.of(context).style).merge(currentStyle);

    final spans = <InlineSpan>[];
    int currentIndex = 0;

    text.splitMapJoin(
      regex,
      onMatch: (Match match) {
        for (var ii = 0; ii < effectiveExtensions.length; ii++) {
          final matchIndex = (2 + ii).clamp(0, match.groupCount);
          final currentMatch = match.group(matchIndex);
          if (currentMatch != null) {
            if (effectiveExtensions[ii].builder != null) {
              spans.add(
                effectiveExtensions[ii].builder!(
                  TTextMatchDetails(
                    context: context,
                    extensions: effectiveExtensions,
                    text: text,
                    style: style,
                    extensionMatch: effectiveExtensions[ii],
                    textMatch: currentMatch,
                  ),
                ),
              );
            } else {
              spans.addAll(
                _parseMatch(
                  regex: regex,
                  effectiveExtensions: effectiveExtensions,
                  text: currentMatch,
                  context: context,
                  currentStyle: style.merge(effectiveExtensions[ii].style),
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

// =================================================
// CLASS: TTextExtension
// =================================================

/// A class that represents a custom extension for [TText]
class TTextExtension {
  /// Creates a [TTextExtension] object.
  const TTextExtension({
    required this.regex,
    this.builder,
    this.style,
  });

  /// The regular expression to match custom patterns in the text.
  final RegExp regex;

  /// A function that builds a [InlineSpan] for the given match.
  final InlineSpan Function(TTextMatchDetails details)? builder;

  /// The style to use for the text.
  final TextStyle? style;
}

// =================================================
// CLASS: TTextMatchDetails
// =================================================

/// A class that represents the context of a text match.
class TTextMatchDetails {
  /// Creates a [TTextMatchDetails] object.
  const TTextMatchDetails({
    required this.context,
    required this.extensions,
    required this.extensionMatch,
    required this.text,
    required this.textMatch,
    required this.style,
  });

  /// The current build context.
  final BuildContext context;

  /// The composed extensions defined by the wrapping [TText] widget.
  final List<TTextExtension> extensions;

  /// The custom extensions defined by the wrapping [TText] widget.
  final TTextExtension extensionMatch;

  /// The entire text of the wrapping [TText] widget.
  final String text;

  /// The text of the current match.
  final String textMatch;

  /// The style defined by the wrapping [TText] widget.
  final TextStyle style;
}
