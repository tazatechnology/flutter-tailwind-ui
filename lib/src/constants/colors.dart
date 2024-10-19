// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

/// The [ColorSwatch] shades used by Flutter [MaterialColor] definitions
const DEFAULT_COLOR_SWATCH_SHADES = [
  50,
  100,
  200,
  300,
  400,
  500,
  600,
  700,
  800,
  900,
];

/// The [ColorSwatch] shades used by Tailwind [MaterialColor] definitions
const DEFAULT_TAILWIND_COLOR_SWATCH_SHADES = [
  50,
  100,
  200,
  300,
  400,
  500,
  600,
  700,
  800,
  900,
  950,
];

// =================================================
// CLASS: TColors
// =================================================

/// Class that contains the Tailwind CSS color palettes
///
/// https://tailwindcss.com/docs/customizing-colors
abstract final class TColors {
  /// Completely opaque black.
  static const black = Colors.black;

  /// Completely opaque white.
  static const white = Colors.white;

  /// Completely invisible.
  static const transparent = Colors.transparent;

  /// Slate color palette
  static const MaterialColor slate = MaterialColor(
    0xFF64748b,
    <int, Color>{
      50: Color(0xFFf8fafc),
      100: Color(0xFFf1f5f9),
      200: Color(0xFFe2e8f0),
      300: Color(0xFFcbd5e1),
      400: Color(0xFF94a3b8),
      500: Color(0xFF64748b),
      600: Color(0xFF475569),
      700: Color(0xFF334155),
      800: Color(0xFF1e293b),
      900: Color(0xFF0f172a),
      950: Color(0xFF020617),
    },
  );

  /// Gray color palette
  static const MaterialColor gray = MaterialColor(
    0xFF6b7280,
    <int, Color>{
      50: Color(0xFFf9fafb),
      100: Color(0xFFf3f4f6),
      200: Color(0xFFe5e7eb),
      300: Color(0xFFd1d5db),
      400: Color(0xFF9ca3af),
      500: Color(0xFF6b7280),
      600: Color(0xFF4b5563),
      700: Color(0xFF374151),
      800: Color(0xFF1f2937),
      900: Color(0xFF111827),
      950: Color(0xFF030712),
    },
  );

  /// Zinc color palette
  static const MaterialColor zinc = MaterialColor(
    0xFF71717a,
    <int, Color>{
      50: Color(0xFFfafafa),
      100: Color(0xFFf4f4f5),
      200: Color(0xFFe4e4e7),
      300: Color(0xFFd4d4d8),
      400: Color(0xFFa1a1aa),
      500: Color(0xFF71717a),
      600: Color(0xFF52525b),
      700: Color(0xFF3f3f46),
      800: Color(0xFF27272a),
      900: Color(0xFF18181b),
      950: Color(0xFF09090b),
    },
  );

  /// Neutral color palette
  static const MaterialColor neutral = MaterialColor(
    0xFF737373,
    <int, Color>{
      50: Color(0xFFfafafa),
      100: Color(0xFFf5f5f5),
      200: Color(0xFFe5e5e5),
      300: Color(0xFFd4d4d4),
      400: Color(0xFFa3a3a3),
      500: Color(0xFF737373),
      600: Color(0xFF525252),
      700: Color(0xFF404040),
      800: Color(0xFF262626),
      900: Color(0xFF171717),
      950: Color(0xFF0a0a0a),
    },
  );

  /// Stone color palette
  static const MaterialColor stone = MaterialColor(
    0xFF78716c,
    <int, Color>{
      50: Color(0xFFfafaf9),
      100: Color(0xFFf5f5f4),
      200: Color(0xFFe7e5e4),
      300: Color(0xFFd6d3d1),
      400: Color(0xFFa8a29e),
      500: Color(0xFF78716c),
      600: Color(0xFF57534e),
      700: Color(0xFF44403c),
      800: Color(0xFF292524),
      900: Color(0xFF1c1917),
      950: Color(0xFF0c0a09),
    },
  );

  /// Red color palette
  static const MaterialColor red = MaterialColor(
    0xFFef4444,
    <int, Color>{
      50: Color(0xFFfef2f2),
      100: Color(0xFFfee2e2),
      200: Color(0xFFfecaca),
      300: Color(0xFFfca5a5),
      400: Color(0xFFf87171),
      500: Color(0xFFef4444),
      600: Color(0xFFdc2626),
      700: Color(0xFFb91c1c),
      800: Color(0xFF991b1b),
      900: Color(0xFF7f1d1d),
      950: Color(0xFF450a0a),
    },
  );

  /// Orange color palette
  static const MaterialColor orange = MaterialColor(
    0xFFf97316,
    <int, Color>{
      50: Color(0xFFfff7ed),
      100: Color(0xFFffedd5),
      200: Color(0xFFfed7aa),
      300: Color(0xFFfdba74),
      400: Color(0xFFfb923c),
      500: Color(0xFFf97316),
      600: Color(0xFFea580c),
      700: Color(0xFFc2410c),
      800: Color(0xFF9a3412),
      900: Color(0xFF7c2d12),
      950: Color(0xFF431407),
    },
  );

  /// Amber color palette
  static const MaterialColor amber = MaterialColor(
    0xFFf59e0b,
    <int, Color>{
      50: Color(0xFFfffbeb),
      100: Color(0xFFfef3c7),
      200: Color(0xFFfde68a),
      300: Color(0xFFfcd34d),
      400: Color(0xFFfbbf24),
      500: Color(0xFFf59e0b),
      600: Color(0xFFd97706),
      700: Color(0xFFb45309),
      800: Color(0xFF92400e),
      900: Color(0xFF78350f),
      950: Color(0xFF451a03),
    },
  );

  /// Yellow color palette
  static const MaterialColor yellow = MaterialColor(
    0xFFeab308,
    <int, Color>{
      50: Color(0xFFfefce8),
      100: Color(0xFFfef9c3),
      200: Color(0xFFfef08a),
      300: Color(0xFFfde047),
      400: Color(0xFFfacc15),
      500: Color(0xFFeab308),
      600: Color(0xFFca8a04),
      700: Color(0xFFa16207),
      800: Color(0xFF854d0e),
      900: Color(0xFF713f12),
      950: Color(0xFF422006),
    },
  );

  /// Lime color palette
  static const MaterialColor lime = MaterialColor(
    0xFF84cc16,
    <int, Color>{
      50: Color(0xFFf7fee7),
      100: Color(0xFFecfccb),
      200: Color(0xFFd9f99d),
      300: Color(0xFFbef264),
      400: Color(0xFFa3e635),
      500: Color(0xFF84cc16),
      600: Color(0xFF65a30d),
      700: Color(0xFF4d7c0f),
      800: Color(0xFF3f6212),
      900: Color(0xFF365314),
      950: Color(0xFF1a2e05),
    },
  );

  /// Green color palette
  static const MaterialColor green = MaterialColor(
    0xFF22c55e,
    <int, Color>{
      50: Color(0xFFf0fdf4),
      100: Color(0xFFdcfce7),
      200: Color(0xFFbbf7d0),
      300: Color(0xFF86efac),
      400: Color(0xFF4ade80),
      500: Color(0xFF22c55e),
      600: Color(0xFF16a34a),
      700: Color(0xFF15803d),
      800: Color(0xFF166534),
      900: Color(0xFF14532d),
      950: Color(0xFF052e16),
    },
  );

  /// Emerald color palette
  static const MaterialColor emerald = MaterialColor(
    0xFF10b981,
    <int, Color>{
      50: Color(0xFFecfdf5),
      100: Color(0xFFd1fae5),
      200: Color(0xFFa7f3d0),
      300: Color(0xFF6ee7b7),
      400: Color(0xFF34d399),
      500: Color(0xFF10b981),
      600: Color(0xFF059669),
      700: Color(0xFF047857),
      800: Color(0xFF065f46),
      900: Color(0xFF064e3b),
      950: Color(0xFF022c22),
    },
  );

  /// Teal color palette
  static const MaterialColor teal = MaterialColor(
    0xFF14b8a6,
    <int, Color>{
      50: Color(0xFFf0fdfa),
      100: Color(0xFFccfbf1),
      200: Color(0xFF99f6e4),
      300: Color(0xFF5eead4),
      400: Color(0xFF2dd4bf),
      500: Color(0xFF14b8a6),
      600: Color(0xFF0d9488),
      700: Color(0xFF0f766e),
      800: Color(0xFF115e59),
      900: Color(0xFF134e4a),
      950: Color(0xFF042f2e),
    },
  );

  /// Cyan color palette
  static const MaterialColor cyan = MaterialColor(
    0xFF06b6d4,
    <int, Color>{
      50: Color(0xFFecfeff),
      100: Color(0xFFcffafe),
      200: Color(0xFFa5f3fc),
      300: Color(0xFF67e8f9),
      400: Color(0xFF22d3ee),
      500: Color(0xFF06b6d4),
      600: Color(0xFF0891b2),
      700: Color(0xFF0e7490),
      800: Color(0xFF155e75),
      900: Color(0xFF164e63),
      950: Color(0xFF083344),
    },
  );

  /// Sky color palette
  static const MaterialColor sky = MaterialColor(
    0xFF0ea5e9,
    <int, Color>{
      50: Color(0xFFf0f9ff),
      100: Color(0xFFe0f2fe),
      200: Color(0xFFbae6fd),
      300: Color(0xFF7dd3fc),
      400: Color(0xFF38bdf8),
      500: Color(0xFF0ea5e9),
      600: Color(0xFF0284c7),
      700: Color(0xFF0369a1),
      800: Color(0xFF075985),
      900: Color(0xFF0c4a6e),
      950: Color(0xFF082f49),
    },
  );

  /// Blue color palette
  static const MaterialColor blue = MaterialColor(
    0xFF3b82f6,
    <int, Color>{
      50: Color(0xFFeff6ff),
      100: Color(0xFFdbeafe),
      200: Color(0xFFbfdbfe),
      300: Color(0xFF93c5fd),
      400: Color(0xFF60a5fa),
      500: Color(0xFF3b82f6),
      600: Color(0xFF2563eb),
      700: Color(0xFF1d4ed8),
      800: Color(0xFF1e40af),
      900: Color(0xFF1e3a8a),
      950: Color(0xFF172554),
    },
  );

  /// Indigo color palette
  static const MaterialColor indigo = MaterialColor(
    0xFF6366f1,
    <int, Color>{
      50: Color(0xFFeef2ff),
      100: Color(0xFFe0e7ff),
      200: Color(0xFFc7d2fe),
      300: Color(0xFFa5b4fc),
      400: Color(0xFF818cf8),
      500: Color(0xFF6366f1),
      600: Color(0xFF4f46e5),
      700: Color(0xFF4338ca),
      800: Color(0xFF3730a3),
      900: Color(0xFF312e81),
      950: Color(0xFF1e1b4b),
    },
  );

  /// Violet color palette
  static const MaterialColor violet = MaterialColor(
    0xFF8b5cf6,
    <int, Color>{
      50: Color(0xFFf5f3ff),
      100: Color(0xFFede9fe),
      200: Color(0xFFddd6fe),
      300: Color(0xFFc4b5fd),
      400: Color(0xFFa78bfa),
      500: Color(0xFF8b5cf6),
      600: Color(0xFF7c3aed),
      700: Color(0xFF6d28d9),
      800: Color(0xFF5b21b6),
      900: Color(0xFF4c1d95),
      950: Color(0xFF2e1065),
    },
  );

  /// Purple color palette
  static const MaterialColor purple = MaterialColor(
    0xFFA855F7,
    <int, Color>{
      50: Color(0xFFfaf5ff),
      100: Color(0xFFf3e8ff),
      200: Color(0xFFe9d5ff),
      300: Color(0xFFd8b4fe),
      400: Color(0xFFc084fc),
      500: Color(0xFFA855F7),
      600: Color(0xFF9333ea),
      700: Color(0xFF7e22ce),
      800: Color(0xFF6b21a8),
      900: Color(0xFF581c87),
      950: Color(0xFF3b0764),
    },
  );

  /// Fuchsia color palette
  static const MaterialColor fuchsia = MaterialColor(
    0xFFD946EF,
    <int, Color>{
      50: Color(0xFFfdf4ff),
      100: Color(0xFFfae8ff),
      200: Color(0xFFf5d0fe),
      300: Color(0xFFf0abfc),
      400: Color(0xFFe879f9),
      500: Color(0xFFD946EF),
      600: Color(0xFFc026d3),
      700: Color(0xFFA21caf),
      800: Color(0xFF86198f),
      900: Color(0xFF701a75),
      950: Color(0xFF4a044e),
    },
  );

  /// Pink color palette
  static const MaterialColor pink = MaterialColor(
    0xFFec4899,
    <int, Color>{
      50: Color(0xFFfdf2f8),
      100: Color(0xFFfce7f3),
      200: Color(0xFFfbcfe8),
      300: Color(0xFFf9a8d4),
      400: Color(0xFFf472b6),
      500: Color(0xFFec4899),
      600: Color(0xFFdb2777),
      700: Color(0xFFbe185d),
      800: Color(0xFF9d174d),
      900: Color(0xFF831843),
      950: Color(0xFF500724),
    },
  );

  /// Rose color palette
  static const MaterialColor rose = MaterialColor(
    0xFFf43f5e,
    <int, Color>{
      50: Color(0xFFfff1f2),
      100: Color(0xFFffe4e6),
      200: Color(0xFFfecdd3),
      300: Color(0xFFfda4af),
      400: Color(0xFFfb7185),
      500: Color(0xFFf43f5e),
      600: Color(0xFFe11d48),
      700: Color(0xFFbe123c),
      800: Color(0xFF9f1239),
      900: Color(0xFF881337),
      950: Color(0xFF4c0519),
    },
  );

  /// Get the color palette by name
  static MaterialColor get(String name) {
    final colorName = name.trim().toLowerCase();
    switch (colorName) {
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
