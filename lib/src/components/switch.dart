import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/selection_group.dart';

// =============================================================================
// CLASS: TSwitch
// =============================================================================

/// A Tailwind UI inspired switch widget
class TSwitch extends StatelessWidget {
  /// Construct a switch widget
  const TSwitch({
    super.key,
    this.animationCurve = Curves.easeInOut,
    this.animationDuration = const Duration(milliseconds: 200),
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

  /// The color of the switch
  final Color? color;

  /// Flag to enable or disable the switch
  final bool enabled;

  /// The focus node of the switch button
  final FocusNode? focusNode;

  /// An optional custom indicator widget
  final Widget? indicator;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The padding of the switch
  ///
  /// Will be added to the gesture detector
  final EdgeInsetsGeometry padding;

  /// The value of the switch
  final bool value;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    const size = TSpace.v24;
    const inset = 2.0;
    const inset2 = inset * 2;
    const thumbWidth = size - inset2;

    final tw = context.tw;

    final color = this.color ?? tw.color.primary;
    final bgColor = tw.light ? TColors.gray.shade200 : TColors.gray.shade800;
    final bgDisabled = tw.light ? TColors.gray.shade400 : TColors.gray.shade700;

    // Defer to the focus node value if it is set
    final canRequestFocus = enabled && (focusNode?.canRequestFocus ?? true);

    // Have a default spacebar handler for the switch
    KeyEventResult onKeyEvent(FocusNode _, KeyEvent event) {
      if ((event.isSpaceKeyDown || event.isEnterKeyDown) && enabled) {
        onChanged?.call(!value);
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }

    // Build the indicator widget
    Widget? indicatorWidget;
    if (indicator != null) {
      indicatorWidget = IconTheme(
        data: context.theme.iconTheme.copyWith(
          size: thumbWidth * 2 / 3,
        ),
        child: AnimatedSwitcher(
          duration: animationDuration,
          switchInCurve: animationCurve,
          switchOutCurve: animationCurve,
          transitionBuilder: animationTransitionBuilder ??
              (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
          child: KeyedSubtree(
            key: ValueKey(value),
            child: indicator ?? const SizedBox.shrink(),
          ),
        ),
      );
    }

    // The thumb widget
    final thumb = Container(
      width: thumbWidth,
      height: thumbWidth,
      margin: const EdgeInsets.all(inset),
      decoration: BoxDecoration(
        color: enabled || tw.light ? Colors.white : tw.color.disabled,
        borderRadius: TBorderRadius.rounded_full,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: size / 8,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: indicatorWidget,
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
        return TFocusBorder(
          focused: states.focused,
          focusColor: color,
          borderRadius: TBorderRadius.rounded_full,
          child: AnimatedContainer(
            margin: padding,
            duration: animationDuration,
            curve: animationCurve,
            width: (size * 2) - inset2,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size / 2),
              color: enabled ? (value ? color : bgColor) : bgDisabled,
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: animationDuration,
                  curve: animationCurve,
                  left: value ? thumbWidth : 0.0,
                  right: value ? 0.0 : thumbWidth,
                  child: thumb,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// =============================================================================
// CLASS: TSwitchTile
// =============================================================================

/// A Tailwind inspired switch tile.
class TSwitchTile extends TFormField<bool> {
  /// Construct a basic [TSwitchTile]
  TSwitchTile({
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
          id: id ?? 'TSwitchTile',
          child: _TSwitchTileFormField(
            affinity: affinity,
            color: color,
            description: description,
            enabled: enabled,
            focusNode: focusNode,
            indicator: indicator,
            initialValue: initialValue,
            onChanged: onChanged,
            padding: padding,
            radius: 0,
            title: title,
            variant: TSelectionGroupVariant.basic,
          ),
        );

  /// Construct a card [TSwitchTile]
  TSwitchTile.card({
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
          id: id ?? 'TSwitchTile.card',
          child: _TSwitchTileFormField(
            affinity: affinity,
            color: color,
            description: description,
            enabled: enabled,
            focusNode: focusNode,
            indicator: indicator,
            initialValue: initialValue,
            onChanged: onChanged,
            padding: padding,
            radius: radius,
            title: title,
            variant: TSelectionGroupVariant.card,
          ),
        );

  /// The control affinity of the switch
  final TControlAffinity affinity;

  /// The color of the switch
  final Color? color;

  /// The description of this switch tile
  final Widget? description;

  /// Flag to enable or disable the switch
  final bool enabled;

  /// The focus node of the switch widget
  final FocusNode? focusNode;

  /// An optional custom indicator widget
  final Widget? indicator;

  /// The initial value of the switch
  final bool initialValue;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The padding of the switch
  ///
  /// Will be added to the gesture detector
  final EdgeInsetsGeometry padding;

  /// The title of this switch tile
  final Widget? title;
}

// =============================================================================
// CLASS: _TSwitchTileFormField
// =============================================================================

class _TSwitchTileFormField extends FormField<bool> {
  _TSwitchTileFormField({
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
          builder: (field) {
            final state = field as _TSwitchTileFormFieldState;
            return state.buildWidget(state.context);
          },
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
  FormFieldState<bool> createState() => _TSwitchTileFormFieldState();
}

class _TSwitchTileFormFieldState extends FormFieldState<bool> {
  _TSwitchTileFormField get field => widget as _TSwitchTileFormField;

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged(bool value) {
    if (!field.enabled) {
      return;
    }
    setState(() {
      didChange(value);
      field.onChanged?.call(value);
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: reset
  // ---------------------------------------------------------------------------

  @override
  void reset() {
    super.reset();
    field.onChanged?.call(widget.initialValue ?? false);
  }

  // ---------------------------------------------------------------------------
  // METHOD: buildWidget
  // ---------------------------------------------------------------------------

  Widget buildWidget(BuildContext context) {
    return TSelectionGroupTile(
      variant: field.variant,
      index: 0,
      numItems: 1,
      color: field.color,
      title: field.title ?? const SizedBox.shrink(),
      description: field.description,
      applySelectedBorderColor: false,
      controlCrossAxisAlignment: CrossAxisAlignment.center,
      radius: field.radius,
      selected: value ?? false,
      enabled: field.enabled,
      affinity: field.affinity,
      axis: Axis.vertical,
      onChanged: onChanged,
      control: TSwitch(
        color: field.color,
        value: value ?? false,
        onChanged: onChanged,
        enabled: field.enabled,
        padding: field.padding,
        focusNode: field.focusNode,
        indicator: field.indicator,
      ),
    );
  }
}

// =============================================================================
// CLASS: TSwitchGroupItem
// =============================================================================

/// A radio group item
class TSwitchGroupItem<T> extends TSelectionGroupItem<T> {
  /// Creates a radio item
  const TSwitchGroupItem({
    required super.value,
    required super.title,
    super.description,
    super.enabled = true,
  });
}

// =============================================================================
// CLASS: TSwitchGroup
// =============================================================================

/// A Tailwind inspired slider field.
class TSwitchGroup<T> extends TFormField<List<T>> {
  /// Construct a [TSwitchGroup]
  TSwitchGroup({
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
          id: id ?? 'TSwitchGroup',
          child: _TSwitchGroupFormField(
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

  /// Construct a [TSwitchGroup]
  TSwitchGroup.separated({
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
          id: id ?? 'TSwitchGroup.separated',
          child: _TSwitchGroupFormField(
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

  /// Construct a [TSwitchGroup]
  TSwitchGroup.card({
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
          id: id ?? 'TSwitchGroup.card',
          child: _TSwitchGroupFormField(
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

  /// Construct a [TSwitchGroup]
  TSwitchGroup.panel({
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
          id: id ?? 'TSwitchGroup.card',
          child: _TSwitchGroupFormField(
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

  /// The children of the switch group.
  final List<TSwitchGroupItem<T>> children;

  /// The color of the switch elements.
  final Color? color;

  /// The description widget
  final Widget? description;

  /// The value of the switch group.
  final List<T> initialValue;

  /// The label widget
  final Widget? label;

  /// Callback when the value changes.
  ///
  /// Returns a list of the currently selected values.
  final ValueChanged<List<T>>? onChanged;

  /// The radius value for rounded corners
  ///
  /// Only used for [TSwitchGroup.card] and [TSwitchGroup.panel] variants.
  final double radius;

  /// The spacing between the group elements.
  ///
  /// If not specified, default is based on [TSelectionGroupVariant].
  final double? spacing;
}

// =============================================================================
// CLASS: _TSwitchGroupFormField
// =============================================================================

class _TSwitchGroupFormField<T> extends FormField<List<T>> {
  /// Creates a switch group
  _TSwitchGroupFormField({
    super.key,
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
          builder: (field) {
            final state = field as _TSwitchGroupFormFieldState<T>;
            return state.buildWidget(state.context);
          },
        );

  final TControlAffinity affinity;
  final Axis axis;
  final List<TSwitchGroupItem<T>> children;
  final Color? color;
  final Widget? description;
  final Widget? label;
  final ValueChanged<List<T>>? onChanged;
  final double radius;
  final double? spacing;
  final TSelectionGroupVariant variant;

  @override
  FormFieldState<List<T>> createState() => _TSwitchGroupFormFieldState();
}

class _TSwitchGroupFormFieldState<T> extends FormFieldState<List<T>> {
  _TSwitchGroupFormField<T> get field => widget as _TSwitchGroupFormField<T>;

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged({required TSwitchGroupItem<T> item, required bool status}) {
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
  // METHOD: reset
  // ---------------------------------------------------------------------------

  @override
  void reset() {
    super.reset();
    field.onChanged?.call(widget.initialValue ?? []);
  }

  // ---------------------------------------------------------------------------
  // METHOD: buildWidget
  // ---------------------------------------------------------------------------

  Widget buildWidget(BuildContext context) {
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
          controlCrossAxisAlignment: CrossAxisAlignment.center,
          radius: field.radius,
          enabled: item.enabled,
          affinity: field.affinity,
          axis: field.axis,
          onChanged: (status) => onChanged(item: item, status: status),
          control: TSwitch(
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
