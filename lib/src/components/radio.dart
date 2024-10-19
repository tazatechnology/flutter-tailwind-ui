import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// enum: TRadioListVariant
// =================================================

/// The style
enum TRadioListVariant {
  /// Basic list
  basic,

  /// Place items in separated cards
  card,

  /// Place items in a combined panel
  panel,
}

// =================================================
// CLASS: TRadioListItem
// =================================================

/// A radio list item
class TRadioListItem<T> {
  /// Creates a radio item widget
  const TRadioListItem({
    required this.value,
    required this.onChanged,
    this.enabled = true,
    this.title,
  });

  /// The title widget
  final Widget? title;

  /// The value
  final T value;

  /// The on changed callback
  final ValueChanged<T> onChanged;

  /// Whether the item is enabled
  final bool enabled;
}

// =================================================
// CLASS: TRadioList
// =================================================

/// A radio list widget
class TRadioList<T> extends StatelessWidget {
  /// Creates a radio list widget with raw properties
  const TRadioList.basic({
    required this.items,
    required this.groupValue,
    super.key,
    this.direction = Axis.vertical,
    this.mouseCursor = SystemMouseCursors.basic,
    this.controlAffinity = TControlAffinity.leading,
    this.separated = false,
    this.title,
    this.description,
    this.spacing,
    this.constraints,
    this.expanded = false,
  })  : variant = TRadioListVariant.basic,
        padding = null;

  /// Creates a radio list widget with raw properties
  const TRadioList.card({
    required this.items,
    required this.groupValue,
    super.key,
    this.direction = Axis.vertical,
    this.mouseCursor = SystemMouseCursors.basic,
    this.controlAffinity = TControlAffinity.leading,
    this.padding = const EdgeInsets.symmetric(
      horizontal: TSpace.v16,
      vertical: TSpace.v12,
    ),
    this.title,
    this.description,
    this.spacing,
    this.constraints,
    this.expanded = false,
  })  : variant = TRadioListVariant.card,
        separated = false;

  /// Creates a radio list widget with raw properties
  const TRadioList.panel({
    required this.items,
    required this.groupValue,
    super.key,
    this.direction = Axis.vertical,
    this.mouseCursor = SystemMouseCursors.basic,
    this.controlAffinity = TControlAffinity.leading,
    this.padding = const EdgeInsets.symmetric(
      horizontal: TSpace.v16,
      vertical: TSpace.v12,
    ),
    this.title,
    this.description,
    this.spacing,
    this.constraints,
    this.expanded = false,
  })  : variant = TRadioListVariant.panel,
        separated = false;

  /// The radio items
  final List<TRadioListItem<T>> items;

  /// The group value
  final T groupValue;

  /// The direction of the radio list
  final Axis direction;

  /// The spacing between items
  final double? spacing;

  /// The mouse cursor
  final MouseCursor mouseCursor;

  /// The title of the radio list
  final Widget? title;

  /// The description of the radio list
  final Widget? description;

  /// The size constraints of the radio list
  final BoxConstraints? constraints;

  /// The location of the radio control
  final TControlAffinity controlAffinity;

  /// Whether the items are separated
  final bool separated;

  /// Whether the items are expanded
  final bool expanded;

  /// The style of the radio list
  final TRadioListVariant variant;

  /// Padding for card and panel variants
  final EdgeInsetsGeometry? padding;

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final effectiveSpacing = spacing ?? TSpace.v14;

    return ConstrainedBox(
      constraints: constraints ?? const BoxConstraints(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            DefaultTextStyle.merge(
              style: tw.text.style_sm.semibold,
              child: title!,
            ),
          if (description != null)
            Padding(
              padding: TOffset.t4 + TOffset.b16,
              child: DefaultTextStyle.merge(
                style: tw.text.style_sm.copyWith(color: tw.colors.label),
                child: description!,
              ),
            ),
          TRowColumn(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            axis: direction,
            spacing: effectiveSpacing,
            separated: separated,
            children: items.map<Widget>((item) {
              return _TRadioListItemWidget(
                item: item,
                selected: item.value == groupValue,
                mouseCursor: mouseCursor,
                controlAffinity: controlAffinity,
                direction: direction,
                style: variant,
                expanded: expanded,
                padding: padding,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// =================================================
// CLASS: _TRadioListItemWidget
// =================================================

class _TRadioListItemWidget<T> extends StatefulWidget {
  const _TRadioListItemWidget({
    required this.item,
    required this.selected,
    required this.mouseCursor,
    required this.controlAffinity,
    required this.direction,
    required this.style,
    required this.expanded,
    this.padding,
  });
  final TRadioListItem<T> item;
  final bool selected;
  final MouseCursor mouseCursor;
  final TControlAffinity controlAffinity;
  final Axis direction;
  final TRadioListVariant style;
  final bool expanded;
  final EdgeInsetsGeometry? padding;

  @override
  State<_TRadioListItemWidget<T>> createState() =>
      _TRadioListItemWidgetState<T>();
}

class _TRadioListItemWidgetState<T> extends State<_TRadioListItemWidget<T>> {
  late final bool isEnabled;
  late final FocusNode focusNode;
  bool get isFocused => focusNode.hasFocus;

  // -------------------------------------------------
  // METHOD: initState
  // -------------------------------------------------

  @override
  void initState() {
    super.initState();
    isEnabled = widget.item.enabled;
    focusNode = FocusNode(
      canRequestFocus: isEnabled,
      descendantsAreFocusable: isEnabled,
      skipTraversal: !isEnabled,
      descendantsAreTraversable: isEnabled,
    );
    focusNode.addListener(() {
      setState(() {});
    });
  }

  // -------------------------------------------------
  // METHOD: dispose
  // -------------------------------------------------

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final theme = context.theme;
    final isVertical = widget.direction == Axis.vertical;
    final selectedColor = tw.colors.primary[tw.light ? 600 : 400]!;

    /// Radio control
    const radioDot = Icon(Icons.circle, size: 7, color: Colors.white);
    final radioControl = Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: TSpace.v16,
          height: TSpace.v16,
          decoration: BoxDecoration(
            color: widget.selected ? selectedColor : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.selected
                  ? selectedColor
                  : TColors.gray.shade300.withOpacity(isEnabled ? 1 : 0.75),
            ),
          ),
          child: widget.selected ? radioDot : null,
        ),
        Container(
          width: TSpace.v24,
          height: TSpace.v24,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: isFocused ? selectedColor : Colors.transparent,
              width: 1.75,
            ),
          ),
        ),
      ],
    );

    /// Title widget
    final titleWidget = widget.item.title == null
        ? const SizedBox.shrink()
        : Expanded(
            flex: widget.expanded ? 1 : 0,
            child: Padding(
              padding:
                  widget.controlAffinity.isLeading ? TOffset.l12 : TOffset.r12,
              // Change the text theme for this title
              child: DefaultTextStyle.merge(
                style: tw.text.style_sm.copyWith(
                  fontWeight: isEnabled ? FontWeight.w500 : FontWeight.normal,
                  color: isEnabled ? null : theme.disabledColor,
                ),
                child: widget.item.title!,
              ),
            ),
          );

    /// Content layout
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.controlAffinity.isLeading
          ? MainAxisAlignment.start
          : MainAxisAlignment.spaceBetween,
      children: widget.controlAffinity.isLeading
          ? [radioControl, titleWidget]
          : [titleWidget, const Spacer(), radioControl],
    );

    /// Style the child
    Widget child;
    switch (widget.style) {
      case TRadioListVariant.basic:
        child = content;
      case TRadioListVariant.card:
        RoundedRectangleBorder cardShape;
        final themeCardShape = context.theme.cardTheme.shape;
        if (themeCardShape is RoundedRectangleBorder) {
          cardShape = themeCardShape;
        } else {
          cardShape = const RoundedRectangleBorder();
        }
        child = Card(
          shape: cardShape.copyWith(
            side: BorderSide(
              width: widget.selected ? 2 : 1,
              color: widget.selected ? selectedColor : cardShape.side.color,
            ),
          ),
          child: Container(
            width: isVertical ? double.infinity : null,
            padding: widget.padding,
            child: content,
          ),
        );
      case TRadioListVariant.panel:
        child = content;
    }

    /// Build the widget
    return InkWell(
      key: ValueKey(widget.item.value),
      mouseCursor: widget.mouseCursor,
      focusNode: focusNode,
      onTap: () {
        if (!isEnabled) {
          return;
        }
        widget.item.onChanged(widget.item.value);
      },
      onHighlightChanged: (value) {
        if (focusNode.canRequestFocus) {
          focusNode.requestFocus();
        }
      },
      onFocusChange: (value) {
        setState(() {});
      },
      child: child,
    );
  }
}
