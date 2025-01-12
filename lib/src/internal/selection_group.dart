import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

/// Fixed size of the control widget
const defaultControlSize = TSpace.v16;

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
    required this.spacing,
    required this.width,
    required this.radius,
    super.key,
  });

  /// Optional separator
  final TSelectionGroupVariant variant;

  /// The selection group items
  final List<TSelectionGroupItem<T>> items;

  /// The builder for the items
  final IndexedWidgetBuilder itemBuilder;

  /// The spacing between the items
  final double spacing;

  /// Optional separator
  final double width;

  /// Optional separator
  final double radius;

  /// Whether the items are to be separated
  bool get separated => variant == TSelectionGroupVariant.separated;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    /// Build the children widgets
    final List<Widget> effectiveChildren = [];
    for (var i = 0; i < items.length; i++) {
      if (i > 0 && variant == TSelectionGroupVariant.separated) {
        effectiveChildren.add(
          SizedBox(
            width: width,
            child: const Divider(height: 0, thickness: 1),
          ),
        );
      }
      effectiveChildren.add(itemBuilder(context, i));
    }

    /// Check for any special outer decoration
    BoxDecoration? decoration;
    if (variant == TSelectionGroupVariant.panel) {
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: tw.colors.divider, strokeAlign: 1),
      );
    }

    return Container(
      width: width,
      decoration: decoration,
      child: TRowColumn(
        axis: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: spacing,
        children: effectiveChildren,
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
    required this.width,
    required this.radius,
    required this.selected,
    required this.enabled,
    required this.affinity,
    required this.onChanged,
    this.shape,
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

  /// The width of the tile
  final double width;

  /// The radius the card
  final double radius;

  /// Is the item selected
  final bool selected;

  /// Is the control enabled
  final bool enabled;

  /// The control affinity
  final TControlAffinity affinity;

  /// The onPressed callback
  final ValueChanged<bool> onChanged;

  /// The shape of the card
  final RoundedRectangleBorder? shape;

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
    final sep = affinity.isLeading ? TSpace.v12 : TSpace.v0;

    final color = (this.color ?? tw.colors.primary).toMaterialColor();

    Color selectedBorderColor = tw.light ? color.shade400 : color.shade600;
    if (!enabled) {
      selectedBorderColor = tw.colors.disabled;
    }

    // Padded control widget
    final control = Padding(
      padding: EdgeInsets.only(right: sep),
      child: this.control,
    );

    // Styled title widget
    final styledTitle = DefaultTextStyle.merge(
      style: tw.text.style_sm.medium.leading_none.copyWith(
        color: enabled ? null : tw.colors.disabledTextColor,
      ),
      child: title,
      textAlign: TextAlign.start,
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
    List<Widget> children = [control, effectiveTitle];
    if (affinity.isTrailing) {
      children = children.reversed.toList();
    }

    /// The primary content
    final content = SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: affinity.isLeading
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: children,
          ),
          if (description != null)
            Padding(
              padding: EdgeInsets.only(
                top: TSpace.v4,
                left: affinity.isLeading ? defaultControlSize + sep : 0,
              ),
              child: DefaultTextStyle.merge(
                style: tw.text.style_sm.copyWith(
                  color:
                      enabled ? tw.colors.label : tw.colors.disabledTextColor,
                ),
                child: description!,
                textAlign: TextAlign.start,
              ),
            ),
        ],
      ),
    );

    switch (variant) {
      case TSelectionGroupVariant.basic:
      case TSelectionGroupVariant.separated:
        return content;
      case TSelectionGroupVariant.card:
        return TGestureDetector(
          onTap: enabled ? () => onChanged(!selected) : null,
          builder: (context, states) {
            return TCard(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(
                  color: selected
                      ? selectedBorderColor
                      : (enabled ? tw.colors.divider : tw.colors.disabled),
                  width: selected ? 1.5 : 1,
                ),
              ),
              child: content,
            );
          },
        );
      case TSelectionGroupVariant.panel:
        // Perform panel specific decoration
        final r = Radius.circular(radius);
        final itemBorderRadius = BorderRadius.only(
          topLeft: isFirst ? r : TRadius.none,
          topRight: isFirst ? r : TRadius.none,
          bottomLeft: isLast ? r : TRadius.none,
          bottomRight: isLast ? r : TRadius.none,
        );
        return TGestureDetector(
          onTap: enabled ? () => onChanged(!selected) : null,
          canRequestFocus: false,
          skipTraversal: true,
          builder: (context, states) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: itemBorderRadius,
                border: Border(
                  bottom: isLast
                      ? BorderSide.none
                      : BorderSide(color: tw.colors.divider),
                ),
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
