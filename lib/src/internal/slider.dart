import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TSliderThumbShape
// =============================================================================

/// The default shape of a [Slider]'s thumb.
class TSliderThumbShape extends SliderComponentShape {
  /// Create a slider thumb that draws a circle.
  const TSliderThumbShape({
    this.enabledThumbRadius = 8.0,
    this.disabledThumbRadius = 8.0,
  });

  /// The preferred radius of the round thumb shape when the slider is enabled.
  final double enabledThumbRadius;

  /// The preferred radius of the round thumb shape when the slider is disabled.
  final double disabledThumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
      isEnabled ? enabledThumbRadius : disabledThumbRadius,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    assert(
      sliderTheme.disabledThumbColor != null,
      'The disabledThumbColor must be provided',
    );
    assert(
      sliderTheme.thumbColor != null,
      'The thumbColor must be provided',
    );

    final Canvas canvas = context.canvas;

    const borderStrokeWidth = 2.0;

    // Define tweens to smoothly animate between disabled and enabled states.
    final Tween<double> radiusTween = Tween<double>(
      begin: disabledThumbRadius - borderStrokeWidth / 2,
      end: enabledThumbRadius - borderStrokeWidth / 2,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    // Get the current color and radius based on the animation value.
    final Color borderColor = colorTween.evaluate(enableAnimation)!;
    final double radius = radiusTween.evaluate(enableAnimation);

    // 1) Draw a white-filled circle.
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = Colors.white,
    );

    // 2) Draw a stroked circle on top as the border.
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3, // Adjust the stroke width as needed.
    );
  }
}

// =============================================================================
// CLASS: TSliderValueIndicatorShape
// =============================================================================

/// A custom slider value indicator shape
class TSliderValueIndicatorShape extends SliderComponentShape {
  /// Creates a slider value indicator that draws a rounded rectangle.
  const TSliderValueIndicatorShape({
    this.radius = TRadius.rounded_md,
    this.verticalOffset = TSpace.v28,
    this.color,
    this.borderColor,
  });

  /// The corner radius of the rounded rectangle.
  final double radius;

  /// How many pixels to shift the value indicator upwards (or downwards).
  ///
  /// Positive values move it upwards; negative values move it downward.
  final double verticalOffset;

  /// The color of the value indicator.
  final Color? color;

  /// The border color of the value indicator.
  final Color? borderColor;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    // Determines the size of the value indicator’s “hit box.”
    // This can be tweaked based on your design.
    return const Size(TSpace.v80, TSpace.v32);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    // Obtain the canvas to draw on.
    final Canvas canvas = context.canvas;

    /// Determine the indicator color
    final Color indicatorColor =
        color ?? sliderTheme.valueIndicatorColor ?? Colors.black;

    // Shift the center upwards by [verticalOffset].
    // If you want to move the shape downward, pass a negative value.
    final Offset shapeCenter = center - Offset(0, verticalOffset);

    // The shape’s total width/height can be based on the label’s size
    // plus any padding you want around it.
    const double padding = 8;
    final double halfWidth = (labelPainter.width + padding * 2) / 2;
    final double halfHeight = (labelPainter.height + padding) / 2;

    final Rect rect = Rect.fromCenter(
      center: shapeCenter,
      width: halfWidth * 2,
      height: halfHeight * 2,
    );

    // Apply corner rounding.
    final RRect rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(radius),
    );

    // Draw the rounded shape with the animated color (fade in/out).
    final Paint paint = Paint()..color = indicatorColor;
    canvas.drawRRect(rRect, paint);

    // Draw the border around the shape.
    final Paint borderPaint = Paint()
      ..color = borderColor ?? indicatorColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawRRect(rRect, borderPaint);

    // Paint the text (the slider's value).
    // We want to center it within our shape.
    final Offset textOffset = Offset(
      shapeCenter.dx - (labelPainter.width / 2),
      shapeCenter.dy - (labelPainter.height / 2),
    );
    labelPainter.paint(canvas, textOffset);
  }
}
