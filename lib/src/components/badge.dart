import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/styled_container.dart';

// =============================================================================
// CLASS: TBadge
// =============================================================================

/// A badge is a small status descriptor for UI elements.
class TBadge extends StatelessWidget {
  /// Creates a basic [TBadge] button ([TStyleVariant.basic]).
  const TBadge({
    required this.child,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.theme,
    this.size = TWidgetSize.md,
    this.leading,
    this.trailing,
    this.loading,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
    this.onPressed,
    this.onPressedLeading,
    this.onPressedTrailing,
    this.onHover,
    this.selectableText = false,
    super.key,
  }) : variant = TStyleVariant.basic;

  /// Creates a basic [TBadge] button ([TStyleVariant.outlined]).
  const TBadge.outlined({
    required this.child,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.theme,
    this.size = TWidgetSize.md,
    this.leading,
    this.trailing,
    this.loading,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
    this.onPressed,
    this.onPressedLeading,
    this.onPressedTrailing,
    this.onHover,
    this.selectableText = false,
    super.key,
  }) : variant = TStyleVariant.outlined;

  /// Creates a basic [TBadge] button ([TStyleVariant.filled]).
  const TBadge.filled({
    required this.child,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.theme,
    this.size = TWidgetSize.md,
    this.leading,
    this.trailing,
    this.loading,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
    this.onPressed,
    this.onPressedLeading,
    this.onPressedTrailing,
    this.onHover,
    this.selectableText = false,
    super.key,
  }) : variant = TStyleVariant.filled;

  /// Creates a basic [TBadge] button ([TStyleVariant.soft]).
  const TBadge.soft({
    required this.child,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.theme,
    this.size = TWidgetSize.md,
    this.leading,
    this.trailing,
    this.loading,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
    this.onPressed,
    this.onPressedLeading,
    this.onPressedTrailing,
    this.onHover,
    this.selectableText = false,
    super.key,
  }) : variant = TStyleVariant.soft;

  /// Creates a [TBadge] widget.
  const TBadge.raw({
    required this.child,
    required this.variant,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.theme,
    this.size = TWidgetSize.md,
    this.leading,
    this.trailing,
    this.loading,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
    this.onPressed,
    this.onPressedLeading,
    this.onPressedTrailing,
    this.onHover,
    this.selectableText = false,
    super.key,
  });

  /// The variant of the button.
  final TStyleVariant variant;

  /// The custom theme override for the badge.
  final Widget child;

  /// The a leading widget for the badge.
  final Widget? leading;

  /// The a leading widget for the badge.
  final Widget? trailing;

  /// The widget to display when the [TWidgetController] is in a loading state.
  final Widget? loading;

  /// The custom theme override for the badge.
  final TStyleTheme? theme;

  /// The size of the badge.
  final TWidgetSize size;

  /// The color to use for button styling.
  final Color? color;

  /// The base text style for the badge.
  ///
  /// Default: [TTextStyle.text_xs] with [FontWeight.w500].
  final TextStyle? baseTextStyle;

  /// The controller for the badge.
  final TWidgetController? controller;

  /// The tooltip to display when hovering over the badge.
  ///
  /// Rendered using the [TTooltip] widget and supports rich text formatting.
  final String? tooltip;

  /// The tooltip to display when hovering over the leading widget.
  ///
  /// Rendered using the [TTooltip] widget and supports rich text formatting.
  final String? tooltipLeading;

  /// The tooltip to display when hovering over the trailing widget.
  ///
  /// Rendered using the [TTooltip] widget and supports rich text formatting.
  final String? tooltipTrailing;

  /// An action to call when the badge is pressed.
  final GestureTapCallback? onPressed;

  /// An action to call when the badge leading widget is pressed.
  final GestureTapCallback? onPressedLeading;

  /// An action to call when the badge trailing widget is pressed.
  final GestureTapCallback? onPressedTrailing;

  /// Called when a pointer enters or exits the response area.
  final ValueChanged<bool>? onHover;

  /// Whether or not the badge text is selectable, by default it is not.
  final bool selectableText;

  // ---------------------------------------------------------------------------
  // METHOD: getDefaultHeight
  // ---------------------------------------------------------------------------

  /// The fixed height associated with the given [TWidgetSize].
  static double getDefaultHeight(TWidgetSize size) {
    switch (size) {
      case TWidgetSize.xs:
        return 18;
      case TWidgetSize.sm:
        return 22;
      case TWidgetSize.md:
        return 26;
      case TWidgetSize.lg:
        return 30;
      case TWidgetSize.xl:
        return 34;
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: getDefaultTextStyle
  // ---------------------------------------------------------------------------

  /// The default text style associated with the given [TWidgetSize].
  static TextStyle getDefaultTextStyle(TWidgetSize size) {
    switch (size) {
      case TWidgetSize.xs:
      case TWidgetSize.sm:
      case TWidgetSize.md:
      case TWidgetSize.lg:
      case TWidgetSize.xl:
        return TTextStyle.text_xs.copyWith(
          fontWeight: TFontWeight.medium,
        );
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: getDefaultPadding
  // ---------------------------------------------------------------------------

  /// Fallback padding based on the size of the button.
  static EdgeInsetsGeometry getDefaultPadding(TWidgetSize size) {
    switch (size) {
      case TWidgetSize.xs:
        return TOffset.x4;
      case TWidgetSize.sm:
        return TOffset.x6;
      case TWidgetSize.md:
        return TOffset.x8;
      case TWidgetSize.lg:
        return TOffset.x10;
      case TWidgetSize.xl:
        return TOffset.x12;
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
      case TWidgetSize.md:
      case TWidgetSize.lg:
      case TWidgetSize.xl:
        return TBorderRadius.rounded_full;
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
      tooltipLeading: tooltipLeading,
      tooltipTrailing: tooltipTrailing,
      onTap: onPressed,
      onTapLeading: onPressedLeading,
      onTapTrailing: onPressedTrailing,
      loading: loading,
      onHover: onHover,
      leading: leading,
      trailing: trailing,
      child: selectableText ? child : SelectionContainer.disabled(child: child),
    );
  }
}
