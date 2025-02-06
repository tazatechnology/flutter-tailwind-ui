import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/selection_group.dart';

// =============================================================================
// CLASS: TCheckbox
// =============================================================================

/// A Tailwind UI inspired checkbox widget.
class TCheckbox extends StatelessWidget {
  /// Construct a checkbox widget.
  const TCheckbox({
    super.key,
    this.animationCurve = Curves.easeInOut,
    this.animationDuration = Duration.zero,
    this.animationTransitionBuilder,
    this.color,
    this.enabled = true,
    this.focusNode,
    this.indicator,
    this.onChanged,
    this.padding = TOffset.a0,
    required this.value,
  });

  /// The transition builder for the indicator when toggling states
  final AnimatedSwitcherTransitionBuilder? animationTransitionBuilder;

  /// The curve of the switch animations
  final Curve animationCurve;

  /// The duration of the switch animations
  final Duration animationDuration;

  /// The color of the checkbox
  final Color? color;

  /// Flag to enable or disable the checkbox
  final bool enabled;

  /// The focus node of the checkbox button
  final FocusNode? focusNode;

  /// An optional custom indicator widget
  final Widget? indicator;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The padding of the checkbox
  ///
  /// Will be added to the gesture detector
  final EdgeInsetsGeometry padding;

  /// The value of the checkbox
  final bool value;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    final color = enabled ? this.color ?? tw.color.primary : tw.color.disabled;

    final indicator = this.indicator ?? const Icon(Icons.check);

    // Defer to the focus node value if it is set
    final canRequestFocus = enabled && (focusNode?.canRequestFocus ?? true);

    // Have a default spacebar handler for the checkbox
    KeyEventResult onKeyEvent(FocusNode _, KeyEvent event) {
      if ((event.isSpaceKeyDown || event.isEnterKeyDown) && enabled) {
        onChanged?.call(!value);
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }

    // Build the checkbox widget
    final indicatorWidget = AnimatedSwitcher(
      duration: animationDuration,
      switchInCurve: animationCurve,
      switchOutCurve: animationCurve,
      transitionBuilder: animationTransitionBuilder ??
          (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
      child: KeyedSubtree(
        key: ValueKey(value),
        child: value ? indicator : const SizedBox.shrink(),
      ),
    );

    return TGestureDetector(
      mouseCursor: WidgetStatePropertyAll(
        enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      ),
      focusNode: focusNode,
      onKeyEvent: focusNode?.onKeyEvent ?? onKeyEvent,
      canRequestFocus: canRequestFocus,
      onTap: () {
        if (enabled) {
          onChanged?.call(!value);
        }
      },
      builder: (context, states) {
        Color borderColor;
        if (value) {
          borderColor = color;
        } else if (states.disabled) {
          borderColor = tw.color.disabled;
        } else {
          borderColor =
              tw.light ? const Color(0xffccccd4) : const Color(0xff4d5866);
        }

        return TFocusBorder(
          focused: states.focused,
          focusColor: color,
          borderRadius: TBorderRadius.rounded_sm,
          child: IconTheme(
            data: context.theme.iconTheme.copyWith(
              size: kTDefaultControlSize - TSpace.v4,
              color: color.contrastBlackWhite(),
            ),
            child: AnimatedContainer(
              duration: animationDuration,
              curve: animationCurve,
              margin: padding,
              width: kTDefaultControlSize,
              height: kTDefaultControlSize,
              decoration: BoxDecoration(
                color: value
                    ? color
                    : (enabled
                        ? Colors.transparent
                        : tw.color.disabled.withValues(alpha: 0.5)),
                border: Border.all(color: borderColor),
                borderRadius: TBorderRadius.rounded_sm,
              ),
              child: indicatorWidget,
            ),
          ),
        );
      },
    );
  }
}

// =============================================================================
// CLASS: TCheckboxTile
// =============================================================================

/// A Tailwind inspired slider widget.
class TCheckboxTile extends TFormField<bool> {
  /// Construct a basic checkbox tile
  TCheckboxTile({
    super.key,
    this.affinity = TControlAffinity.leading,
    this.color,
    this.description,
    this.enabled = true,
    this.focusNode,
    Object? id,
    this.indicator,
    this.initialValue = false,
    this.onChanged,
    this.padding = TOffset.a0,
    this.title,
  }) : super(
          id: id ?? 'TCheckboxTile',
          child: _TCheckboxTileFormField(
            title: title,
            description: description,
            onChanged: onChanged,
            color: color,
            enabled: enabled,
            padding: padding,
            focusNode: focusNode,
            indicator: indicator,
            initialValue: initialValue,
            affinity: affinity,
            radius: 0,
            variant: TSelectionGroupVariant.basic,
          ),
        );

  /// Construct a card checkbox tile
  TCheckboxTile.card({
    super.key,
    this.affinity = TControlAffinity.leading,
    this.color,
    this.description,
    this.enabled = true,
    this.focusNode,
    Object? id,
    this.indicator,
    this.initialValue = false,
    this.onChanged,
    this.padding = TOffset.a0,
    double radius = TRadius.rounded_lg,
    this.title,
  }) : super(
          id: id ?? 'TCheckboxTile.card',
          child: _TCheckboxTileFormField(
            title: title,
            description: description,
            onChanged: onChanged,
            color: color,
            enabled: enabled,
            padding: padding,
            focusNode: focusNode,
            indicator: indicator,
            initialValue: initialValue,
            affinity: affinity,
            radius: radius,
            variant: TSelectionGroupVariant.card,
          ),
        );

  /// The control affinity of the checkbox
  final TControlAffinity affinity;

  /// The color of the checkbox
  final Color? color;

  /// The description of this checkbox tile
  final Widget? description;

  /// Flag to enable or disable the checkbox
  final bool enabled;

  /// The focus node of the checkbox widget
  final FocusNode? focusNode;

  /// An optional custom indicator widget
  final Widget? indicator;

  /// The initial value of the checkbox
  final bool initialValue;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The padding of the checkbox
  ///
  /// Will be added to the gesture detector
  final EdgeInsetsGeometry padding;

  /// The title of this checkbox tile
  final Widget? title;
}

// =============================================================================
// CLASS: _TCheckboxTileFormField
// =============================================================================

class _TCheckboxTileFormField extends FormField<bool> {
  _TCheckboxTileFormField({
    required this.affinity,
    required this.color,
    required this.description,
    required super.enabled,
    required this.focusNode,
    required this.indicator,
    required super.initialValue,
    required this.onChanged,
    required this.padding,
    required this.radius,
    required this.title,
    required this.variant,
  }) : super(
          builder: (field) => const SizedBox.shrink(),
        );
  final TControlAffinity affinity;
  final Color? color;
  final Widget? description;
  final FocusNode? focusNode;
  final Widget? indicator;
  final ValueChanged<bool>? onChanged;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Widget? title;
  final TSelectionGroupVariant variant;

  @override
  FormFieldState<bool> createState() => _TCheckboxTileFormFieldState();
}

class _TCheckboxTileFormFieldState extends FormFieldState<bool> {
  _TCheckboxTileFormField get field => widget as _TCheckboxTileFormField;

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged(bool value) {
    if (!widget.enabled) {
      return;
    }
    setState(() {
      didChange(value);
      field.onChanged?.call(value);
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return TSelectionGroupTile(
      variant: field.variant,
      index: 0,
      numItems: 1,
      color: field.color,
      title: field.title ?? const SizedBox.shrink(),
      description: field.description,
      applySelectedBorderColor: false,
      radius: field.radius,
      selected: value ?? false,
      enabled: widget.enabled,
      affinity: field.affinity,
      axis: Axis.vertical,
      onChanged: onChanged,
      control: TCheckbox(
        color: field.color,
        value: value ?? false,
        onChanged: onChanged,
        enabled: widget.enabled,
        padding: field.padding,
        focusNode: field.focusNode,
        indicator: field.indicator,
      ),
    );
  }
}

// =============================================================================
// CLASS: TCheckboxGroupItem
// =============================================================================

/// A radio group item
class TCheckboxGroupItem<T> extends TSelectionGroupItem<T> {
  /// Creates a radio item
  const TCheckboxGroupItem({
    required super.value,
    required super.title,
    super.description,
    super.enabled = true,
  });
}

// =============================================================================
// CLASS: TCheckboxGroup
// =============================================================================

/// A Tailwind inspired slider field.
class TCheckboxGroup<T> extends TFormField<List<T>> {
  /// Construct a [TCheckboxGroup]
  TCheckboxGroup({
    required this.children,
    this.label,
    this.description,
    this.initialValue = const [],
    this.onChanged,
    Object? id,
    this.color,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
    super.key,
  })  : radius = 0,
        super(
          id: id ?? 'TCheckboxGroup',
          child: _TCheckboxGroupFormField(
            affinity: affinity,
            axis: axis,
            children: children,
            color: color,
            description: description,
            initialValue: initialValue,
            label: label,
            onChanged: onChanged,
            spacing: spacing,
            variant: TSelectionGroupVariant.basic,
            radius: 0,
          ),
        );

  /// Construct a [TCheckboxGroup]
  TCheckboxGroup.separated({
    required this.children,
    this.label,
    this.description,
    this.initialValue = const [],
    this.onChanged,
    Object? id,
    this.color,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
    super.key,
  })  : radius = 0,
        super(
          id: id ?? 'TCheckboxGroup.separated',
          child: _TCheckboxGroupFormField(
            affinity: affinity,
            axis: axis,
            children: children,
            color: color,
            description: description,
            initialValue: initialValue,
            label: label,
            onChanged: onChanged,
            spacing: spacing,
            variant: TSelectionGroupVariant.separated,
            radius: 0,
          ),
        );

  /// Construct a [TCheckboxGroup]
  TCheckboxGroup.card({
    required this.children,
    this.label,
    this.description,
    this.initialValue = const [],
    this.onChanged,
    Object? id,
    this.color,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    this.radius = TRadius.rounded_lg,
    this.axis = Axis.vertical,
    super.key,
  }) : super(
          id: id ?? 'TCheckboxGroup.card',
          child: _TCheckboxGroupFormField(
            affinity: affinity,
            axis: axis,
            children: children,
            color: color,
            description: description,
            initialValue: initialValue,
            label: label,
            onChanged: onChanged,
            spacing: spacing,
            variant: TSelectionGroupVariant.card,
            radius: radius,
          ),
        );

  /// Construct a [TCheckboxGroup]
  TCheckboxGroup.panel({
    required this.children,
    this.label,
    this.description,
    this.initialValue = const [],
    this.onChanged,
    Object? id,
    this.color,
    this.affinity = TControlAffinity.leading,
    this.radius = TRadius.rounded_lg,
    this.axis = Axis.vertical,
    super.key,
  })  : spacing = 0,
        super(
          id: id ?? 'TCheckboxGroup.card',
          child: _TCheckboxGroupFormField(
            affinity: affinity,
            axis: axis,
            children: children,
            color: color,
            description: description,
            initialValue: initialValue,
            label: label,
            onChanged: onChanged,
            spacing: 0,
            variant: TSelectionGroupVariant.panel,
            radius: radius,
          ),
        );

  /// The control affinity of the group.
  final TControlAffinity affinity;

  /// The orientation of the group.
  final Axis axis;

  /// The children of the checkbox group.
  final List<TCheckboxGroupItem<T>> children;

  /// The color of the checkbox elements.
  final Color? color;

  /// The description widget
  final Widget? description;

  /// The value of the checkbox group.
  final List<T> initialValue;

  /// The label widget
  final Widget? label;

  /// Callback when the value changes.
  ///
  /// Returns a list of the currently selected values.
  final ValueChanged<List<T>>? onChanged;

  /// The radius value for rounded corners
  ///
  /// Only used for [TCheckboxGroup.card] and [TCheckboxGroup.panel] variants.
  final double radius;

  /// The spacing between the group elements.
  ///
  /// If not specified, default is based on [TSelectionGroupVariant].
  final double? spacing;
}

// =============================================================================
// CLASS: _TCheckboxGroupFormField
// =============================================================================

class _TCheckboxGroupFormField<T> extends FormField<List<T>> {
  /// Creates a checkbox group
  _TCheckboxGroupFormField({
    required this.children,
    required this.label,
    required this.description,
    required super.initialValue,
    required this.onChanged,
    required this.color,
    required this.spacing,
    required this.affinity,
    required this.axis,
    required this.variant,
    required this.radius,
  }) : super(
          builder: (field) => const SizedBox.shrink(),
        );

  final TControlAffinity affinity;
  final Axis axis;
  final List<TCheckboxGroupItem<T>> children;
  final Color? color;
  final Widget? description;
  final Widget? label;
  final ValueChanged<List<T>>? onChanged;
  final double radius;
  final double? spacing;
  final TSelectionGroupVariant variant;

  @override
  FormFieldState<List<T>> createState() => _TCheckboxGroupFormFieldState();
}

class _TCheckboxGroupFormFieldState<T> extends FormFieldState<List<T>> {
  _TCheckboxGroupFormField<T> get field =>
      widget as _TCheckboxGroupFormField<T>;

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged({required TCheckboxGroupItem<T> item, required bool status}) {
    if (!item.enabled) {
      return;
    }
    final currentValue = List<T>.from(value ?? []);
    if (status && !currentValue.contains(item.value)) {
      currentValue.add(item.value);
    } else if (!status && currentValue.contains(item.value)) {
      currentValue.remove(item.value);
    }

    // Sort value list to match the order of the children list
    currentValue.sort((a, b) {
      final indexA = field.children.indexWhere((element) => element.value == a);
      final indexB = field.children.indexWhere((element) => element.value == b);
      return indexA.compareTo(indexB);
    });

    didChange(currentValue);
    field.onChanged?.call(currentValue);
  }

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final currentValue = List<T>.from(value ?? []);

    return TSelectionGroupList(
      axis: field.axis,
      variant: field.variant,
      spacing: field.spacing ?? field.variant.spacing,
      items: field.children,
      radius: field.radius,
      label: field.label,
      description: field.description,
      itemBuilder: (context, index) {
        final item = field.children[index];
        final selected = currentValue.contains(item.value);
        return TSelectionGroupTile(
          key: ValueKey(item.value),
          index: index,
          numItems: field.children.length,
          variant: field.variant,
          color: field.color,
          selected: selected,
          title: item.title,
          description: item.description,
          radius: field.radius,
          enabled: item.enabled,
          affinity: field.affinity,
          axis: field.axis,
          onChanged: (status) => onChanged(item: item, status: status),
          control: TCheckbox(
            color: field.color,
            value: selected,
            enabled: item.enabled,
            onChanged: (status) => onChanged(item: item, status: status),
          ),
        );
      },
    );
  }
}
