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
    final baseFontSize = baseStyle.fontSize ?? tw.text_base.fontSize ?? 16;
    final exp = RegExp(r'\*([^*]+)\*|_([^_]+)_|`([^`]+)`|\[(.*?)\]\((.*?)\)');
    final children = <InlineSpan>[];
    var currentIndex = 0;

    text.splitMapJoin(
      exp,
      onMatch: (Match match) {
        if (match.start > currentIndex) {
          children.add(
            TextSpan(
              text: text.substring(currentIndex, match.start),
              style: baseStyle,
            ),
          );
        }

        if (match.group(1) != null) {
          // Bold: *text*
          children.add(TextSpan(text: match.group(1), style: baseStyle.bold));
        } else if (match.group(2) != null) {
          // Italic: _text_
          children.add(TextSpan(text: match.group(2), style: baseStyle.italic));
        } else if (match.group(3) != null) {
          // Code: `text`
          children.add(
            WidgetSpan(
              child: Container(
                padding: TOffset.x4,
                decoration: BoxDecoration(
                  color: tw.light
                      ? context.theme.scaffoldBackgroundColor.darken()
                      : context.theme.scaffoldBackgroundColor.lighten(),
                  borderRadius: TBorderRadius.rounded,
                ),
                child: Text(
                  match.group(3)!,
                  style: baseStyle.merge(
                    TextStyle(
                      fontSize: baseFontSize - 2, // accounts for line height
                      fontFamily: TailwindTheme.fontFamilyMono,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (match.group(4) != null && match.group(5) != null) {
          // Link: [text](url)
          children.add(
            TextSpan(
              text: match.group(4),
              style: baseStyle.merge(
                const TextStyle(color: TColors.sky).underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // print("Click LINK");
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
          children.add(TextSpan(text: remaining, style: baseStyle));
        }
        currentIndex = text.length;
        return '';
      },
    );

    return TextSpan(children: children, style: baseStyle);
  }
}
