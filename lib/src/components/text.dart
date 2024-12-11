import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TText
// =============================================================================

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
    this.builders,
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

  /// Custom builders to pass to the [TRichParser].
  final List<TRichBuilder>? builders;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TRichParser(builders: builders).parse(
        context: context,
        text: data,
        style: style,
      ),
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
}
