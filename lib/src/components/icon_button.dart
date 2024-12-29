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
// ENUM: TIconButtonSize
// =============================================================================

/// The size of the icon button.
enum TIconButtonSize {
  /// A small icon button.
  sm,

  /// A medium icon button.
  md,

  /// A large icon button.
  lg,
}

/// Extension on [TIconButtonSize] to provide useful methods
extension XTailwindTIconButtonSize on TIconButtonSize {
  /// The font size associated with the given [TIconButtonSize].
  double get iconSize {
    switch (this) {
      case TIconButtonSize.sm:
        return TSpace.v14;
      case TIconButtonSize.md:
        return TSpace.v16;
      case TIconButtonSize.lg:
        return TSpace.v20;
    }
  }

  /// The padding associated with the given [TIconButtonSize].
  EdgeInsets get padding {
    switch (this) {
      case TIconButtonSize.sm:
        return TOffset.a4;
      case TIconButtonSize.md:
        return TOffset.a6;
      case TIconButtonSize.lg:
        return TOffset.a8;
    }
  }

  /// The border radius associated with the given [TIconButtonSize].
  BorderRadius get borerRadius {
    switch (this) {
      case TIconButtonSize.sm:
      case TIconButtonSize.md:
        return TBorderRadius.rounded;
      case TIconButtonSize.lg:
        return TBorderRadius.rounded_md;
    }
  }
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
    this.size = TIconButtonSize.md,
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
    this.size = TIconButtonSize.md,
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
    this.size = TIconButtonSize.md,
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
    this.size = TIconButtonSize.md,
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
    this.size = TIconButtonSize.md,
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
  final TIconButtonSize size;

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

    return TStyledContainer(
      controller: controller,
      color: color,
      focusColor: theme?.focusColor,
      animationDuration: theme?.animationDuration ?? Duration.zero,
      variant: styledVariant,
      tooltip: tooltip,
      textStyle: theme?.textStyle,
      iconSize: size.iconSize,
      backgroundColor: theme?.backgroundColor,
      padding: theme?.padding ?? WidgetStatePropertyAll(size.padding),
      border: theme?.border,
      borderRadius:
          theme?.borderRadius ?? WidgetStatePropertyAll(size.borerRadius),
      mouseCursor: theme?.mouseCursor,
      loading: loading,
      onTap: onPressed,
      onHover: onHover,
      child: icon,
    );
  }
}
