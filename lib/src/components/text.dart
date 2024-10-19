import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

/// A widget that renders text with basic markdown-like formatting.
///
/// The supported markdown elements are:
/// - Bold: `*text*`
/// - Italic: `_text_`
/// - Code: `` `text` ``
/// - Link: `[text](url)`
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
    this.maxLines,
    this.locale,
    this.overflow = TextOverflow.clip,
    this.textScaler = TextScaler.noScaling,
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

  /// The number of lines the text should span.
  final int? maxLines;

  /// An optional object that provides semantics information about the text.
  final Locale? locale;

  /// How overflowing text should be handled.
  final TextOverflow overflow;

  /// The text scaling factor.
  final TextScaler textScaler;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      _parse(data, context),
      textAlign: textAlign,
      textDirection: textDirection,
      strutStyle: strutStyle,
      softWrap: softWrap,
      maxLines: maxLines,
      locale: locale,
      textScaler: textScaler,
      overflow: overflow,
    );
  }

  /// Parses the given [text] and returns a formatted [TextSpan]
  TextSpan _parse(String text, BuildContext context) {
    final tw = context.tw;
    final baseStyle = style ?? DefaultTextStyle.of(context).style;
    final baseFontSize = baseStyle.fontSize ?? tw.text.style_md.fontSize ?? 16;

    // Regex to match **bold**, _italic_, `code`, and [text](url)
    final exp = RegExp(
      r'(\*\*([^*]+)\*\*|_([^_]+)_|`([^`]+)`|\[(.*?)\]\((.*?)\))',
    );

    // Recursive function to parse each match
    List<InlineSpan> parseWithStyles(String text, TextStyle currentStyle) {
      final spans = <InlineSpan>[];
      var currentIndex = 0;

      text.splitMapJoin(
        exp,
        onMatch: (Match match) {
          if (match.start > currentIndex) {
            spans.add(
              TextSpan(
                text: text.substring(currentIndex, match.start),
                style: currentStyle,
              ),
            );
          }

          if (match.group(2) != null) {
            // Bold: **text**
            spans.addAll(parseWithStyles(match.group(2)!, currentStyle.bold));
          } else if (match.group(3) != null) {
            // Italic: _text_
            spans.addAll(parseWithStyles(match.group(3)!, currentStyle.italic));
          } else if (match.group(4) != null) {
            // Code: `text`
            spans.add(
              WidgetSpan(
                alignment: PlaceholderAlignment.top,
                child: Container(
                  padding: TOffset.x4,
                  decoration: BoxDecoration(
                    color: tw.light
                        ? Colors.black.withOpacity(0.05)
                        : Colors.white.withOpacity(0.1),
                    borderRadius: TBorderRadius.rounded,
                  ),
                  child: Text(
                    match.group(4)!,
                    style: currentStyle.merge(
                      TextStyle(
                        // accounts for background padding
                        fontSize: baseFontSize - 2,
                        fontFamily: TailwindTheme.fontFamilyMono,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (match.group(5) != null && match.group(6) != null) {
            // Link: [text](url)
            spans.add(
              TextSpan(
                text: match.group(5),
                style: currentStyle.merge(
                  const TextStyle(color: TColors.sky),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // navigate to URL
                  },
                mouseCursor: SystemMouseCursors.click,
              ),
            );
          }

          currentIndex = match.end;
          return '';
        },
        onNonMatch: (String remaining) {
          if (currentIndex < text.length) {
            spans.add(TextSpan(text: remaining, style: currentStyle));
          }
          currentIndex = text.length;
          return '';
        },
      );

      return spans;
    }

    return TextSpan(
      children: parseWithStyles(text, baseStyle),
      style: baseStyle,
    );
  }
}
