import 'package:flutter/material.dart';

// =============================================================================
// EXTENSION: XTailwindColor
// =============================================================================

/// Extension on [Color] to provide useful methods
extension XTailwindColor on Color {
  /// Check if this color is black
  bool get isBlack => value == Colors.black.value;

  /// Check if this color is white
  bool get isWhite => value == Colors.white.value;

  /// Check if this color is transparent
  bool get isTransparent => value == Colors.transparent.value;

  // ---------------------------------------------------------------------------
  // METHOD: darken
  // ---------------------------------------------------------------------------

  /// Darken a color by [percent] amount (1 = black)
  Color darken([double percent = 0.1]) {
    if (percent <= 0.001) {
      return this;
    } else {
      final p = 1 - percent;
      return Color.fromARGB(
        alpha,
        (red * p).round(),
        (green * p).round(),
        (blue * p).round(),
      );
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: lighten
  // ---------------------------------------------------------------------------

  /// Lighten a color by [percent] amount (1 = white)
  Color lighten([double percent = 0.1]) {
    if (percent <= 0.001) {
      return this;
    } else {
      return Color.fromARGB(
        alpha,
        red + ((255 - red) * percent).round(),
        green + ((255 - green) * percent).round(),
        blue + ((255 - blue) * percent).round(),
      );
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: contrastBlackWhite
  // ---------------------------------------------------------------------------

  /// Get a black or white contrast color
  Color? contrastBlackWhite() {
    if (this == Colors.transparent) {
      return null; // Defer
    }
    return computeLuminance() < 0.5 ? Colors.white : Colors.black;
  }

  // ---------------------------------------------------------------------------
  // METHOD: toHex
  // ---------------------------------------------------------------------------

  /// Get a hex string representation of this color
  String toHex({bool leadingHashSign = true}) {
    String value = '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';

    if (value.startsWith('ff')) {
      value = value.substring(2);
    }

    if (leadingHashSign) {
      value = '#$value';
    }

    return value;
  }

  // ---------------------------------------------------------------------------
  // METHOD: toMaterialColor
  // ---------------------------------------------------------------------------

  /// Get a [MaterialColor] representation of this color
  MaterialColor toMaterialColor() {
    if (this is MaterialColor) {
      return this as MaterialColor;
    }
    Map<int, Color> colorShades;
    if (this == Colors.transparent) {
      colorShades = {
        50: Colors.transparent,
        100: Colors.transparent,
        200: Colors.transparent,
        300: Colors.transparent,
        400: Colors.transparent,
        500: Colors.transparent,
        600: Colors.transparent,
        700: Colors.transparent,
        800: Colors.transparent,
        900: Colors.transparent,
      };
    } else if (this == Colors.white) {
      colorShades = {
        50: Colors.white,
        100: Colors.white,
        200: Colors.white,
        300: Colors.white,
        400: Colors.white,
        500: Colors.white,
        600: Colors.white,
        700: Colors.white,
        800: Colors.white,
        900: Colors.white,
      };
    } else if (this == Colors.black) {
      colorShades = {
        50: Colors.black,
        100: Colors.black,
        200: Colors.black,
        300: Colors.black,
        400: Colors.black,
        500: Colors.black,
        600: Colors.black,
        700: Colors.black,
        800: Colors.black,
        900: Colors.black,
      };
    } else {
      colorShades = {
        50: _tintColor(this, 0.9),
        100: _tintColor(this, 0.8),
        200: _tintColor(this, 0.6),
        300: _tintColor(this, 0.4),
        400: _tintColor(this, 0.2),
        500: this,
        600: _shadeColor(this, 0.1),
        700: _shadeColor(this, 0.2),
        800: _shadeColor(this, 0.3),
        900: _shadeColor(this, 0.4),
      };
    }

    return MaterialColor(value, colorShades);
  }
}

// ---------------------------------------------------------------------------
// METHOD: _tintColor
// ---------------------------------------------------------------------------

/// Tints the given color by lightening it based on the provided factor.
///
/// The factor should be between 0 and 1, where 1 results in the lightest tint.
Color _tintColor(Color color, double factor) => Color.fromRGBO(
      (color.red + ((255 - color.red) * factor)).round(),
      (color.green + ((255 - color.green) * factor)).round(),
      (color.blue + ((255 - color.blue) * factor)).round(),
      1,
    );

// ---------------------------------------------------------------------------
// METHOD: _shadeColor
// ---------------------------------------------------------------------------

/// Shades the given color by darkening it based on the provided factor.
///
/// The factor should be between 0 and 1, where 1 results in the darkest shade.
Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      (color.red * (1 - factor)).round(),
      (color.green * (1 - factor)).round(),
      (color.blue * (1 - factor)).round(),
      1,
    );
