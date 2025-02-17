import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/input_decorator.dart';

const Widget _defaultItemsEmpty = SizedBox(
  height: TSpace.v64,
  child: Center(child: Text('No items')),
);

// =============================================================================
// CLASS: TSelect
// =============================================================================

/// A Tailwind inspired select widget
class TSelect<T> extends TFormField<T> {
  /// Construct a [TSelect] widget.
  TSelect({
    this.allowDeselect = false,
    this.animationOptions,
    this.autovalidateMode,
    this.borderColor,
    this.borderRadius = const WidgetStatePropertyAll(TBorderRadius.rounded_md),
    this.closeOnSelect = true,
    this.closeOnTapOutside = true,
    this.constraints,
    this.enabled = true,
    this.error,
    this.fillColor,
    this.help,
    this.hoverColor,
    super.id = 'TSelect',
    this.initialValue,
    this.itemBuilder,
    this.itemExtent,
    this.itemPadding = TOffset.x12,
    required this.items,
    this.itemsEmpty = _defaultItemsEmpty,
    super.key,
    this.label,
    this.listPadding = TOffset.a6,
    this.maxVisible = 5,
    this.onChanged,
    this.onSaved,
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
    this.spacing = 0,
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
            closeOnTapOutside: closeOnTapOutside,
            constraints: constraints,
            enabled: enabled,
            error: error,
            fillColor: fillColor,
            help: help,
            hoverColor: hoverColor,
            initialValue: initialValue,
            itemBuilder: itemBuilder,
            itemExtent: itemExtent,
            itemPadding: itemPadding,
            items: items,
            itemsAsync: null,
            itemsEmpty: itemsEmpty,
            label: label,
            listPadding: listPadding,
            maxVisible: maxVisible,
            onChanged: onChanged,
            onSaved: onSaved,
            onSearch: onSearch,
            placeholder: placeholder,
            placeholderLoading: null,
            restorationId: restorationId,
            selectedIcon: selectedIcon,
            selectedIconAffinity: selectedIconAffinity,
            selectedItemBuilder: selectedItemBuilder,
            searchCount: searchCount,
            searchResultsEmpty: searchResultsEmpty,
            searchHintText: searchHintText,
            searchIcon: searchIcon,
            size: size,
            spacing: spacing,
            trailing: trailing,
            validator: validator,
          ),
        );

  /// Construct a [TSelect] widget.
  TSelect.async({
    this.allowDeselect = false,
    this.animationOptions,
    this.autovalidateMode,
    this.borderColor,
    this.borderRadius = const WidgetStatePropertyAll(TBorderRadius.rounded_md),
    this.closeOnSelect = true,
    this.closeOnTapOutside = true,
    this.constraints,
    this.enabled = true,
    this.error,
    this.fillColor,
    this.help,
    this.hoverColor,
    super.id = 'TSelect.async',
    this.initialValue,
    this.itemBuilder,
    this.itemExtent,
    this.itemPadding = TOffset.x12,
    required Future<List<T>> Function() items,
    this.itemsEmpty = _defaultItemsEmpty,
    super.key,
    this.label,
    this.listPadding = TOffset.a6,
    this.maxVisible = 5,
    this.onChanged,
    this.onSaved,
    this.onSearch,
    this.placeholder = const Text('Select'),
    Widget? placeholderLoading = const Text('Loading...'),
    this.restorationId,
    this.searchCount = true,
    this.searchResultsEmpty = const Text('No results found'),
    this.searchHintText = 'Search',
    this.searchIcon = const Icon(Icons.search),
    this.selectedIcon = const Icon(Icons.check),
    this.selectedIconAffinity = TControlAffinity.trailing,
    this.selectedItemBuilder,
    this.size = TInputSize.lg,
    this.spacing = 0,
    this.trailing = const Icon(Icons.keyboard_arrow_down),
    this.validator,
  })  : items = [],
        super(
          child: _TSelectFormField(
            allowDeselect: allowDeselect,
            animationOptions: animationOptions,
            autovalidateMode: autovalidateMode,
            borderColor: borderColor,
            borderRadius: borderRadius,
            closeOnSelect: closeOnSelect,
            closeOnTapOutside: closeOnTapOutside,
            constraints: constraints,
            enabled: enabled,
            error: error,
            fillColor: fillColor,
            help: help,
            hoverColor: hoverColor,
            initialValue: initialValue,
            itemBuilder: itemBuilder,
            itemExtent: itemExtent,
            itemPadding: itemPadding,
            items: const [],
            itemsAsync: items,
            itemsEmpty: itemsEmpty,
            label: label,
            listPadding: listPadding,
            maxVisible: maxVisible,
            onChanged: onChanged,
            onSaved: onSaved,
            onSearch: onSearch,
            placeholder: placeholder,
            placeholderLoading: placeholderLoading,
            restorationId: restorationId,
            selectedIcon: selectedIcon,
            selectedIconAffinity: selectedIconAffinity,
            selectedItemBuilder: selectedItemBuilder,
            searchCount: searchCount,
            searchResultsEmpty: searchResultsEmpty,
            searchHintText: searchHintText,
            searchIcon: searchIcon,
            size: size,
            spacing: spacing,
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

  /// Whether the popover should close when tapped outside
  final bool closeOnTapOutside;

  /// The constraints for the anchor widget
  final BoxConstraints? constraints;

  /// Whether the select widget is enabled
  final bool enabled;

  /// The error widget to display below the select field.
  final Widget? error;

  /// The fill color for the select field.
  final WidgetStateProperty<Color>? fillColor;

  /// The help widget to display below the select field.
  final Widget? help;

  /// The hover color of the options in the list
  final Color? hoverColor;

  /// The initial value of the select widget
  final T? initialValue;

  /// A builder that is called for each item in the list of options
  final Widget Function(T)? itemBuilder;

  /// The height of each item in the list of options
  final double? itemExtent;

  /// The content padding for each item
  final EdgeInsets itemPadding;

  /// The list of options to display in the select widget
  final List<T> items;

  /// The widget to display when there are no items in the list
  final Widget? itemsEmpty;

  /// The label text to display above the input field.
  ///
  /// For full customization, use [label] to pass in a widget.
  final Widget? label;

  /// The padding to add around the entire list of options
  final EdgeInsets listPadding;

  /// The maximum number of items to display in list before scrolling
  final int maxVisible;

  /// A callback that is called when the value of the select widget changes
  final ValueChanged<T?>? onChanged;

  /// A callback that is called when the field is saved
  final ValueChanged<T?>? onSaved;

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

  /// The spacing that separates each item in the list
  final double spacing;

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
    required this.closeOnTapOutside,
    required this.constraints,
    required super.enabled,
    required this.error,
    required this.fillColor,
    required this.help,
    required this.hoverColor,
    required super.initialValue,
    required this.itemBuilder,
    required this.itemExtent,
    required this.itemPadding,
    required this.items,
    required this.itemsAsync,
    required this.itemsEmpty,
    required this.label,
    required this.listPadding,
    required this.maxVisible,
    required this.onChanged,
    required this.onSearch,
    required super.onSaved,
    required this.placeholder,
    required this.placeholderLoading,
    required super.restorationId,
    required this.selectedIcon,
    required this.selectedIconAffinity,
    required this.selectedItemBuilder,
    required this.searchCount,
    required this.searchResultsEmpty,
    required this.searchHintText,
    required this.searchIcon,
    required this.size,
    required this.spacing,
    required this.trailing,
    required super.validator,
  }) : super(
          builder: (field) {
            final state = field as _TSelectFormFieldState<T>;
            return state.buildWidget(state.context);
          },
        );

  final bool allowDeselect;
  final TAnimatedOptions? animationOptions;
  final WidgetStateProperty<Color>? borderColor;
  final WidgetStateProperty<BorderRadius>? borderRadius;
  final bool closeOnSelect;
  final bool closeOnTapOutside;
  final BoxConstraints? constraints;
  final Widget? error;
  final WidgetStateProperty<Color>? fillColor;
  final Widget? help;
  final Color? hoverColor;
  final Widget Function(T)? itemBuilder;
  final double? itemExtent;
  final EdgeInsets itemPadding;
  final List<T> items;
  final Future<List<T>> Function()? itemsAsync;
  final Widget? itemsEmpty;
  final Widget? label;
  final EdgeInsets listPadding;
  final int maxVisible;
  final ValueChanged<T?>? onChanged;
  final List<T>? Function(List<T>, String)? onSearch;
  final Widget? placeholder;
  final Widget? placeholderLoading;
  final Widget? selectedIcon;
  final TControlAffinity selectedIconAffinity;
  final Widget Function(T)? selectedItemBuilder;
  final bool searchCount;
  final Widget searchResultsEmpty;
  final String searchHintText;
  final Widget searchIcon;
  final double spacing;
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

  T? initialValue;
  T? selected;
  late int hoveredIndex = selectedIndex;

  late final bool searchEnabled = field.onSearch != null;
  late List<T> items = List<T>.from(field.items);
  late final List<T> currentItems = List<T>.from(field.items);
  late List<TWidgetStatesController> stateControllers;
  late final TAnimatedOptions animationOptions;
  int get maxVisible => field.maxVisible.clamp(0, items.length);

  double get height => field.size.height;

  double get itemExtent => field.itemExtent ?? height;

  int get selectedIndex =>
      selected == null ? -1 : currentItems.indexOf(selected as T);
  bool get isScrollable => currentItems.length > maxVisible;

  EdgeInsets get listViewPadding =>
      field.listPadding + (isScrollable ? TOffset.r16 : TOffset.r0);

  // Async logic
  late final Future<List<T>>? getItems;
  late bool isLoading = field.itemsAsync != null;

  bool get enabled => field.enabled && !isLoading;

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    stateControllers = List.generate(
      items.length,
      (index) => TWidgetStatesController(),
    );
    animationOptions = field.animationOptions ?? TAnimatedOptions.dropdown();
    if (field.itemsAsync != null) {
      getItems = field.itemsAsync!().then((itemsAsync) {
        setState(() {
          isLoading = false;
          items.clear();
          items.addAll(itemsAsync);
          currentItems.clear();
          currentItems.addAll(itemsAsync);
          stateControllers.clear();
          stateControllers = List.generate(
            items.length,
            (index) => TWidgetStatesController(),
          );
          if (field.initialValue != null &&
              items.contains(field.initialValue)) {
            initialValue = field.initialValue;
            selected = field.initialValue;
          }
        });
        return items;
      });
    } else {
      if (field.initialValue != null && items.contains(field.initialValue)) {
        initialValue = field.initialValue;
        selected = field.initialValue;
      }
      getItems = null;
    }
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
  // METHOD: reset
  // ---------------------------------------------------------------------------

  @override
  void reset() {
    super.reset();
    searchController.text = '';
    selected = initialValue;
    hoveredIndex = -1;
    currentItems.clear();
    currentItems.addAll(field.items);
    field.onChanged?.call(widget.initialValue);
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
        currentItems.length != items.length &&
        searchController.text.trim().isNotEmpty) {
      suffix = Text('${currentItems.length}/${items.length}');
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
                borderRadius: field.borderRadius,
                borderColor: const WidgetStatePropertyAll(
                  Colors.transparent,
                ),
                prefix: field.searchIcon,
                suffix: suffix,
                onChanged: (value) {
                  final newItems = field.onSearch!.call(items, value);
                  setState(() {
                    currentItems.clear();
                    if (newItems == null || value.trim().isEmpty) {
                      currentItems.addAll(items);
                    } else {
                      currentItems.addAll(newItems);
                    }
                  });
                },
              ),
            ),
          // Display a message when search results are empty
          if (searchEnabled &&
              currentItems.isEmpty &&
              searchController.text.trim().isNotEmpty)
            Expanded(
              child: DefaultTextStyle.merge(
                style: field.size.textStyle.copyWith(
                  color: tw.color.label,
                ),
                child: Center(child: field.searchResultsEmpty),
              ),
            ),
          if (items.isEmpty && field.itemsEmpty != null)
            DefaultTextStyle.merge(
              style: field.size.textStyle.copyWith(
                color: tw.color.label,
              ),
              child: field.itemsEmpty!,
            ),
          if (currentItems.isNotEmpty)
            Expanded(
              child: ListView.separated(
                controller: scrollController,
                padding: listViewPadding,
                itemCount: currentItems.length,
                // Separated constructor does not support itemExtent
                // itemExtent: itemExtent,
                separatorBuilder: (context, index) {
                  return TSizedBox.y(size: field.spacing);
                },
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  // Make sure index is within bounds
                  if (index < 0 || index >= currentItems.length) {
                    return const SizedBox.shrink();
                  }
                  final option = currentItems[index];
                  final optionWidget = field.itemBuilder?.call(option) ??
                      Text(option.toString());
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
                        height: itemExtent,
                        alignment: Alignment.centerLeft,
                        padding: field.itemPadding,
                        decoration: BoxDecoration(
                          color: states.hovered
                              ? field.hoverColor ?? tw.color.hover
                              : Colors.transparent,
                          borderRadius: TBorderRadius.rounded_sm,
                        ),
                        child: DefaultTextStyle.merge(
                          style: field.size.textStyle.copyWith(
                            fontWeight:
                                isSelected ? TFontWeight.semibold : null,
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
    popoverController.toggle();
    FocusScope.of(context).unfocus();
    if (selectedIndex >= 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToIndex(selectedIndex);
      });
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: buildWidget
  // ---------------------------------------------------------------------------

  Widget buildWidget(BuildContext context) {
    return FutureBuilder(
      future: getItems,
      builder: (context, snapshot) {
        final tw = context.tw;

        // Resolve the widget to display in the select field
        Widget selectWidget = SelectionContainer.disabled(
          child: (isLoading ? field.placeholderLoading : field.placeholder) ??
              const SizedBox.shrink(),
        );
        if (selected != null) {
          if (field.selectedItemBuilder != null) {
            selectWidget = field.selectedItemBuilder!.call(selected as T);
          } else if (field.itemBuilder != null) {
            selectWidget = field.itemBuilder!.call(selected as T);
          } else {
            selectWidget = Text(selected.toString());
          }
        }

        // Resolve the text style for the select widget
        TextStyle? selectWidgetTextStyle = field.size.textStyle.copyWith(
          color: selected != null ? tw.color.body : tw.color.label,
        );
        if (!enabled) {
          selectWidgetTextStyle = selectWidgetTextStyle.copyWith(
            color: tw.color.disabledTextColor,
          );
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
        double? popoverHeight =
            itemExtent * maxVisible + listViewPadding.vertical + 2;
        // Account for the search input and the divider
        if (searchEnabled) {
          popoverHeight += itemExtent + 1;
        }
        // Account for the empty state message
        if (items.isEmpty && field.itemsEmpty != null) {
          popoverHeight = null;
        }
        // Account for the spacing between items
        if (field.spacing > 0) {
          popoverHeight = popoverHeight?.add((maxVisible - 1) * field.spacing);
        }

        // Resolve the error widget
        Widget? error = field.error;
        if (error != null) {
          error = DefaultTextStyle.merge(
            style: context.theme.inputDecorationTheme.errorStyle,
            child: error,
          );
        }

        // Resolve the help widget
        Widget? help = field.help;
        if (help != null) {
          help = DefaultTextStyle.merge(
            style: context.theme.inputDecorationTheme.helperStyle,
            child: help,
          );
        }

        return InputDecorator(
          decoration: InputDecoration(
            error: error,
            errorText: field.error == null ? errorText : null,
            helper: help,
            errorStyle: context.theme.inputDecorationTheme.errorStyle,
            helperStyle: context.theme.inputDecorationTheme.helperStyle,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (field.label != null) TLabelDescription(label: field.label),
              TPopover(
                animationOptions: animationOptions,
                controller: popoverController,
                closeOnTapOutside: field.closeOnTapOutside,
                matchAnchorWidth: true,
                height: popoverHeight,
                alignment: Alignment.bottomCenter,
                borderRadius:
                    field.borderRadius?.resolve({}) ?? TBorderRadius.rounded_md,
                content: buildListView(),
                anchor: TInputBorderWrapper(
                  enabled: enabled,
                  canRequestFocus: enabled,
                  mouseCursor: WidgetStatePropertyAll(
                    enabled
                        ? SystemMouseCursors.click
                        : SystemMouseCursors.forbidden,
                  ),
                  padding: TOffset.x12,
                  fillColor: effectiveFillColor,
                  borderColor: field.borderColor,
                  borderRadius: field.borderRadius,
                  onTap: enabled ? onAnchorPressed : null,
                  child: IconTheme(
                    data: IconTheme.of(context).copyWith(
                      size: TSpace.v16,
                      color: enabled ? null : tw.color.disabledTextColor,
                    ),
                    child: ConstrainedBox(
                      constraints: field.constraints ?? const BoxConstraints(),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
