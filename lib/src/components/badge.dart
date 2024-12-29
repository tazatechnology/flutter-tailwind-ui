import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/styled_container.dart';

// =============================================================================
// ENUM: TBadgeVariant
// =============================================================================

/// The variant of the badge.
enum TBadgeVariant {
  /// A outlined themed badge.
  outlined,

  /// A filled themed badge.
  filled,

  /// An soft themed button.
  soft,
}

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
  /// The padding associated with the given [TBadgeSize].
  EdgeInsets get padding {
    switch (this) {
      case TBadgeSize.sm:
        return TOffset.x6 + TOffset.y2;
      case TBadgeSize.md:
        return TOffset.x8 + TOffset.y4;
      case TBadgeSize.lg:
        return TOffset.x10 + TOffset.y6;
    }
  }
}

// =============================================================================
// CLASS: TBadge
// =============================================================================

/// A badge is a small status descriptor for UI elements.
class TBadge extends StatelessWidget {
  /// Creates a [TBadge] widget.
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
    this.onPressed,
    this.onHover,
    super.key,
  }) : variant = TBadgeVariant.outlined;

  /// Creates a [TBadge] widget.
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
    this.onPressed,
    this.onHover,
    super.key,
  }) : variant = TBadgeVariant.filled;

  /// Creates a [TBadge] widget.
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
    this.onPressed,
    this.onHover,
    super.key,
  }) : variant = TBadgeVariant.soft;

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
    this.onPressed,
    this.onHover,
    super.key,
  });

  /// The variant of the button.
  final TBadgeVariant variant;

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
  final String? tooltip;

  /// An action to call when the badge is pressed.
  final GestureTapCallback? onPressed;

  /// Called when a pointer enters or exits the response area.
  final ValueChanged<bool>? onHover;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    // Map the badge variant to the styled container variant.
    TStyledContainerVariant styledVariant;
    switch (variant) {
      case TBadgeVariant.outlined:
        styledVariant = TStyledContainerVariant.outlined;
      case TBadgeVariant.filled:
        styledVariant = TStyledContainerVariant.filled;
      case TBadgeVariant.soft:
        styledVariant = TStyledContainerVariant.soft;
    }

    return TStyledContainer(
      controller: controller,
      color: color,
      focusColor: theme?.focusColor,
      animationDuration: theme?.animationDuration ?? Duration.zero,
      variant: styledVariant,
      tooltip: tooltip,
      baseTextStyle: TTextStyle.text_xs.medium.merge(baseTextStyle),
      textStyle: theme?.textStyle,
      backgroundColor: theme?.backgroundColor,
      padding: theme?.padding ?? WidgetStatePropertyAll(size.padding),
      border: theme?.border,
      borderRadius: theme?.borderRadius ??
          const WidgetStatePropertyAll(TBorderRadius.rounded_full),
      mouseCursor: theme?.mouseCursor,
      leading: leading,
      trailing: trailing,
      loading: loading,
      onTap: onPressed,
      onHover: onHover,
      child: child,
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
