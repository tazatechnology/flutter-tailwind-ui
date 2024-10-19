import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// CLASS: TailwindTheme
// =================================================

/// Tailwind theme data to replicate the Tailwind CSS design system
///
/// Reference: https://tailwindcss.com/docs
class TailwindTheme {
  /// Factory constructor for a light Tailwind inspired theme
  factory TailwindTheme.light({
    TailwindColorsThemeExtension? colors,
    TailwindTextThemeExtension? text,
  }) {
    return TailwindTheme._(
      colors: colors ?? TailwindColorsThemeExtension.light(),
      text: text ?? TailwindTextThemeExtension(),
      brightness: Brightness.light,
    );
  }

  /// Factory constructor for a dark Tailwind inspired theme
  factory TailwindTheme.dark({
    TailwindColorsThemeExtension? colors,
    TailwindTextThemeExtension? text,
  }) {
    return TailwindTheme._(
      colors: colors ?? TailwindColorsThemeExtension.dark(),
      text: text ?? TailwindTextThemeExtension(),
      brightness: Brightness.dark,
    );
  }

  /// Constructor for [TailwindTheme]
  TailwindTheme._({
    required this.text,
    required this.colors,
    required this.brightness,
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

  /// The Tailwind text theme extension definition
  final TailwindTextThemeExtension text;

  /// The Tailwind colors theme extension definition
  final TailwindColorsThemeExtension colors;

  /// The brightness of the theme (light or dark)
  final Brightness brightness;

  // -------------------------------------------------
  // METHOD: _buildTheme
  // -------------------------------------------------

  ThemeData _buildThemeData() {
    final light = brightness == Brightness.light;

    // Brightness specific colors
    Color cursorColor;
    Color thumbColor;
    Color trackColor;
    Color trackBorderColor;

    // Default values inspired by Tailwind CSS
    if (light) {
      cursorColor = TColors.gray.shade600;
      thumbColor = TColors.gray.shade300;
      trackColor = TColors.neutral.shade50;
      trackBorderColor = const Color(0xFFededed);
    } else {
      cursorColor = TColors.gray.shade300;
      thumbColor = TColors.gray.shade500;
      trackColor = Colors.transparent;
      trackBorderColor = const Color(0xFF3d3d3d);
    }

    // Define the default text theme
    var textTheme = TextTheme(
      displayLarge: text.style_6xl,
      displayMedium: text.style_5xl,
      displaySmall: text.style_4xl,
      headlineLarge: text.style_4xl,
      headlineMedium: text.style_3xl,
      headlineSmall: text.style_2xl,
      titleLarge: text.style_2xl,
      titleMedium: text.style_lg,
      titleSmall: text.style_md,
      bodyLarge: text.style_lg,
      bodyMedium: text.style_md,
      bodySmall: text.style_sm,
      labelLarge: text.style_md,
      labelMedium: text.style_sm,
      labelSmall: text.style_xs,
    ).apply(
      fontFamily: fontFamily,
      bodyColor: colors.body,
      displayColor: colors.title,
    );

    // Update the text theme with the secondary color
    textTheme = textTheme.copyWith(
      labelLarge: textTheme.labelLarge?.copyWith(color: colors.label),
      labelMedium: textTheme.labelLarge?.copyWith(color: colors.label),
      labelSmall: textTheme.labelLarge?.copyWith(color: colors.label),
    );

    return ThemeData(
      extensions: [
        colors,
        text,
      ],
      useMaterial3: true,
      brightness: brightness,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: colors.background,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,
      dividerColor: colors.divider,
      disabledColor: colors.disabled,
      textTheme: textTheme,
      cardColor: colors.card,
      hintColor: colors.label,
      primaryColor: colors.primary,

      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
      ),

      cardTheme: CardTheme(
        color: colors.card,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 20,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: TBorderRadius.rounded_lg,
          side: BorderSide(
            color: colors.divider,
          ),
        ),
      ),

      /// Divider
      dividerTheme: DividerThemeData(
        color: colors.divider,
        thickness: 1,
      ),

      /// Icon
      iconTheme: IconThemeData(
        color: TColors.slate.shade400,
      ),

      /// Text Selection
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: cursorColor,
        selectionColor: colors.selection,
      ),

      /// Scrollbar
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(thumbColor),
        thickness: WidgetStateProperty.all(TSpace.v8),
        trackColor: WidgetStateProperty.all(trackColor),
        trackBorderColor: WidgetStateProperty.all(trackBorderColor),
      ),

      /// Drawer
      drawerTheme: DrawerThemeData(
        backgroundColor: colors.background,
      ),

      /// Radio
      radioTheme: RadioThemeData(
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashRadius: 0,
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return colors.disabled;
            } else if (states.contains(WidgetState.selected)) {
              return light ? colors.primary.shade600 : colors.primary;
            }
            return TColors.gray.shade300;
          },
        ),
      ),
    );
  }
}
