// ignore_for_file: constant_identifier_names

// =================================================
// CLASS: TFontSize
// =================================================

/// Tailwind font size scaling system for text.
///
/// https://tailwindcss.com/docs/font-size
abstract final class TFontSize {
  /// Equivalent to Tailwind font size `text-xs`
  static const text_xs = 12.0;

  /// Equivalent to Tailwind font size `text-sm`
  static const text_sm = 14.0;

  /// Equivalent to Tailwind font size `text-base`
  static const text_base = 16.0;

  /// Equivalent to Tailwind font size `text-lg`
  static const text_lg = 18.0;

  /// Equivalent to Tailwind font size `text-xl`
  static const text_xl = 20.0;

  /// Equivalent to Tailwind font size `text-2xl`
  static const text_2xl = 24.0;

  /// Equivalent to Tailwind font size `text-3xl`
  static const text_3xl = 30.0;

  /// Equivalent to Tailwind font size `text-4xl`
  static const text_4xl = 36.0;

  /// Equivalent to Tailwind font size `text-5xl`
  static const text_5xl = 48.0;

  /// Equivalent to Tailwind font size `text-6xl`
  static const text_6xl = 60.0;

  /// Equivalent to Tailwind font size `text-7xl`
  static const text_7xl = 72.0;

  /// Equivalent to Tailwind font size `text-8xl`
  static const text_8xl = 96.0;

  /// Equivalent to Tailwind font size `text-9xl`
  static const text_9xl = 128.0;

  /// A complete list of all the Tailwind spacing scale names and values.
  static const Map<String, double> values = {
    'text_xs': text_xs,
    'text_sm': text_sm,
    'text_base': text_base,
    'text_lg': text_lg,
    'text_xl': text_xl,
    'text_2xl': text_2xl,
    'text_3xl': text_3xl,
    'text_4xl': text_4xl,
    'text_5xl': text_5xl,
    'text_6xl': text_6xl,
    'text_7xl': text_7xl,
    'text_8xl': text_8xl,
    'text_9xl': text_9xl,
  };
}
