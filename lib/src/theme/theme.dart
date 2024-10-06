import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/constants/text.dart';

// =================================================
// CLASS: TailwindTheme
// =================================================

/// Tailwind theme data to replicate the Tailwind CSS design system
///
/// Reference: https://tailwindcss.com/docs
class TailwindTheme {
  /// Factory constructor for a light Tailwind inspired theme
  factory TailwindTheme.light({
    MaterialColor? primaryColor,
    Color? backgroundColor,
  }) {
    return TailwindTheme._(
      brightness: Brightness.light,
      primaryColor: primaryColor ?? TColors.indigo,
      backgroundColor: backgroundColor ?? TColors.white,
    );
  }

  /// Factory constructor for a dark Tailwind inspired theme
  factory TailwindTheme.dark({
    MaterialColor? primaryColor,
    Color? backgroundColor,
  }) {
    return TailwindTheme._(
      brightness: Brightness.dark,
      primaryColor: primaryColor ?? TColors.indigo,
      backgroundColor: backgroundColor ?? TColors.slate.shade900,
    );
  }

  /// Constructor for [TailwindTheme]
  TailwindTheme._({
    required this.brightness,
    required this.primaryColor,
    required this.backgroundColor,
  }) {
    data = _buildThemeData();
  }

  /// The default font that is shipped with the package
  ///
  /// https://github.com/vercel/geist-font
  static const fontFamily = 'packages/flutter_tailwind_ui/Geist';

  /// The default monospace font that is shipped with the package
  ///
  /// https://github.com/vercel/geist-font
  static const fontFamilyMono = 'packages/flutter_tailwind_ui/GeistMono';

  /// The Flutter [ThemeData] instance
  late final ThemeData data;

  /// The brightness of the theme (light or dark)
  final Brightness brightness;

  /// Primary color palette
  ///
  /// Used for buttons, borders, checkboxes, and more
  final MaterialColor primaryColor;

  /// Background color
  ///
  /// Used for the scaffold background color
  final Color backgroundColor;

  // -------------------------------------------------
  // METHOD: _buildTheme
  // -------------------------------------------------

  ThemeData _buildThemeData() {
    final isLight = brightness == Brightness.light;

    // Brightness specific colors
    Color bodyColor;
    Color displayColor;
    Color cursorColor;
    Color selectionColor;
    Color thumbColor;
    Color trackColor;
    Color trackBorderColor;

    // Default values inspired by Tailwind CSS
    if (isLight) {
      bodyColor = TColors.gray.shade800;
      displayColor = TColors.black;
      cursorColor = TColors.gray.shade600;
      selectionColor = const Color(0xFFb6d7ff);
      thumbColor = const Color(0xFFc7c7c7);
      trackColor = TColors.neutral.shade50;
      trackBorderColor = const Color(0xFFededed);
    } else {
      bodyColor = TColors.slate.shade400;
      displayColor = TColors.white;
      cursorColor = TColors.gray.shade300;
      selectionColor = const Color(0xFF385479);
      thumbColor = const Color(0xFF2d2d2d);
      trackColor = const Color(0xFF2d2d2d);
      trackBorderColor = const Color(0xFF3d3d3d);
    }

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: backgroundColor,

      // Text
      textTheme: const TextTheme(
        displayLarge: TTextStyle.text_6xl,
        displayMedium: TTextStyle.text_5xl,
        displaySmall: TTextStyle.text_4xl,
        headlineLarge: TTextStyle.text_4xl,
        headlineMedium: TTextStyle.text_3xl,
        headlineSmall: TTextStyle.text_2xl,
        titleLarge: TTextStyle.text_2xl,
        titleMedium: TTextStyle.text_lg,
        titleSmall: TTextStyle.text_base,
        bodyLarge: TTextStyle.text_lg,
        bodyMedium: TTextStyle.text_base,
        bodySmall: TTextStyle.text_sm,
        labelLarge: TTextStyle.text_base,
        labelMedium: TTextStyle.text_sm,
        labelSmall: TTextStyle.text_xs,
      ).apply(
        fontFamily: fontFamily,
        bodyColor: bodyColor,
        displayColor: displayColor,
      ),

      // Icon
      iconTheme: IconThemeData(
        color: TColors.slate.shade400,
      ),

      /// Text Selection
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: cursorColor,
        selectionColor: selectionColor,
      ),

      /// Scrollbar
      scrollbarTheme: ScrollbarThemeData(
        interactive: false,
        thumbColor: WidgetStateProperty.all(thumbColor),
        thickness: WidgetStateProperty.all(TSpacingScale.v8),
        trackColor: WidgetStateProperty.all(trackColor),
        trackBorderColor: WidgetStateProperty.all(trackBorderColor),
      ),
    );
  }
}
