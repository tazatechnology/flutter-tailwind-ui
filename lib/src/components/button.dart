import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/styled_container.dart';

// =============================================================================
// CLASS: TButton
// =============================================================================

/// A highly customizable button
class TButton extends StatelessWidget {
  /// Creates a basic [TButton] button ([TStyleVariant.basic]).
  const TButton({
    required this.child,
    super.key,
    this.leading,
    this.trailing,
    this.loading,
    this.theme,
    this.size = TWidgetSize.md,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
    this.selectableText = false,
  }) : variant = TStyleVariant.basic;

  /// Creates an outlined [TButton] button ([TStyleVariant.outlined]).
  const TButton.outlined({
    required this.child,
    super.key,
    this.leading,
    this.trailing,
    this.loading,
    this.theme,
    this.size = TWidgetSize.md,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
    this.selectableText = false,
  }) : variant = TStyleVariant.outlined;

  /// Creates a filled [TButton] button ([TStyleVariant.filled]).
  const TButton.filled({
    required this.child,
    super.key,
    this.leading,
    this.trailing,
    this.loading,
    this.theme,
    this.size = TWidgetSize.md,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
    this.selectableText = false,
  }) : variant = TStyleVariant.filled;

  /// Creates a soft [TButton] button ([TStyleVariant.soft]).
  const TButton.soft({
    required this.child,
    super.key,
    this.leading,
    this.trailing,
    this.loading,
    this.theme,
    this.size = TWidgetSize.md,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
    this.selectableText = false,
  }) : variant = TStyleVariant.soft;

  /// Creates a raw [TButton] button.
  const TButton.raw({
    required this.child,
    required this.variant,
    super.key,
    this.leading,
    this.trailing,
    this.loading,
    this.theme,
    this.size = TWidgetSize.md,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
    this.selectableText = false,
  });

  /// The variant of the button.
  final TStyleVariant variant;

  /// The custom theme override for the button.
  final Widget child;

  /// The a leading widget for the badge.
  final Widget? leading;

  /// The a trailing widget for the badge.
  final Widget? trailing;

  /// The widget to display when the [TWidgetController] is in a loading state.
  final Widget? loading;

  /// The custom theme override for the button.
  final TStyleTheme? theme;

  /// The custom theme override for the button.
  final TWidgetSize size;

  /// The color to use for button styling.
  final Color? color;

  /// The base text style for the badge.
  ///
  /// Default: [TTextStyle.text_xs] with [FontWeight.w500].
  final TextStyle? baseTextStyle;

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

  /// Whether or not the button text is selectable, by default it is not.
  final bool selectableText;

  // ---------------------------------------------------------------------------
  // METHOD: getDefaultHeight
  // ---------------------------------------------------------------------------

  /// The fixed height associated with the given [TWidgetSize].
  static double getDefaultHeight(TWidgetSize size) {
    switch (size) {
      case TWidgetSize.xs:
        return 26;
      case TWidgetSize.sm:
        return 30;
      case TWidgetSize.md:
        return 34;
      case TWidgetSize.lg:
        return 38;
      case TWidgetSize.xl:
        return 42;
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: getDefaultTextStyle
  // ---------------------------------------------------------------------------

  /// The default text style associated with the given [TWidgetSize].
  static TextStyle getDefaultTextStyle(TWidgetSize size) {
    switch (size) {
      case TWidgetSize.xs:
        return TTextStyle.text_xs.copyWith(fontWeight: TFontWeight.medium);
      case TWidgetSize.sm:
      case TWidgetSize.md:
      case TWidgetSize.lg:
      case TWidgetSize.xl:
        return TTextStyle.text_sm.copyWith(fontWeight: TFontWeight.medium);
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: getDefaultPadding
  // ---------------------------------------------------------------------------

  /// Fallback padding based on the size of the button.
  static EdgeInsetsGeometry getDefaultPadding(TWidgetSize size) {
    switch (size) {
      case TWidgetSize.xs:
        return TOffset.x6;
      case TWidgetSize.sm:
        return TOffset.x8;
      case TWidgetSize.md:
        return TOffset.x10;
      case TWidgetSize.lg:
        return TOffset.x12;
      case TWidgetSize.xl:
        return TOffset.x14;
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: getDefaultBorderRadius
  // ---------------------------------------------------------------------------

  /// The border radius associated with the given [TWidgetSize].
  static BorderRadius getDefaultBorderRadius(TWidgetSize size) {
    switch (size) {
      case TWidgetSize.xs:
      case TWidgetSize.sm:
        return TBorderRadius.rounded_sm;
      case TWidgetSize.md:
      case TWidgetSize.lg:
      case TWidgetSize.xl:
        return TBorderRadius.rounded_md;
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final defaultHeight = getDefaultHeight(size);
    final defaultPadding = getDefaultPadding(size);
    final defaultTextStyle = getDefaultTextStyle(size);
    final defaultBorderRadius = getDefaultBorderRadius(size);

    return TStyledContainer(
      height: WidgetStateProperty.resolveWith((states) {
        return theme?.height?.resolve(states) ?? defaultHeight;
      }),
      controller: controller,
      color: color,
      focusColor: theme?.focusColor,
      animationDuration: theme?.animationDuration ?? Duration.zero,
      variant: variant,
      baseTextStyle: defaultTextStyle.merge(baseTextStyle),
      textStyle: theme?.textStyle,
      backgroundColor: theme?.backgroundColor,
      elevation: theme?.elevation,
      border: theme?.border,
      borderRadius: WidgetStateProperty.resolveWith((states) {
        return theme?.borderRadius?.resolve(states) ?? defaultBorderRadius;
      }),
      padding: WidgetStateProperty.resolveWith((states) {
        return theme?.padding?.resolve(states) ?? defaultPadding;
      }),
      mouseCursor: theme?.mouseCursor,
      tooltip: tooltip,
      leading: leading,
      trailing: trailing,
      loading: loading,
      onTap: onPressed,
      onHover: onHover,
      child: selectableText ? child : SelectionContainer.disabled(child: child),
    );
  }
}
