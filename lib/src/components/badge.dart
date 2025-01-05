import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/styled_container.dart';

// =============================================================================
// ENUM: TBadgeSize
// =============================================================================

/// The size of the badge.
enum TBadgeSize {
  /// A small themed badge.
  sm,

  /// A medium themed badge.
  md,

  /// A large themed badge.
  lg,
}

/// Extension on [TBadgeSize] to provide useful methods
extension XTailwindTBadgeSize on TBadgeSize {
  /// The default text style associated with the given [TBadgeSize].
  TextStyle get textStyle {
    switch (this) {
      case TBadgeSize.sm:
      case TBadgeSize.md:
      case TBadgeSize.lg:
        return TTextStyle.text_xs.medium;
    }
  }

  /// The fixed height associated with the given [TBadgeSize].
  double get height {
    switch (this) {
      case TBadgeSize.sm:
        return 22;
      case TBadgeSize.md:
        return 26;
      case TBadgeSize.lg:
        return 30;
    }
  }

  /// The border radius associated with the given [TButtonSize].
  BorderRadius get borderRadius {
    switch (this) {
      case TBadgeSize.sm:
      case TBadgeSize.md:
      case TBadgeSize.lg:
        return TBorderRadius.rounded_full;
    }
  }
}

// =============================================================================
// CLASS: TBadge
// =============================================================================

/// A badge is a small status descriptor for UI elements.
class TBadge extends StatelessWidget {
  /// Creates a basic [TBadge] button ([TVariant.basic]).
  const TBadge({
    required this.child,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.theme,
    this.size = TBadgeSize.md,
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
    super.key,
  }) : variant = TVariant.basic;

  /// Creates a basic [TBadge] button ([TVariant.outlined]).
  const TBadge.outlined({
    required this.child,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.theme,
    this.size = TBadgeSize.md,
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
    super.key,
  }) : variant = TVariant.outlined;

  /// Creates a basic [TBadge] button ([TVariant.filled]).
  const TBadge.filled({
    required this.child,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.theme,
    this.size = TBadgeSize.md,
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
    super.key,
  }) : variant = TVariant.filled;

  /// Creates a basic [TBadge] button ([TVariant.soft]).
  const TBadge.soft({
    required this.child,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.theme,
    this.size = TBadgeSize.md,
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
    super.key,
  }) : variant = TVariant.soft;

  /// Creates a [TBadge] widget.
  const TBadge.raw({
    required this.child,
    required this.variant,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.theme,
    this.size = TBadgeSize.md,
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
    super.key,
  });

  /// The variant of the button.
  final TVariant variant;

  /// The custom theme override for the badge.
  final Widget child;

  /// The a leading widget for the badge.
  final Widget? leading;

  /// The a leading widget for the badge.
  final Widget? trailing;

  /// The widget to display when the [TWidgetController] is in a loading state.
  final Widget? loading;

  /// The custom theme override for the badge.
  final TBadgeTheme? theme;

  /// The size of the badge.
  final TBadgeSize size;

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

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    /// Fallback padding based on the size of the button.
    EdgeInsetsGeometry fallbackPadding;
    switch (size) {
      case TBadgeSize.sm:
        fallbackPadding = TOffset.x6;
      case TBadgeSize.md:
        fallbackPadding = TOffset.x8;
      case TBadgeSize.lg:
        fallbackPadding = TOffset.x10;
    }

    return TStyledContainer(
      height: WidgetStatePropertyAll(size.height),
      controller: controller,
      color: color,
      focusColor: theme?.focusColor,
      animationDuration: theme?.animationDuration ?? Duration.zero,
      variant: variant,
      baseTextStyle: size.textStyle.merge(baseTextStyle),
      textStyle: theme?.textStyle,
      backgroundColor: theme?.backgroundColor,
      padding: theme?.padding ?? WidgetStatePropertyAll(fallbackPadding),
      border: theme?.border,
      borderRadius:
          theme?.borderRadius ?? WidgetStatePropertyAll(size.borderRadius),
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
      child: SelectionContainer.disabled(child: child),
    );
  }
}

// =============================================================================
// CLASS: TBadgeTheme
// =============================================================================

/// Theme data for [TBadge] widgets.
class TBadgeTheme extends ThemeExtension<TBadgeTheme> {
  /// Creates a [TBadgeTheme] object.
  const TBadgeTheme({
    this.animationDuration = Duration.zero,
    this.backgroundColor,
    this.padding,
    this.border,
    this.borderRadius,
    this.textStyle,
    this.mouseCursor,
    this.focusColor,
  });

  /// Set badge theme data for every [WidgetState] at once.
  ///
  /// Useful if you want to set the same theme for every [WidgetState].
  factory TBadgeTheme.all({
    Duration? animationDuration,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    BoxBorder? border,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
    MouseCursor? mouseCursor,
    Color? focusColor,
  }) {
    return TBadgeTheme(
      animationDuration: animationDuration ?? Duration.zero,
      backgroundColor: backgroundColor == null
          ? null
          : WidgetStatePropertyAll(backgroundColor),
      padding: padding == null ? null : WidgetStatePropertyAll(padding),
      border: border == null ? null : WidgetStatePropertyAll(border),
      borderRadius:
          borderRadius == null ? null : WidgetStatePropertyAll(borderRadius),
      textStyle: textStyle == null ? null : WidgetStatePropertyAll(textStyle),
      mouseCursor:
          mouseCursor == null ? null : WidgetStatePropertyAll(mouseCursor),
      focusColor: focusColor,
    );
  }

  /// The duration of the badge animation.
  final Duration animationDuration;

  /// The background color of the badge.
  final WidgetStateProperty<Color?>? backgroundColor;

  /// Text
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;

  /// Text
  final WidgetStateProperty<BoxBorder?>? border;

  /// Text
  final WidgetStateProperty<BorderRadius?>? borderRadius;

  /// Text
  final WidgetStateProperty<TextStyle?>? textStyle;

  /// Text
  final WidgetStateProperty<MouseCursor?>? mouseCursor;

  /// The color of the focus border.
  final Color? focusColor;

  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  @override
  TBadgeTheme copyWith({
    Duration? animationDuration,
    WidgetStateProperty<Color?>? backgroundColor,
    WidgetStateProperty<EdgeInsetsGeometry?>? padding,
    WidgetStateProperty<BoxBorder?>? border,
    WidgetStateProperty<BorderRadius?>? borderRadius,
    WidgetStateProperty<TextStyle?>? textStyle,
    WidgetStateProperty<MouseCursor?>? mouseCursor,
    Color? focusColor,
  }) {
    return TBadgeTheme(
      animationDuration: animationDuration ?? this.animationDuration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      focusColor: focusColor ?? this.focusColor,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: merge
  // ---------------------------------------------------------------------------

  /// Merges this [TBadgeTheme] with another [TBadgeTheme].
  TBadgeTheme merge(TBadgeTheme? other) {
    if (other == null) {
      return this;
    }
    return copyWith(
      animationDuration: other.animationDuration,
      backgroundColor: other.backgroundColor,
      padding: other.padding,
      border: other.border,
      borderRadius: other.borderRadius,
      textStyle: other.textStyle,
      mouseCursor: other.mouseCursor,
      focusColor: other.focusColor,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: lerp
  // ---------------------------------------------------------------------------

  @override
  TBadgeTheme lerp(
    TBadgeTheme? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }
    return TBadgeTheme(
      animationDuration: other.animationDuration,
      backgroundColor: WidgetStateProperty.lerp<Color?>(
        backgroundColor,
        other.backgroundColor,
        t,
        Color.lerp,
      ),
      padding: WidgetStateProperty.lerp<EdgeInsetsGeometry?>(
        padding,
        other.padding,
        t,
        EdgeInsetsGeometry.lerp,
      ),
      border: WidgetStateProperty.lerp<BoxBorder?>(
        border,
        other.border,
        t,
        BoxBorder.lerp,
      ),
      borderRadius: WidgetStateProperty.lerp<BorderRadius?>(
        borderRadius,
        other.borderRadius,
        t,
        BorderRadius.lerp,
      ),
      textStyle: WidgetStateProperty.lerp<TextStyle?>(
        textStyle,
        other.textStyle,
        t,
        TextStyle.lerp,
      ),
      mouseCursor: other.mouseCursor,
      focusColor: Color.lerp(focusColor, other.focusColor, t),
    );
  }
}
