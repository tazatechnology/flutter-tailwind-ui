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
    TailwindColorTheme? color,
    TailwindTextTheme? text,
    TailwindComponentsTheme? components,
  }) {
    return TailwindTheme._(
      brightness: Brightness.light,
      color: color ?? TailwindColorTheme.light(),
      text: text ?? TailwindTextTheme(),
      components: components ?? TailwindComponentsTheme.light(),
    );
  }

  /// Factory constructor for a dark Tailwind inspired theme
  factory TailwindTheme.dark({
    TailwindColorTheme? color,
    TailwindTextTheme? text,
    TailwindComponentsTheme? components,
  }) {
    return TailwindTheme._(
      brightness: Brightness.dark,
      color: color ?? TailwindColorTheme.dark(),
      text: text ?? TailwindTextTheme(),
      components: components ?? TailwindComponentsTheme.dark(),
    );
  }

  /// Constructor for [TailwindTheme]
  TailwindTheme._({
    required this.brightness,
    required TailwindColorTheme color,
    required TailwindTextTheme text,
    required TailwindComponentsTheme components,
  }) {
    data = _buildThemeData(color: color, text: text, components: components);
  }

  /// The Flutter [ThemeData] instance
  late final ThemeData data;

  /// The brightness of the theme (light or dark)
  final Brightness brightness;

  // -------------------------------------------------
  // METHOD: _buildTheme
  // -------------------------------------------------

  ThemeData _buildThemeData({
    required TailwindColorTheme color,
    required TailwindTextTheme text,
    required TailwindComponentsTheme components,
  }) {
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
      bodyColor: color.body,
      displayColor: color.title,
    );

    // Update the text theme with the secondary color
    textTheme = textTheme.copyWith(
      labelLarge: textTheme.labelLarge?.copyWith(color: color.label),
      labelMedium: textTheme.labelLarge?.copyWith(color: color.label),
      labelSmall: textTheme.labelLarge?.copyWith(color: color.label),
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
        color,
        text,
        components,
      ],
      useMaterial3: true,
      brightness: brightness,
      fontFamily: text.fontFamily,
      scaffoldBackgroundColor: color.background,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,
      dividerColor: color.divider,
      disabledColor: color.disabled,
      textTheme: textTheme,
      cardColor: color.card,
      hintColor: color.label,
      primaryColor: color.primary,

      /// AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: color.background,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: color.background,
          statusBarIconBrightness: brightness,
          statusBarBrightness: brightness,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarColor: color.background,
          systemNavigationBarIconBrightness: brightness,
          systemNavigationBarContrastEnforced: true,
        ),
      ),

      /// Card
      cardTheme: CardTheme(
        color: color.card,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 20,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: TBorderRadius.rounded_lg,
          side: BorderSide(
            color: color.divider,
          ),
        ),
      ),

      /// Chip
      chipTheme: const ChipThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        labelPadding: TOffset.a4,
        padding: TOffset.a4,
      ),

      /// Divider
      dividerTheme: DividerThemeData(
        color: color.divider,
        thickness: 1,
      ),

      /// Drawer
      drawerTheme: DrawerThemeData(
        backgroundColor: color.background,
      ),

      /// Icon
      iconTheme: IconThemeData(
        color: TColors.slate.shade400,
      ),

      /// Page Transitions
      pageTransitionsTheme: PageTransitionsTheme(
        builders: pageTransitionBuilders,
      ),

      /// Radio
      radioTheme: RadioThemeData(
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashRadius: 0,
        fillColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return color.disabled;
            } else if (states.contains(WidgetState.selected)) {
              return light ? color.primary.shade600 : color.primary;
            }
            return TColors.gray.shade300;
          },
        ),
      ),

      /// Scrollbar
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(thumbColor),
        thickness: WidgetStateProperty.all(TSpace.v8),
        trackColor: WidgetStateProperty.all(trackColor),
        trackBorderColor: WidgetStateProperty.all(trackBorderColor),
      ),

      /// Text Selection
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: cursorColor,
        selectionColor: color.selection,
      ),

      /// Tooltip
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: light ? TColors.gray.shade900 : TColors.gray.shade700,
          borderRadius: TBorderRadius.rounded_md,
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: TFontSize.text_xs - 1,
        ),
      ),
    );
  }
}
