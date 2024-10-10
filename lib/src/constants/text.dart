// ignore_for_file: constant_identifier_names
import 'package:flutter/widgets.dart';
import 'package:flutter_tailwind_ui/src/constants/scale.dart';

// =================================================
// CLASS: TLetterSpacing
// =================================================

/// Tailwind letter spacing constants
///
/// https://tailwindcss.com/docs/letter-spacing
abstract final class TLetterSpacing {
  /// Equivalent to Tailwind letter spacing: `tracking-tighter`
  static const tracking_tighter = -0.05 * 16;

  /// Equivalent to Tailwind letter spacing: `tracking-tight`
  static const tracking_tight = -0.025 * 16;

  /// Equivalent to Tailwind letter spacing: `tracking-normal`
  static const tracking_normal = 0.0;

  /// Equivalent to Tailwind letter spacing: `tracking-wide`
  static const tracking_wide = 0.025 * 16;

  /// Equivalent to Tailwind letter spacing: `tracking-wider`
  static const tracking_wider = 0.05 * 16;

  /// Equivalent to Tailwind letter spacing: `tracking-widest`
  static const tracking_widest = 0.1 * 16;
}

// =================================================
// CLASS: TTextStyle
// =================================================

/// Tailwind text style constants
///
/// https://tailwindcss.com/docs/font-size
abstract final class TTextStyle {
  /// [TextStyle] equivalent to Tailwind font size `text-xs`
  static const text_xs = TextStyle(
    fontSize: TTextScale.text_xs,
    height: 16 / 12,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-sm`
  static const text_sm = TextStyle(
    fontSize: TTextScale.text_sm,
    height: 20 / 14,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-base`
  static const text_base = TextStyle(
    fontSize: TTextScale.text_base,
    height: 24 / 16,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-lg`
  static const text_lg = TextStyle(
    fontSize: TTextScale.text_lg,
    height: 28 / 18,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-xl`
  static const text_xl = TextStyle(
    fontSize: TTextScale.text_xl,
    height: 28 / 20,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-2xl`
  static const text_2xl = TextStyle(
    fontSize: TTextScale.text_2xl,
    height: 32 / 24,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-3xl`
  static const text_3xl = TextStyle(
    fontSize: TTextScale.text_3xl,
    height: 36 / 30,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-4xl`
  static const text_4xl = TextStyle(
    fontSize: TTextScale.text_4xl,
    height: 40 / 36,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-5xl`
  static const text_5xl = TextStyle(
    fontSize: TTextScale.text_5xl,
    height: 1,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-6xl`
  static const text_6xl = TextStyle(
    fontSize: TTextScale.text_6xl,
    height: 1,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-7xl`
  static const text_7xl = TextStyle(
    fontSize: TTextScale.text_7xl,
    height: 1,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-8xl`
  static const text_8xl = TextStyle(
    fontSize: TTextScale.text_8xl,
    height: 1,
  );

  /// [TextStyle] equivalent to Tailwind font size `text-9xl`
  static const text_9xl = TextStyle(
    fontSize: TTextScale.text_9xl,
    height: 1,
  );
}
