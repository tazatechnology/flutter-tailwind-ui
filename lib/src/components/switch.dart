import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/extensions/key_event.dart';
import 'package:flutter_tailwind_ui/src/internal/selection_group.dart';

// =============================================================================
// CLASS: TSwitch
// =============================================================================

/// A Tailwind UI inspired switch widget
class TSwitch extends StatelessWidget {
  /// Construct a switch widget
  const TSwitch({
    required this.value,
    this.onChanged,
    this.color,
    this.enabled = true,
    this.padding = TOffset.a0,
    this.focusNode,
    this.indicator,
    this.animationTransitionBuilder,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    super.key,
  });

  /// The value of the switch
  final bool value;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The color of the switch
  final Color? color;

  /// Flag to enable or disable the switch
  final bool enabled;

  /// The padding of the switch
  ///
  /// Will be added to the gesture detector
  final EdgeInsetsGeometry padding;

  /// The focus node of the switch button
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
    const size = TSpace.v24;
    const inset = 2.0;
    const inset2 = inset * 2;
    const thumbWidth = size - inset2;

    final tw = context.tw;

    final color = this.color ?? tw.colors.primary;
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
        color: enabled || tw.light ? Colors.white : tw.colors.disabled,
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

/// A single switch item
class TSwitchTile extends StatefulWidget {
  /// Construct a basic switch tile
  const TSwitchTile({
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

  /// Construct a card switch tile
  const TSwitchTile.card({
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

  /// The value of the switch
  final bool value;

  /// The title of this switch tile
  final Widget? title;

  /// The description of this switch tile
  final Widget? description;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The color of the switch
  final Color? color;

  /// Flag to enable or disable the switch
  final bool enabled;

  /// The padding of the switch
  ///
  /// Will be added to the gesture detector
  final EdgeInsetsGeometry padding;

  /// The focus node of the switch widget
  final FocusNode? focusNode;

  /// An optional custom indicator widget
  final Widget? indicator;

  /// The control affinity of the switch
  final TControlAffinity affinity;

  /// The variant of the switch tile
  final TSelectionGroupVariant _variant;

  /// The radius value for rounded corners (card variant only)
  final double _radius;

  @override
  State<TSwitchTile> createState() => _TSwitchTileState();
}

class _TSwitchTileState extends State<TSwitchTile> {
  late bool value = widget.value;

  // ---------------------------------------------------------------------------
  // METHOD: didUpdateWidget
  // ---------------------------------------------------------------------------

  @override
  void didUpdateWidget(covariant TSwitchTile oldWidget) {
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
      controlCrossAxisAlignment: CrossAxisAlignment.center,
      radius: widget._radius,
      selected: value,
      enabled: widget.enabled,
      affinity: widget.affinity,
      axis: Axis.vertical,
      onChanged: onChanged,
      control: TSwitch(
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

/// A switch group
class TSwitchGroup<T> extends StatefulWidget {
  /// Creates a switch group
  const TSwitchGroup({
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

  /// Creates a separated switch group
  const TSwitchGroup.separated({
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

  /// Creates a card switch group
  const TSwitchGroup.card({
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

  /// Creates a card switch group
  const TSwitchGroup.panel({
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

  /// The children of the switch group.
  final List<TSwitchGroupItem<T>> children;

  /// The title widget
  final Widget? title;

  /// The description widget
  final Widget? description;

  /// The value of the switch group.
  final List<T>? groupValue;

  /// Callback when the value changes.
  ///
  /// Returns a list of the currently selected values.
  final ValueChanged<List<T>>? onChanged;

  /// The variant of the switch group.
  final TSelectionGroupVariant variant;

  /// The color of the switch elements.
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
  /// Only used for [TSwitchGroup.card] and [TSwitchGroup.panel] variants.
  final double radius;

  @override
  State<TSwitchGroup<T>> createState() => _TSwitchGroupState<T>();
}

class _TSwitchGroupState<T> extends State<TSwitchGroup<T>> {
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
  void didUpdateWidget(covariant TSwitchGroup<T> oldWidget) {
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

  void onChanged({required TSwitchGroupItem<T> item, required bool status}) {
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
          controlCrossAxisAlignment: CrossAxisAlignment.center,
          radius: widget.radius,
          enabled: item.enabled,
          affinity: widget.affinity,
          axis: widget.axis,
          onChanged: (status) => onChanged(item: item, status: status),
          control: TSwitch(
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
