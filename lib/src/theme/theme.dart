import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    TailwindColorTheme? colors,
    TailwindTextTheme? text,
  }) {
    return TailwindTheme._(
      colors: colors ?? TailwindColorTheme.light(),
      text: text ?? TailwindTextTheme(),
      brightness: Brightness.light,
    );
  }

  /// Factory constructor for a dark Tailwind inspired theme
  factory TailwindTheme.dark({
    TailwindColorTheme? colors,
    TailwindTextTheme? text,
  }) {
    return TailwindTheme._(
      colors: colors ?? TailwindColorTheme.dark(),
      text: text ?? TailwindTextTheme(),
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

  /// The Flutter [ThemeData] instance
  late final ThemeData data;

  /// The Tailwind text theme extension definition
  final TailwindTextTheme text;

  /// The Tailwind colors theme extension definition
  final TailwindColorTheme colors;

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
    TextTheme textTheme = TextTheme(
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
      fontFamily: text.fontFamily,
      bodyColor: colors.body,
      displayColor: colors.title,
    );

    // Update the text theme with the secondary color
    textTheme = textTheme.copyWith(
      labelLarge: textTheme.labelLarge?.copyWith(color: colors.label),
      labelMedium: textTheme.labelLarge?.copyWith(color: colors.label),
      labelSmall: textTheme.labelLarge?.copyWith(color: colors.label),
    );

    // Define default page transition animations (disabled)
    final pageTransitionBuilders = <TargetPlatform, PageTransitionsBuilder>{
      for (final platform in TargetPlatform.values)
        platform: const TNoPageTransitionsBuilder(),
    };
    // Add page transitions for mobile platforms (if not web)
    if (!kIsWeb) {
      pageTransitionBuilders.addAll({
        TargetPlatform.android: const ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
      });
    }

    return ThemeData(
      extensions: [
        colors,
        text,
      ],
      useMaterial3: true,
      brightness: brightness,
      fontFamily: text.fontFamily,
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

      /// Page Transitions
      pageTransitionsTheme: PageTransitionsTheme(
        builders: pageTransitionBuilders,
      ),

      /// AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colors.background,
          statusBarIconBrightness: brightness,
          statusBarBrightness: brightness,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarColor: colors.background,
          systemNavigationBarIconBrightness: brightness,
          systemNavigationBarContrastEnforced: true,
        ),
      ),

      /// Card
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
