import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// CLASS: TailwindTheme
// =================================================

/// Tailwind CSS theme data
class TailwindTheme {
  /// Constructor for [TailwindTheme]
  const TailwindTheme({
    this.primary = TColors.indigo,
    this.backgroundColor = TColors.white,
    this.backgroundColorDark = TColors.slate,
  });

  /// Primary color palette for the application
  ///
  /// Used for buttons, borders, checkboxes, and more
  final MaterialColor primary;

  /// Light background color for the application
  final Color backgroundColor;

  /// Dark background color for the application
  final MaterialColor backgroundColorDark;

  /// Returns an instance of a light [ThemeData] from [TailwindTheme]
  ThemeData light() {
    return _buildTheme(ThemeData.light());
  }

  /// Returns an instance of a dark [ThemeData] from [TailwindTheme]
  ThemeData dark() {
    // const Color(0xFF0f172a),
    return _buildTheme(ThemeData.dark());
  }

  // -------------------------------------------------
  // METHOD: _buildTheme
  // -------------------------------------------------

  ThemeData _buildTheme(ThemeData base) {
    final isLight = base.brightness == Brightness.light;
    return base.copyWith(
      scaffoldBackgroundColor:
          isLight ? backgroundColor : backgroundColorDark.shade900,
    );
  }
}
