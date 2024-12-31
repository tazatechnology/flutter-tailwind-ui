import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/styled_container.dart';

// =============================================================================
// ENUM: TIconButtonVariant
// =============================================================================

/// The variant of the button.
enum TIconButtonVariant {
  /// A basic button.
  basic,

  /// An outlined button.
  outlined,

  /// A filled button.
  filled,

  /// A filled button.
  soft,
}

// =============================================================================
// CLASS: TIconButton
// =============================================================================

/// A highly customizable button
class TIconButton extends StatelessWidget {
  /// Creates a basic [TIconButton] button ([TIconButtonVariant.basic]).
  const TIconButton({
    super.key,
    this.icon,
    this.loading,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TIconButtonVariant.basic;

  /// Creates an outlined [TIconButton] button ([TIconButtonVariant.outlined]).
  const TIconButton.outlined({
    super.key,
    this.icon,
    this.loading,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TIconButtonVariant.outlined;

  /// Creates a filled [TIconButton] button ([TIconButtonVariant.filled]).
  const TIconButton.filled({
    super.key,
    this.icon,
    this.loading,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TIconButtonVariant.filled;

  /// Creates a soft [TIconButton] button ([TIconButtonVariant.soft]).
  const TIconButton.soft({
    super.key,
    this.icon,
    this.loading,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TIconButtonVariant.soft;

  /// Creates a raw [TIconButton] button.
  const TIconButton.raw({
    required this.variant,
    super.key,
    this.icon,
    this.loading,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  });

  /// The variant of the button.
  final TIconButtonVariant variant;

  /// The icon to display on the button.
  final Widget? icon;

  /// The widget to display when the [TWidgetController] is in a loading state.
  final Widget? loading;

  /// The custom theme override for the button.
  final TButtonTheme? theme;

  /// The custom theme override for the button.
  final TButtonSize size;

  /// The color to use for button styling.
  final Color? color;

  /// The controller for the button.
  final TWidgetController? controller;

  /// An action to call when the button is pressed.
  final VoidCallback? onPressed;

  /// Called when a pointer enters or exits the response area.
  final ValueChanged<bool>? onHover;

  /// The tooltip to display when hovering over the button.
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    // Map the button variant to the styled container variant.
    TStyledContainerVariant styledVariant;
    switch (variant) {
      case TIconButtonVariant.basic:
        styledVariant = TStyledContainerVariant.basic;
      case TIconButtonVariant.outlined:
        styledVariant = TStyledContainerVariant.outlined;
      case TIconButtonVariant.filled:
        styledVariant = TStyledContainerVariant.filled;
      case TIconButtonVariant.soft:
        styledVariant = TStyledContainerVariant.soft;
    }

    // Icon padding should be square.
    final iconPadding = EdgeInsets.all(size.padding.vertical / 2);

    return TStyledContainer(
      controller: controller,
      color: color,
      focusColor: theme?.focusColor,
      animationDuration: theme?.animationDuration ?? Duration.zero,
      variant: styledVariant,
      tooltip: tooltip,
      baseTextStyle: size.textStyle,
      textStyle: theme?.textStyle,
      backgroundColor: theme?.backgroundColor,
      elevation: theme?.elevation,
      padding: theme?.padding ?? WidgetStatePropertyAll(iconPadding),
      border: theme?.border,
      borderRadius:
          theme?.borderRadius ?? WidgetStatePropertyAll(size.borderRadius),
      mouseCursor: theme?.mouseCursor,
      loading: loading,
      onTap: onPressed,
      onHover: onHover,
      child: SelectionContainer.disabled(
        child: icon ?? const SizedBox.shrink(),
      ),
    );
  }
}
