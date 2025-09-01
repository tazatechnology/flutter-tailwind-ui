import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/slider.dart';

// =============================================================================
// CLASS: TGauge
// =============================================================================

/// A Tailwind inspired gauge widget.
class TGauge extends StatefulWidget {
  /// Construct a [TGauge] widget.
  const TGauge({
    super.key,
    this.label,
    this.value,
    this.min = 0.0,
    this.max = 1.0,
    this.showDefaultMarks = false,
    this.textStyle,
    this.formatter,
    this.unsetValue = const Text('- - - -'),
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.disabledActiveTrackColor,
    this.disabledInactiveTrackColor,
    this.disabledThumbColor,
    this.trackShape,
    this.divisions,
    this.indicators = const [],
    this.enabled = true,
  }) : assert(min <= max, 'min must be less than or equal to max');

  /// The color of the active track.
  final Color? activeTrackColor;

  /// The color of the inactive track.
  final Color? inactiveTrackColor;

  /// The color of the disabled active track.
  final Color? disabledActiveTrackColor;

  /// The color of the disabled inactive track.
  final Color? disabledInactiveTrackColor;

  /// The color of the disabled thumb.
  final Color? disabledThumbColor;

  /// The shape of the gauge track.
  final SliderTrackShape? trackShape;

  /// The label text to display above the input field.
  final Widget? label;

  /// The current value of the gauge.
  final double? value;

  /// The minimum value of the gauge.
  final double min;

  /// The maximum value of the gauge.
  final double max;

  /// Whether the gauge should display the default marks (e.g min/max).
  final bool showDefaultMarks;

  /// The text style to apply to any gauge marks.
  final TextStyle? textStyle;

  /// The formatter callback for all gauge value labels (e.g min/max).
  ///
  /// If not provided, [XTailwindDouble.toDisplayString] is used
  final String Function(double)? formatter;

  /// The value to display when the gauge value is unset.
  final Widget unsetValue;

  /// The number of discrete divisions in the gauge.
  final int? divisions;

  /// The indicators to display on the gauge.
  final List<TIndicator> indicators;

  /// Whether the gauge is enabled.
  final bool enabled;

  @override
  State<TGauge> createState() => _TGaugeState();
}

class _TGaugeState extends State<TGauge> {
  /// The value represented as a string.
  String? get valueString {
    if (widget.value == null) {
      return null;
    }
    return widget.formatter?.call(widget.value!) ??
        widget.value!.toDisplayString();
  }

  /// The minimum value represented as a string.
  String get minString =>
      widget.formatter?.call(widget.min) ?? widget.min.toDisplayString();

  /// The maximum value represented as a string.
  String get maxString =>
      widget.formatter?.call(widget.max) ?? widget.max.toDisplayString();

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
  }

  // ---------------------------------------------------------------------------
  // METHOD: didUpdateWidget
  // ---------------------------------------------------------------------------

  @override
  void didUpdateWidget(covariant TGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value ||
        oldWidget.min != widget.min ||
        oldWidget.max != widget.max) {
      setState(() {});
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) TLabelDescription(label: widget.label),
        _AbsorbTapClickOnly(
          child: TSlider(
            key: ValueKey(widget.value),
            allowedInteraction: TSliderInteraction.none,
            min: widget.min,
            max: widget.max,
            enabled: widget.enabled,
            initialValue: widget.value,
            thumbShape: const TInvisibleSliderThumbShape(),
            activeTrackColor: widget.activeTrackColor,
            inactiveTrackColor: widget.inactiveTrackColor,
            disabledActiveTrackColor: widget.disabledActiveTrackColor,
            disabledInactiveTrackColor: widget.disabledInactiveTrackColor,
            disabledThumbColor: widget.disabledThumbColor,
            trackShape:
                widget.trackShape ?? const RectangularSliderTrackShape(),
            divisions: widget.divisions,
            indicators: widget.indicators,
          ),
        ),
        if (widget.showDefaultMarks)
          TSliderMarkings(
            min: minString,
            max: maxString,
            value: valueString,
            unsetValue: widget.unsetValue,
            enabled: true,
            editable: false,
          ),
      ],
    );
  }
}
// =============================================================================
// CLASS: _AbsorbTapClickOnly
// =============================================================================

class _AbsorbTapClickOnly extends StatelessWidget {
  const _AbsorbTapClickOnly({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (_) {},
      onPointerUp: (_) {},
      child: child,
    );
  }
}
