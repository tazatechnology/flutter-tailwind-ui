import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/input_border.dart';
import 'package:flutter_tailwind_ui/src/internal/title_label.dart';

// =============================================================================
// CLASS: TInput
// =============================================================================

/// An input field for text input.
class TInput extends StatefulWidget {
  /// Construct a simple input field.
  const TInput({
    super.key,
    this.id,
    this.restorationId,
    this.groupId = EditableText,
    this.initialValue,
    this.controller,
    this.statesController,
    this.style,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.contentPadding,
    this.fillColor,
    this.borderColor,
    this.borderRadius = const WidgetStatePropertyAll(TBorderRadius.rounded_md),
    this.hintText,
    this.label,
    this.labelText,
    this.help,
    this.helpText,
    this.error,
    this.errorText,
    this.prefix,
    this.suffix,
    this.size = TInputSize.lg,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.ignorePointers = false,
    this.enableInteractiveSelection = true,
    this.scribbleEnabled = true,
    this.onTapAlwaysCalled = false,
    this.obscure = false,
    this.obscureCharacter = '•',
    this.showCursor,
    this.mouseCursor,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.smartDashesType,
    this.smartQuotesType,
    this.maxLengthEnforcement,
    this.selectionControls,
    this.autofillHints,
    this.autovalidateMode,
    this.validator,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onAppPrivateCommand,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.undoController,
  })  : _isTextArea = false,
        expands = false,
        minLines = 1,
        maxLines = 1,
        assert(
          initialValue == null || controller == null,
          'initialValue and controller cannot be used at the same time',
        );

  /// Construct a text area input field.
  const TInput.area({
    super.key,
    this.id,
    this.restorationId,
    this.groupId = EditableText,
    this.initialValue,
    this.controller,
    this.statesController,
    this.style,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.contentPadding,
    this.fillColor,
    this.borderColor,
    this.borderRadius = const WidgetStatePropertyAll(TBorderRadius.rounded_md),
    this.hintText,
    this.label,
    this.labelText,
    this.help,
    this.helpText,
    this.error,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.ignorePointers = false,
    this.enableInteractiveSelection = true,
    this.scribbleEnabled = true,
    this.onTapAlwaysCalled = false,
    this.showCursor,
    this.mouseCursor,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.smartDashesType,
    this.smartQuotesType,
    this.maxLengthEnforcement,
    this.selectionControls,
    this.autofillHints,
    this.autovalidateMode,
    this.validator,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onAppPrivateCommand,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.undoController,
    this.expands = false,
    this.minLines = 5,
    this.maxLines = 10,
  })  : _isTextArea = true,
        obscure = false,
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

  /// The unique identifier for the input field.
  ///
  /// This is used by [TFormController] to retrieve the value of the field.
  final Object? id;

  /// The restoration ID for the input field.
  final String? restorationId;

  /// The group ID for the input field.
  final Object groupId;

  /// The initial value of the input field.
  final String? initialValue;

  /// The controller for the input field.
  final TextEditingController? controller;

  /// The states controller for the input field.
  final TWidgetStatesController? statesController;

  /// The style to apply to the input field.
  final TextStyle? style;

  /// The text direction for the input field.
  final TextDirection? textDirection;

  /// The text alignment for the input field.
  final TextAlign textAlign;

  /// The vertical text alignment for the input field.
  final TextAlignVertical? textAlignVertical;

  /// The padding for the input field.
  final EdgeInsetsGeometry? contentPadding;

  /// The fill color for the input field.
  final WidgetStateProperty<Color>? fillColor;

  /// The stateful border color for the input field.
  final WidgetStateProperty<Color>? borderColor;

  /// The stateful border color for the input field.
  final WidgetStateProperty<BorderRadius>? borderRadius;

  /// The hint text to display inside the input field.
  final String? hintText;

  /// The label text to display above the input field.
  ///
  /// For full customization, use [label] to pass in a widget.
  final String? labelText;

  /// The label text to display above the input field.
  final Widget? label;

  /// The help text to display below the input field.
  ///
  /// For full customization, use [help] to pass in a widget.
  final String? helpText;

  /// The help widget to display below the input field.
  final Widget? help;

  /// The error text to display below the input field.
  ///
  /// For full customization, use [error] to pass in a widget.
  final String? errorText;

  /// The error widget to display below the input field.
  final Widget? error;

  /// The widget to display at the beginning of the input field.
  final Widget? prefix;

  /// The widget to display at the end of the input field.
  final Widget? suffix;

  /// The size of the select widget
  final TInputSize size;

  /// Whether the input field is enabled;
  final bool enabled;

  /// Whether the input field is read-only.
  final bool readOnly;

  /// Whether the input field should automatically focus.
  final bool autofocus;

  /// Whether the input field should automatically correct typos.
  final bool autocorrect;

  /// Whether the input field should suggest corrections.
  final bool enableSuggestions;

  /// Whether the input field should enable scribble.
  final bool scribbleEnabled;

  /// Whether the input field should ignore pointers.
  final bool ignorePointers;

  /// Whether the input field should enable interactive selection.
  final bool enableInteractiveSelection;

  /// Whether the input field should always call onTap.
  final bool onTapAlwaysCalled;

  /// Whether the input field is obscured.
  final bool obscure;

  /// The character to use when obscuring the input field.
  final String obscureCharacter;

  /// Whether the input field should show the cursor.
  final bool? showCursor;

  /// The mouse cursor to use for the input field.
  final MouseCursor? mouseCursor;

  /// The focus node for the input field.
  final FocusNode? focusNode;

  /// The type of keyboard to display for the input field.
  final TextInputType? keyboardType;

  /// The text capitalization for the input field.
  final TextCapitalization textCapitalization;

  /// The action to take when the user submits the input field.
  final TextInputAction? textInputAction;

  /// The type of smart dashes to use for the input field.
  final SmartDashesType? smartDashesType;

  /// The type of smart quotes to use for the input field.
  final SmartQuotesType? smartQuotesType;

  /// The action to take when the user submits the input field.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// The selection controls for the input field.
  final TextSelectionControls? selectionControls;

  /// The autofill hints for the input field.
  final Iterable<String>? autofillHints;

  /// The autovalidate mode for the input field.
  final AutovalidateMode? autovalidateMode;

  /// The callback to call when the input field is validated.
  final FormFieldValidator<String>? validator;

  /// The input formatters for the input field.
  final List<TextInputFormatter>? inputFormatters;

  /// The callback to call when the user taps the input field.
  final VoidCallback? onTap;

  /// The callback to call when the user changes the input field.
  final ValueChanged<String>? onChanged;

  /// The callback to call when the user taps outside the input field.
  final TapRegionCallback? onTapOutside;

  /// The callback to call when the user completes editing the input field.
  final VoidCallback? onEditingComplete;

  /// The callback to call when the user submits the input field.
  final ValueChanged<String>? onFieldSubmitted;

  /// The callback to call when the user saves the input field.
  final ValueChanged<String?>? onSaved;

  /// The callback when the input method sends a private command to the app
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// The configuration for content insertion.
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// The context menu builder for the input field.
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;

  /// The spell check configuration for the input field.
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// The text magnifier configuration for the input field.
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// The undo history controller for the input field.
  final UndoHistoryController? undoController;

  /// Whether the input field expands to fill the available space.
  final bool expands;

  /// The minimum number of lines to display in the text area.
  final int? minLines;

  /// The maximum number of lines to display in the text area.
  final int? maxLines;

  @override
  State<TInput> createState() => _TInputState();
}

class _TInputState extends State<TInput> {
  late final isTextArea = widget._isTextArea;
  late final TextEditingController controller;
  late final TWidgetStatesController statesController;

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
    Color? effectiveFillColor =
        widget.fillColor?.resolve(statesController.value);
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
    );

    // Determine the x-axis padding
    double xPad = TSpace.v12;
    if (widget.contentPadding?.horizontal == 0) {
      xPad = 0;
    }

    // Resolve the label widget
    Widget? label = widget.label;
    if (label == null && widget.labelText != null) {
      label = Text(widget.labelText!);
    }

    // Resolve the help widget
    Widget? help = widget.help;
    if (help == null && widget.helpText != null) {
      help = SelectableText(
        widget.helpText!,
        style: inputTheme.helperStyle,
      );
    }
    if (help != null) {
      help = DefaultTextStyle.merge(
        style: inputTheme.helperStyle,
        child: help,
      );
    }

    // Resolve the help widget
    Widget? error = widget.error;
    if (error == null && widget.errorText != null) {
      error = SelectableText(
        widget.errorText!,
        style: inputTheme.errorStyle,
      );
    }
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
    final yPad = (height - textHeight - 2 * borderWidth) / 2;

    // Resolve the content padding and clamp to required height
    final contentPadding = (widget.contentPadding ?? TOffset.y(yPad)).clamp(
      EdgeInsets.zero,
      EdgeInsets.symmetric(horizontal: double.infinity, vertical: yPad),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) TLabelDescriptionWidget(label: label),
        TFormField(
          id: widget.id ?? 'TFormField',
          child: TextFormField(
            groupId: widget.groupId,
            restorationId: widget.restorationId,
            controller: controller,
            statesController: statesController,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
            smartDashesType: widget.smartDashesType,
            smartQuotesType: widget.smartQuotesType,
            maxLengthEnforcement: widget.maxLengthEnforcement,
            selectionControls: widget.selectionControls,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            autofocus: widget.autofocus,
            autocorrect: widget.autocorrect,
            autofillHints: widget.autofillHints,
            autovalidateMode: widget.autovalidateMode,
            showCursor: widget.showCursor ?? isInteractive,
            obscureText: widget.obscure,
            obscuringCharacter: widget.obscureCharacter,
            enableSuggestions: widget.enableSuggestions,
            scribbleEnabled: widget.scribbleEnabled,
            ignorePointers: widget.ignorePointers,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            onTapAlwaysCalled: widget.onTapAlwaysCalled,
            canRequestFocus: widget.enabled,
            mouseCursor: mouseCursor,
            cursorWidth: 1,
            cursorHeight: style.fontSize,
            cursorColor: textSelectionTheme.cursorColor,
            cursorErrorColor: textSelectionTheme.cursorColor,
            cursorOpacityAnimates: false,
            style: style,
            textAlign: widget.textAlign,
            textDirection: widget.textDirection,
            textAlignVertical: widget.textAlignVertical,
            // Callbacks
            validator: widget.validator,
            inputFormatters: widget.inputFormatters,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            onTapOutside: widget.onTapOutside,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,
            onAppPrivateCommand: widget.onAppPrivateCommand,
            contentInsertionConfiguration: widget.contentInsertionConfiguration,
            contextMenuBuilder: widget.contextMenuBuilder,
            spellCheckConfiguration: widget.spellCheckConfiguration,
            magnifierConfiguration: widget.magnifierConfiguration,
            undoController: widget.undoController,
            // Text area properties
            expands: widget.expands,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            // Decoration properties
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
              focusedBorder: effectiveBorder.resolve({WidgetState.focused}),
              errorBorder: effectiveBorder.resolve({WidgetState.error}),
              disabledBorder: effectiveBorder.resolve({WidgetState.disabled}),
              filled: !effectiveFillColor.isTransparent,
              fillColor: effectiveFillColor,
              prefixIcon: widget.prefix ?? const SizedBox.shrink(),
              suffixIcon: widget.suffix ?? const SizedBox.shrink(),
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
      ],
    );
  }
}
