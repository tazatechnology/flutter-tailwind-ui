import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/input_border.dart';
import 'package:flutter_tailwind_ui/src/internal/title_label.dart';

// =============================================================================
// CLASS: TSelect
// =============================================================================

/// A Tailwind inspired select widget
class TSelect<T> extends TFormField<T> {
  /// Construct a [TSelect] widget.
  TSelect({
    required this.items,
    this.allowDeselect = false,
    this.animationOptions,
    this.autovalidateMode,
    this.borderColor,
    this.borderRadius = const WidgetStatePropertyAll(TBorderRadius.rounded_md),
    this.closeOnSelect = true,
    this.constraints,
    this.enabled = true,
    this.fillColor,
    super.id = 'TSelect',
    this.initialValue,
    this.itemBuilder,
    this.itemExtent,
    this.itemPadding = TOffset.x12,
    super.key,
    this.label,
    this.labelText,
    this.maxVisible = 5,
    this.onChanged,
    this.onSearch,
    this.placeholder = const Text('Select'),
    this.restorationId,
    this.searchCount = true,
    this.searchResultsEmpty = const Text('No results found'),
    this.searchHintText = 'Search',
    this.searchIcon = const Icon(Icons.search),
    this.selectedIcon = const Icon(Icons.check),
    this.selectedIconAffinity = TControlAffinity.trailing,
    this.selectedItemBuilder,
    this.size = TInputSize.lg,
    this.trailing = const Icon(Icons.keyboard_arrow_down),
    this.validator,
  }) : super(
          child: _TSelectFormField(
            allowDeselect: allowDeselect,
            animationOptions: animationOptions,
            autovalidateMode: autovalidateMode,
            borderColor: borderColor,
            borderRadius: borderRadius,
            closeOnSelect: closeOnSelect,
            constraints: constraints,
            enabled: enabled,
            fillColor: fillColor,
            initialValue: initialValue,
            itemBuilder: itemBuilder,
            itemExtent: itemExtent,
            itemPadding: itemPadding,
            items: items,
            label: label,
            labelText: labelText,
            maxVisible: maxVisible,
            onChanged: onChanged,
            onSearch: onSearch,
            placeholder: placeholder,
            restorationId: restorationId,
            selectedIcon: selectedIcon,
            selectedIconAffinity: selectedIconAffinity,
            selectedItemBuilder: selectedItemBuilder,
            searchCount: searchCount,
            searchResultsEmpty: searchResultsEmpty,
            searchHintText: searchHintText,
            searchIcon: searchIcon,
            size: size,
            trailing: trailing,
            validator: validator,
          ),
        );

  /// Whether clicking on the selected item will deselect it
  final bool allowDeselect;

  /// The animation options to use for the popover
  final TAnimatedOptions? animationOptions;

  /// The autovalidate mode to use for the select widget
  final AutovalidateMode? autovalidateMode;

  /// The stateful border color for the input field.
  final WidgetStateProperty<Color>? borderColor;

  /// The stateful border color for the input field.
  final WidgetStateProperty<BorderRadius>? borderRadius;

  /// Whether the popover should close when an item is selected
  final bool closeOnSelect;

  /// The constraints for the anchor widget
  final BoxConstraints? constraints;

  /// Whether the select widget is enabled
  final bool enabled;

  /// The fill color for the input field.
  final WidgetStateProperty<Color>? fillColor;

  /// The initial value of the select widget
  final T? initialValue;

  /// A builder that is called for each item in the list of options
  final Widget Function(T)? itemBuilder;

  /// The height of each item in the list of options
  final double? itemExtent;

  /// The padding around each item in the list of options
  final EdgeInsetsGeometry itemPadding;

  /// The list of options to display in the select widget
  final List<T> items;

  /// The label text to display above the input field.
  ///
  /// For full customization, use [label] to pass in a widget.
  final Widget? label;

  /// The label text to display above the input field.
  final String? labelText;

  /// The maximum number of items to display in list before scrolling
  final int maxVisible;

  /// A callback that is called when the value of the select widget changes
  final ValueChanged<T?>? onChanged;

  /// The search callback to use for the select widget
  ///
  /// Use this to filter the list of options based on a search query
  final List<T>? Function(List<T>, String)? onSearch;

  /// The placeholder widget to display when no option is selected
  final Widget? placeholder;

  /// The restoration ID to save and restore the state of the select widget
  final String? restorationId;

  /// The icon to display when an item is selected
  ///
  /// Defaults to a checkmark
  final Widget? selectedIcon;

  /// The position of the selected icon
  final TControlAffinity selectedIconAffinity;

  /// A builder that is called for the currently selected item
  final Widget Function(T)? selectedItemBuilder;

  /// Whether to display the count of search results
  ///
  /// Displayed as a suffix in the search input
  final bool searchCount;

  /// The widget to display when the search results are empty
  final Widget searchResultsEmpty;

  /// The hint text to display in the search input
  final String searchHintText;

  /// The icon to display in the search input
  final Widget searchIcon;

  /// The size of the select widget
  final TInputSize size;

  /// The trailing widget to display in the anchor widget
  ///
  /// Defaults to a chevron down
  final Widget trailing;

  /// The validator to use for the select widget
  final FormFieldValidator<T>? validator;
}

// =============================================================================
// CLASS: _TSelectFormField
// =============================================================================

class _TSelectFormField<T> extends FormField<T> {
  _TSelectFormField({
    super.key,
    required this.allowDeselect,
    required this.animationOptions,
    required super.autovalidateMode,
    required this.borderColor,
    required this.borderRadius,
    required this.closeOnSelect,
    required this.constraints,
    required super.enabled,
    required this.fillColor,
    required super.initialValue,
    required this.itemBuilder,
    required this.itemExtent,
    required this.itemPadding,
    required this.items,
    required this.label,
    required this.labelText,
    required this.maxVisible,
    required this.onChanged,
    required this.onSearch,
    required this.placeholder,
    required super.restorationId,
    required this.selectedIcon,
    required this.selectedIconAffinity,
    required this.selectedItemBuilder,
    required this.searchCount,
    required this.searchResultsEmpty,
    required this.searchHintText,
    required this.searchIcon,
    required this.size,
    required this.trailing,
    required super.validator,
  }) : super(
          builder: (field) => const SizedBox.shrink(),
        );

  final bool allowDeselect;
  final TAnimatedOptions? animationOptions;
  final WidgetStateProperty<Color>? borderColor;
  final WidgetStateProperty<BorderRadius>? borderRadius;
  final bool closeOnSelect;
  final BoxConstraints? constraints;
  final WidgetStateProperty<Color>? fillColor;
  final Widget Function(T)? itemBuilder;
  final double? itemExtent;
  final EdgeInsetsGeometry itemPadding;
  final List<T> items;
  final Widget? label;
  final String? labelText;
  final int maxVisible;
  final ValueChanged<T?>? onChanged;
  final List<T>? Function(List<T>, String)? onSearch;
  final Widget? placeholder;
  final Widget? selectedIcon;
  final TControlAffinity selectedIconAffinity;
  final Widget Function(T)? selectedItemBuilder;
  final bool searchCount;
  final Widget searchResultsEmpty;
  final String searchHintText;
  final Widget searchIcon;
  final TInputSize size;
  final Widget trailing;

  @override
  FormFieldState<T> createState() => _TSelectFormFieldState();
}

class _TSelectFormFieldState<T> extends FormFieldState<T> {
  _TSelectFormField<T> get field => widget as _TSelectFormField<T>;
  final popoverController = TPopoverController();
  final searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  late T? selected = widget.initialValue;
  late int hoveredIndex = selectedIndex;

  late final bool searchEnabled = field.onSearch != null;
  late final List<T> items = List<T>.from(field.items);
  late final List<TWidgetStatesController> stateControllers;
  late final TAnimatedOptions animationOptions;
  int get maxVisible => field.maxVisible.clamp(0, field.items.length);

  double get height => field.size.height;

  double get itemExtent => field.itemExtent ?? height;

  int get selectedIndex => selected == null ? -1 : items.indexOf(selected as T);
  bool get isScrollable => items.length > maxVisible;

  EdgeInsets get listViewPadding =>
      TOffset.a6 + (isScrollable ? TOffset.r16 : TOffset.r0);

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    stateControllers = List.generate(
      field.items.length,
      (index) => TWidgetStatesController(),
    );
    animationOptions = field.animationOptions ?? TAnimatedOptions.dropdown();
  }

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
    final targetOffset = math.min(index * itemExtent, maxScrollExtent);
    scrollController.jumpTo(targetOffset);
  }

  // ---------------------------------------------------------------------------
  // METHOD: onChanged
  // ---------------------------------------------------------------------------

  void onChanged(T? value) {
    didChange(value);
    field.onChanged?.call(value);
  }

  // ---------------------------------------------------------------------------
  // METHOD: buildListView
  // ---------------------------------------------------------------------------

  Widget buildListView() {
    final tw = context.tw;

    /// Determine if the search count should be displayed
    Widget? suffix;
    if (field.searchCount &&
        searchEnabled &&
        items.length != field.items.length &&
        searchController.text.trim().isNotEmpty) {
      suffix = Text('${items.length}/${field.items.length}');
    }

    return TScrollbar(
      controller: scrollController,
      thumbVisibility: const WidgetStatePropertyAll(true),
      trackVisibility: const WidgetStatePropertyAll(true),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (searchEnabled)
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: tw.color.divider)),
              ),
              child: TInput(
                controller: searchController,
                id: 'search',
                size: field.size,
                hintText: field.searchHintText,
                borderRadius: const WidgetStatePropertyAll(
                  TBorderRadius.rounded_none,
                ),
                borderColor: const WidgetStatePropertyAll(
                  Colors.transparent,
                ),
                prefix: field.searchIcon,
                suffix: suffix,
                onChanged: (value) {
                  final newItems = field.onSearch!.call(items, value);
                  setState(() {
                    items.clear();
                    if (newItems == null || value.trim().isEmpty) {
                      items.addAll(field.items);
                    } else {
                      items.addAll(newItems);
                    }
                  });
                },
              ),
            ),
          // Display a message when search results are empty
          if (searchEnabled &&
              items.isEmpty &&
              searchController.text.trim().isNotEmpty)
            Expanded(
              child: DefaultTextStyle.merge(
                style: field.size.textStyle.copyWith(
                  color: tw.color.label,
                ),
                child: Center(child: field.searchResultsEmpty),
              ),
            ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: listViewPadding,
              itemCount: items.length,
              itemExtent: itemExtent,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                // Make sure index is within bounds
                if (index < 0 || index >= items.length) {
                  return const SizedBox.shrink();
                }
                final option = items[index];
                final optionWidget =
                    field.itemBuilder?.call(option) ?? Text(option.toString());
                final bool isSelected = selected == option;
                final itemStateController = stateControllers[index];
                itemStateController.hovered =
                    hoveredIndex == index || isSelected;
                itemStateController.selected = isSelected;
                return TGestureDetector(
                  controller: itemStateController,
                  onTap: () {
                    setState(() {
                      if (selectedIndex >= 0) {
                        stateControllers[selectedIndex].value = {};
                      }
                      if (selected == option && field.allowDeselect) {
                        selected = null;
                        hoveredIndex = -1;
                      } else {
                        selected = option;
                        hoveredIndex = index;
                        itemStateController.selected = true;
                      }
                    });
                    onChanged.call(selected);
                    if (field.closeOnSelect) {
                      popoverController.hide();
                    }
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
                    if (field.selectedIcon != null) {
                      showLeading = field.selectedIconAffinity.isLeading;
                      showTrailing = field.selectedIconAffinity.isTrailing;
                    }
                    final selectedIcon =
                        field.selectedIcon ?? const SizedBox.shrink();

                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: field.itemPadding,
                      decoration: BoxDecoration(
                        color: states.hovered
                            ? tw.color.hover
                            : Colors.transparent,
                        borderRadius: TBorderRadius.rounded_sm,
                      ),
                      child: DefaultTextStyle.merge(
                        style: field.size.textStyle.copyWith(
                          fontWeight: isSelected ? TFontWeight.semibold : null,
                        ),
                        child: IconTheme(
                          data: IconTheme.of(context).copyWith(
                            size: TSpace.v16,
                            color: tw.color.primary,
                          ),
                          child: Row(
                            children: [
                              if (showLeading)
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: field.itemPadding.horizontal / 2,
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
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: onAnchorPressed
  // ---------------------------------------------------------------------------

  void onAnchorPressed() {
    hoveredIndex = selectedIndex;
    popoverController.show();
    FocusScope.of(context).unfocus();
    if (selectedIndex >= 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToIndex(selectedIndex);
      });
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    // Resolve the widget to display in the select field
    Widget selectWidget = SelectionContainer.disabled(
      child: field.placeholder ?? const SizedBox.shrink(),
    );
    if (selected != null) {
      if (field.selectedItemBuilder != null) {
        selectWidget = field.selectedItemBuilder!.call(selected as T);
      } else {
        selectWidget = Text(selected.toString());
      }
    }

    // Resolve the text style for the select widget
    TextStyle? selectWidgetTextStyle = field.size.textStyle.copyWith(
      color: selected != null ? tw.color.body : tw.color.label,
    );
    if (!widget.enabled) {
      selectWidgetTextStyle = selectWidgetTextStyle.copyWith(
        color: tw.color.disabledTextColor,
      );
    }

    // Resolve the label widget
    Widget? label = field.label;
    if (label == null && field.labelText != null) {
      label = Text(field.labelText!);
    }

    // Resolve the fill color
    final effectiveFillColor =
        WidgetStateProperty.resolveWith<Color?>((states) {
      Color? color = field.fillColor?.resolve(states);
      if (color == null && states.disabled) {
        color = tw.dark ? Colors.black54 : TColors.gray.shade50;
      }
      return color;
    });

    // Compute the total height of the popover
    double popoverHeight =
        itemExtent * maxVisible + listViewPadding.vertical + 2;
    // Account for the search input and the divider
    if (searchEnabled) {
      popoverHeight += itemExtent + 1;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) TLabelDescriptionWidget(label: label),
        TPopover(
          animationOptions: animationOptions,
          controller: popoverController,
          matchAnchorWidth: true,
          height: popoverHeight,
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
            constraints: field.constraints,
            fillColor: effectiveFillColor,
            borderColor: field.borderColor,
            borderRadius: field.borderRadius,
            onTap: widget.enabled ? onAnchorPressed : null,
            child: IconTheme(
              data: IconTheme.of(context).copyWith(
                size: TSpace.v16,
                color: widget.enabled ? null : tw.color.disabledTextColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultTextStyle.merge(
                    style: selectWidgetTextStyle,
                    child: selectWidget,
                  ),
                  SizedBox(
                    height: height,
                    child: field.trailing,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
