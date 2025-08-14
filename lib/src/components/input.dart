import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/input_decorator.dart';

// =============================================================================
// CLASS: TInput
// =============================================================================

/// An input field for text input.
class TInput extends StatefulWidget {
  /// Construct a simple input field.
  const TInput({
    this.autocorrect = true,
    this.autofillHints,
    this.autofocus = false,
    this.autovalidateMode,
    this.borderColor,
    this.borderRadius = const WidgetStatePropertyAll(TBorderRadius.rounded_md),
    this.borderWidth,
    this.contentInsertionConfiguration,
    this.contentPadding,
    this.contextMenuBuilder,
    this.controller,
    this.enableInteractiveSelection = true,
    this.enableSuggestions = true,
    this.enabled = true,
    this.error,
    this.fillColor,
    this.focusNode,
    this.groupId = EditableText,
    this.help,
    this.hintText,
    this.id,
    this.ignorePointers = false,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    super.key,
    this.label,
    this.magnifierConfiguration,
    this.maxLengthEnforcement,
    this.mouseCursor,
    this.obscure = false,
    this.obscureCharacter = '•',
    this.onAppPrivateCommand,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.onTapAlwaysCalled = false,
    this.onTapOutside,
    this.onTapUpOutside,
    this.onFocusChange,
    this.prefix,
    this.readOnly = false,
    this.restorationId,
    this.selectionControls,
    this.showCursor,
    this.size = TInputSize.lg,
    this.smartDashesType,
    this.smartQuotesType,
    this.spellCheckConfiguration,
    this.statesController,
    this.style,
    this.suffix,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.textInputAction,
    this.undoController,
    this.validator,
  }) : _isTextArea = false,
       expands = false,
       minLines = 1,
       maxLines = 1,
       scrollController = null,
       scrollPadding = null,
       scrollPhysics = null,
       scrollbarOptions = const TScrollbarOptions(),
       assert(
         initialValue == null || controller == null,
         'initialValue and controller cannot be used at the same time',
       );

  /// Construct a text area input field.
  const TInput.area({
    this.autocorrect = true,
    this.autofillHints,
    this.autofocus = false,
    this.autovalidateMode,
    this.borderColor,
    this.borderRadius = const WidgetStatePropertyAll(TBorderRadius.rounded_md),
    this.borderWidth,
    this.contentInsertionConfiguration,
    this.contentPadding,
    this.contextMenuBuilder,
    this.controller,
    this.enableInteractiveSelection = true,
    this.enableSuggestions = true,
    this.enabled = true,
    this.error,
    this.fillColor,
    this.focusNode,
    this.groupId = EditableText,
    this.help,
    this.hintText,
    this.id,
    this.ignorePointers = false,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    super.key,
    this.label,
    this.magnifierConfiguration,
    this.maxLengthEnforcement,
    this.mouseCursor,
    this.onAppPrivateCommand,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.onTapAlwaysCalled = false,
    this.onTapOutside,
    this.onTapUpOutside,
    this.onFocusChange,
    this.readOnly = false,
    this.restorationId,
    this.selectionControls,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.spellCheckConfiguration,
    this.statesController,
    this.style,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.textInputAction,
    this.undoController,
    this.validator,
    this.minLines = 5,
    this.maxLines = 10,
    this.scrollController,
    this.scrollPadding,
    this.scrollPhysics,
    this.scrollbarOptions = const TScrollbarOptions(
      thickness: WidgetStatePropertyAll(TSpace.v6),
    ),
  }) : _isTextArea = true,
       obscure = false,
       expands = false,
       obscureCharacter = '•',
       prefix = null,
       suffix = null,
       size = TInputSize.lg, // Not used for text area
       assert(
         initialValue == null || controller == null,
         'initialValue and controller cannot be used at the same time',
       );

  /// Internal flag to determine if the input field is a text area.
  final bool _isTextArea;

  /// Whether the input field should automatically correct typos.
  final bool autocorrect;

  /// Whether the input field should automatically focus.
  final bool autofocus;

  /// The autofill hints for the input field.
  final Iterable<String>? autofillHints;

  /// The autovalidate mode for the input field.
  final AutovalidateMode? autovalidateMode;

  /// The stateful border color for the input field.
  final WidgetStateProperty<Color>? borderColor;

  /// The stateful border color for the input field.
  final WidgetStateProperty<BorderRadius>? borderRadius;

  /// The stateful border width for the input field.
  final WidgetStateProperty<double?>? borderWidth;

  /// The configuration for content insertion.
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// The padding for the input field.
  final EdgeInsetsGeometry? contentPadding;

  /// The context menu builder for the input field.
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;

  /// The controller for the input field.
  final TextEditingController? controller;

  /// Whether the input field is enabled;
  final bool enabled;

  /// Whether the input field should enable interactive selection.
  final bool enableInteractiveSelection;

  /// Whether the input field should suggest corrections.
  final bool enableSuggestions;

  /// The error widget to display below the input field.
  final Widget? error;

  /// Whether the input field expands to fill the available space.
  final bool expands;

  /// The fill color for the input field.
  final WidgetStateProperty<Color>? fillColor;

  /// The focus node for the input field.
  final FocusNode? focusNode;

  /// The group ID for the input field.
  final Object groupId;

  /// The help widget to display below the input field.
  final Widget? help;

  /// The hint text to display inside the input field.
  final String? hintText;

  /// The unique identifier for the input field.
  ///
  /// This is used by [TFormController] to retrieve the value of the field.
  final Object? id;

  /// Whether the input field should ignore pointers.
  final bool ignorePointers;

  /// The initial value of the input field.
  final String? initialValue;

  /// The input formatters for the input field.
  final List<TextInputFormatter>? inputFormatters;

  /// The type of keyboard to display for the input field.
  final TextInputType? keyboardType;

  /// The label text to display above the input field.
  final Widget? label;

  /// The text magnifier configuration for the input field.
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// The action to take when the user submits the input field.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// The maximum number of lines to display in the text area.
  final int? maxLines;

  /// The minimum number of lines to display in the text area.
  final int? minLines;

  /// The mouse cursor to use for the input field.
  final MouseCursor? mouseCursor;

  /// Whether the input field is obscured.
  final bool obscure;

  /// The character to use when obscuring the input field.
  final String obscureCharacter;

  /// The callback when the input method sends a private command to the app
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// The callback to call when the user changes the input field.
  final ValueChanged<String>? onChanged;

  /// The callback to call when the user completes editing the input field.
  final VoidCallback? onEditingComplete;

  /// The callback to call when the user submits the input field.
  final ValueChanged<String>? onFieldSubmitted;

  /// The callback to call when the user saves the input field.
  final ValueChanged<String?>? onSaved;

  /// The callback to call when the user taps the input field.
  final VoidCallback? onTap;

  /// Whether the input field should always call onTap.
  final bool onTapAlwaysCalled;

  /// The callback to call when the user taps outside the input field.
  final TapRegionCallback? onTapOutside;

  /// The callback to call when the user taps up outside the input field.
  final TapRegionUpCallback? onTapUpOutside;

  /// The callback to call when the input field gains or loses focus.
  final ValueChanged<bool>? onFocusChange;

  /// The widget to display at the beginning of the input field.
  final Widget? prefix;

  /// Whether the input field is read-only.
  final bool readOnly;

  /// The restoration ID for the input field.
  final String? restorationId;

  /// The selection controls for the input field.
  final TextSelectionControls? selectionControls;

  /// Whether the input field should show the cursor.
  final bool? showCursor;

  /// The size of the select widget
  final TInputSize size;

  /// The type of smart dashes to use for the input field.
  final SmartDashesType? smartDashesType;

  /// The type of smart quotes to use for the input field.
  final SmartQuotesType? smartQuotesType;

  /// The spell check configuration for the input field.
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// The states controller for the input field.
  final TWidgetStatesController? statesController;

  /// The style to apply to the input field.
  final TextStyle? style;

  /// The widget to display at the end of the input field.
  final Widget? suffix;

  /// The text alignment for the input field.
  final TextAlign textAlign;

  /// The vertical text alignment for the input field.
  final TextAlignVertical? textAlignVertical;

  /// The text capitalization for the input field.
  final TextCapitalization textCapitalization;

  /// The text direction for the input field.
  final TextDirection? textDirection;

  /// The action to take when the user submits the input field.
  final TextInputAction? textInputAction;

  /// The undo history controller for the input field.
  final UndoHistoryController? undoController;

  /// The callback to call when the input field is validated.
  final FormFieldValidator<String>? validator;

  /// The scroll controller for the input field.
  ///
  /// Only applies to [TInput.area].
  final ScrollController? scrollController;

  /// The padding to apply to the scrollable area.
  ///
  /// Only applies to [TInput.area].
  final EdgeInsets? scrollPadding;

  /// The physics to apply to the scrollable area.
  ///
  /// Only applies to [TInput.area].
  final ScrollPhysics? scrollPhysics;

  /// The scrollbar options for the input field.
  ///
  /// Only applies to [TInput.area].
  final TScrollbarOptions scrollbarOptions;

  @override
  State<TInput> createState() => _TInputState();
}

class _TInputState extends State<TInput> {
  late final bool isTextArea = widget._isTextArea;
  late final TextEditingController controller;
  late final TWidgetStatesController statesController;
  late final FocusNode focusNode;

  /// The height of the input field.
  double get height => widget.size.height;

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      controller = widget.controller!;
    } else {
      controller = TextEditingController(text: widget.initialValue);
    }
    if (widget.statesController != null) {
      statesController = widget.statesController!;
    } else {
      statesController = TWidgetStatesController();
    }

    // Initialize the focus node
    focusNode = widget.focusNode ?? FocusNode(skipTraversal: widget.readOnly);
    focusNode.addListener(() {
      widget.onFocusChange?.call(focusNode.hasFocus);
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    if (widget.statesController == null) {
      statesController.dispose();
    }
    if (widget.focusNode == null) {
      focusNode.dispose();
    }
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final inputTheme = context.theme.inputDecorationTheme;
    final textSelectionTheme = context.theme.textSelectionTheme;

    // Determine if the input field is interactive
    final isInteractive = widget.enabled && !widget.readOnly;

    // Resolve the fill color
    Color? effectiveFillColor = widget.fillColor?.resolve(
      statesController.value,
    );
    if (isInteractive) {
      effectiveFillColor ??= tw.color.background;
    } else {
      effectiveFillColor ??= tw.dark ? Colors.black54 : TColors.gray.shade50;
    }

    // Determine the effective border based on the state
    final effectiveBorder = TInputBorderWrapper.resolveInputBorder(
      context: context,
      borderColor: widget.borderColor,
      borderRadius: widget.borderRadius,
      borderWidth: widget.borderWidth,
    );

    // Resolve the help widget
    Widget? help = widget.help;
    if (help != null) {
      help = DefaultTextStyle.merge(style: inputTheme.helperStyle, child: help);
    }

    // Resolve the error widget
    Widget? error = widget.error;
    if (error != null) {
      error = DefaultTextStyle.merge(
        style: inputTheme.errorStyle,
        child: error,
      );
    }

    // Resolve the mouse cursor
    MouseCursor? mouseCursor = widget.mouseCursor;
    if (widget.readOnly && controller.text.isEmpty) {
      mouseCursor ??= SystemMouseCursors.basic;
    } else if (!widget.enabled) {
      mouseCursor ??= SystemMouseCursors.forbidden;
    }

    // Resolve the base text style
    final style = const TextStyle(
      fontSize: TFontSize.text_sm,
      height: kTextHeightNone,
    ).merge(widget.style);

    // Compute the estimated text height
    // Used to compute input padding
    final textHeight = style.estimateHeight(context);

    // Compute the y-axis padding required to center the text
    final borderWidth = effectiveBorder.resolve({})?.borderSide.width ?? 0;
    final yPad =
        widget.contentPadding?.vertical.divide(2) ??
        (height - textHeight - 2 * borderWidth) / 2;

    // Determine the x-axis padding
    final xPad = widget.contentPadding?.horizontal.divide(2) ?? yPad;

    // Resolve the content padding and clamp to required height
    final contentPadding = (widget.contentPadding ?? TOffset.y(yPad)).clamp(
      EdgeInsets.zero,
      EdgeInsets.symmetric(horizontal: double.infinity, vertical: yPad),
    );

    Widget? effectivePrefix = widget.prefix;
    if (effectivePrefix != null) {
      effectivePrefix = DefaultTextStyle.merge(
        style: TTextStyle.text_xs,
        child: effectivePrefix,
      );
    }

    Widget? effectiveSuffix = widget.suffix;
    if (effectiveSuffix != null) {
      effectiveSuffix = DefaultTextStyle.merge(
        style: TTextStyle.text_xs,
        child: effectiveSuffix,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) TLabelDescription(label: widget.label),
        Flexible(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: TScrollbar.fromOptions(
              options: widget.scrollbarOptions,
              child: TFormField(
                id: widget.id ?? 'TFormField',
                child: TextFormField(
                  scrollController: widget.scrollController,
                  scrollPadding: widget.scrollPadding ?? TOffset.a16,
                  scrollPhysics: widget.scrollPhysics,
                  autofocus: widget.autofocus,
                  autocorrect: widget.autocorrect,
                  autofillHints: widget.autofillHints,
                  autovalidateMode: widget.autovalidateMode,
                  canRequestFocus: widget.enabled,
                  contentInsertionConfiguration:
                      widget.contentInsertionConfiguration,
                  contextMenuBuilder: widget.contextMenuBuilder,
                  controller: controller,
                  cursorColor: textSelectionTheme.cursorColor,
                  cursorErrorColor: textSelectionTheme.cursorColor,
                  cursorHeight: style.fontSize,
                  cursorOpacityAnimates: false,
                  cursorWidth: 1,
                  enableInteractiveSelection: widget.enableInteractiveSelection,
                  enableSuggestions: widget.enableSuggestions,
                  enabled: widget.enabled,
                  expands: widget.expands,
                  focusNode: focusNode,
                  groupId: widget.groupId,
                  ignorePointers: widget.ignorePointers,
                  inputFormatters: widget.inputFormatters,
                  keyboardType: widget.keyboardType,
                  magnifierConfiguration: widget.magnifierConfiguration,
                  maxLengthEnforcement: widget.maxLengthEnforcement,
                  maxLines: widget.maxLines,
                  minLines: widget.minLines,
                  mouseCursor: mouseCursor,
                  obscuringCharacter: widget.obscureCharacter,
                  obscureText: widget.obscure,
                  onAppPrivateCommand: widget.onAppPrivateCommand,
                  onChanged: widget.onChanged,
                  onEditingComplete: widget.onEditingComplete,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  onSaved: widget.onSaved,
                  onTap: widget.onTap,
                  onTapAlwaysCalled: widget.onTapAlwaysCalled,
                  onTapOutside: widget.onTapOutside,
                  onTapUpOutside: widget.onTapUpOutside,
                  readOnly: widget.readOnly,
                  restorationId: widget.restorationId,
                  selectionControls: widget.selectionControls,
                  showCursor: widget.showCursor ?? isInteractive,
                  smartDashesType:
                      widget.smartDashesType ??
                      (widget.obscure
                          ? SmartDashesType.disabled
                          : SmartDashesType.enabled),
                  smartQuotesType:
                      widget.smartQuotesType ??
                      (widget.obscure
                          ? SmartQuotesType.disabled
                          : SmartQuotesType.enabled),
                  spellCheckConfiguration: widget.spellCheckConfiguration,
                  statesController: statesController,
                  style: style,
                  textAlign: widget.textAlign,
                  textAlignVertical: widget.textAlignVertical,
                  textCapitalization: widget.textCapitalization,
                  textDirection: widget.textDirection,
                  textInputAction: widget.textInputAction,
                  undoController: widget.undoController,
                  validator: widget.validator,
                  decoration: InputDecoration(
                    contentPadding: contentPadding,
                    // Used to pad the input text without using content padding
                    // Else, content padding will shift the help and error text
                    prefixIconConstraints: BoxConstraints(
                      minWidth: widget.prefix == null ? xPad : height,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: widget.suffix == null ? xPad : height,
                    ),
                    border: effectiveBorder.resolve({}),
                    enabledBorder: effectiveBorder.resolve({}),
                    focusedBorder: effectiveBorder.resolve({
                      WidgetState.focused,
                    }),
                    errorBorder: effectiveBorder.resolve({WidgetState.error}),
                    disabledBorder: effectiveBorder.resolve({
                      WidgetState.disabled,
                    }),
                    filled: !effectiveFillColor.isTransparent,
                    fillColor: effectiveFillColor,
                    prefixIcon: effectivePrefix ?? const SizedBox.shrink(),
                    suffixIcon: effectiveSuffix ?? const SizedBox.shrink(),
                    hintText: widget.hintText,
                    hintFadeDuration: Duration.zero,
                    hintStyle: inputTheme.hintStyle?.copyWith(
                      fontSize: style.fontSize,
                    ),
                    helper: help,
                    error: error,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
