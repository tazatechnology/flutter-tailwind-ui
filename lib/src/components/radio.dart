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

  /// The color of the radio
  final Color? color;

  /// Flag to enable or disable the radio widget
  final bool enabled;

  /// The focus node of the radio
  final FocusNode? focusNode;

  /// An optional custom indicator widget
  final Widget? indicator;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The padding of the radio
  ///
  /// Will be added to the gesture detector
  final EdgeInsetsGeometry padding;

  /// The value of the radio
  final bool value;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    final color = enabled ? this.color ?? tw.color.primary : tw.color.disabled;

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
          borderColor = tw.color.disabled;
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
                        : tw.color.disabled.withValues(alpha: 0.5)),
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

/// A Tailwind inspired slider field.
class TRadioGroup<T> extends TFormField<T> {
  /// Construct a basic [TRadioGroup]
  TRadioGroup({
    super.key,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
    this.color,
    this.description,
    Object? id,
    this.initialValue,
    this.label,
    this.onChanged,
    required this.children,
    this.spacing,
  })  : radius = 0,
        super(
          id: id ?? 'TRadioGroup',
          child: _TRadioGroupFormField<T>(
            affinity: affinity,
            color: color,
            description: description,
            initialValue: initialValue,
            label: label,
            axis: axis,
            children: children,
            spacing: spacing,
            onChanged: onChanged,
            radius: 0,
            variant: TSelectionGroupVariant.basic,
          ),
        );

  /// Construct a separated [TRadioGroup]
  TRadioGroup.separated({
    super.key,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
    this.color,
    this.description,
    Object? id,
    this.initialValue,
    this.label,
    this.onChanged,
    required this.children,
    this.spacing,
  })  : radius = 0,
        super(
          id: id ?? 'TRadioGroup.separated',
          child: _TRadioGroupFormField<T>(
            affinity: affinity,
            color: color,
            description: description,
            initialValue: initialValue,
            label: label,
            axis: axis,
            children: children,
            spacing: spacing,
            onChanged: onChanged,
            radius: 0,
            variant: TSelectionGroupVariant.separated,
          ),
        );

  /// Construct a card [TRadioGroup]
  TRadioGroup.card({
    super.key,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
    this.color,
    this.description,
    Object? id,
    this.initialValue,
    this.label,
    this.onChanged,
    required this.children,
    this.spacing,
    this.radius = TRadius.rounded_lg,
  }) : super(
          id: id ?? 'TRadioGroup.card',
          child: _TRadioGroupFormField<T>(
            affinity: affinity,
            color: color,
            description: description,
            initialValue: initialValue,
            label: label,
            axis: axis,
            children: children,
            spacing: spacing,
            onChanged: onChanged,
            radius: radius,
            variant: TSelectionGroupVariant.card,
          ),
        );

  /// Construct a panel [TRadioGroup]
  TRadioGroup.panel({
    super.key,
    this.affinity = TControlAffinity.leading,
    this.axis = Axis.vertical,
    this.color,
    this.description,
    Object? id,
    this.initialValue,
    this.label,
    this.onChanged,
    required this.children,
    this.radius = TRadius.rounded_lg,
  })  : spacing = 0,
        super(
          id: id ?? 'TRadioGroup.panel',
          child: _TRadioGroupFormField<T>(
            affinity: affinity,
            color: color,
            description: description,
            initialValue: initialValue,
            label: label,
            axis: axis,
            children: children,
            spacing: 0,
            onChanged: onChanged,
            radius: radius,
            variant: TSelectionGroupVariant.panel,
          ),
        );

  /// The control affinity of the group.
  final TControlAffinity affinity;

  /// The orientation of the group.
  final Axis axis;

  /// The children of the radio group.
  final List<TRadioGroupItem<T>> children;

  /// The color of the radio elements.
  final Color? color;

  /// The description widget
  final Widget? description;

  /// The initial value of the radio group.
  final T? initialValue;

  /// The label widget
  final Widget? label;

  /// The callback when the value changes.
  final ValueChanged<T?>? onChanged;

  /// The radius value for rounded corners
  ///
  /// Only used for [TRadioGroup.card] and [TRadioGroup.panel] variants.
  final double radius;

  /// The spacing between the group elements.
  ///
  /// If not specified, default is based on [TSelectionGroupVariant].
  final double? spacing;
}

// =============================================================================
// CLASS: _TRadioGroupFormField
// =============================================================================

class _TRadioGroupFormField<T> extends FormField<T> {
  _TRadioGroupFormField({
    required this.affinity,
    required this.axis,
    required this.children,
    required this.color,
    required this.description,
    required super.initialValue,
    required this.label,
    required this.onChanged,
    required this.radius,
    required this.spacing,
    required this.variant,
  }) : super(
          builder: (field) {
            final state = field as _TSwitchTileFormFieldState<T>;
            return state.buildWidget(state.context);
          },
        );
  final TControlAffinity affinity;
  final Axis axis;
  final Color? color;
  final List<TRadioGroupItem<T>> children;
  final Widget? description;
  final Widget? label;
  final ValueChanged<T?>? onChanged;
  final double radius;
  final double? spacing;
  final TSelectionGroupVariant variant;

  @override
  FormFieldState<T> createState() => _TSwitchTileFormFieldState();
}

class _TSwitchTileFormFieldState<T> extends FormFieldState<T> {
  _TRadioGroupFormField<T> get field => widget as _TRadioGroupFormField<T>;
  late final List<FocusNode> focusNodes;

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(
      field.children.length,
      (ii) => FocusNode(
        debugLabel: field.children[ii].value.toString(),
        descendantsAreFocusable: false,
        descendantsAreTraversable: false,
      ),
    );
    updateFocusNodes();
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
    for (var ii = 0; ii < field.children.length; ii++) {
      final f = focusNodes[ii];
      // Focus is only enabled for the first item (if none are selected)
      bool canRequestFocus = true;
      if (value == null) {
        canRequestFocus = ii == 0;
      } else {
        canRequestFocus = field.children[ii].value == value;
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
          final index = field.children.indexOf(field.children[ii]);

          // Update index and handle out-of-bounds
          int nextIndex = nextRequested ? index + 1 : index - 1;
          if (nextIndex < 0) {
            nextIndex = field.children.length - 1;
          } else if (nextIndex >= field.children.length) {
            nextIndex = 0;
          }

          // Make sure that the next item is enabled, else go to the next one
          while (!field.children[nextIndex].enabled) {
            nextIndex += nextRequested ? 1 : -1;
            if (nextIndex < 0) {
              nextIndex = field.children.length - 1;
            } else if (nextIndex >= field.children.length) {
              nextIndex = 0;
            }
          }

          // Handle focus and group value
          final nextItem = field.children[nextIndex];
          setState(() {
            didChange(nextItem.value);
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
      didChange(item.value);
      updateFocusNodes();
    });
    field.onChanged?.call(item.value);
  }

  // ---------------------------------------------------------------------------
  // METHOD: buildWidget
  // ---------------------------------------------------------------------------

  Widget buildWidget(BuildContext context) {
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
        final selected = value == item.value;
        return TSelectionGroupTile(
          key: ValueKey(item.value),
          index: index,
          numItems: field.children.length,
          variant: field.variant,
          color: field.color,
          title: item.title,
          description: item.description,
          radius: field.radius,
          selected: selected,
          enabled: item.enabled,
          affinity: field.affinity,
          axis: field.axis,
          onChanged: (status) => onChanged(item: item, status: status),
          control: TRadio(
            color: field.color,
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
