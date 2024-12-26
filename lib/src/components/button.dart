import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/styled_container.dart';

// =============================================================================
// ENUM: TButtonVariant
// =============================================================================

/// The variant of the button.
enum TButtonVariant {
  /// A basic button.
  basic,

  /// An outlined button.
  outlined,

  /// A filled button.
  filled,

  /// A filled button.
  soft,

  /// A link button.
  link,
}

// =============================================================================
// ENUM: TButtonSize
// =============================================================================

/// The size of the button.
enum TButtonSize {
  /// An extra-small button.
  xs,

  /// A small button.
  sm,

  /// A medium button.
  md,

  /// A large button.
  lg,

  /// An extra-large button.
  xl,
}

/// Extension on [TButtonSize] to provide useful methods
extension _XTButtonSize on TButtonSize {
  /// The padding associated with the given [TButtonSize].
  EdgeInsets get padding {
    switch (this) {
      case TButtonSize.xs:
      case TButtonSize.sm:
        return TOffset.x8 + TOffset.y4;
      case TButtonSize.md:
        return TOffset.x10 + TOffset.y6;
      case TButtonSize.lg:
        return TOffset.x12 + TOffset.y8;
      case TButtonSize.xl:
        return TOffset.x14 + TOffset.y10;
    }
  }

  /// The font size associated with the given [TButtonSize].
  double get fontSize {
    switch (this) {
      case TButtonSize.xs:
        return TFontSize.text_xs;
      case TButtonSize.sm:
      case TButtonSize.md:
      case TButtonSize.lg:
      case TButtonSize.xl:
        return TFontSize.text_sm;
    }
  }

  /// The border radius associated with the given [TButtonSize].
  BorderRadius get borerRadius {
    switch (this) {
      case TButtonSize.xs:
      case TButtonSize.sm:
        return TBorderRadius.rounded;
      case TButtonSize.md:
      case TButtonSize.lg:
      case TButtonSize.xl:
        return TBorderRadius.rounded_md;
    }
  }
}

// =============================================================================
// CLASS: TButton
// =============================================================================

/// A highly customizable button widget.
class TButton extends StatelessWidget {
  /// Creates a basic [TButton] button ([TButtonVariant.basic]).
  const TButton({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TButtonVariant.basic;

  /// Creates an outlined [TButton] button ([TButtonVariant.outlined]).
  const TButton.outlined({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TButtonVariant.outlined;

  /// Creates a filled [TButton] button ([TButtonVariant.filled]).
  const TButton.filled({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TButtonVariant.filled;

  /// Creates a soft [TButton] button ([TButtonVariant.soft]).
  const TButton.soft({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TButtonVariant.soft;

  /// Creates a link [TButton] button ([TButtonVariant.link]).
  const TButton.link({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TButtonVariant.link;

  /// Creates a raw [TButton] button.
  const TButton.raw({
    required this.variant,
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.onPressed,
    this.onHover,
    this.tooltip,
  });

  /// The variant of the button.
  final TButtonVariant variant;

  /// The custom theme override for the button.
  final Widget? child;

  /// The a leading widget for the badge.
  final Widget? leading;

  /// The a trailing widget for the badge.
  final Widget? trailing;

  /// The custom theme override for the button.
  final TButtonTheme? theme;

  /// The custom theme override for the button.
  final TButtonSize size;

  /// The color to use for button styling.
  final Color? color;

  /// The base text style for the badge.
  ///
  /// Default: [TTextStyle.text_xs] with [FontWeight.w500].
  final TextStyle? baseTextStyle;

  /// An action to call when the button is pressed.
  final VoidCallback? onPressed;

  /// Called when a pointer enters or exits the response area.
  final ValueChanged<bool>? onHover;

  /// The tooltip to display when hovering over the button.
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    TStyledContainerVariant styledVariant;
    switch (variant) {
      case TButtonVariant.basic:
        styledVariant = TStyledContainerVariant.basic;
      case TButtonVariant.outlined:
        styledVariant = TStyledContainerVariant.outlined;
      case TButtonVariant.filled:
        styledVariant = TStyledContainerVariant.filled;
      case TButtonVariant.soft:
        styledVariant = TStyledContainerVariant.soft;
      case TButtonVariant.link:
        styledVariant = TStyledContainerVariant.link;
    }

    return TStyledContainer(
      color: color,
      focusColor: theme?.focusColor,
      animationDuration: theme?.animationDuration ?? Duration.zero,
      variant: styledVariant,
      tooltip: tooltip,
      baseTextStyle:
          TextStyle(fontSize: size.fontSize).medium.merge(baseTextStyle),
      textStyle: theme?.textStyle,
      backgroundColor: theme?.backgroundColor,
      padding: theme?.padding ?? WidgetStatePropertyAll(size.padding),
      border: theme?.border,
      borderRadius:
          theme?.borderRadius ?? WidgetStatePropertyAll(size.borerRadius),
      leading: leading,
      trailing: trailing,
      onTap: onPressed,
      onHover: onHover,
      child: child,
    );
  }
}

// =============================================================================
// CLASS: TButtonTheme
// =============================================================================

/// Theme data for [TButton] widgets.
class TButtonTheme extends ThemeExtension<TButtonTheme> {
  /// Creates a [TButtonTheme] object.
  const TButtonTheme({
    this.animationDuration = Duration.zero,
    this.backgroundColor,
    this.padding,
    this.border,
    this.borderRadius,
    this.textStyle,
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

  /// The color of the focus border.
  final Color? focusColor;

  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  @override
  TButtonTheme copyWith({
    Duration? animationDuration,
    WidgetStateProperty<Color?>? backgroundColor,
    WidgetStateProperty<EdgeInsetsGeometry?>? padding,
    WidgetStateProperty<BoxBorder?>? border,
    WidgetStateProperty<BorderRadius?>? borderRadius,
    WidgetStateProperty<TextStyle?>? textStyle,
  }) {
    return TButtonTheme(
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

  /// Merges this [TButtonTheme] with another [TButtonTheme].
  TButtonTheme merge(TButtonTheme? other) {
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
  TButtonTheme lerp(
    TButtonTheme? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }

    return TButtonTheme(
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