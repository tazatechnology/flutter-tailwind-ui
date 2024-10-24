import 'package:flutter/material.dart';

// =================================================
// CLASS:
// =================================================

/// Extension on [Color] to provide useful methods
extension XTailwindColor on Color {
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

  /// Get a black or white contrast color
  Color? contrastBlackWhite() {
    if (this == Colors.transparent) {
      return null; // Defer
    }
    return computeLuminance() < 0.5 ? Colors.white : Colors.black;
  }

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

  /// Get a [MaterialColor] representation of this color
  MaterialColor toMaterialColor() {
    final colorShades = {
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

    return MaterialColor(value, colorShades);
  }
}

/// Tints the given color by lightening it based on the provided factor.
///
/// The factor should be between 0 and 1, where 1 results in the lightest tint.
Color _tintColor(Color color, double factor) => Color.fromRGBO(
      (color.red + ((255 - color.red) * factor)).round(),
      (color.green + ((255 - color.green) * factor)).round(),
      (color.blue + ((255 - color.blue) * factor)).round(),
      1,
    );

/// Shades the given color by darkening it based on the provided factor.
///
/// The factor should be between 0 and 1, where 1 results in the darkest shade.
Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      (color.red * (1 - factor)).round(),
      (color.green * (1 - factor)).round(),
      (color.blue * (1 - factor)).round(),
      1,
    );
