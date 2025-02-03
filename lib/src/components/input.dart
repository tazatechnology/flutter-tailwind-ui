import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/title_label.dart';

// =============================================================================
// CLASS: TInput
// =============================================================================

/// An input field for text input.
class TInput extends StatefulWidget {
  /// Construct a simple input field.
  const TInput({
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
    this.hintText,
    this.label,
    this.labelText,
    this.help,
    this.helpText,
    this.error,
    this.errorText,
    this.prefix,
    this.suffix,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.showCursor = true,
    this.ignorePointers = false,
    this.enableInteractiveSelection = true,
    this.scribbleEnabled = true,
    this.onTapAlwaysCalled = false,
    this.obscure = false,
    this.obscureCharacter = '•',
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
    super.key,
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
    this.showCursor = true,
    this.ignorePointers = false,
    this.enableInteractiveSelection = true,
    this.scribbleEnabled = true,
    this.onTapAlwaysCalled = false,
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
    super.key,
  })  : _isTextArea = true,
        obscure = false,
        obscureCharacter = '•',
        prefix = null,
        suffix = null,
        assert(
          initialValue == null || controller == null,
          'initialValue and controller cannot be used at the same time',
        );

  /// Internal flag to determine if the input field is a text area.
  final bool _isTextArea;

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

  /// Whether the input field should show the cursor.
  final bool showCursor;

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statesController.addListener(() => setState(() {}));
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

    // Determine if the input field should be filled
    // Only filled when not interactive and has a fill color
    final effectiveFillColor =
        widget.fillColor?.resolve(statesController.value) ??
            (tw.dark ? Colors.black54 : TColors.gray.shade50);
    final isFilled = !isInteractive && (!effectiveFillColor.isTransparent);

    // Determine the effective border based on the state
    final effectiveBorder =
        WidgetStateProperty.resolveWith<InputBorder?>((states) {
      if (states.focused && !widget.readOnly) {
        return inputTheme.focusedBorder?.copyWith(
          borderSide: inputTheme.focusedBorder?.borderSide.copyWith(
            color: widget.borderColor?.resolve({WidgetState.focused}) ??
                inputTheme.focusedBorder?.borderSide.color,
          ),
        );
      } else if (states.error) {
        return inputTheme.errorBorder?.copyWith(
          borderSide: inputTheme.errorBorder?.borderSide.copyWith(
            color: widget.borderColor?.resolve({WidgetState.focused}) ??
                inputTheme.errorBorder?.borderSide.color,
          ),
        );
      } else if (states.disabled) {
        return inputTheme.disabledBorder?.copyWith(
          borderSide: inputTheme.disabledBorder?.borderSide.copyWith(
            color: widget.borderColor?.resolve({WidgetState.focused}) ??
                inputTheme.disabledBorder?.borderSide.color,
          ),
        );
      } else {
        return inputTheme.enabledBorder?.copyWith(
          borderSide: inputTheme.enabledBorder?.borderSide.copyWith(
            color: widget.borderColor?.resolve({WidgetState.focused}) ??
                inputTheme.enabledBorder?.borderSide.color,
          ),
        );
      }
    });

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
    MouseCursor? mouseCursor;
    if (widget.readOnly && controller.text.isEmpty) {
      mouseCursor = SystemMouseCursors.basic;
    } else if (!widget.enabled) {
      mouseCursor = SystemMouseCursors.forbidden;
    }

    // Resolve the prefix widget
    final prefix = widget.prefix;

    // Resolve the suffix widget
    final suffix = widget.suffix;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) TLabelDescriptionWidget(label: label),
        TextFormField(
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
          showCursor: widget.showCursor,
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
          cursorHeight: TFontSize.text_sm,
          cursorColor: textSelectionTheme.cursorColor,
          cursorErrorColor: textSelectionTheme.cursorColor,
          cursorOpacityAnimates: false,
          style: (widget.style ?? TTextStyle.text_sm).copyWith(
            height: kTextHeightNone,
          ),
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
            contentPadding: widget.contentPadding ?? TOffset.y8,
            // Used to pad the input text without using content padding
            // Else, content padding will shift the help and error text
            prefixIconConstraints: BoxConstraints(
              minWidth: prefix == null ? xPad : kTDefaultInputHeight,
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: suffix == null ? xPad : kTDefaultInputHeight,
            ),
            border: effectiveBorder.resolve({}),
            enabledBorder: effectiveBorder.resolve({}),
            focusedBorder: effectiveBorder.resolve({WidgetState.focused}),
            errorBorder: effectiveBorder.resolve({WidgetState.error}),
            disabledBorder: effectiveBorder.resolve({WidgetState.disabled}),
            filled: isFilled,
            fillColor: effectiveFillColor,
            prefixIcon: prefix ?? const SizedBox.shrink(),
            suffixIcon: suffix ?? const SizedBox.shrink(),
            hintText: widget.hintText,
            hintFadeDuration: Duration.zero,
            helper: help,
            error: error,
          ),
        ),
      ],
    );
  }
}
