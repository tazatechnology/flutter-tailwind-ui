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
class TSlider extends TFormField<double> {
  /// Construct a [TSlider] widget.
  TSlider({
    this.activeTrackColor,
    this.allowedInteraction,
    this.autofocus = false,
    this.autovalidateMode,
    this.controller,
    this.disabledActiveTrackColor,
    this.disabledInactiveTrackColor,
    this.disabledThumbColor,
    this.divisions,
    this.editable = false,
    this.enabled = true,
    this.focusNode,
    this.formatter,
    Object? id,
    this.inactiveTrackColor,
    this.initialValue,
    super.key,
    this.label,
    this.labelText,
    this.max = 1.0,
    this.min = 0.0,
    this.onChanged,
    this.restorationId,
    this.showValueLabels = false,
    this.textStyle,
    this.thumbColor,
    this.tooltipBorderColor,
    this.tooltipColor,
    this.tooltipFormatter,
    this.tooltipTextStyle,
    this.validator,
  })  : assert(
          min <= max,
          'min must be less than or equal to max',
        ),
        assert(
          (initialValue != null) ^ (controller != null),
          'Either initialValue or controller must be specified',
        ),
        super(
          id: id ?? 'TSlider',
          child: _TSliderFormField(
            activeTrackColor: activeTrackColor,
            allowedInteraction: allowedInteraction,
            autofocus: autofocus,
            autovalidateMode: autovalidateMode,
            controller: controller,
            disabledActiveTrackColor: disabledActiveTrackColor,
            disabledInactiveTrackColor: disabledInactiveTrackColor,
            disabledThumbColor: disabledThumbColor,
            divisions: divisions,
            editable: editable,
            enabled: enabled,
            focusNode: focusNode,
            formatter: formatter,
            initialValue: initialValue,
            inactiveTrackColor: inactiveTrackColor,
            label: label,
            labelText: labelText,
            max: max,
            min: min,
            onChanged: onChanged,
            restorationId: restorationId,
            showValueLabels: showValueLabels,
            textStyle: textStyle,
            thumbColor: thumbColor,
            tooltipBorderColor: tooltipBorderColor,
            tooltipColor: tooltipColor,
            tooltipFormatter: tooltipFormatter,
            tooltipTextStyle: tooltipTextStyle,
            validator: validator,
          ),
        );

  /// The allowed interactions for the slider.
  final SliderInteraction? allowedInteraction;

  /// The color of the active track.
  final Color? activeTrackColor;

  /// Whether the slider is focused automatically.
  final bool autofocus;

  /// The autovalidate mode to use for the select widget
  final AutovalidateMode? autovalidateMode;

  /// The controller for the slider.
  final TSliderController? controller;

  /// The color of the disabled active track.
  final Color? disabledActiveTrackColor;

  /// The color of the disabled inactive track.
  final Color? disabledInactiveTrackColor;

  /// The color of the disabled thumb.
  final Color? disabledThumbColor;

  /// The number of discrete divisions.
  final int? divisions;

  /// Whether the slider should display an input field to edit the value.
  final bool editable;

  /// Whether the select widget is enabled
  final bool enabled;

  /// The focus node of the slider.
  final FocusNode? focusNode;

  /// The formatter callback for all slider value labels (e.g min/max).
  ///
  /// If not provided, [XTailwindDouble.autoFormat] is used
  final String Function(double)? formatter;

  /// The initial value of the select widget
  final double? initialValue;

  /// The color of the inactive track.
  final Color? inactiveTrackColor;

  /// The label text to display above the input field.
  final Widget? label;

  /// The label text to display above the slider.
  ///
  /// For full customization, use [label] to pass in a widget.
  final String? labelText;

  /// The maximum value of the slider.
  final double max;

  /// The minimum value of the slider.
  final double min;

  /// Called when the user starts selecting a new value for the slider.
  final ValueChanged<double>? onChanged;

  /// The restoration ID to save and restore the state of the select widget
  final String? restorationId;

  /// Whether the slider should display value labels.
  ///
  /// E.g. min, max, and any other value markings.
  final bool showValueLabels;

  /// The text style to apply to any slider value related text.
  ///
  /// For example the min, max, and any other value markings.
  final TextStyle? textStyle;

  /// The color of the thumb.
  final Color? thumbColor;

  /// The color of the value tooltip border
  final Color? tooltipBorderColor;

  /// The color of the value tooltip.
  final Color? tooltipColor;

  /// The formatter callback for the slider to set the value tooltip label.
  ///
  /// If not provided, [XTailwindDouble.autoFormat] is used
  final String Function(double)? tooltipFormatter;

  /// The text style of the value tooltip label.
  final TextStyle? tooltipTextStyle;

  /// The validator to use for the select widget
  final FormFieldValidator<double>? validator;
}

// =============================================================================
// CLASS: _TSliderFormField
// =============================================================================

class _TSliderFormField extends FormField<double> {
  _TSliderFormField({
    required this.activeTrackColor,
    required this.allowedInteraction,
    required this.autofocus,
    required super.autovalidateMode,
    required this.controller,
    required this.disabledActiveTrackColor,
    required this.disabledInactiveTrackColor,
    required this.disabledThumbColor,
    required this.divisions,
    required super.enabled,
    required this.editable,
    required this.focusNode,
    required this.formatter,
    required super.initialValue,
    required this.inactiveTrackColor,
    required this.label,
    required this.labelText,
    required this.max,
    required this.min,
    required this.onChanged,
    required super.restorationId,
    required this.showValueLabels,
    required this.textStyle,
    required this.thumbColor,
    required this.tooltipBorderColor,
    required this.tooltipColor,
    required this.tooltipFormatter,
    required this.tooltipTextStyle,
    required super.validator,
  }) : super(
          builder: (field) => const SizedBox.shrink(),
        );

  final Color? activeTrackColor;
  final SliderInteraction? allowedInteraction;
  final bool autofocus;
  final TSliderController? controller;
  final Color? disabledActiveTrackColor;
  final Color? disabledInactiveTrackColor;
  final Color? disabledThumbColor;
  final int? divisions;
  final bool editable;
  final FocusNode? focusNode;
  final String Function(double)? formatter;
  final Color? inactiveTrackColor;
  final Widget? label;
  final String? labelText;
  final double max;
  final double min;
  final ValueChanged<double>? onChanged;
  final bool showValueLabels;
  final TextStyle? textStyle;
  final Color? thumbColor;
  final Color? tooltipBorderColor;
  final Color? tooltipColor;
  final String Function(double)? tooltipFormatter;
  final TextStyle? tooltipTextStyle;

  @override
  FormFieldState<double> createState() => _TSliderFormFieldState();
}

class _TSliderFormFieldState extends FormFieldState<double> {
  _TSliderFormField get field => widget as _TSliderFormField;

  late final TextEditingController inputController;
  late final TSliderController controller;
  late final valueFocusNode = FocusNode();

  /// The value tooltip label.
  String get tooltipLabel {
    return field.tooltipFormatter?.call(controller.value) ??
        controller.value.autoFormat();
  }

  /// The value represented as a string.
  String get valueString {
    return field.formatter?.call(controller.value) ??
        controller.value.autoFormat();
  }

  /// The minimum value represented as a string.
  String get minString =>
      field.formatter?.call(field.min) ?? field.min.autoFormat();

  /// The maximum value represented as a string.
  String get maxString =>
      field.formatter?.call(field.max) ?? field.max.autoFormat();

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    if (field.controller != null) {
      controller = field.controller!;
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
    if (field.controller == null) {
      controller.dispose();
    }
    inputController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged(double value) {
    didChange(value);
    controller.value = value;
    inputController.text = valueString;
    valueFocusNode.unfocus();
    field.onChanged?.call(value);
  }

  // ---------------------------------------------------------------------------
  // METHOD: onFieldSubmitted
  // ---------------------------------------------------------------------------

  void onFieldSubmitted(String inputValue) {
    final v = double.tryParse(inputValue);
    if (v != null) {
      final vClamped = v.clamp(field.min, field.max);
      if (v != vClamped) {
        inputController.text = vClamped.autoFormat();
      }
      controller.value = vClamped;
      onChanged(vClamped);
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
    Widget? label = field.label;
    if (label == null && field.labelText != null) {
      label = Text(field.labelText!);
    }

    /// The text style for the markings
    final markingTextStyle = const TextStyle(
      fontSize: TFontSize.text_xs,
      height: kTextHeightNone,
      fontWeight: TFontWeight.medium,
    ).merge(field.textStyle);

    return Theme(
      data: context.theme.copyWith(
        sliderTheme: context.theme.sliderTheme.copyWith(
          thumbColor: field.thumbColor,
          disabledThumbColor: field.disabledThumbColor,
          activeTrackColor: field.activeTrackColor,
          inactiveTrackColor: field.inactiveTrackColor,
          disabledActiveTrackColor: field.disabledActiveTrackColor,
          disabledInactiveTrackColor: field.disabledInactiveTrackColor,
          allowedInteraction: field.allowedInteraction,
          valueIndicatorTextStyle: context
              .theme.sliderTheme.valueIndicatorTextStyle
              ?.merge(field.tooltipTextStyle),
          overlayColor: Colors.transparent,
          thumbShape: const TSliderThumbShape(),
          valueIndicatorShape: TSliderValueIndicatorShape(
            color: field.tooltipColor ?? tw.color.tooltip,
            borderColor: field.tooltipBorderColor ?? tw.color.divider,
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
                    min: field.min,
                    max: field.max,
                    divisions: field.divisions,
                    label: tooltipLabel,
                    semanticFormatterCallback: field.tooltipFormatter,
                    autofocus: field.autofocus,
                    focusNode: field.focusNode,
                    onChanged: widget.enabled ? onChanged : null,
                  ),
                  if (field.showValueLabels || field.editable)
                    Padding(
                      padding: TOffset.t8,
                      child: DefaultTextStyle.merge(
                        style: markingTextStyle,
                        child: Row(
                          mainAxisAlignment: field.showValueLabels
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.center,
                          children: [
                            if (field.showValueLabels)
                              Flexible(
                                child: _TSliderInput(
                                  readOnly: true,
                                  style: markingTextStyle,
                                  value: minString,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            if (!field.showValueLabels) const Spacer(),
                            Flexible(
                              child: _TSliderInput(
                                controller: inputController,
                                focusNode: valueFocusNode,
                                readOnly: !widget.enabled || !field.editable,
                                style: markingTextStyle,
                                textAlign: TextAlign.center,
                                onFieldSubmitted: onFieldSubmitted,
                                onTapOutside: (_) {
                                  inputController.text = valueString;
                                },
                              ),
                            ),
                            if (!field.showValueLabels) const Spacer(),
                            if (field.showValueLabels)
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
      borderColor: WidgetStatePropertyAll(tw.color.divider),
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
