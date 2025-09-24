import 'package:flutter/material.dart';

// =============================================================================
// EXTENSION: TextStyle
// =============================================================================

/// Extension methods for the [TextStyle] class
extension XTailwindTextStyle on TextStyle {
  /// Method to copy this [TextStyle] without a given property
  TextStyle copyWithout({
    bool color = false,
    bool backgroundColor = false,
    bool fontSize = false,
    bool fontWeight = false,
    bool fontStyle = false,
    bool letterSpacing = false,
    bool wordSpacing = false,
    bool textBaseline = false,
    bool removeHeight = false,
    bool locale = false,
    bool foreground = false,
    bool removeBackground = false,
    bool removeShadows = false,
    bool fontFeatures = false,
    bool decoration = false,
    bool decorationColor = false,
    bool decorationStyle = false,
    bool decorationThickness = false,
    bool debugLabel = false,
    bool overflow = false,
  }) {
    return TextStyle(
      color: color ? null : this.color,
      backgroundColor: backgroundColor ? null : this.backgroundColor,
      fontSize: fontSize ? null : this.fontSize,
      fontWeight: fontWeight ? null : this.fontWeight,
      fontStyle: fontStyle ? null : this.fontStyle,
      letterSpacing: letterSpacing ? null : this.letterSpacing,
      wordSpacing: wordSpacing ? null : this.wordSpacing,
      textBaseline: textBaseline ? null : this.textBaseline,
      height: removeHeight ? null : height,
      locale: locale ? null : this.locale,
      foreground: foreground ? null : this.foreground,
      background: removeBackground ? null : background,
      shadows: removeShadows ? null : shadows,
      fontFeatures: fontFeatures ? null : this.fontFeatures,
      decoration: decoration ? null : this.decoration,
      decorationColor: decorationColor ? null : this.decorationColor,
      decorationStyle: decorationStyle ? null : this.decorationStyle,
      decorationThickness: decorationThickness
          ? null
          : this.decorationThickness,
      debugLabel: debugLabel ? null : this.debugLabel,
      overflow: overflow ? null : this.overflow,
    );
  }

  /// Estimate the total rendered text height for this [TextStyle]
  double estimateHeight(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(text: 'Text', style: this),
      textDirection: Directionality.of(context),
    );
    textPainter.layout();
    return textPainter.size.height;
  }
}
