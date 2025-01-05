import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/styled_container.dart';

// =============================================================================
// CLASS: TIconButton
// =============================================================================

/// A highly customizable button
class TIconButton extends StatelessWidget {
  /// Creates a basic [TIconButton] button ([TStyleVariant.basic]).
  const TIconButton({
    required this.icon,
    super.key,
    this.loading,
    this.theme,
    this.size = TWidgetSize.md,
    this.color,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TStyleVariant.basic;

  /// Creates an outlined [TIconButton] button ([TStyleVariant.outlined]).
  const TIconButton.outlined({
    required this.icon,
    super.key,
    this.loading,
    this.theme,
    this.size = TWidgetSize.md,
    this.color,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TStyleVariant.outlined;

  /// Creates a filled [TIconButton] button ([TStyleVariant.filled]).
  const TIconButton.filled({
    required this.icon,
    super.key,
    this.loading,
    this.theme,
    this.size = TWidgetSize.md,
    this.color,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TStyleVariant.filled;

  /// Creates a soft [TIconButton] button ([TStyleVariant.soft]).
  const TIconButton.soft({
    required this.icon,
    super.key,
    this.loading,
    this.theme,
    this.size = TWidgetSize.md,
    this.color,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TStyleVariant.soft;

  /// Creates a raw [TIconButton] button.
  const TIconButton.raw({
    required this.variant,
    required this.icon,
    super.key,
    this.loading,
    this.theme,
    this.size = TWidgetSize.md,
    this.color,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  });

  /// The variant of the button.
  final TStyleVariant variant;

  /// The icon to display on the button.
  final Widget icon;

  /// The widget to display when the [TWidgetController] is in a loading state.
  final Widget? loading;

  /// The custom theme override for the button.
  final TStyleTheme? theme;

  /// The custom theme override for the button.
  final TWidgetSize size;

  /// The color to use for button styling.
  final Color? color;

  /// The controller for the button.
  final TWidgetController? controller;

  /// An action to call when the button is pressed.
  final VoidCallback? onPressed;

  /// Called when a pointer enters or exits the response area.
  final ValueChanged<bool>? onHover;

  /// The tooltip to display when hovering over the button.
  ///
  /// Rendered using the [TTooltip] widget and supports rich text formatting.
  final String? tooltip;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final defaultHeight = TButton.getDefaultHeight(size);
    final defaultTextStyle = TButton.getDefaultTextStyle(size);
    final defaultBorderRadius = TButton.getDefaultBorderRadius(size);
    final dimension = WidgetStateProperty.resolveWith((states) {
      return theme?.height?.resolve(states) ?? defaultHeight;
    });

    return TStyledContainer(
      iconSize: theme?.iconSize,
      height: dimension,
      width: dimension,
      controller: controller,
      color: color,
      focusColor: theme?.focusColor,
      animationDuration: theme?.animationDuration ?? Duration.zero,
      variant: variant,
      tooltip: tooltip,
      baseTextStyle: defaultTextStyle,
      textStyle: theme?.textStyle,
      backgroundColor: theme?.backgroundColor,
      elevation: theme?.elevation,
      padding: theme?.padding,
      border: theme?.border,
      borderRadius:
          theme?.borderRadius ?? WidgetStatePropertyAll(defaultBorderRadius),
      mouseCursor: theme?.mouseCursor,
      loading: loading,
      onTap: onPressed,
      onHover: onHover,
      child: SelectionContainer.disabled(child: icon),
    );
  }
}
