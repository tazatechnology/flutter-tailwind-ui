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
      backgroundColor: backgroundColor ?? Colors.white,
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
  /// https://github.com/JetBrains/JetBrainsMono
  static const fontFamilyMono = 'packages/flutter_tailwind_ui/JetBrainsMono';

  /// The Flutter [ThemeData] instance
  late final ThemeData data;

  /// The brightness of the theme (light or dark)
  final Brightness brightness;

  /// Primary color palette
  ///
  /// Used for buttons,radios, checkboxes, and more
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
    Color bodyColor; // Body text color
    Color displayColor; // Display text color
    Color secondaryColor; // Secondary text color
    Color cursorColor;
    Color selectionColor;
    Color thumbColor;
    Color trackColor;
    Color trackBorderColor;
    Color disabledColor;
    Color dividerColor;
    Color cardColor;

    // Default values inspired by Tailwind CSS
    if (isLight) {
      bodyColor = TColors.gray.shade800;
      displayColor = Colors.black;
      secondaryColor = TColors.gray.shade500;
      cursorColor = TColors.gray.shade600;
      selectionColor = const Color(0xFFb6d7ff);
      thumbColor = TColors.gray.shade400;
      trackColor = TColors.neutral.shade50;
      trackBorderColor = const Color(0xFFededed);
      disabledColor = TColors.gray.shade400;
      dividerColor = TColors.gray.shade200;
      cardColor = backgroundColor;
    } else {
      bodyColor = TColors.slate.shade400;
      displayColor = Colors.white;
      secondaryColor = TColors.gray.shade500;
      cursorColor = TColors.gray.shade300;
      selectionColor = const Color(0xFF385479);
      thumbColor = TColors.gray.shade500;
      trackColor = Colors.transparent;
      trackBorderColor = const Color(0xFF3d3d3d);
      disabledColor = TColors.gray.shade600;
      dividerColor = TColors.slate.shade800;
      cardColor = backgroundColor;
    }

    // Define the default text theme
    var textTheme = const TextTheme(
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
    );

    // Update the text theme with the secondary color
    textTheme = textTheme.copyWith(
      labelLarge: textTheme.labelLarge?.copyWith(color: secondaryColor),
      labelMedium: textTheme.labelLarge?.copyWith(color: secondaryColor),
      labelSmall: textTheme.labelLarge?.copyWith(color: secondaryColor),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: backgroundColor,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,
      dividerColor: dividerColor,
      disabledColor: disabledColor,
      textTheme: textTheme,
      cardColor: cardColor,
      hintColor: secondaryColor,
      primaryColor: primaryColor,

      cardTheme: CardTheme(
        color: cardColor,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: TBorderRadius.rounded_md,
          side: BorderSide(
            color: dividerColor,
          ),
        ),
      ),

      /// Divider
      dividerTheme: DividerThemeData(
        color: dividerColor,
        thickness: 1,
      ),

      /// Icon
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
        thumbColor: WidgetStateProperty.all(thumbColor),
        thickness: WidgetStateProperty.all(TSpacingScale.v8),
        trackColor: WidgetStateProperty.all(trackColor),
        trackBorderColor: WidgetStateProperty.all(trackBorderColor),
      ),

      /// Drawer
      drawerTheme: DrawerThemeData(
        backgroundColor: backgroundColor,
      ),

      /// Radio
      radioTheme: RadioThemeData(
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashRadius: 0,
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return disabledColor;
            } else if (states.contains(WidgetState.selected)) {
              return isLight ? primaryColor.shade600 : primaryColor;
            }
            return TColors.gray.shade300;
          },
        ),
      ),
    );
  }
}
