import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/styled_container.dart';

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
extension XTailwindTButtonSize on TButtonSize {
  /// The fixed height associated with the given [TButtonSize].
  double get height {
    switch (this) {
      case TButtonSize.xs:
        return 26;
      case TButtonSize.sm:
        return 30;
      case TButtonSize.md:
        return 34;
      case TButtonSize.lg:
        return 38;
      case TButtonSize.xl:
        return 42;
    }
  }

  /// The default text style associated with the given [TButtonSize].
  TextStyle get textStyle {
    switch (this) {
      case TButtonSize.xs:
        return TTextStyle.text_xs.medium;
      case TButtonSize.sm:
      case TButtonSize.md:
      case TButtonSize.lg:
      case TButtonSize.xl:
        return TTextStyle.text_sm.medium;
    }
  }

  /// The border radius associated with the given [TButtonSize].
  BorderRadius get borderRadius {
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

/// A highly customizable button
class TButton extends StatelessWidget {
  /// Creates a basic [TButton] button ([TVariant.basic]).
  const TButton({
    required this.child,
    super.key,
    this.leading,
    this.trailing,
    this.loading,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TVariant.basic;

  /// Creates an outlined [TButton] button ([TVariant.outlined]).
  const TButton.outlined({
    required this.child,
    super.key,
    this.leading,
    this.trailing,
    this.loading,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TVariant.outlined;

  /// Creates a filled [TButton] button ([TVariant.filled]).
  const TButton.filled({
    required this.child,
    super.key,
    this.leading,
    this.trailing,
    this.loading,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TVariant.filled;

  /// Creates a soft [TButton] button ([TVariant.soft]).
  const TButton.soft({
    required this.child,
    super.key,
    this.leading,
    this.trailing,
    this.loading,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TVariant.soft;

  /// Creates a raw [TButton] button.
  const TButton.raw({
    required this.child,
    required this.variant,
    super.key,
    this.leading,
    this.trailing,
    this.loading,
    this.theme,
    this.size = TButtonSize.md,
    this.color,
    this.baseTextStyle,
    this.controller,
    this.onPressed,
    this.onHover,
    this.tooltip,
  });

  /// The variant of the button.
  final TVariant variant;

  /// The custom theme override for the button.
  final Widget child;

  /// The a leading widget for the badge.
  final Widget? leading;

  /// The a trailing widget for the badge.
  final Widget? trailing;

  /// The widget to display when the [TWidgetController] is in a loading state.
  final Widget? loading;

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

  @override
  Widget build(BuildContext context) {
    /// Fallback padding based on the size of the button.
    EdgeInsetsGeometry fallbackPadding;
    switch (size) {
      case TButtonSize.xs:
        fallbackPadding = TOffset.x6;
      case TButtonSize.sm:
        fallbackPadding = TOffset.x8;
      case TButtonSize.md:
        fallbackPadding = TOffset.x10;
      case TButtonSize.lg:
        fallbackPadding = TOffset.x12;
      case TButtonSize.xl:
        fallbackPadding = TOffset.x14;
    }

    return TStyledContainer(
      height: WidgetStateProperty.resolveWith((states) {
        return theme?.height?.resolve(states) ?? size.height;
      }),
      controller: controller,
      color: color,
      focusColor: theme?.focusColor,
      animationDuration: theme?.animationDuration ?? Duration.zero,
      variant: variant,
      tooltip: tooltip,
      baseTextStyle: size.textStyle.merge(baseTextStyle),
      textStyle: theme?.textStyle,
      backgroundColor: theme?.backgroundColor,
      elevation: theme?.elevation,
      padding: theme?.padding ?? WidgetStatePropertyAll(fallbackPadding),
      border: theme?.border,
      borderRadius:
          theme?.borderRadius ?? WidgetStatePropertyAll(size.borderRadius),
      mouseCursor: theme?.mouseCursor,
      leading: leading,
      trailing: trailing,
      loading: loading,
      onTap: onPressed,
      onHover: onHover,
      child: SelectionContainer.disabled(child: child),
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
    this.height,
    this.backgroundColor,
    this.elevation,
    this.padding,
    this.border,
    this.borderRadius,
    this.textStyle,
    this.iconSize,
    this.mouseCursor,
    this.focusColor,
  });

  /// Set button theme data for every [WidgetState] at once.
  ///
  /// Useful if you want to set the same theme for every [WidgetState].
  factory TButtonTheme.all({
    Duration? animationDuration,
    double? height,
    Color? backgroundColor,
    double? elevation,
    EdgeInsetsGeometry? padding,
    BoxBorder? border,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
    double? iconSize,
    MouseCursor? mouseCursor,
    Color? focusColor,
  }) {
    return TButtonTheme(
      animationDuration: animationDuration ?? Duration.zero,
      height: height == null
          ? null
          : WidgetStatePropertyAll(
              height,
            ),
      backgroundColor: backgroundColor == null
          ? null
          : WidgetStatePropertyAll(
              backgroundColor,
            ),
      elevation: elevation == null
          ? null
          : WidgetStatePropertyAll(
              elevation,
            ),
      padding: padding == null
          ? null
          : WidgetStatePropertyAll(
              padding,
            ),
      border: border == null
          ? null
          : WidgetStatePropertyAll(
              border,
            ),
      borderRadius: borderRadius == null
          ? null
          : WidgetStatePropertyAll(
              borderRadius,
            ),
      textStyle: textStyle == null
          ? null
          : WidgetStatePropertyAll(
              textStyle,
            ),
      iconSize: iconSize == null
          ? null
          : WidgetStatePropertyAll(
              iconSize,
            ),
      mouseCursor: mouseCursor == null
          ? null
          : WidgetStatePropertyAll(
              mouseCursor,
            ),
      focusColor: focusColor,
    );
  }

  /// The duration of the badge animation.
  final Duration animationDuration;

  /// The stateful height of the button.
  final WidgetStateProperty<double?>? height;

  /// The stateful background color of the button.
  final WidgetStateProperty<Color?>? backgroundColor;

  /// The stateful elevation of the button.
  final WidgetStateProperty<double?>? elevation;

  /// The stateful  padding of the button.
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;

  /// The stateful border of the button.
  final WidgetStateProperty<BoxBorder?>? border;

  /// The stateful border radius of the button.
  final WidgetStateProperty<BorderRadius?>? borderRadius;

  /// The stateful text style of the button.
  final WidgetStateProperty<TextStyle?>? textStyle;

  /// The stateful icon size of any child widget subtree icons.
  final WidgetStateProperty<double?>? iconSize;

  /// The stateful mouse cursor style of the button.
  final WidgetStateProperty<MouseCursor?>? mouseCursor;

  /// The color of the focus border.
  final Color? focusColor;

  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  @override
  TButtonTheme copyWith({
    Duration? animationDuration,
    WidgetStateProperty<double?>? height,
    WidgetStateProperty<Color?>? backgroundColor,
    WidgetStateProperty<double?>? elevation,
    WidgetStateProperty<EdgeInsetsGeometry?>? padding,
    WidgetStateProperty<BoxBorder?>? border,
    WidgetStateProperty<BorderRadius?>? borderRadius,
    WidgetStateProperty<TextStyle?>? textStyle,
    WidgetStateProperty<double?>? iconSize,
    WidgetStateProperty<MouseCursor?>? mouseCursor,
    Color? focusColor,
  }) {
    return TButtonTheme(
      animationDuration: animationDuration ?? this.animationDuration,
      height: height ?? this.height,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      padding: padding ?? this.padding,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
      iconSize: iconSize ?? this.iconSize,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      focusColor: focusColor ?? this.focusColor,
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
      height: other.height,
      backgroundColor: other.backgroundColor,
      elevation: other.elevation,
      padding: other.padding,
      border: other.border,
      borderRadius: other.borderRadius,
      textStyle: other.textStyle,
      iconSize: other.iconSize,
      mouseCursor: other.mouseCursor,
      focusColor: other.focusColor,
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
      height: WidgetStateProperty.lerp<double?>(
        height,
        other.height,
        t,
        lerpDouble,
      ),
      backgroundColor: WidgetStateProperty.lerp<Color?>(
        backgroundColor,
        other.backgroundColor,
        t,
        Color.lerp,
      ),
      elevation: WidgetStateProperty.lerp<double?>(
        elevation,
        other.elevation,
        t,
        lerpDouble,
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
      iconSize: WidgetStateProperty.lerp<double?>(
        iconSize,
        other.iconSize,
        t,
        lerpDouble,
      ),
      mouseCursor: other.mouseCursor,
      focusColor: Color.lerp(focusColor, other.focusColor, t),
    );
  }
}
