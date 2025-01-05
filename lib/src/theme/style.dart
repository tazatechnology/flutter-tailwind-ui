import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TStyleTheme
// =============================================================================

/// Theme data for [TButton] widgets.
class TStyleTheme extends ThemeExtension<TStyleTheme> {
  /// Creates a [TStyleTheme] object.
  const TStyleTheme({
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
  factory TStyleTheme.all({
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
    return TStyleTheme(
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
  TStyleTheme copyWith({
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
    return TStyleTheme(
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

  /// Merges this [TStyleTheme] with another [TStyleTheme].
  TStyleTheme merge(TStyleTheme? other) {
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
  TStyleTheme lerp(
    TStyleTheme? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }

    return TStyleTheme(
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
