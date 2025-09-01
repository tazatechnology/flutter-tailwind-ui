import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/slider.dart';

// =============================================================================
// CLASS: TSliderController
// =============================================================================

/// A controller for a [TSlider].
class TSliderController extends ValueNotifier<double> {
  /// Construct a [TSliderController] with the given [initialValue].
  TSliderController({required double initialValue}) : super(initialValue);
}

// =============================================================================
// CLASS: TSliderInteraction
// =============================================================================

/// Possible ways for a user to interact with a [TSlider].
enum TSliderInteraction {
  /// Allows the user to interact with a [TSlider] by tapping or sliding anywhere
  /// on the track.
  ///
  /// Essentially all possible interactions are allowed.
  ///
  /// This is different from [TSliderInteraction.slideOnly] as when you try
  /// to slide anywhere other than the thumb, the thumb will move to the first
  /// point of contact.
  tapAndSlide,

  /// Allows the user to interact with a [TSlider] by only tapping anywhere on
  /// the track.
  ///
  /// Sliding interaction is ignored.
  tapOnly,

  /// Allows the user to interact with a [TSlider] only by sliding anywhere on
  /// the track.
  ///
  /// Tapping interaction is ignored.
  slideOnly,

  /// Allows the user to interact with a [TSlider] only by sliding the thumb.
  ///
  /// Tapping and sliding interactions on the track are ignored.
  slideThumb,

  /// No interaction is allowed.
  none,
}

// =============================================================================
// CLASS: TIndicator
// =============================================================================

/// A simple class to represent an indicator for a slider or gauge.
class TIndicator {
  /// Construct a [TIndicator] with the given [value].
  TIndicator({
    required this.value,
    this.color,
    this.tooltip,
    this.child,
    this.offset = Offset.zero,
  });

  /// The value of the indicator.
  final double? value;

  /// The child widget to display inside the indicator.
  ///
  /// If not provided, the default indicator will be used.
  final Widget? child;

  /// The color of the indicator.
  final Color? color;

  /// The tooltip text to display when hovering over the indicator.
  final String? tooltip;

  /// The offset to apply to the indicator position.
  final Offset offset;

  @override
  String toString() => 'TIndicator(value: $value)';
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
    this.trackShape,
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
    this.max = 1.0,
    this.min = 0.0,
    this.onChanged,
    this.restorationId,
    this.showDefaultMarks = false,
    this.textStyle,
    this.thumbColor,
    this.thumbShape,
    this.valueIndicatorShape,
    this.tooltipBorderColor,
    this.tooltipColor,
    this.tooltipFormatter,
    this.tooltipTextStyle,
    this.validator,
    this.indicators = const [],
  }) : assert(min <= max, 'min must be less than or equal to max'),
       //  assert(
       //    (initialValue != null) ^ (controller != null),
       //    'Either initialValue or controller must be specified',
       //  ),
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
           trackShape: trackShape,
           divisions: divisions,
           editable: editable,
           enabled: enabled,
           focusNode: focusNode,
           formatter: formatter,
           initialValue: initialValue,
           inactiveTrackColor: inactiveTrackColor,
           label: label,
           max: max,
           min: min,
           onChanged: onChanged,
           restorationId: restorationId,
           showDefaultMarks: showDefaultMarks,
           textStyle: textStyle,
           thumbColor: thumbColor,
           thumbShape: thumbShape,
           valueIndicatorShape: valueIndicatorShape,
           tooltipBorderColor: tooltipBorderColor,
           tooltipColor: tooltipColor,
           tooltipFormatter: tooltipFormatter,
           tooltipTextStyle: tooltipTextStyle,
           validator: validator,
           indicators: indicators,
         ),
       );

  /// The allowed interactions for the slider.
  final TSliderInteraction? allowedInteraction;

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

  /// The shape of the slider track.
  final SliderTrackShape? trackShape;

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
  /// If not provided, [XTailwindDouble.toDisplayString] is used
  final String Function(double)? formatter;

  /// The initial value of the select widget
  final double? initialValue;

  /// The color of the inactive track.
  final Color? inactiveTrackColor;

  /// The label text to display above the input field.
  final Widget? label;

  /// The maximum value of the slider.
  final double max;

  /// The minimum value of the slider.
  final double min;

  /// Called when the user starts selecting a new value for the slider.
  final ValueChanged<double>? onChanged;

  /// The restoration ID to save and restore the state of the select widget
  final String? restorationId;

  /// Whether the slider should display the default marks (e.g min/max).
  final bool showDefaultMarks;

  /// The text style to apply to any slider marks.
  final TextStyle? textStyle;

  /// The color of the thumb.
  final Color? thumbColor;

  /// The shape of the slider thumb.
  final SliderComponentShape? thumbShape;

  /// The shape of the value indicator.
  final SliderComponentShape? valueIndicatorShape;

  /// The color of the value tooltip border
  final Color? tooltipBorderColor;

  /// The color of the value tooltip.
  final Color? tooltipColor;

  /// The formatter callback for the slider to set the value tooltip label.
  ///
  /// If not provided, [XTailwindDouble.toDisplayString] is used
  final String Function(double)? tooltipFormatter;

  /// The text style of the value tooltip label.
  final TextStyle? tooltipTextStyle;

  /// The validator to use for the select widget
  final FormFieldValidator<double>? validator;

  /// The list of indicators to display on the slider.
  final List<TIndicator> indicators;
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
    required this.trackShape,
    required this.divisions,
    required super.enabled,
    required this.editable,
    required this.focusNode,
    required this.formatter,
    required super.initialValue,
    required this.inactiveTrackColor,
    required this.label,
    required this.max,
    required this.min,
    required this.onChanged,
    required super.restorationId,
    required this.showDefaultMarks,
    required this.textStyle,
    required this.thumbColor,
    required this.thumbShape,
    required this.valueIndicatorShape,
    required this.tooltipBorderColor,
    required this.tooltipColor,
    required this.tooltipFormatter,
    required this.tooltipTextStyle,
    required super.validator,
    required this.indicators,
  }) : super(
         builder: (field) {
           final state = field as _TSliderFormFieldState;
           return state.buildWidget(state.context);
         },
       );

  final Color? activeTrackColor;
  final TSliderInteraction? allowedInteraction;
  final bool autofocus;
  final TSliderController? controller;
  final Color? disabledActiveTrackColor;
  final Color? disabledInactiveTrackColor;
  final Color? disabledThumbColor;
  final SliderTrackShape? trackShape;
  final int? divisions;
  final bool editable;
  final FocusNode? focusNode;
  final String Function(double)? formatter;
  final Color? inactiveTrackColor;
  final Widget? label;
  final double max;
  final double min;
  final ValueChanged<double>? onChanged;
  final bool showDefaultMarks;
  final TextStyle? textStyle;
  final Color? thumbColor;
  final SliderComponentShape? thumbShape;
  final SliderComponentShape? valueIndicatorShape;
  final Color? tooltipBorderColor;
  final Color? tooltipColor;
  final String Function(double)? tooltipFormatter;
  final TextStyle? tooltipTextStyle;
  final List<TIndicator> indicators;

  @override
  FormFieldState<double> createState() => _TSliderFormFieldState();
}

class _TSliderFormFieldState extends FormFieldState<double> {
  _TSliderFormField get field => widget as _TSliderFormField;
  late final TextEditingController inputController;
  late final TSliderController controller;
  late final valueFocusNode = FocusNode();

  /// Whether user interaction is allowed on the slider.
  late final interactionAllowed =
      field.allowedInteraction != TSliderInteraction.none;

  /// The value tooltip label.
  String get tooltipLabel {
    return field.tooltipFormatter?.call(controller.value) ??
        controller.value.toDisplayString();
  }

  /// The value represented as a string.
  String get valueString {
    return field.formatter?.call(controller.value) ??
        controller.value.toDisplayString();
  }

  /// The minimum value represented as a string.
  String get minString =>
      field.formatter?.call(field.min) ?? field.min.toDisplayString();

  /// The maximum value represented as a string.
  String get maxString =>
      field.formatter?.call(field.max) ?? field.max.toDisplayString();

  /// A safe initial value that is within the min/max range.
  double? get initialValueSafe {
    return widget.initialValue?.clamp(field.min, field.max);
  }

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    if (field.controller != null) {
      controller = field.controller!;
    } else {
      controller = TSliderController(
        initialValue: initialValueSafe ?? field.min,
      );
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
  // METHOD: reset
  // ---------------------------------------------------------------------------

  @override
  void reset() {
    super.reset();
    if (initialValueSafe != null) {
      controller.value = initialValueSafe!;
    }
    inputController.text = valueString;
  }

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged(double value) {
    if (!interactionAllowed) {
      return;
    }
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
    if (!interactionAllowed) {
      return;
    }
    final v = double.tryParse(inputValue);
    if (v != null) {
      final vClamped = v.clamp(field.min, field.max);
      if (v != vClamped) {
        inputController.text = vClamped.toDisplayString();
      }
      controller.value = vClamped;
      onChanged(vClamped);
    } else {
      inputController.text = valueString;
    }
    // Revalidate the values with the actual registered field value
    // Ensures that discrete points are respected
    if (field.divisions != null) {
      final valueDiscretized = discretize(controller.value);
      controller.value = valueDiscretized;
      inputController.text = valueString;
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: discretize
  // ---------------------------------------------------------------------------

  double discretize(double value) {
    if (field.divisions == null) {
      return value;
    }
    final int divisions = field.divisions!;
    return (value * divisions).round() / divisions;
  }

  // ---------------------------------------------------------------------------
  // METHOD: buildWidget
  // ---------------------------------------------------------------------------

  Widget buildWidget(BuildContext context) {
    final tw = context.tw;

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
          trackShape: field.trackShape,
          allowedInteraction:
              field.allowedInteraction == TSliderInteraction.none
              ? null
              : SliderInteraction.values[field.allowedInteraction?.index ?? 0],
          valueIndicatorTextStyle: context
              .theme
              .sliderTheme
              .valueIndicatorTextStyle
              ?.merge(field.tooltipTextStyle),
          overlayColor: Colors.transparent,
          thumbShape: field.thumbShape ?? const TSliderThumbShape(),
          valueIndicatorShape:
              field.valueIndicatorShape ??
              TSliderValueIndicatorShape(
                color: field.tooltipColor ?? tw.color.tooltip,
                borderColor: field.tooltipBorderColor ?? tw.color.divider,
              ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (field.label != null) TLabelDescription(label: field.label),
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

              final slider = Slider(
                mouseCursor: interactionAllowed
                    ? (widget.enabled
                          ? SystemMouseCursors.click
                          : SystemMouseCursors.forbidden)
                    : SystemMouseCursors.basic,
                value: value,
                padding: EdgeInsets.zero,
                min: field.min,
                max: field.max,
                divisions: field.divisions,
                label: interactionAllowed ? tooltipLabel : null,
                semanticFormatterCallback: field.tooltipFormatter,
                autofocus: field.autofocus,
                focusNode: field.focusNode,
                onChanged: widget.enabled ? onChanged : null,
              );

              return Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final sliderWidth = constraints.maxWidth;
                      return Stack(
                        alignment: Alignment.centerLeft,
                        clipBehavior: Clip.none,
                        children: [
                          if (!interactionAllowed) slider,
                          for (final indicator in field.indicators.where(
                            (e) => e.value != null,
                          ))
                            Builder(
                              builder: (context) {
                                // Determine the indicator child
                                Widget child = CustomPaint(
                                  size: const Size(10, 8),
                                  painter: TSliderMarkerPainter(
                                    color: indicator.color ?? tw.color.primary,
                                  ),
                                );
                                if (indicator.child != null) {
                                  child = DefaultTextStyle(
                                    style: TextStyle(color: indicator.color),
                                    child: IconTheme(
                                      data: context.theme.iconTheme.copyWith(
                                        color: indicator.color,
                                      ),
                                      child: indicator.child!,
                                    ),
                                  );
                                }

                                // Compute the pixel position for the marker
                                final percent =
                                    (indicator.value! - field.min) /
                                    (field.max - field.min);
                                final markerX = percent * sliderWidth;
                                return Positioned(
                                  left: markerX - indicator.offset.dx - 5,
                                  top: indicator.offset.dy + 10,
                                  child: TTooltip(
                                    message:
                                        indicator.tooltip ??
                                        indicator.value!.toDisplayString(),
                                    child: child,
                                  ),
                                );
                              },
                            ),
                          if (interactionAllowed) slider,
                        ],
                      );
                    },
                  ),
                  if (field.showDefaultMarks || field.editable)
                    TSliderMarkings(
                      min: minString,
                      max: maxString,
                      value: valueString,
                      inputController: inputController,
                      valueFocusNode: valueFocusNode,
                      enabled: widget.enabled && field.editable,
                      editable: field.editable,
                      textStyle: markingTextStyle,
                      showDefaultMarks: field.showDefaultMarks,
                      onFieldSubmitted: onFieldSubmitted,
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
