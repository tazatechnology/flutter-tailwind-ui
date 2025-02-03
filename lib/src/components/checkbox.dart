import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/extensions/key_event.dart';
import 'package:flutter_tailwind_ui/src/internal/selection_group.dart';

// =============================================================================
// CLASS: TCheckbox
// =============================================================================

/// A Tailwind UI inspired checkbox widget.
class TCheckbox extends StatelessWidget {
  /// Construct a checkbox widget.
  const TCheckbox({
    required this.value,
    this.onChanged,
    this.color,
    this.enabled = true,
    this.padding = TOffset.a0,
    this.focusNode,
    this.indicator,
    this.animationTransitionBuilder,
    this.animationDuration = Duration.zero,
    this.animationCurve = Curves.easeInOut,
    super.key,
  });

  /// The value of the checkbox
  final bool value;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The color of the checkbox
  final Color? color;

  /// Flag to enable or disable the checkbox
  final bool enabled;

  /// The padding of the checkbox
  ///
  /// Will be added to the gesture detector
  final EdgeInsetsGeometry padding;

  /// The focus node of the checkbox button
  final FocusNode? focusNode;

  /// An optional custom indicator widget
  final Widget? indicator;

  /// The transition builder for the indicator when toggling states
  final AnimatedSwitcherTransitionBuilder? animationTransitionBuilder;

  /// The duration of the switch animations
  final Duration animationDuration;

  /// The curve of the switch animations
  final Curve animationCurve;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    final color =
        enabled ? this.color ?? tw.colors.primary : tw.colors.disabled;

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
          borderColor = tw.colors.disabled;
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
                        : tw.colors.disabled.withValues(alpha: 0.5)),
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

/// A single checkbox item
class TCheckboxTile extends StatefulWidget {
  /// Construct a basic checkbox tile
  const TCheckboxTile({
    required this.value,
    this.title,
    this.description,
    this.onChanged,
    this.color,
    this.enabled = true,
    this.padding = TOffset.a0,
    this.focusNode,
    this.indicator,
    this.affinity = TControlAffinity.leading,
    super.key,
  })  : _variant = TSelectionGroupVariant.basic,
        _radius = 0;

  /// Construct a card checkbox tile
  const TCheckboxTile.card({
    required this.value,
    this.title,
    this.description,
    this.onChanged,
    this.color,
    this.enabled = true,
    this.padding = TOffset.a0,
    this.focusNode,
    this.indicator,
    this.affinity = TControlAffinity.leading,
    double radius = TRadius.rounded_lg,
    super.key,
  })  : _variant = TSelectionGroupVariant.card,
        _radius = radius;

  /// The value of the checkbox
  final bool value;

  /// The title of this checkbox tile
  final Widget? title;

  /// The description of this checkbox tile
  final Widget? description;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The color of the checkbox
  final Color? color;

  /// Flag to enable or disable the checkbox
  final bool enabled;

  /// The padding of the checkbox
  ///
  /// Will be added to the gesture detector
  final EdgeInsetsGeometry padding;

  /// The focus node of the checkbox widget
  final FocusNode? focusNode;

  /// An optional custom indicator widget
  final Widget? indicator;

  /// The control affinity of the checkbox
  final TControlAffinity affinity;

  /// The variant of the checkbox tile
  final TSelectionGroupVariant _variant;

  /// The radius value for rounded corners (card variant only)
  final double _radius;

  @override
  State<TCheckboxTile> createState() => _TCheckboxTileState();
}

class _TCheckboxTileState extends State<TCheckboxTile> {
  late bool value = widget.value;

  // ---------------------------------------------------------------------------
  // METHOD: didUpdateWidget
  // ---------------------------------------------------------------------------

  @override
  void didUpdateWidget(covariant TCheckboxTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (value != widget.value) {
      setState(() {
        value = widget.value;
      });
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged(bool value) {
    if (!widget.enabled) {
      return;
    }
    setState(() {
      this.value = value;
      widget.onChanged?.call(value);
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return TSelectionGroupTile(
      variant: widget._variant,
      index: 0,
      numItems: 1,
      color: widget.color,
      title: widget.title ?? const SizedBox.shrink(),
      description: widget.description,
      applySelectedBorderColor: false,
      radius: widget._radius,
      selected: value,
      enabled: widget.enabled,
      affinity: widget.affinity,
      axis: Axis.vertical,
      onChanged: onChanged,
      control: TCheckbox(
        color: widget.color,
        value: value,
        onChanged: onChanged,
        enabled: widget.enabled,
        padding: widget.padding,
        focusNode: widget.focusNode,
        indicator: widget.indicator,
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

/// A checkbox group
class TCheckboxGroup<T> extends StatefulWidget {
  /// Creates a checkbox group
  const TCheckboxGroup({
    required this.children,
    this.title,
    this.description,
    this.groupValue,
    this.onChanged,
    this.color,
    this.width = TScreen.max_w_md,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
    super.key,
  })  : variant = TSelectionGroupVariant.basic,
        radius = 0;

  /// Creates a separated checkbox group
  const TCheckboxGroup.separated({
    required this.children,
    this.title,
    this.description,
    this.groupValue,
    this.onChanged,
    this.color,
    this.width = TScreen.max_w_md,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
    super.key,
  })  : variant = TSelectionGroupVariant.separated,
        radius = 0;

  /// Creates a card checkbox group
  const TCheckboxGroup.card({
    required this.children,
    this.title,
    this.description,
    this.groupValue,
    this.onChanged,
    this.color,
    this.width = TScreen.max_w_md,
    this.radius = TRadius.rounded_lg,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
    super.key,
  }) : variant = TSelectionGroupVariant.card;

  /// Creates a card checkbox group
  const TCheckboxGroup.panel({
    required this.children,
    this.title,
    this.description,
    this.groupValue,
    this.onChanged,
    this.color,
    this.width = TScreen.max_w_md,
    this.radius = TRadius.rounded_lg,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
    super.key,
  })  : variant = TSelectionGroupVariant.panel,
        spacing = 0;

  /// The children of the checkbox group.
  final List<TCheckboxGroupItem<T>> children;

  /// The title widget
  final Widget? title;

  /// The description widget
  final Widget? description;

  /// The value of the checkbox group.
  final List<T>? groupValue;

  /// Callback when the value changes.
  ///
  /// Returns a list of the currently selected values.
  final ValueChanged<List<T>>? onChanged;

  /// The variant of the checkbox group.
  final TSelectionGroupVariant variant;

  /// The color of the checkbox elements.
  final Color? color;

  /// The maximum width of the group.
  final double width;

  /// The spacing between the group elements.
  ///
  /// If not specified, default is based on [TSelectionGroupVariant].
  final double? spacing;

  /// The control affinity of the group.
  final TControlAffinity affinity;

  /// The orientation of the group.
  final Axis axis;

  /// The radius value for rounded corners
  ///
  /// Only used for [TCheckboxGroup.card] and [TCheckboxGroup.panel] variants.
  final double radius;

  @override
  State<TCheckboxGroup<T>> createState() => _TCheckboxGroupState<T>();
}

class _TCheckboxGroupState<T> extends State<TCheckboxGroup<T>> {
  late final List<T> groupValue;

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    groupValue = List.from(widget.groupValue ?? []);
  }

  // ---------------------------------------------------------------------------
  // METHOD: didUpdateWidget
  // ---------------------------------------------------------------------------

  @override
  void didUpdateWidget(covariant TCheckboxGroup<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (groupValue != widget.groupValue && widget.groupValue != null) {
      setState(() {
        groupValue.clear();
        groupValue.addAll(widget.groupValue!);
      });
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged({required TCheckboxGroupItem<T> item, required bool status}) {
    if (!item.enabled) {
      return;
    }
    if (status && !groupValue.contains(item.value)) {
      groupValue.add(item.value);
    } else if (!status && groupValue.contains(item.value)) {
      groupValue.remove(item.value);
    }
    setState(() {});
    widget.onChanged?.call(groupValue);
  }

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return TSelectionGroupList(
      axis: widget.axis,
      variant: widget.variant,
      width: widget.width,
      spacing: widget.spacing ?? widget.variant.spacing,
      items: widget.children,
      radius: widget.radius,
      title: widget.title,
      description: widget.description,
      itemBuilder: (context, index) {
        final item = widget.children[index];
        final selected = groupValue.contains(item.value);
        return TSelectionGroupTile(
          key: ValueKey(item.value),
          index: index,
          numItems: widget.children.length,
          variant: widget.variant,
          color: widget.color,
          selected: selected,
          title: item.title,
          description: item.description,
          radius: widget.radius,
          enabled: item.enabled,
          affinity: widget.affinity,
          axis: widget.axis,
          onChanged: (status) => onChanged(item: item, status: status),
          control: TCheckbox(
            color: widget.color,
            value: selected,
            enabled: item.enabled,
            onChanged: (status) => onChanged(item: item, status: status),
          ),
        );
      },
    );
  }
}
