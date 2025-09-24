import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/src/extensions/color.dart';

/// Defines a single color as well a color swatch with eleven shades of the color.
///
/// Matches the shades of the Tailwind CSS color palette.
///
/// Unlike [MaterialColor], a [TMaterialColor] contains an extra [shade950].
class TMaterialColor extends MaterialColor {
  /// Creates a [TMaterialColor] with the given primary [Color] and [Map] of swatches.
  const TMaterialColor(super.primary, super.swatch);

  /// The lightest shade.
  @override
  Color get shade50 => this[50]!;

  /// The second lightest shade.
  @override
  Color get shade100 => this[100]!;

  /// The third lightest shade.
  @override
  Color get shade200 => this[200]!;

  /// The fourth lightest shade.
  @override
  Color get shade300 => this[300]!;

  /// The fifth lightest shade.
  @override
  Color get shade400 => this[400]!;

  /// The default shade.
  @override
  Color get shade500 => this[500]!;

  /// The fifth darkest shade.
  @override
  Color get shade600 => this[600]!;

  /// The fourth darkest shade.
  @override
  Color get shade700 => this[700]!;

  /// The third darkest shade.
  @override
  Color get shade800 => this[800]!;

  /// The second shade.
  @override
  Color get shade900 => this[900]!;

  /// The darkest shade.
  Color get shade950 => this[950]!;
}

// =============================================================================
// CLASS: TColors
// =============================================================================

/// Class that contains the Tailwind CSS color palettes
///
/// https://tailwindcss.com/docs/customizing-colors
abstract final class TColors {
  /// Transparent color
  static const Color transparent = Colors.transparent;

  /// Pure black
  static const Color black = Colors.black;

  /// Pure black with 5% opacity
  static const Color black5 = Color(0x0D000000);

  /// Pure black with 10% opacity
  static const Color black10 = Color(0x1A000000);

  /// Pure black with 20% opacity
  static const Color black20 = Color(0x33000000);

  /// Pure black with 25% opacity
  static const Color black25 = Color(0x40000000);

  /// Pure black with 30% opacity
  static const Color black30 = Color(0x4D000000);

  /// Pure black with 40% opacity
  static const Color black40 = Color(0x66000000);

  /// Pure black with 50% opacity
  static const Color black50 = Color(0x80000000);

  /// Pure black with 60% opacity
  static const Color black60 = Color(0x99000000);

  /// Pure black with 70% opacity
  static const Color black70 = Color(0xB3000000);

  /// Pure black with 75% opacity
  static const Color black75 = Color(0xBF000000);

  /// Pure black with 80% opacity
  static const Color black80 = Color(0xCC000000);

  /// Pure black with 90% opacity
  static const Color black90 = Color(0xE6000000);

  /// Pure black with 95% opacity
  static const Color black95 = Color(0xF2000000);

  /// Pure white
  static const Color white = Colors.white;

  /// Pure white with 5% opacity
  static const Color white5 = Color(0x0DFFFFFF);

  /// Pure white with 10% opacity
  static const Color white10 = Color(0x1AFFFFFF);

  /// Pure white with 20% opacity
  static const Color white20 = Color(0x33FFFFFF);

  /// Pure white with 25% opacity
  static const Color white25 = Color(0x40FFFFFF);

  /// Pure white with 30% opacity
  static const Color white30 = Color(0x4DFFFFFF);

  /// Pure white with 40% opacity
  static const Color white40 = Color(0x66FFFFFF);

  /// Pure white with 50% opacity
  static const Color white50 = Color(0x80FFFFFF);

  /// Pure white with 60% opacity
  static const Color white60 = Color(0x99FFFFFF);

  /// Pure white with 70% opacity
  static const Color white70 = Color(0xB3FFFFFF);

  /// Pure white with 75% opacity
  static const Color white75 = Color(0xBFFFFFFF);

  /// Pure white with 80% opacity
  static const Color white80 = Color(0xCCFFFFFF);

  /// Pure white with 90% opacity
  static const Color white90 = Color(0xE6FFFFFF);

  /// Pure white with 95% opacity
  static const Color white95 = Color(0xF2FFFFFF);

  /// Slate color palette
  static const TMaterialColor slate = TMaterialColor(
    0xff64748b,
    <int, Color>{
      50: Color(0xfff8fafc),
      100: Color(0xfff1f5f9),
      200: Color(0xffe2e8f0),
      300: Color(0xffcbd5e1),
      400: Color(0xff94a3b8),
      500: Color(0xff64748b),
      600: Color(0xff475569),
      700: Color(0xff334155),
      800: Color(0xff1e293b),
      900: Color(0xff0f172a),
      950: Color(0xff020617),
    },
  );

  /// Gray color palette
  static const TMaterialColor gray = TMaterialColor(
    0xff6b7280,
    <int, Color>{
      50: Color(0xfff9fafb),
      100: Color(0xfff3f4f6),
      200: Color(0xffe5e7eb),
      300: Color(0xffd1d5db),
      400: Color(0xff9ca3af),
      500: Color(0xff6b7280),
      600: Color(0xff4b5563),
      700: Color(0xff374151),
      800: Color(0xff1f2937),
      900: Color(0xff111827),
      950: Color(0xff030712),
    },
  );

  /// Zinc color palette
  static const TMaterialColor zinc = TMaterialColor(
    0xff71717a,
    <int, Color>{
      50: Color(0xfffafafa),
      100: Color(0xfff4f4f5),
      200: Color(0xffe4e4e7),
      300: Color(0xffd4d4d8),
      400: Color(0xffa1a1aa),
      500: Color(0xff71717a),
      600: Color(0xff52525b),
      700: Color(0xff3f3f46),
      800: Color(0xff27272a),
      900: Color(0xff18181b),
      950: Color(0xff09090b),
    },
  );

  /// Neutral color palette
  static const TMaterialColor neutral = TMaterialColor(
    0xff737373,
    <int, Color>{
      50: Color(0xfffafafa),
      100: Color(0xfff5f5f5),
      200: Color(0xffe5e5e5),
      300: Color(0xffd4d4d4),
      400: Color(0xffa3a3a3),
      500: Color(0xff737373),
      600: Color(0xff525252),
      700: Color(0xff404040),
      800: Color(0xff262626),
      900: Color(0xff171717),
      950: Color(0xff0a0a0a),
    },
  );

  /// Stone color palette
  static const TMaterialColor stone = TMaterialColor(
    0xff78716c,
    <int, Color>{
      50: Color(0xfffafaf9),
      100: Color(0xfff5f5f4),
      200: Color(0xffe7e5e4),
      300: Color(0xffd6d3d1),
      400: Color(0xffa8a29e),
      500: Color(0xff78716c),
      600: Color(0xff57534e),
      700: Color(0xff44403c),
      800: Color(0xff292524),
      900: Color(0xff1c1917),
      950: Color(0xff0c0a09),
    },
  );

  /// Red color palette
  static const TMaterialColor red = TMaterialColor(
    0xffef4444,
    <int, Color>{
      50: Color(0xfffef2f2),
      100: Color(0xfffee2e2),
      200: Color(0xfffecaca),
      300: Color(0xfffca5a5),
      400: Color(0xfff87171),
      500: Color(0xffef4444),
      600: Color(0xffdc2626),
      700: Color(0xffb91c1c),
      800: Color(0xff991b1b),
      900: Color(0xff7f1d1d),
      950: Color(0xff450a0a),
    },
  );

  /// Orange color palette
  static const TMaterialColor orange = TMaterialColor(
    0xfff97316,
    <int, Color>{
      50: Color(0xfffff7ed),
      100: Color(0xffffedd5),
      200: Color(0xfffed7aa),
      300: Color(0xfffdba74),
      400: Color(0xfffb923c),
      500: Color(0xfff97316),
      600: Color(0xffea580c),
      700: Color(0xffc2410c),
      800: Color(0xff9a3412),
      900: Color(0xff7c2d12),
      950: Color(0xff431407),
    },
  );

  /// Amber color palette
  static const TMaterialColor amber = TMaterialColor(
    0xfff59e0b,
    <int, Color>{
      50: Color(0xfffffbeb),
      100: Color(0xfffef3c7),
      200: Color(0xfffde68a),
      300: Color(0xfffcd34d),
      400: Color(0xfffbbf24),
      500: Color(0xfff59e0b),
      600: Color(0xffd97706),
      700: Color(0xffb45309),
      800: Color(0xff92400e),
      900: Color(0xff78350f),
      950: Color(0xff451a03),
    },
  );

  /// Yellow color palette
  static const TMaterialColor yellow = TMaterialColor(
    0xffeab308,
    <int, Color>{
      50: Color(0xfffefce8),
      100: Color(0xfffef9c3),
      200: Color(0xfffef08a),
      300: Color(0xfffde047),
      400: Color(0xfffacc15),
      500: Color(0xffeab308),
      600: Color(0xffca8a04),
      700: Color(0xffa16207),
      800: Color(0xff854d0e),
      900: Color(0xff713f12),
      950: Color(0xff422006),
    },
  );

  /// Lime color palette
  static const TMaterialColor lime = TMaterialColor(
    0xff84cc16,
    <int, Color>{
      50: Color(0xfff7fee7),
      100: Color(0xffecfccb),
      200: Color(0xffd9f99d),
      300: Color(0xffbef264),
      400: Color(0xffa3e635),
      500: Color(0xff84cc16),
      600: Color(0xff65a30d),
      700: Color(0xff4d7c0f),
      800: Color(0xff3f6212),
      900: Color(0xff365314),
      950: Color(0xff1a2e05),
    },
  );

  /// Green color palette
  static const TMaterialColor green = TMaterialColor(
    0xff22c55e,
    <int, Color>{
      50: Color(0xfff0fdf4),
      100: Color(0xffdcfce7),
      200: Color(0xffbbf7d0),
      300: Color(0xff86efac),
      400: Color(0xff4ade80),
      500: Color(0xff22c55e),
      600: Color(0xff16a34a),
      700: Color(0xff15803d),
      800: Color(0xff166534),
      900: Color(0xff14532d),
      950: Color(0xff052e16),
    },
  );

  /// Emerald color palette
  static const TMaterialColor emerald = TMaterialColor(
    0xff10b981,
    <int, Color>{
      50: Color(0xffecfdf5),
      100: Color(0xffd1fae5),
      200: Color(0xffa7f3d0),
      300: Color(0xff6ee7b7),
      400: Color(0xff34d399),
      500: Color(0xff10b981),
      600: Color(0xff059669),
      700: Color(0xff047857),
      800: Color(0xff065f46),
      900: Color(0xff064e3b),
      950: Color(0xff022c22),
    },
  );

  /// Teal color palette
  static const TMaterialColor teal = TMaterialColor(
    0xff14b8a6,
    <int, Color>{
      50: Color(0xfff0fdfa),
      100: Color(0xffccfbf1),
      200: Color(0xff99f6e4),
      300: Color(0xff5eead4),
      400: Color(0xff2dd4bf),
      500: Color(0xff14b8a6),
      600: Color(0xff0d9488),
      700: Color(0xff0f766e),
      800: Color(0xff115e59),
      900: Color(0xff134e4a),
      950: Color(0xff042f2e),
    },
  );

  /// Cyan color palette
  static const TMaterialColor cyan = TMaterialColor(
    0xff06b6d4,
    <int, Color>{
      50: Color(0xffecfeff),
      100: Color(0xffcffafe),
      200: Color(0xffa5f3fc),
      300: Color(0xff67e8f9),
      400: Color(0xff22d3ee),
      500: Color(0xff06b6d4),
      600: Color(0xff0891b2),
      700: Color(0xff0e7490),
      800: Color(0xff155e75),
      900: Color(0xff164e63),
      950: Color(0xff083344),
    },
  );

  /// Sky color palette
  static const TMaterialColor sky = TMaterialColor(
    0xff0ea5e9,
    <int, Color>{
      50: Color(0xfff0f9ff),
      100: Color(0xffe0f2fe),
      200: Color(0xffbae6fd),
      300: Color(0xff7dd3fc),
      400: Color(0xff38bdf8),
      500: Color(0xff0ea5e9),
      600: Color(0xff0284c7),
      700: Color(0xff0369a1),
      800: Color(0xff075985),
      900: Color(0xff0c4a6e),
      950: Color(0xff082f49),
    },
  );

  /// Blue color palette
  static const TMaterialColor blue = TMaterialColor(
    0xff3b82f6,
    <int, Color>{
      50: Color(0xffeff6ff),
      100: Color(0xffdbeafe),
      200: Color(0xffbfdbfe),
      300: Color(0xff93c5fd),
      400: Color(0xff60a5fa),
      500: Color(0xff3b82f6),
      600: Color(0xff2563eb),
      700: Color(0xff1d4ed8),
      800: Color(0xff1e40af),
      900: Color(0xff1e3a8a),
      950: Color(0xff172554),
    },
  );

  /// Indigo color palette
  static const TMaterialColor indigo = TMaterialColor(
    0xff6366f1,
    <int, Color>{
      50: Color(0xffeef2ff),
      100: Color(0xffe0e7ff),
      200: Color(0xffc7d2fe),
      300: Color(0xffa5b4fc),
      400: Color(0xff818cf8),
      500: Color(0xff6366f1),
      600: Color(0xff4f46e5),
      700: Color(0xff4338ca),
      800: Color(0xff3730a3),
      900: Color(0xff312e81),
      950: Color(0xff1e1b4b),
    },
  );

  /// Violet color palette
  static const TMaterialColor violet = TMaterialColor(
    0xff8b5cf6,
    <int, Color>{
      50: Color(0xfff5f3ff),
      100: Color(0xffede9fe),
      200: Color(0xffddd6fe),
      300: Color(0xffc4b5fd),
      400: Color(0xffa78bfa),
      500: Color(0xff8b5cf6),
      600: Color(0xff7c3aed),
      700: Color(0xff6d28d9),
      800: Color(0xff5b21b6),
      900: Color(0xff4c1d95),
      950: Color(0xff2e1065),
    },
  );

  /// Purple color palette
  static const TMaterialColor purple = TMaterialColor(
    0xffA855F7,
    <int, Color>{
      50: Color(0xfffaf5ff),
      100: Color(0xfff3e8ff),
      200: Color(0xffe9d5ff),
      300: Color(0xffd8b4fe),
      400: Color(0xffc084fc),
      500: Color(0xffA855F7),
      600: Color(0xff9333ea),
      700: Color(0xff7e22ce),
      800: Color(0xff6b21a8),
      900: Color(0xff581c87),
      950: Color(0xff3b0764),
    },
  );

  /// Fuchsia color palette
  static const TMaterialColor fuchsia = TMaterialColor(
    0xffD946EF,
    <int, Color>{
      50: Color(0xfffdf4ff),
      100: Color(0xfffae8ff),
      200: Color(0xfff5d0fe),
      300: Color(0xfff0abfc),
      400: Color(0xffe879f9),
      500: Color(0xffD946EF),
      600: Color(0xffc026d3),
      700: Color(0xffA21caf),
      800: Color(0xff86198f),
      900: Color(0xff701a75),
      950: Color(0xff4a044e),
    },
  );

  /// Pink color palette
  static const TMaterialColor pink = TMaterialColor(
    0xffec4899,
    <int, Color>{
      50: Color(0xfffdf2f8),
      100: Color(0xfffce7f3),
      200: Color(0xfffbcfe8),
      300: Color(0xfff9a8d4),
      400: Color(0xfff472b6),
      500: Color(0xffec4899),
      600: Color(0xffdb2777),
      700: Color(0xffbe185d),
      800: Color(0xff9d174d),
      900: Color(0xff831843),
      950: Color(0xff500724),
    },
  );

  /// Rose color palette
  static const TMaterialColor rose = TMaterialColor(
    0xfff43f5e,
    <int, Color>{
      50: Color(0xfffff1f2),
      100: Color(0xffffe4e6),
      200: Color(0xfffecdd3),
      300: Color(0xfffda4af),
      400: Color(0xfffb7185),
      500: Color(0xfff43f5e),
      600: Color(0xffe11d48),
      700: Color(0xffbe123c),
      800: Color(0xff9f1239),
      900: Color(0xff881337),
      950: Color(0xff4c0519),
    },
  );

  /// Get the color palette by name
  static MaterialColor get(String name) {
    final colorName = name.trim().toLowerCase();
    switch (colorName) {
      case 'black':
        return Colors.black.toMaterialColor();
      case 'white':
        return Colors.white.toMaterialColor();
      case 'transparent':
        return Colors.transparent.toMaterialColor();
      case 'slate':
        return slate;
      case 'gray':
        return gray;
      case 'zinc':
        return zinc;
      case 'neutral':
        return neutral;
      case 'stone':
        return stone;
      case 'red':
        return red;
      case 'orange':
        return orange;
      case 'amber':
        return amber;
      case 'yellow':
        return yellow;
      case 'lime':
        return lime;
      case 'green':
        return green;
      case 'emerald':
        return emerald;
      case 'teal':
        return teal;
      case 'cyan':
        return cyan;
      case 'sky':
        return sky;
      case 'blue':
        return blue;
      case 'indigo':
        return indigo;
      case 'violet':
        return violet;
      case 'purple':
        return purple;
      case 'fuchsia':
        return fuchsia;
      case 'pink':
        return pink;
      case 'rose':
        return rose;
      default:
        throw Exception('Color palette not found: $name');
    }
  }
}
