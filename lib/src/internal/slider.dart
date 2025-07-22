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
// CLASS: TInvisibleSliderThumbShape
// =============================================================================

/// A custom slider thumb shape that is invisible.
class TInvisibleSliderThumbShape extends SliderComponentShape {
  /// Creates an invisible thumb shape.
  const TInvisibleSliderThumbShape({this.radius = 8.0});

  /// The preferred radius of the invisible thumb shape.
  final double radius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
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
    final Canvas canvas = context.canvas;

    // Draw a simple circle with the specified radius
    canvas.drawCircle(
      center,
      radius,
      Paint()..color = Colors.transparent,
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

// =============================================================================
// CLASS: TSliderMarkerPainter
// =============================================================================

/// A custom painter that draws a marker shape for the slider.
class TSliderMarkerPainter extends CustomPainter {
  /// Creates a slider marker painter with a specified color.
  TSliderMarkerPainter({
    this.color = Colors.black,
  });

  /// The color of the marker.
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// =============================================================================
// CLASS: TSliderMarkings
// =============================================================================

/// A widget that displays the minimum, maximum, and current value of a slider.
class TSliderMarkings extends StatelessWidget {
  /// Construct a [TSliderMarkings] widget.
  const TSliderMarkings({
    super.key,
    required this.min,
    required this.max,
    required this.value,
    this.unsetValue = const Text('- - - -'),
    required this.enabled,
    required this.editable,
    this.textStyle,
    this.inputController,
    this.valueFocusNode,
    this.onFieldSubmitted,
    this.showDefaultMarks = true,
  });

  /// The minimum value of the slider.
  final String min;

  /// The maximum value of the slider.
  final String max;

  /// The current value of the slider.
  final String? value;

  /// The value to display when the slider value is unset.
  final Widget unsetValue;

  /// Whether the slider is enabled.
  final bool enabled;

  /// Whether the slider value can be edited.
  final bool editable;

  /// The text style to apply to the markings.
  final TextStyle? textStyle;

  /// The controller for the input field.
  final TextEditingController? inputController;

  /// The focus node for the input field.
  final FocusNode? valueFocusNode;

  /// Callback when the field is submitted.
  final void Function(String)? onFieldSubmitted;

  /// Whether to show the default marks (min/max).
  final bool showDefaultMarks;

  @override
  Widget build(BuildContext context) {
    /// The text style for the markings
    final markingTextStyle = const TextStyle(
      fontSize: TFontSize.text_xs,
      height: kTextHeightNone,
      fontWeight: TFontWeight.medium,
    ).merge(textStyle);

    return Padding(
      padding: TOffset.t8,
      child: DefaultTextStyle.merge(
        style: markingTextStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showDefaultMarks)
              Flexible(
                flex: 2,
                child: _TSliderInput(
                  readOnly: true,
                  style: markingTextStyle,
                  value: min,
                  textAlign: TextAlign.center,
                ),
              ),
            if (!showDefaultMarks) const Spacer(flex: 2),
            if (value != null)
              Flexible(
                flex: 3,
                child: _TSliderInput(
                  controller: inputController,
                  value: value!,
                  focusNode: valueFocusNode,
                  readOnly: !enabled || !editable,
                  style: markingTextStyle,
                  textAlign: TextAlign.center,
                  onFieldSubmitted: onFieldSubmitted,
                  onFocusChange: (hasFocus) {
                    if (!hasFocus) {
                      onFieldSubmitted?.call(inputController?.text ?? '');
                    }
                  },
                ),
              )
            else
              unsetValue,
            if (!showDefaultMarks) const Spacer(flex: 2),
            if (showDefaultMarks)
              Flexible(
                flex: 2,
                child: _TSliderInput(
                  readOnly: true,
                  style: markingTextStyle,
                  value: max,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// CLASS: TSliderInput
// =============================================================================

class _TSliderInput extends StatelessWidget {
  const _TSliderInput({
    required this.readOnly,
    required this.style,
    this.value = '',
    this.controller,
    this.onFieldSubmitted,
    this.onFocusChange,
    this.textAlign = TextAlign.start,
    this.focusNode,
  });
  final bool readOnly;
  final TextStyle style;
  final String value;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final ValueChanged<bool>? onFocusChange;
  final TextAlign textAlign;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    if (readOnly) {
      return Padding(
        padding: TOffset.y6,
        child: Text(
          controller?.text ?? value,
          style: style,
          textAlign: textAlign,
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
      );
    }
    return TInput(
      borderColor: WidgetStatePropertyAll(tw.color.divider),
      controller: controller,
      focusNode: focusNode,
      style: style,
      contentPadding: TOffset.y6,
      textAlign: textAlign,
      onFieldSubmitted: onFieldSubmitted,
      onFocusChange: onFocusChange,
    );
  }
}
