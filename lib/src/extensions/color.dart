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
    var value = '${alpha.toRadixString(16).padLeft(2, '0')}'
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
}
