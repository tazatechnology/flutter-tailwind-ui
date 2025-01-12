import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/extensions/key_event.dart';
import 'package:flutter_tailwind_ui/src/internal/selection_group.dart';

// =============================================================================
// CLASS: TCheckbox
// =============================================================================

/// A checkbox
class TCheckbox extends StatelessWidget {
  /// Creates a checkbox widget
  const TCheckbox({
    required this.value,
    this.onChanged,
    this.color,
    this.enabled = true,
    this.focusNode,
    super.key,
  });

  /// The value of the checkbox button
  final bool value;

  /// The callback when the value changes
  final ValueChanged<bool>? onChanged;

  /// The color of the checkbox
  final Color? color;

  /// Flag to enable or disable the checkbox
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

    // Have a default spacebar handler for the checkbox
    KeyEventResult onKeyEvent(FocusNode _, KeyEvent event) {
      if (event.isSpaceKeyDown && enabled) {
        onChanged?.call(!value);
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }

    return TGestureDetector(
      mouseCursor: WidgetStatePropertyAll(
        enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      ),
      focusNode: focusNode,
      canRequestFocus: enabled,
      onTap: () {
        if (enabled) {
          onChanged?.call(!value);
        }
      },
      onKeyEvent: onKeyEvent,
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
          borderRadius: TBorderRadius.rounded,
          focusColor: color,
          child: Container(
            width: defaultControlSize,
            height: defaultControlSize,
            decoration: BoxDecoration(
              color: value
                  ? color
                  : (enabled
                      ? Colors.transparent
                      : tw.colors.disabled.withValues(alpha: 0.5)),
              border: Border.all(color: borderColor),
              borderRadius: TBorderRadius.rounded,
            ),
            child: Icon(
              Icons.check,
              size: defaultControlSize - 4,
              color: value ? color.contrastBlackWhite() : Colors.transparent,
            ),
          ),
        );
      },
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
    this.groupValues,
    this.color,
    this.width = TScreen.max_w_sm,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    super.key,
  })  : variant = TSelectionGroupVariant.basic,
        _radius = 0;

  /// Creates a separated checkbox group
  const TCheckboxGroup.separated({
    required this.children,
    this.groupValues,
    this.color,
    this.width = TScreen.max_w_sm,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    super.key,
  })  : variant = TSelectionGroupVariant.separated,
        _radius = 0;

  /// Creates a card checkbox group
  const TCheckboxGroup.card({
    required this.children,
    this.groupValues,
    this.color,
    this.width = TScreen.max_w_sm,
    double radius = TRadiusScale.radius_lg,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    super.key,
  })  : variant = TSelectionGroupVariant.card,
        _radius = radius;

  /// Creates a card checkbox group
  const TCheckboxGroup.panel({
    required this.children,
    this.groupValues,
    this.color,
    this.width = TScreen.max_w_sm,
    double radius = TRadiusScale.radius_lg,
    this.spacing,
    this.affinity = TControlAffinity.leading,
    super.key,
  })  : variant = TSelectionGroupVariant.panel,
        _radius = radius;

  /// The children of the checkbox group.
  final List<TCheckboxGroupItem<T>> children;

  /// The value of the radio group.
  final List<T>? groupValues;

  /// The variant of the checkbox group.
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
  final double _radius;

  @override
  State<TCheckboxGroup<T>> createState() => _TCheckboxGroupState<T>();
}

class _TCheckboxGroupState<T> extends State<TCheckboxGroup<T>> {
  late final List<T> groupValues;

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    groupValues = widget.groupValues ?? [];
    super.initState();
  }

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged({required TCheckboxGroupItem<T> item, required bool status}) {
    if (!item.enabled) {
      return;
    }
    if (status && !groupValues.contains(item.value)) {
      groupValues.add(item.value);
    } else if (!status && groupValues.contains(item.value)) {
      groupValues.remove(item.value);
    }
    setState(() {});
  }

  // ---------------------------------------------------------------------------
  // METHOD: initState
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
        final selected = groupValues.contains(item.value);
        return TSelectionGroupTile(
          key: ValueKey(item.value),
          index: index,
          numItems: widget.children.length,
          variant: widget.variant,
          color: widget.color,
          selected: selected,
          title: item.title,
          description: item.description,
          width: widget.width,
          radius: widget._radius,
          enabled: item.enabled,
          affinity: widget.affinity,
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
