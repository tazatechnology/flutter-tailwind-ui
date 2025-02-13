// Match Tailwind naming conventions for traceability
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:flutter/material.dart';

// =============================================================================
// CLASS: TFontSize
// =============================================================================

/// Tailwind font size scaling system for text.
///
/// https://tailwindcss.com/docs/font-size
abstract class TFontSize {
  /// Equivalent to Tailwind font size `text-xs`
  static const double text_xs = 12;

  /// Equivalent to Tailwind font size `text-sm`
  static const double text_sm = 14;

  /// Equivalent to Tailwind font size `text-base`
  static const double text_md = 16;

  /// Equivalent to Tailwind font size `text-lg`
  static const double text_lg = 18;

  /// Equivalent to Tailwind font size `text-xl`
  static const double text_xl = 20;

  /// Equivalent to Tailwind font size `text-2xl`
  static const double text_2xl = 24;

  /// Equivalent to Tailwind font size `text-3xl`
  static const double text_3xl = 30;

  /// Equivalent to Tailwind font size `text-4xl`
  static const double text_4xl = 36;

  /// Equivalent to Tailwind font size `text-5xl`
  static const double text_5xl = 48;

  /// Equivalent to Tailwind font size `text-6xl`
  static const double text_6xl = 60;

  /// Equivalent to Tailwind font size `text-7xl`
  static const double text_7xl = 72;

  /// Equivalent to Tailwind font size `text-8xl`
  static const double text_8xl = 96;

  /// Equivalent to Tailwind font size `text-9xl`
  static const double text_9xl = 128;

  /// A list of all the letter spacing values.
  static const List<double> values = <double>[
    text_xs,
    text_sm,
    text_md,
    text_lg,
    text_xl,
    text_2xl,
    text_3xl,
    text_4xl,
    text_5xl,
    text_6xl,
    text_7xl,
    text_8xl,
    text_9xl,
  ];

  /// A mapping of font size values to their string representations.
  static final Map<double, String> names = {
    text_xs: 'TFontSize.text_xs',
    text_sm: 'TFontSize.text_sm',
    text_md: 'TFontSize.text_md',
    text_lg: 'TFontSize.text_lg',
    text_xl: 'TFontSize.text_xl',
    text_2xl: 'TFontSize.text_2xl',
    text_3xl: 'TFontSize.text_3xl',
    text_4xl: 'TFontSize.text_4xl',
    text_5xl: 'TFontSize.text_5xl',
    text_6xl: 'TFontSize.text_6xl',
    text_7xl: 'TFontSize.text_7xl',
    text_8xl: 'TFontSize.text_8xl',
    text_9xl: 'TFontSize.text_9xl',
  };

  /// A helper method to get the name of the font size value.
  static String getName(double fontSize) {
    return names[fontSize] ?? fontSize.toString();
  }
}

// =============================================================================
// CLASS: TFontWeight
// =============================================================================

/// Tailwind font weight constants
///
/// https://tailwindcss.com/docs/font-weight
abstract class TFontWeight {
  /// Equivalent to Tailwind font weight: `font-thin`
  static const FontWeight thin = FontWeight.w100;

  /// Equivalent to Tailwind font weight: `font-extralight`
  static const FontWeight extralight = FontWeight.w200;

  /// Equivalent to Tailwind font weight: `font-light`
  static const FontWeight light = FontWeight.w300;

  /// Equivalent to Tailwind font weight: `font-normal`
  static const FontWeight normal = FontWeight.w400;

  /// Equivalent to Tailwind font weight: `font-medium`
  static const FontWeight medium = FontWeight.w500;

  /// Equivalent to Tailwind font weight: `font-semibold`
  static const FontWeight semibold = FontWeight.w600;

  /// Equivalent to Tailwind font weight: `font-bold`
  static const FontWeight bold = FontWeight.w700;

  /// Equivalent to Tailwind font weight: `font-extrabold`
  static const FontWeight extrabold = FontWeight.w800;

  /// Equivalent to Tailwind font weight: `font-black`
  static const FontWeight black = FontWeight.w900;

  /// A list of all the font weights.
  static const List<FontWeight> values = <FontWeight>[
    thin,
    extralight,
    light,
    normal,
    medium,
    semibold,
    bold,
    extrabold,
    black,
  ];

  /// A mapping of font weights to their string representations.
  static const Map<FontWeight, String> names = {
    thin: 'TFontWeight.thin',
    extralight: 'TFontWeight.extralight',
    light: 'TFontWeight.light',
    normal: 'TFontWeight.normal',
    medium: 'TFontWeight.medium',
    semibold: 'TFontWeight.semibold',
    bold: 'TFontWeight.bold',
    extrabold: 'TFontWeight.extrabold',
    black: 'TFontWeight.black',
  };

  /// A helper method to get the name of a font weight.
  static String getName(FontWeight fontWeight) {
    return names[fontWeight] ?? fontWeight.toString();
  }
}

// =============================================================================
// CLASS: TLetterSpacing
// =============================================================================

/// Tailwind letter spacing constants
///
/// https://tailwindcss.com/docs/letter-spacing
abstract class TLetterSpacing {
  /// Equivalent to Tailwind letter spacing: `tracking-tighter`
  static const double tighter = -0.05 * 16;

  /// Equivalent to Tailwind letter spacing: `tracking-tight`
  static const double tight = -0.025 * 16;

  /// Equivalent to Tailwind letter spacing: `tracking-normal`
  static const double normal = 0;

  /// Equivalent to Tailwind letter spacing: `tracking-wide`
  static const double wide = 0.025 * 16;

  /// Equivalent to Tailwind letter spacing: `tracking-wider`
  static const double wider = 0.05 * 16;

  /// Equivalent to Tailwind letter spacing: `tracking-widest`
  static const double widest = 0.1 * 16;

  /// A list of all the letter spacing values.
  static const List<double> values = <double>[
    tighter,
    tight,
    normal,
    wide,
    wider,
    widest,
  ];

  /// A mapping of letter spacing values to their string representations.
  static final Map<double, String> names = {
    tighter: 'TLetterSpacing.tighter',
    tight: 'TLetterSpacing.tight',
    normal: 'TLetterSpacing.normal',
    wide: 'TLetterSpacing.wide',
    wider: 'TLetterSpacing.wider',
    widest: 'TLetterSpacing.widest',
  };

  /// A helper method to get the name of the letter spacing value.
  static String getName(double letterSpacing) {
    return names[letterSpacing] ?? letterSpacing.toString();
  }
}

// =============================================================================
// CLASS: TTextStyle
// =============================================================================

/// Tailwind inspired fonts and text styles
abstract class TTextStyle {
  /// The default font family (pre-packaged)
  static const fontFamily = 'packages/flutter_tailwind_ui/Geist';

  /// The default monospace font family (pre-packaged)
  static const fontFamilyMono = 'packages/flutter_tailwind_ui/JetBrainsMono';

  /// Default [TextStyle] equivalent to Tailwind font size `text-xs`
  static const text_xs = TextStyle(
    fontSize: TFontSize.text_xs,
    height: 1 / 0.75,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-sm`
  static const text_sm = TextStyle(
    fontSize: TFontSize.text_sm,
    height: 1.25 / 0.875,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-base`
  static const text_md = TextStyle(
    fontSize: TFontSize.text_md,
    height: 1.5 / 1,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-lg`
  static const text_lg = TextStyle(
    fontSize: TFontSize.text_lg,
    height: 1.75 / 1.125,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-xl`
  static const text_xl = TextStyle(
    fontSize: TFontSize.text_xl,
    height: 1.75 / 1.25,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-2xl`
  static const text_2xl = TextStyle(
    fontSize: TFontSize.text_2xl,
    height: 2 / 1.5,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-3xl`
  static const text_3xl = TextStyle(
    fontSize: TFontSize.text_3xl,
    height: 2.25 / 1.875,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-4xl`
  static const text_4xl = TextStyle(
    fontSize: TFontSize.text_4xl,
    height: 2.5 / 2.25,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-5xl`
  static const text_5xl = TextStyle(
    fontSize: TFontSize.text_5xl,
    height: 1,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-6xl`
  static const text_6xl = TextStyle(
    fontSize: TFontSize.text_6xl,
    height: 1,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-7xl`
  static const text_7xl = TextStyle(
    fontSize: TFontSize.text_7xl,
    height: 1,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-8xl`
  static const text_8xl = TextStyle(
    fontSize: TFontSize.text_8xl,
    height: 1,
  );

  /// Default [TextStyle] equivalent to Tailwind font size `text-9xl`
  static const text_9xl = TextStyle(
    fontSize: TFontSize.text_9xl,
    height: 1,
  );
}
