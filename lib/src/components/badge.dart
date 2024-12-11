import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/components/styled_container.dart';
import 'package:flutter_tailwind_ui/src/constants/text.dart';

// =============================================================================
// ENUM: TBadgeVariant
// =============================================================================

/// The variant of the badge.
enum TBadgeVariant {
  /// A basic themed badge.
  basic,

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
extension XTBadgeSize on TBadgeSize {
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
  const TBadge({
    required this.child,
    this.color,
    this.theme,
    this.size = TBadgeSize.md,
    this.leading,
    this.trailing,
    this.tooltip,
    this.onPressed,
    this.onHover,
    super.key,
  }) : variant = TBadgeVariant.basic;

  /// Creates a [TBadge] widget.
  const TBadge.filled({
    required this.child,
    this.color,
    this.theme,
    this.size = TBadgeSize.md,
    this.leading,
    this.trailing,
    this.tooltip,
    this.onPressed,
    this.onHover,
    super.key,
  }) : variant = TBadgeVariant.filled;

  /// Creates a [TBadge] widget.
  const TBadge.outlined({
    required this.child,
    this.color,
    this.theme,
    this.size = TBadgeSize.md,
    this.leading,
    this.trailing,
    this.tooltip,
    this.onPressed,
    this.onHover,
    super.key,
  }) : variant = TBadgeVariant.outlined;

  /// Creates a [TBadge] widget.
  const TBadge.soft({
    required this.child,
    this.color,
    this.theme,
    this.size = TBadgeSize.md,
    this.leading,
    this.trailing,
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
    this.theme,
    this.size = TBadgeSize.md,
    this.leading,
    this.trailing,
    this.tooltip,
    this.onPressed,
    this.onHover,
    super.key,
  });

  /// The variant of the button.
  final TBadgeVariant variant;

  /// The color to use for button styling.
  final Color? color;

  /// The custom theme override for the badge.
  final Widget child;

  /// The custom theme override for the badge.
  final TBadgeTheme? theme;

  /// The size of the badge.
  final TBadgeSize size;

  /// The a leading widget for the badge.
  final Widget? leading;

  /// The a leading widget for the badge.
  final Widget? trailing;

  /// The tooltip to display when hovering over the badge.
  final String? tooltip;

  /// An action to call when the badge is pressed.
  final VoidCallback? onPressed;

  /// Called when a pointer enters or exits the response area.
  final ValueChanged<bool>? onHover;

  // ---------------------------------------------------------------------------
  // METHOD: getTheme
  // ---------------------------------------------------------------------------

  /// Returns the badge theme.
  TBadgeTheme getTheme(BuildContext context) {
    final tw = context.tw;

    TBadgeTheme theme = TBadgeTheme(
      borderRadius: WidgetStateProperty.all(TBorderRadius.rounded_full),
    );

    final textColorFallback = tw.dark ? Colors.white : Colors.black;
    final effectiveColor = (color ?? tw.colors.primary).toMaterialColor();

    switch (variant) {
      case TBadgeVariant.basic:
        final backgroundColor =
            tw.dark ? effectiveColor.shade700 : effectiveColor;
        theme = theme.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (effectiveColor.isTransparent) {
              return Colors.transparent;
            }
            return backgroundColor.withOpacity(states.hovered ? 0.9 : 1);
          }),
          textStyle: WidgetStateProperty.resolveWith((states) {
            if (effectiveColor.isTransparent) {
              return TextStyle(color: textColorFallback);
            }
            return TextStyle(color: effectiveColor.contrastBlackWhite());
          }),
        );
      case TBadgeVariant.filled:
        final backgroundColor =
            tw.dark ? effectiveColor.shade700 : effectiveColor;
        theme = theme.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (effectiveColor.isTransparent) {
              return Colors.transparent;
            }
            return backgroundColor.withOpacity(states.hovered ? 0.9 : 1);
          }),
          textStyle: WidgetStateProperty.resolveWith((states) {
            if (effectiveColor.isTransparent) {
              return TextStyle(color: textColorFallback);
            }
            return TextStyle(color: effectiveColor.contrastBlackWhite());
          }),
        );
      case TBadgeVariant.outlined:
        final backgroundColor = effectiveColor;
        theme = theme.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (effectiveColor.isTransparent) {
              return Colors.transparent;
            }
            if (states.hovered) {
              return backgroundColor;
            }
            return null;
          }),
          border: WidgetStateProperty.resolveWith((states) {
            return Border.all(color: backgroundColor);
          }),
          textStyle: WidgetStateProperty.resolveWith((states) {
            if (states.hovered) {
              return TextStyle(color: backgroundColor.contrastBlackWhite());
            }
            return TextStyle(color: backgroundColor);
          }),
        );
      case TBadgeVariant.soft:
        theme = theme.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (effectiveColor.isTransparent) {
              return Colors.transparent;
            }
            if (states.hovered) {
              return tw.dark
                  ? effectiveColor.shade400.withOpacity(0.2)
                  : effectiveColor.shade100;
            }
            return tw.dark
                ? effectiveColor.shade400.withOpacity(0.1)
                : effectiveColor.shade50;
          }),
          border: WidgetStateProperty.resolveWith((states) {
            return Border.all(
              color: tw.dark
                  ? effectiveColor.shade400.withOpacity(0.25)
                  : effectiveColor.shade700.withOpacity(0.1),
            );
          }),
          textStyle: WidgetStateProperty.resolveWith((states) {
            return TextStyle(
              color:
                  tw.dark ? effectiveColor.shade400 : effectiveColor.shade700,
            );
          }),
        );
    }

    /// Override the fallback theme (via merge) with the user provided theme
    return theme.merge(this.theme);
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    TStyledContainerVariant styledVariant;
    switch (variant) {
      case TBadgeVariant.basic:
        styledVariant = TStyledContainerVariant.basic;
      case TBadgeVariant.outlined:
        styledVariant = TStyledContainerVariant.outlined;
      case TBadgeVariant.filled:
        styledVariant = TStyledContainerVariant.filled;
      case TBadgeVariant.soft:
        styledVariant = TStyledContainerVariant.soft;
    }

    return TStyledContainer(
      variant: styledVariant,
      tooltip: tooltip,
      fallbackPadding: size.padding,
      fallbackTextStyle: TTextStyle.text_xs.medium,
      textStyle: theme?.textStyle,
      backgroundColor: theme?.backgroundColor,
      padding: theme?.padding,
      border: theme?.border,
      borderRadius: theme?.borderRadius,
      leading: leading,
      trailing: trailing,
      child: child,
    );

    // return TGestureDetector(
    //   onTap: onPressed,
    //   onHover: onHover,
    //   behavior: HitTestBehavior.translucent,
    //   builder: (context, states) {
    //     final resolvedTextStyle = theme.textStyle?.resolve(states);

    //     final effectiveTextStyle =
    //         TTextStyle.text_xs.medium.merge(resolvedTextStyle);

    //     final effectiveAnimationDuration = theme.animationDuration;

    //     final effectivePadding = theme.padding?.resolve(states) ?? size.padding;
    //     final effectiveHorizontalOffset = (effectivePadding.horizontal) / 2;

    //     final effectiveBorder = theme.border?.resolve(states);

    //     final effectiveBorderRadius = theme.borderRadius?.resolve(states);

    //     final effectiveBackgroundColor = theme.backgroundColor?.resolve(states);

    //     return TStyledContainer(
    //       tooltip: tooltip,
    //       fallbackTextStyle: TTextStyle.text_xs.medium,
    //       leading: leading,
    //       trailing: trailing,
    //       child: child,
    //     );

    //     // Define the badge content
    //     final List<Widget> content = [child];
    //     if (leading != null) {
    //       content.insert(
    //         0,
    //         Padding(
    //           padding: EdgeInsets.only(right: effectiveHorizontalOffset),
    //           child: leading,
    //         ),
    //       );
    //     }
    //     if (onDismiss != null) {
    //       final focusColor = effectiveTextStyle.color?.withOpacity(0.1);
    //       content.add(
    //         TTooltip(
    //           message: dismissTooltip,
    //           child: Material(
    //             type: MaterialType.transparency,
    //             child: Padding(
    //               padding: EdgeInsets.only(left: effectiveHorizontalOffset),
    //               child: InkWell(
    //                 hoverColor: focusColor,
    //                 focusColor: focusColor,
    //                 onTap: onDismiss,
    //                 child: dismissIcon ??
    //                     Icon(
    //                       Icons.close,
    //                       size: effectiveTextStyle.fontSize,
    //                       color: effectiveTextStyle.color?.withOpacity(0.75),
    //                     ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     }

    //     // Build the badge
    //     return DefaultTextStyle.merge(
    //       style: DefaultTextStyle.of(context).style.merge(effectiveTextStyle),
    //       child: TTooltip(
    //         message: tooltip,
    //         child: AnimatedContainer(
    //           duration: effectiveAnimationDuration,
    //           padding: effectivePadding,
    //           decoration: BoxDecoration(
    //             color: effectiveBackgroundColor,
    //             border: effectiveBorder,
    //             borderRadius: effectiveBorderRadius,
    //           ),
    //           child: Row(
    //             mainAxisSize: MainAxisSize.min,
    //             children: content,
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
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
  }) {
    return TBadgeTheme(
      animationDuration: animationDuration ?? this.animationDuration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
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
    );
  }
}
