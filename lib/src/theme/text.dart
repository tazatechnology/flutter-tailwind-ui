// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/src/constants/text.dart';

// =================================================
// CLASS: TailwindTextThemeExtension
// =================================================

/// Tailwind theme extension to replicate the Tailwind CSS design system
///
/// Primarily used to define font sizes and line heights
class TailwindTextThemeExtension
    extends ThemeExtension<TailwindTextThemeExtension> {
  /// Constructor for [TailwindTextThemeExtension]
  TailwindTextThemeExtension({
    TextStyle? style_xs,
    TextStyle? style_sm,
    TextStyle? style_md,
    TextStyle? style_lg,
    TextStyle? style_xl,
    TextStyle? style_2xl,
    TextStyle? style_3xl,
    TextStyle? style_4xl,
    TextStyle? style_5xl,
    TextStyle? style_6xl,
    TextStyle? style_7xl,
    TextStyle? style_8xl,
    TextStyle? style_9xl,
  }) {
    this.style_xs = TTextStyle.text_xs.merge(style_xs);
    this.style_sm = TTextStyle.text_sm.merge(style_sm);
    this.style_md = TTextStyle.text_md.merge(style_md);
    this.style_lg = TTextStyle.text_lg.merge(style_lg);
    this.style_xl = TTextStyle.text_xl.merge(style_xl);
    this.style_2xl = TTextStyle.text_2xl.merge(style_2xl);
    this.style_3xl = TTextStyle.text_3xl.merge(style_3xl);
    this.style_4xl = TTextStyle.text_4xl.merge(style_4xl);
    this.style_5xl = TTextStyle.text_5xl.merge(style_5xl);
    this.style_6xl = TTextStyle.text_6xl.merge(style_6xl);
    this.style_7xl = TTextStyle.text_7xl.merge(style_7xl);
    this.style_8xl = TTextStyle.text_8xl.merge(style_8xl);
    this.style_9xl = TTextStyle.text_9xl.merge(style_9xl);
  }

  /// [TextStyle] equivalent to Tailwind font size `text-xs`
  ///
  /// If not defined, will fallback to [TTextStyle.text_xs]
  late final TextStyle style_xs;

  /// [TextStyle] equivalent to Tailwind font size `text-sm`
  ///
  /// If not defined, will fallback to [TTextStyle.text_sm]
  late final TextStyle style_sm;

  /// [TextStyle] equivalent to Tailwind font size `text-base`
  ///
  /// If not defined, will fallback to [TTextStyle.text_md]
  late final TextStyle style_md;

  /// [TextStyle] equivalent to Tailwind font size `text-lg`
  ///
  /// If not defined, will fallback to [TTextStyle.text_lg]
  late final TextStyle style_lg;

  /// [TextStyle] equivalent to Tailwind font size `text-xl`
  ///
  /// If not defined, will fallback to [TTextStyle.text_xl]
  late final TextStyle style_xl;

  /// [TextStyle] equivalent to Tailwind font size `text-2xl`
  ///
  /// If not defined, will fallback to [TTextStyle.text_2xl]
  late final TextStyle style_2xl;

  /// [TextStyle] equivalent to Tailwind font size `text-3xl`
  ///
  /// If not defined, will fallback to [TTextStyle.text_3xl]
  late final TextStyle style_3xl;

  /// [TextStyle] equivalent to Tailwind font size `text-4xl`
  ///
  /// If not defined, will fallback to [TTextStyle.text_4xl]
  late final TextStyle style_4xl;

  /// [TextStyle] equivalent to Tailwind font size `text-5xl`
  ///
  /// If not defined, will fallback to [TTextStyle.text_5xl]
  late final TextStyle style_5xl;

  /// [TextStyle] equivalent to Tailwind font size `text-6xl`
  ///
  /// If not defined, will fallback to [TTextStyle.text_6xl]
  late final TextStyle style_6xl;

  /// [TextStyle] equivalent to Tailwind font size `text-7xl`
  ///
  /// If not defined, will fallback to [TTextStyle.text_7xl]
  late final TextStyle style_7xl;

  /// [TextStyle] equivalent to Tailwind font size `text-8xl`
  ///
  /// If not defined, will fallback to [TTextStyle.text_8xl]
  late final TextStyle style_8xl;

  /// [TextStyle] equivalent to Tailwind font size `text-9xl`
  ///
  /// If not defined, will fallback to [TTextStyle.text_9xl]
  late final TextStyle style_9xl;

  // -------------------------------------------------
  // METHOD: copyWith
  // -------------------------------------------------

  @override
  TailwindTextThemeExtension copyWith({
    TextStyle? style_xs,
    TextStyle? style_sm,
    TextStyle? style_md,
    TextStyle? style_lg,
    TextStyle? style_xl,
    TextStyle? style_2xl,
    TextStyle? style_3xl,
    TextStyle? style_4xl,
    TextStyle? style_5xl,
    TextStyle? style_6xl,
    TextStyle? style_7xl,
    TextStyle? style_8xl,
    TextStyle? style_9xl,
  }) {
    return TailwindTextThemeExtension(
      style_xs: style_xs ?? this.style_xs,
      style_sm: style_sm ?? this.style_sm,
      style_md: style_md ?? this.style_md,
      style_lg: style_lg ?? this.style_lg,
      style_xl: style_xl ?? this.style_xl,
      style_2xl: style_2xl ?? this.style_2xl,
      style_3xl: style_3xl ?? this.style_3xl,
      style_4xl: style_4xl ?? this.style_4xl,
      style_5xl: style_5xl ?? this.style_5xl,
      style_6xl: style_6xl ?? this.style_6xl,
      style_7xl: style_7xl ?? this.style_7xl,
      style_8xl: style_8xl ?? this.style_8xl,
      style_9xl: style_9xl ?? this.style_9xl,
    );
  }

  // -------------------------------------------------
  // METHOD: lerp
  // -------------------------------------------------

  @override
  TailwindTextThemeExtension lerp(
    TailwindTextThemeExtension? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }
    return TailwindTextThemeExtension(
      style_xs: TextStyle.lerp(style_xs, other.style_xs, t) ?? style_xs,
      style_sm: TextStyle.lerp(style_sm, other.style_sm, t) ?? style_sm,
      style_md: TextStyle.lerp(style_md, other.style_md, t) ?? style_md,
      style_lg: TextStyle.lerp(style_lg, other.style_lg, t) ?? style_lg,
      style_xl: TextStyle.lerp(style_xl, other.style_xl, t) ?? style_xl,
      style_2xl: TextStyle.lerp(style_2xl, other.style_2xl, t) ?? style_2xl,
      style_3xl: TextStyle.lerp(style_3xl, other.style_3xl, t) ?? style_3xl,
      style_4xl: TextStyle.lerp(style_4xl, other.style_4xl, t) ?? style_4xl,
      style_5xl: TextStyle.lerp(style_5xl, other.style_5xl, t) ?? style_5xl,
      style_6xl: TextStyle.lerp(style_6xl, other.style_6xl, t) ?? style_6xl,
      style_7xl: TextStyle.lerp(style_7xl, other.style_7xl, t) ?? style_7xl,
      style_8xl: TextStyle.lerp(style_8xl, other.style_8xl, t) ?? style_8xl,
      style_9xl: TextStyle.lerp(style_9xl, other.style_9xl, t) ?? style_9xl,
    );
  }
}
