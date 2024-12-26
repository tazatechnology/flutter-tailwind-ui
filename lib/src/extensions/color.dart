import 'package:flutter/material.dart';

int _floatToInt8(double x) {
  return (x * 255.0).round() & 0xff;
}

// =============================================================================
// EXTENSION: XTailwindColor
// =============================================================================

/// Extension on [Color] to provide useful methods
extension XTailwindColor on Color {
  /// Check if this color is black
  bool get isBlack => toInt() == Colors.black.toInt();

  /// Check if this color is white
  bool get isWhite => toInt() == Colors.white.toInt();

  /// Check if this color is transparent
  bool get isTransparent => toInt() == Colors.transparent.toInt();

  // ---------------------------------------------------------------------------
  // METHOD: toInt
  // ---------------------------------------------------------------------------

  /// A 32 bit value representing this color.
  ///
  /// The bits are assigned as follows:
  ///
  /// * Bits 24-31 are the alpha value.
  /// * Bits 16-23 are the red value.
  /// * Bits 8-15 are the green value.
  /// * Bits 0-7 are the blue value.
  int toInt() {
    return _floatToInt8(a) << 24 |
        _floatToInt8(r) << 16 |
        _floatToInt8(g) << 8 |
        _floatToInt8(b) << 0;
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
  String toHex({
    bool leadingHashSign = true,
    bool includeAlpha = true,
  }) {
    final rHex = (r * 255).toInt().toRadixString(16).padLeft(2, '0');
    final gHex = (g * 255).toInt().toRadixString(16).padLeft(2, '0');
    final bHex = (b * 255).toInt().toRadixString(16).padLeft(2, '0');
    final aHex = (a * 255).toInt().toRadixString(16).padLeft(2, '0');

    String value = '$rHex$gHex$bHex';

    if (includeAlpha) {
      value = '$aHex$value';
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

    return MaterialColor(toInt(), colorShades);
  }
}

// ---------------------------------------------------------------------------
// METHOD: _tintColor
// ---------------------------------------------------------------------------

/// Tints the given color by lightening it based on the provided factor.
///
/// The factor should be between 0 and 1, where 1 results in the lightest tint.
Color _tintColor(Color color, double factor) => Color.fromRGBO(
      (color.r + ((255 - color.r) * factor)).round(),
      (color.g + ((255 - color.g) * factor)).round(),
      (color.b + ((255 - color.b) * factor)).round(),
      1,
    );

// ---------------------------------------------------------------------------
// METHOD: _shadeColor
// ---------------------------------------------------------------------------

/// Shades the given color by darkening it based on the provided factor.
///
/// The factor should be between 0 and 1, where 1 results in the darkest shade.
Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      (color.r * (1 - factor)).round(),
      (color.g * (1 - factor)).round(),
      (color.b * (1 - factor)).round(),
      1,
    );
