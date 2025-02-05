import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/title_label.dart';

// =============================================================================
// CLASS: TSelectionGroupItem
// =============================================================================

/// A radio group item
class TSelectionGroupItem<T> {
  /// Creates a radio item
  const TSelectionGroupItem({
    required this.value,
    required this.title,
    this.description,
    this.enabled = true,
  });

  /// The value
  final T value;

  /// The title widget
  final Widget title;

  /// The description widget
  final Widget? description;

  /// Whether the item is enabled
  final bool enabled;
}

// =============================================================================
// CLASS: TSelectionGroupList
// =============================================================================

/// A selection group
class TSelectionGroupList<T> extends StatelessWidget {
  /// Creates a selection group
  const TSelectionGroupList({
    required this.variant,
    required this.items,
    required this.itemBuilder,
    required this.title,
    required this.description,
    required this.spacing,
    required this.maxWidth,
    required this.radius,
    required this.axis,
    super.key,
  });

  /// Optional separator
  final TSelectionGroupVariant variant;

  /// The selection group items
  final List<TSelectionGroupItem<T>> items;

  /// The builder for the items
  final IndexedWidgetBuilder itemBuilder;

  /// The title widget
  final Widget? title;

  /// The description widget
  final Widget? description;

  /// The spacing between the items
  final double spacing;

  /// Optional separator
  final double maxWidth;

  /// Optional separator
  final double radius;

  /// The orientation of the list
  final Axis axis;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    /// Build the children widgets
    final List<Widget> effectiveChildren = [];
    for (var ii = 0; ii < items.length; ii++) {
      if (ii > 0 && variant == TSelectionGroupVariant.separated) {
        if (axis == Axis.vertical) {
          effectiveChildren.add(
            SizedBox(
              width: maxWidth,
              child: const Divider(height: 0, thickness: 1),
            ),
          );
        } else {
          effectiveChildren.add(
            const VerticalDivider(width: 0, thickness: 1),
          );
        }
      }
      effectiveChildren.add(
        Flexible(child: itemBuilder(context, ii)),
      );
    }

    /// Check for any special outer decoration
    BoxDecoration? decoration;
    if (variant == TSelectionGroupVariant.panel) {
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: tw.colors.divider,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      );
    }

    // Define the primary content
    final content = Container(
      decoration: decoration,
      child: TRowColumn(
        axis: axis,
        crossAxisAlignment: axis == Axis.vertical
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.stretch,
        spacing: spacing,
        children: effectiveChildren,
      ),
    );

    return SizedBox(
      width: maxWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TLabelDescriptionWidget(label: title, description: description),
          // For horizontal axis, wrap the content with IntrinsicHeight
          // This is to ensure the vertical divider height matches the content height
          if (axis == Axis.vertical)
            content
          else
            IntrinsicHeight(child: content),
        ],
      ),
    );
  }
}

// =============================================================================
// CLASS: TSelectionGroupTile
// =============================================================================

/// The variant of the radio group.
class TSelectionGroupTile extends StatelessWidget {
  /// Creates a selection group tile
  const TSelectionGroupTile({
    required this.variant,
    required this.index,
    required this.numItems,
    required this.color,
    required this.title,
    required this.description,
    required this.control,
    required this.radius,
    required this.selected,
    required this.enabled,
    required this.affinity,
    required this.axis,
    required this.onChanged,
    this.applySelectedBorderColor = true,
    this.controlCrossAxisAlignment = CrossAxisAlignment.start,
    super.key,
  });

  /// The variant of the selection group.
  final TSelectionGroupVariant variant;

  /// The index of the item
  final int index;

  /// The number of items
  final int numItems;

  /// The color of the tile
  final Color? color;

  /// The title widget
  final Widget title;

  /// The description widget
  final Widget? description;

  /// The control widget
  final Widget control;

  /// The radius the card
  final double radius;

  /// Is the item selected
  final bool selected;

  /// Is the control enabled
  final bool enabled;

  /// The control affinity
  final TControlAffinity affinity;

  /// The orientation of the group list
  final Axis axis;

  /// The onPressed callback
  final ValueChanged<bool> onChanged;

  /// Optional to apply border color when selected
  final bool applySelectedBorderColor;

  /// The cross axis alignment of the control (within the [Row] widget)
  final CrossAxisAlignment controlCrossAxisAlignment;

  /// Is this item first in the list
  bool get isFirst => index == 0;

  /// Is this item last in the list
  bool get isLast => index == numItems - 1;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    final color = (this.color ?? tw.colors.primary).toMaterialColor();

    final sep = affinity.isLeading ? TSpace.v12 : TSpace.v0;

    Color selectedBorderColor = tw.light ? color.shade400 : color.shade600;
    if (!enabled) {
      selectedBorderColor = tw.colors.disabled;
    }

    // Styled title widget
    final styledTitle = Padding(
      padding: EdgeInsets.only(left: sep),
      child: DefaultTextStyle.merge(
        style: TTextStyle.text_sm.copyWith(
          color: enabled ? null : tw.colors.disabledTextColor,
          fontWeight: TFontWeight.medium,
          height: kTextHeightNone,
        ),
        child: title,
        maxLines: 100,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
    );

    /// The effective title widget
    final Widget effectiveTitle;
    switch (variant) {
      case TSelectionGroupVariant.basic:
      case TSelectionGroupVariant.separated:
        effectiveTitle = TGestureDetector(
          mouseCursor: WidgetStatePropertyAll(
            enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
          ),
          canRequestFocus: false,
          builder: (context, states) => styledTitle,
          onTap: () => onChanged(!selected),
        );
      case TSelectionGroupVariant.card:
      case TSelectionGroupVariant.panel:
        effectiveTitle = styledTitle;
    }

    /// The children ordering
    List<Widget> children = [
      Padding(
        // Slight adjustment to align control with title when placed at the start
        padding: EdgeInsets.only(
          top: controlCrossAxisAlignment == CrossAxisAlignment.start ? 1 : 0,
        ),
        child: control,
      ),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: effectiveTitle,
            ),
            if (description != null)
              Padding(
                padding: EdgeInsets.only(top: TSpace.v2, left: sep),
                child: DefaultTextStyle.merge(
                  style: TTextStyle.text_sm.copyWith(
                    color:
                        enabled ? tw.colors.label : tw.colors.disabledTextColor,
                  ),
                  child: description!,
                  maxLines: 100,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    ];
    if (affinity.isTrailing) {
      children = children.reversed.toList();
    }

    /// Determine the child alignment
    MainAxisAlignment childrenAlignment = MainAxisAlignment.start;
    if (affinity.isLeading) {
      if (axis == Axis.vertical ||
          variant == TSelectionGroupVariant.card ||
          variant == TSelectionGroupVariant.panel) {
        childrenAlignment = MainAxisAlignment.start;
      } else {
        childrenAlignment = MainAxisAlignment.center;
      }
    } else {
      childrenAlignment = MainAxisAlignment.spaceBetween;
    }

    /// The primary content
    final content = Row(
      crossAxisAlignment: controlCrossAxisAlignment,
      mainAxisAlignment: childrenAlignment,
      children: children,
    );

    switch (variant) {
      case TSelectionGroupVariant.basic:
      case TSelectionGroupVariant.separated:
        return content;
      case TSelectionGroupVariant.card:
        return TGestureDetector(
          mouseCursor: WidgetStatePropertyAll(
            enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
          ),
          onTap: enabled ? () => onChanged(!selected) : null,
          builder: (context, states) {
            return TCard(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(
                  color: selected && applySelectedBorderColor
                      ? selectedBorderColor
                      : (enabled ? tw.colors.divider : tw.colors.disabled),
                  width: selected && applySelectedBorderColor ? 1.5 : 1,
                ),
              ),
              child: content,
            );
          },
        );
      case TSelectionGroupVariant.panel:
        // Customize the border radius depending on axis
        final r = Radius.circular(radius);
        final BorderRadiusGeometry itemBorderRadius;
        if (axis == Axis.vertical) {
          itemBorderRadius = BorderRadius.only(
            topLeft: isFirst ? r : Radius.zero,
            topRight: isFirst ? r : Radius.zero,
            bottomLeft: isLast ? r : Radius.zero,
            bottomRight: isLast ? r : Radius.zero,
          );
        } else {
          itemBorderRadius = BorderRadius.only(
            topLeft: isFirst ? r : Radius.zero,
            bottomLeft: isFirst ? r : Radius.zero,
            topRight: isLast ? r : Radius.zero,
            bottomRight: isLast ? r : Radius.zero,
          );
        }

        // Customize the border location depending on axis
        BorderSide bottom = BorderSide.none;
        BorderSide left = BorderSide.none;
        if (axis == Axis.vertical) {
          bottom =
              isLast ? BorderSide.none : BorderSide(color: tw.colors.divider);
        } else {
          left =
              isFirst ? BorderSide.none : BorderSide(color: tw.colors.divider);
        }

        return TGestureDetector(
          mouseCursor: WidgetStatePropertyAll(
            enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
          ),
          onTap: enabled ? () => onChanged(!selected) : null,
          canRequestFocus: false,
          skipTraversal: true,
          builder: (context, states) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: itemBorderRadius,
                border: Border(bottom: bottom, left: left),
              ),
              child: TCard(
                shape: RoundedRectangleBorder(
                  borderRadius: itemBorderRadius,
                  side: selected
                      ? BorderSide(color: selectedBorderColor, width: 1.5)
                      : BorderSide.none,
                ),
                child: content,
              ),
            );
          },
        );
    }
  }
}
