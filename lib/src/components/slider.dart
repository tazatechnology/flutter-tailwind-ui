import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/slider.dart';
import 'package:flutter_tailwind_ui/src/internal/title_label.dart';

// =============================================================================
// CLASS: TSliderController
// =============================================================================

/// A controller for a [TSlider].
class TSliderController extends ValueNotifier<double> {
  /// Construct a [TSliderController] with the given [initialValue].
  TSliderController({
    required double initialValue,
  }) : super(initialValue);
}

// =============================================================================
// CLASS: TSlider
// =============================================================================

/// A Tailwind inspired slider widget.
class TSlider extends StatefulWidget {
  /// Construct a [TSlider] widget.
  const TSlider({
    this.initialValue,
    this.controller,
    this.enabled = true,
    this.editable = false,
    this.showValueLabels = false,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.onChanged,
    this.thumbColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.disabledThumbColor,
    this.disabledActiveTrackColor,
    this.disabledInactiveTrackColor,
    this.textStyle,
    this.formatter,
    this.tooltipColor,
    this.tooltipBorderColor,
    this.tooltipTextStyle,
    this.labelText,
    this.label,
    this.allowedInteraction,
    this.tooltipFormatter,
    this.autofocus = false,
    this.focusNode,
    super.key,
  })  : assert(
          min <= max,
          'min must be less than or equal to max',
        ),
        assert(
          (initialValue != null) ^ (controller != null),
          'Either initialValue or controller must be specified',
        );

  /// The initial value of the slider.
  final double? initialValue;

  /// The controller for the slider.
  final TSliderController? controller;

  /// Whether the slider is enabled.
  final bool enabled;

  /// Whether the slider should display an input field to edit the value.
  final bool editable;

  /// Whether the slider should display value labels.
  ///
  /// E.g. min, max, and any other value markings.
  final bool showValueLabels;

  /// The minimum value of the slider.
  final double min;

  /// The maximum value of the slider.
  final double max;

  /// The number of discrete divisions.
  final int? divisions;

  /// Called when the user starts selecting a new value for the slider.
  final ValueChanged<double>? onChanged;

  /// The color of the thumb.
  final Color? thumbColor;

  /// The color of the active track.
  final Color? activeTrackColor;

  /// The color of the inactive track.
  final Color? inactiveTrackColor;

  /// The color of the disabled thumb.
  final Color? disabledThumbColor;

  /// The color of the disabled active track.
  final Color? disabledActiveTrackColor;

  /// The color of the disabled inactive track.
  final Color? disabledInactiveTrackColor;

  /// The text style to apply to any slider value related text.
  ///
  /// For example the min, max, and any other value markings.
  final TextStyle? textStyle;

  /// The formatter callback for all slider value labels (e.g min/max).
  ///
  /// If not provided, [XTailwindDouble.autoFormat] is used
  final String Function(double)? formatter;

  /// The color of the value tooltip.
  final Color? tooltipColor;

  /// The color of the value tooltip border
  final Color? tooltipBorderColor;

  /// The text style of the value tooltip label.
  final TextStyle? tooltipTextStyle;

  /// The formatter callback for the slider to set the value tooltip label.
  ///
  /// If not provided, [XTailwindDouble.autoFormat] is used
  final String Function(double)? tooltipFormatter;

  /// The label text to display above the slider.
  ///
  /// For full customization, use [label] to pass in a widget.
  final String? labelText;

  /// The label text to display above the input field.
  final Widget? label;

  /// The allowed interactions for the slider.
  final SliderInteraction? allowedInteraction;

  /// Whether the slider is focused automatically.
  final bool autofocus;

  /// The focus node of the slider.
  final FocusNode? focusNode;

  @override
  State<TSlider> createState() => _TSliderState();
}

class _TSliderState extends State<TSlider> {
  late final TextEditingController inputController;
  late final TSliderController controller;
  late final valueFocusNode = FocusNode();

  /// The value tooltip label.
  String get tooltipLabel {
    return widget.tooltipFormatter?.call(controller.value) ??
        controller.value.autoFormat();
  }

  /// The value represented as a string.
  String get valueString {
    return widget.formatter?.call(controller.value) ??
        controller.value.autoFormat();
  }

  /// The minimum value represented as a string.
  String get minString =>
      widget.formatter?.call(widget.min) ?? widget.min.autoFormat();

  /// The maximum value represented as a string.
  String get maxString =>
      widget.formatter?.call(widget.max) ?? widget.max.autoFormat();

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    if (widget.controller != null) {
      controller = widget.controller!;
    } else {
      controller = TSliderController(initialValue: widget.initialValue!);
    }
    inputController = TextEditingController(text: valueString);
    super.initState();
  }

  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    inputController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged(double value) {
    controller.value = value;
    inputController.text = valueString;
    valueFocusNode.unfocus();
    widget.onChanged?.call(value);
  }

  // ---------------------------------------------------------------------------
  // METHOD: onFieldSubmitted
  // ---------------------------------------------------------------------------

  void onFieldSubmitted(String inputValue) {
    final v = double.tryParse(inputValue);
    if (v != null) {
      final vClamped = v.clamp(widget.min, widget.max);
      if (v != vClamped) {
        inputController.text = vClamped.autoFormat();
      }
      controller.value = vClamped;
      widget.onChanged?.call(vClamped);
    } else {
      inputController.text = valueString;
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    // Resolve the label widget
    Widget? label = widget.label;
    if (label == null && widget.labelText != null) {
      label = Text(widget.labelText!);
    }

    /// The text style for the markings
    final markingTextStyle = const TextStyle(
      fontSize: TFontSize.text_xs,
      height: kTextHeightNone,
      fontWeight: TFontWeight.medium,
    ).merge(widget.textStyle);

    return Theme(
      data: context.theme.copyWith(
        sliderTheme: context.theme.sliderTheme.copyWith(
          thumbColor: widget.thumbColor,
          disabledThumbColor: widget.disabledThumbColor,
          activeTrackColor: widget.activeTrackColor,
          inactiveTrackColor: widget.inactiveTrackColor,
          disabledActiveTrackColor: widget.disabledActiveTrackColor,
          disabledInactiveTrackColor: widget.disabledInactiveTrackColor,
          allowedInteraction: widget.allowedInteraction,
          valueIndicatorTextStyle: context
              .theme.sliderTheme.valueIndicatorTextStyle
              ?.merge(widget.tooltipTextStyle),
          overlayColor: Colors.transparent,
          thumbShape: const TSliderThumbShape(),
          valueIndicatorShape: TSliderValueIndicatorShape(
            color: widget.tooltipColor ?? tw.colors.tooltip,
            borderColor: widget.tooltipBorderColor ?? tw.colors.divider,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null) TLabelDescriptionWidget(label: label),
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, _) {
              // Ensure that the input field is updated when the value changes
              // May happen if a controller is used to update the value
              if (inputController.text != valueString) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    inputController.text = valueString;
                  });
                });
              }

              return Column(
                children: [
                  Slider(
                    mouseCursor: widget.enabled
                        ? SystemMouseCursors.click
                        : SystemMouseCursors.forbidden,
                    value: value,
                    min: widget.min,
                    max: widget.max,
                    divisions: widget.divisions,
                    label: tooltipLabel,
                    semanticFormatterCallback: widget.tooltipFormatter,
                    autofocus: widget.autofocus,
                    focusNode: widget.focusNode,
                    onChanged: widget.enabled ? onChanged : null,
                  ),
                  if (widget.showValueLabels || widget.editable)
                    Padding(
                      padding: TOffset.t8,
                      child: DefaultTextStyle.merge(
                        style: markingTextStyle,
                        child: Row(
                          mainAxisAlignment: widget.showValueLabels
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.center,
                          children: [
                            if (widget.showValueLabels)
                              Flexible(
                                child: _TSliderInput(
                                  readOnly: true,
                                  style: markingTextStyle,
                                  value: minString,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            if (!widget.showValueLabels) const Spacer(),
                            Flexible(
                              child: _TSliderInput(
                                controller: inputController,
                                focusNode: valueFocusNode,
                                readOnly: !widget.enabled || !widget.editable,
                                style: markingTextStyle,
                                textAlign: TextAlign.center,
                                onFieldSubmitted: onFieldSubmitted,
                                onTapOutside: (_) {
                                  inputController.text = valueString;
                                },
                              ),
                            ),
                            if (!widget.showValueLabels) const Spacer(),
                            if (widget.showValueLabels)
                              Flexible(
                                child: _TSliderInput(
                                  readOnly: true,
                                  style: markingTextStyle,
                                  value: maxString,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// CLASS: _TSliderInput
// =============================================================================

class _TSliderInput extends StatelessWidget {
  const _TSliderInput({
    required this.readOnly,
    required this.style,
    this.value = '',
    this.controller,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.textAlign = TextAlign.start,
    this.focusNode,
  });
  final bool readOnly;
  final TextStyle style;
  final String value;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final TapRegionCallback? onTapOutside;
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
        ),
      );
    }
    return TInput(
      borderColor: WidgetStatePropertyAll(tw.colors.divider),
      controller: controller,
      focusNode: focusNode,
      style: style,
      contentPadding: TOffset.y6,
      textAlign: textAlign,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: onTapOutside,
    );
  }
}
