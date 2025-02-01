import 'package:flutter/material.dart';

// =============================================================================
// CLASS: TSlider
// =============================================================================

/// A Tailwind inspired slider widget.
class TSlider extends StatefulWidget {
  /// Construct a [TSlider] widget.
  const TSlider({
    this.value,
    this.min = 0.0,
    this.max = 1.0,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.labelText,
    this.label,
    super.key,
  }) : assert(
          min <= max,
          'min must be less than or equal to max',
        );

  /// The initial value of the slider.
  final double? value;

  /// The minimum value of the slider.
  final double min;

  /// The maximum value of the slider.
  final double max;

  /// Called when the user starts selecting a new value for the slider.
  final ValueChanged<double>? onChanged;

  /// The color of the active track.
  final Color? activeColor;

  /// The color of the inactive track.
  final Color? inactiveColor;

  /// The color of the thumb.
  final Color? thumbColor;

  /// The label text to display above the slider.
  ///
  /// For full customization, use [label] to pass in a widget.
  final String? labelText;

  /// The label text to display above the input field.
  final Widget? label;

  @override
  State<TSlider> createState() => _TSliderState();
}

class _TSliderState extends State<TSlider> {
  late double value;

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    value = widget.value ?? (widget.min + widget.max) / 2;
    super.initState();
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    // Resolve the label widget
    Widget? label = widget.label;
    if (label == null && widget.labelText != null) {
      label = Text(widget.labelText!);
    }

    return Column(
      children: [
        Slider(
          value: value,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          thumbColor: widget.thumbColor,
          activeColor: widget.activeColor,
          inactiveColor: widget.inactiveColor,
          onChanged: (value) {
            setState(() {
              this.value = value;
              widget.onChanged?.call(value);
            });
          },
        ),
      ],
    );
  }
}
