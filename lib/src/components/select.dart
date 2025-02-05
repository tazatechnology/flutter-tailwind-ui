import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/input_border.dart';
import 'package:flutter_tailwind_ui/src/internal/title_label.dart';

// =============================================================================
// CLASS: TSelect
// =============================================================================

/// A Tailwind inspired select widget
class TSelect<T> extends StatefulWidget {
  /// Construct a [TSelect] widget.
  const TSelect({
    required this.items,
    this.selectedItemBuilder,
    this.itemBuilder,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
    this.allowDeselect = false,
    this.maxWidth = TScreen.max_w_sm,
    this.placeholder = const Text('Select'),
    this.trailing = const Icon(Icons.keyboard_arrow_down),
    this.selectedIcon = const Icon(Icons.check),
    this.selectedIconAffinity = TControlAffinity.trailing,
    this.itemExtent = kTDefaultInputHeight,
    this.maxVisible = 5,
    this.itemPadding = TOffset.x12,
    this.labelText,
    this.label,
    this.fillColor,
    this.borderColor,
    this.borderRadius = const WidgetStatePropertyAll(TBorderRadius.rounded_md),
    super.key,
  });

  /// The list of options to display in the select widget
  final List<T> items;

  /// A builder that is called for the currently selected item
  final Widget Function(T)? selectedItemBuilder;

  /// A builder that is called for each item in the list of options
  final Widget Function(T)? itemBuilder;

  /// The initial value of the select widget
  final T? initialValue;

  /// A callback that is called when the value of the select widget changes
  final ValueChanged<T?>? onChanged;

  /// Whether the select widget is enabled
  final bool enabled;

  /// Whether clicking on the selected item will deselect it
  final bool allowDeselect;

  /// The maximum width of the select widget
  final double? maxWidth;

  /// The placeholder widget to display when no option is selected
  final Widget? placeholder;

  /// The trailing widget to display in the anchor widget
  ///
  /// Defaults to a chevron down
  final Widget trailing;

  /// The icon to display when an item is selected
  ///
  /// Defaults to a checkmark
  final Widget? selectedIcon;

  /// The position of the selected icon
  final TControlAffinity selectedIconAffinity;

  /// The height of each item in the list of options
  final double itemExtent;

  /// The maximum number of items to display in dropdown before scrolling
  final int maxVisible;

  /// The padding around each item in the list of options
  final EdgeInsetsGeometry itemPadding;

  /// The label text to display above the input field.
  ///
  /// For full customization, use [label] to pass in a widget.
  final String? labelText;

  /// The label text to display above the input field.
  final Widget? label;

  /// The fill color for the input field.
  final WidgetStateProperty<Color>? fillColor;

  /// The stateful border color for the input field.
  final WidgetStateProperty<Color>? borderColor;

  /// The stateful border color for the input field.
  final WidgetStateProperty<BorderRadius>? borderRadius;

  @override
  State<TSelect<T>> createState() => _TSelectState();
}

class _TSelectState<T> extends State<TSelect<T>> {
  final dropdownController = TDropdownController();
  late T? selected = widget.initialValue;
  final ScrollController scrollController = ScrollController();
  late int hoveredIndex = selectedIndex;
  late final stateControllers = List.generate(
    widget.items.length,
    (index) => TWidgetStatesController(),
  );

  late final maxVisible = widget.maxVisible.clamp(0, widget.items.length);

  /// The index of the selected item
  int get selectedIndex =>
      selected == null ? -1 : widget.items.indexOf(selected as T);

  // Determine if the content will be scrollable
  bool get isScrollable => widget.items.length > maxVisible;

  // The right padding accounts for the scrollbar width
  EdgeInsets get listViewPadding =>
      TOffset.a6 + (isScrollable ? TOffset.r16 : TOffset.r0);

  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    scrollController.dispose();
    for (final c in stateControllers) {
      c.dispose();
    }
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: scrollToIndex
  // ---------------------------------------------------------------------------

  void scrollToIndex(int index) {
    final maxScrollExtent = scrollController.position.maxScrollExtent;
    final targetOffset = math.min(index * widget.itemExtent, maxScrollExtent);
    scrollController.jumpTo(targetOffset);
  }

  // ---------------------------------------------------------------------------
  // METHOD: buildListView
  // ---------------------------------------------------------------------------

  Widget buildListView() {
    final tw = context.tw;

    return TScrollbar(
      controller: scrollController,
      thumbVisibility: const WidgetStatePropertyAll(true),
      trackVisibility: const WidgetStatePropertyAll(true),
      child: ListView.builder(
        controller: scrollController,
        padding: listViewPadding,
        itemCount: widget.items.length,
        itemExtent: widget.itemExtent,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final option = widget.items[index];
          final optionWidget =
              widget.itemBuilder?.call(option) ?? Text(option.toString());
          final bool isSelected = selected == option;
          final itemStateController = stateControllers[index];
          itemStateController.hovered = hoveredIndex == index || isSelected;
          itemStateController.selected = isSelected;
          return TGestureDetector(
            controller: itemStateController,
            onTap: () {
              setState(() {
                if (selectedIndex >= 0) {
                  stateControllers[selectedIndex].value = {};
                }
                if (selected == option && widget.allowDeselect) {
                  selected = null;
                  hoveredIndex = -1;
                } else {
                  selected = option;
                  hoveredIndex = index;
                  itemStateController.selected = true;
                }
              });
              widget.onChanged?.call(selected);
              dropdownController.hide();
            },
            onHover: (value) {
              if (hoveredIndex != index && value) {
                if (selectedIndex >= 0) {
                  stateControllers[selectedIndex].hovered = false;
                }
                hoveredIndex = index;
              }
            },
            builder: (context, states) {
              bool showLeading = false;
              bool showTrailing = false;
              if (widget.selectedIcon != null) {
                showLeading = widget.selectedIconAffinity.isLeading;
                showTrailing = widget.selectedIconAffinity.isTrailing;
              }
              final selectedIcon =
                  widget.selectedIcon ?? const SizedBox.shrink();

              return Container(
                alignment: Alignment.centerLeft,
                padding: widget.itemPadding,
                decoration: BoxDecoration(
                  color: states.hovered ? tw.colors.hover : Colors.transparent,
                  borderRadius: TBorderRadius.rounded_sm,
                ),
                child: DefaultTextStyle.merge(
                  style: TTextStyle.text_sm.copyWith(
                    fontWeight: isSelected ? TFontWeight.semibold : null,
                  ),
                  child: IconTheme(
                    data: IconTheme.of(context).copyWith(
                      size: TSpace.v16,
                      color: tw.colors.primary,
                    ),
                    child: Row(
                      children: [
                        if (showLeading)
                          Padding(
                            padding: EdgeInsets.only(
                              right: widget.itemPadding.horizontal / 2,
                            ),
                            child: Opacity(
                              opacity: isSelected ? 1 : 0,
                              child: selectedIcon,
                            ),
                          ),
                        Expanded(child: optionWidget),
                        if (showTrailing && isSelected) selectedIcon,
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    // Resolve the widget to display in the select field
    Widget selectWidget = SelectionContainer.disabled(
      child: widget.placeholder ?? const SizedBox.shrink(),
    );
    if (selected != null) {
      if (widget.selectedItemBuilder != null) {
        selectWidget = widget.selectedItemBuilder!.call(selected as T);
      } else {
        selectWidget = Text(selected.toString());
      }
    }

    // Resolve the text style for the select widget
    TextStyle? selectWidgetTextStyle =
        context.theme.inputDecorationTheme.hintStyle?.copyWith(
      color: selected != null ? tw.colors.body : null,
    );
    if (!widget.enabled) {
      selectWidgetTextStyle = selectWidgetTextStyle?.copyWith(
        color: tw.colors.disabledTextColor,
      );
    }

    // Resolve the label widget
    Widget? label = widget.label;
    if (label == null && widget.labelText != null) {
      label = Text(widget.labelText!);
    }

    // Resolve the fill color
    final effectiveFillColor =
        WidgetStateProperty.resolveWith<Color?>((states) {
      Color? color = widget.fillColor?.resolve(states);
      if (color == null && states.disabled) {
        color = tw.dark ? Colors.black54 : TColors.gray.shade50;
      }
      return color;
    });

    // The right padding accounts for the scrollbar width
    final dropdownHeight =
        widget.itemExtent * maxVisible + listViewPadding.vertical + 2;

    return SizedBox(
      width: widget.maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null) TLabelDescriptionWidget(label: label),
          TDropdown(
            controller: dropdownController,
            matchAnchorWidth: true,
            height: dropdownHeight,
            alignment: Alignment.bottomCenter,
            content: buildListView(),
            anchor: TInputBorderWrapper(
              enabled: widget.enabled,
              mouseCursor: WidgetStatePropertyAll(
                widget.enabled
                    ? SystemMouseCursors.click
                    : SystemMouseCursors.forbidden,
              ),
              padding: TOffset.x12,
              height: kTDefaultInputHeight,
              width: widget.maxWidth,
              fillColor: effectiveFillColor,
              borderColor: widget.borderColor,
              borderRadius: widget.borderRadius,
              onTap: widget.enabled
                  ? () {
                      hoveredIndex = selectedIndex;
                      dropdownController.show();
                      FocusScope.of(context).unfocus();
                      if (selectedIndex >= 0) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          scrollToIndex(selectedIndex);
                        });
                      }
                    }
                  : null,
              child: IconTheme(
                data: IconTheme.of(context).copyWith(
                  size: TSpace.v16,
                  color: widget.enabled ? null : tw.colors.disabledTextColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultTextStyle.merge(
                      style: selectWidgetTextStyle,
                      child: selectWidget,
                    ),
                    SizedBox(
                      height: kTDefaultInputHeight,
                      child: widget.trailing,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
