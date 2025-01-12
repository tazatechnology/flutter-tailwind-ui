import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/extensions/key_event.dart';
import 'package:flutter_tailwind_ui/src/internal/selection_group.dart';

// =============================================================================
// CLASS: TRadio
// =============================================================================

/// A Tailwind UI inspired radio button
class TRadio extends StatelessWidget {
  /// Creates a radio button
  const TRadio({
    required this.value,
    this.onChanged,
    this.color,
    this.enabled = true,
    this.focusNode,
    super.key,
  });

  /// The value of the radio button
  final bool value;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The color of the radio button
  final Color? color;

  /// Flag to enable or disable the radio button
  final bool enabled;

  /// The focus node of the radio button
  final FocusNode? focusNode;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final color =
        enabled ? this.color ?? tw.colors.primary : tw.colors.disabled;

    final radioIndicator = Icon(
      Icons.circle,
      size: 7,
      color: color.contrastBlackWhite(),
    );

    final canRequestFocus = enabled && (focusNode?.canRequestFocus ?? false);

    return TGestureDetector(
      mouseCursor: WidgetStatePropertyAll(
        enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      ),
      focusNode: focusNode,
      canRequestFocus: enabled && canRequestFocus,
      onTap: () {
        if (enabled) {
          onChanged?.call(!value);
        }
      },
      onKeyEvent: focusNode?.onKeyEvent,
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

        return Stack(
          alignment: Alignment.center,
          children: [
            TFocusBorder(
              focusColor: color,
              focused: states.focused,
              borderRadius: TBorderRadius.rounded_full,
              child: Container(
                width: defaultControlSize,
                height: defaultControlSize,
                decoration: BoxDecoration(
                  color: value
                      ? color
                      : (enabled
                          ? Colors.transparent
                          : tw.colors.disabled.withValues(alpha: 0.5)),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor,
                  ),
                ),
                child: value ? radioIndicator : null,
              ),
            ),
            // Hidden outer container for the focus border
            Container(
              width: defaultControlSize,
              height: defaultControlSize,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ],
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
    this.groupValue,
    this.onChanged,
    this.color,
    this.width = TScreen.max_w_sm,
    this.spacing,
    this.affinity = TControlAffinity.leading,
  })  : variant = TSelectionGroupVariant.basic,
        _radius = 0;

  /// Creates a [TRadioGroup] as a card variant
  const TRadioGroup.separated({
    required this.children,
    super.key,
    this.groupValue,
    this.onChanged,
    this.color,
    this.width = TScreen.max_w_sm,
    this.spacing,
    this.affinity = TControlAffinity.leading,
  })  : variant = TSelectionGroupVariant.separated,
        _radius = 0;

  /// Creates a [TRadioGroup] as a card variant
  const TRadioGroup.card({
    required this.children,
    super.key,
    this.groupValue,
    this.onChanged,
    this.color,
    this.width = TScreen.max_w_sm,
    double radius = TRadiusScale.radius_lg,
    this.spacing,
    this.affinity = TControlAffinity.leading,
  })  : variant = TSelectionGroupVariant.card,
        _radius = radius;

  /// Creates a [TRadioGroup] as a panel variant
  const TRadioGroup.panel({
    required this.children,
    super.key,
    this.groupValue,
    this.onChanged,
    this.color,
    this.width = TScreen.max_w_sm,
    double radius = TRadiusScale.radius_lg,
    this.spacing,
    this.affinity = TControlAffinity.leading,
  })  : variant = TSelectionGroupVariant.panel,
        _radius = radius;

  /// The children of the radio group.
  final List<TRadioGroupItem<T>> children;

  /// The value of the radio group.
  final T? groupValue;

  /// The callback when the value changes.
  final ValueChanged<T>? onChanged;

  /// The variant of the radio group.
  final TSelectionGroupVariant variant;

  /// The color of the radio elements.
  final Color? color;

  /// The maximum width of the radio group.
  final double width;

  /// The spacing between the radio elements.
  ///
  /// If not specified, default is based on [TSelectionGroupVariant].
  final double? spacing;

  /// The control affinity of the radio group.
  final TControlAffinity affinity;

  /// The radius value for rounded corners
  ///
  /// Only used for [TRadioGroup.card] and [TRadioGroup.panel] variants.
  final double _radius;

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
    super.initState();
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
      variant: widget.variant,
      width: widget.width,
      spacing: widget.spacing ?? widget.variant.spacing,
      items: widget.children,
      radius: widget._radius,
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
          width: widget.width,
          radius: widget._radius,
          selected: selected,
          enabled: item.enabled,
          affinity: widget.affinity,
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
