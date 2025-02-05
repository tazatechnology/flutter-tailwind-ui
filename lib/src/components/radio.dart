import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/selection_group.dart';

// =============================================================================
// CLASS: TRadio
// =============================================================================

/// A Tailwind UI inspired radio widget
class TRadio extends StatelessWidget {
  /// Construct a radio widget
  const TRadio({
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

  /// The value of the radio
  final bool value;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The color of the radio
  final Color? color;

  /// Flag to enable or disable the radio widget
  final bool enabled;

  /// The padding of the radio
  ///
  /// Will be added to the gesture detector
  final EdgeInsetsGeometry padding;

  /// The focus node of the radio
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

    final indicator = this.indicator ??
        const Icon(
          Icons.circle,
          size: kTDefaultControlSize / 2,
        );

    // Defer to the focus node value if it is set
    final canRequestFocus = enabled && (focusNode?.canRequestFocus ?? true);

    // Have a default spacebar handler for the checkbox
    KeyEventResult onKeyEvent(FocusNode _, KeyEvent event) {
      if (event.isSpaceKeyDown && enabled) {
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
          borderRadius: TBorderRadius.rounded_full,
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
                borderRadius: TBorderRadius.rounded_full,
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
// CLASS: TRadioGroupItem
// =============================================================================

/// A radio group item
class TRadioGroupItem<T> extends TSelectionGroupItem<T> {
  /// Creates a radio item
  const TRadioGroupItem({
    required super.value,
    required super.title,
    super.description,
    super.enabled = true,
  });
}

// =============================================================================
// CLASS: TRadioGroup
// =============================================================================

/// A Tailwind UI inspired radio group
class TRadioGroup<T> extends StatefulWidget {
  /// Creates a basic [TRadioGroup]
  const TRadioGroup({
    required this.children,
    super.key,
    this.title,
    this.description,
    this.groupValue,
    this.onChanged,
    this.color,
    this.maxWidth = TScreen.max_w_md,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
  })  : variant = TSelectionGroupVariant.basic,
        radius = 0;

  /// Creates a [TRadioGroup] as a card variant
  const TRadioGroup.separated({
    required this.children,
    super.key,
    this.title,
    this.description,
    this.groupValue,
    this.onChanged,
    this.color,
    this.maxWidth = TScreen.max_w_md,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
  })  : variant = TSelectionGroupVariant.separated,
        radius = 0;

  /// Creates a [TRadioGroup] as a card variant
  const TRadioGroup.card({
    required this.children,
    super.key,
    this.title,
    this.description,
    this.groupValue,
    this.onChanged,
    this.color,
    this.maxWidth = TScreen.max_w_md,
    this.radius = TRadius.rounded_lg,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
  }) : variant = TSelectionGroupVariant.card;

  /// Creates a [TRadioGroup] as a panel variant
  const TRadioGroup.panel({
    required this.children,
    super.key,
    this.title,
    this.description,
    this.groupValue,
    this.onChanged,
    this.color,
    this.maxWidth = TScreen.max_w_md,
    this.radius = TRadius.rounded_lg,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
  })  : variant = TSelectionGroupVariant.panel,
        spacing = 0;

  /// The children of the radio group.
  final List<TRadioGroupItem<T>> children;

  /// The title widget
  final Widget? title;

  /// The description widget
  final Widget? description;

  /// The value of the radio group.
  final T? groupValue;

  /// The callback when the value changes.
  final ValueChanged<T?>? onChanged;

  /// The variant of the radio group.
  final TSelectionGroupVariant variant;

  /// The color of the radio elements.
  final Color? color;

  /// The maximum width of the group.
  final double maxWidth;

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
  /// Only used for [TRadioGroup.card] and [TRadioGroup.panel] variants.
  final double radius;

  @override
  State<TRadioGroup<T>> createState() => _TRadioGroupState<T>();
}

class _TRadioGroupState<T> extends State<TRadioGroup<T>> {
  late T? groupValue;
  late final List<FocusNode> focusNodes;

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    groupValue = widget.groupValue;
    focusNodes = List.generate(
      widget.children.length,
      (ii) => FocusNode(
        debugLabel: widget.children[ii].value.toString(),
        descendantsAreFocusable: false,
        descendantsAreTraversable: false,
      ),
    );
    updateFocusNodes();
  }

  // ---------------------------------------------------------------------------
  // METHOD: didUpdateWidget
  // ---------------------------------------------------------------------------

  @override
  void didUpdateWidget(covariant TRadioGroup<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (groupValue != widget.groupValue) {
      setState(() {
        groupValue = widget.groupValue;
      });
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: updateFocusNodes
  // ---------------------------------------------------------------------------

  void updateFocusNodes() {
    for (var ii = 0; ii < widget.children.length; ii++) {
      final f = focusNodes[ii];
      // Focus is only enabled for the first item (if none are selected)
      bool canRequestFocus = true;
      if (groupValue == null) {
        canRequestFocus = ii == 0;
      } else {
        canRequestFocus = widget.children[ii].value == groupValue;
      }
      f.skipTraversal = !canRequestFocus;
      f.canRequestFocus = canRequestFocus;
      f.onKeyEvent = (node, event) {
        // Check for traversal events
        final nextRequested =
            event.logicalKey.isArrowDown || event.logicalKey.isArrowRight;
        final previousRequested =
            event.logicalKey.isArrowUp || event.logicalKey.isArrowLeft;

        // Handle up/down arrow keys to traverse the radio group
        if ((nextRequested || previousRequested) && !event.isKeyUp) {
          final index = widget.children.indexOf(widget.children[ii]);

          // Update index and handle out-of-bounds
          int nextIndex = nextRequested ? index + 1 : index - 1;
          if (nextIndex < 0) {
            nextIndex = widget.children.length - 1;
          } else if (nextIndex >= widget.children.length) {
            nextIndex = 0;
          }

          // Make sure that the next item is enabled, else go to the next one
          while (!widget.children[nextIndex].enabled) {
            nextIndex += nextRequested ? 1 : -1;
            if (nextIndex < 0) {
              nextIndex = widget.children.length - 1;
            } else if (nextIndex >= widget.children.length) {
              nextIndex = 0;
            }
          }

          // Handle focus and group value
          final nextItem = widget.children[nextIndex];
          setState(() {
            groupValue = nextItem.value;
            updateFocusNodes();
            focusNodes[nextIndex].requestFocus();
          });

          return KeyEventResult.handled;
        }

        // Traversing the radio group automatically selects the item
        // Mark the event as handled if the space key is pressed
        if (event.logicalKey.isSpace) {
          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      };
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged({required TRadioGroupItem<T> item, required bool status}) {
    if (!item.enabled || !status) {
      return;
    }
    setState(() {
      groupValue = item.value;
      updateFocusNodes();
    });
    widget.onChanged?.call(item.value);
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return TSelectionGroupList(
      axis: widget.axis,
      variant: widget.variant,
      maxWidth: widget.maxWidth,
      spacing: widget.spacing ?? widget.variant.spacing,
      items: widget.children,
      radius: widget.radius,
      title: widget.title,
      description: widget.description,
      itemBuilder: (context, index) {
        final item = widget.children[index];
        final selected = groupValue == item.value;
        return TSelectionGroupTile(
          key: ValueKey(item.value),
          index: index,
          numItems: widget.children.length,
          variant: widget.variant,
          color: widget.color,
          title: item.title,
          description: item.description,
          radius: widget.radius,
          selected: selected,
          enabled: item.enabled,
          affinity: widget.affinity,
          axis: widget.axis,
          onChanged: (status) => onChanged(item: item, status: status),
          control: TRadio(
            color: widget.color,
            value: selected,
            enabled: item.enabled,
            focusNode: focusNodes[index],
            onChanged: (status) => onChanged(item: item, status: status),
          ),
        );
      },
    );
  }
}
