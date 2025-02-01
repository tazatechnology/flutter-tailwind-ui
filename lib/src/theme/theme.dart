import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TailwindTheme
// =============================================================================

/// Tailwind theme data to replicate the Tailwind CSS design system
///
/// Reference: https://tailwindcss.com/docs
class TailwindTheme {
  /// Factory constructor for a light Tailwind inspired theme
  factory TailwindTheme.light({
    TailwindColorTheme? color,
  }) {
    return TailwindTheme._(
      brightness: Brightness.light,
      color: color ?? TailwindColorTheme.light(),
    );
  }

  /// Factory constructor for a dark Tailwind inspired theme
  factory TailwindTheme.dark({
    TailwindColorTheme? color,
  }) {
    return TailwindTheme._(
      brightness: Brightness.dark,
      color: color ?? TailwindColorTheme.dark(),
    );
  }

  /// Constructor for [TailwindTheme]
  TailwindTheme._({
    required this.brightness,
    required TailwindColorTheme color,
  }) {
    themeData = _buildThemeData(color: color);
  }

  /// The Flutter [ThemeData] instance
  late final ThemeData themeData;

  /// The brightness of the theme (light or dark)
  final Brightness brightness;

  // ---------------------------------------------------------------------------
  // METHOD: _buildTheme
  // ---------------------------------------------------------------------------

  ThemeData _buildThemeData({
    required TailwindColorTheme color,
  }) {
    final light = brightness == Brightness.light;

    // Define the default text theme
    TextTheme textTheme = const TextTheme(
      displayLarge: TTextStyle.text_6xl,
      displayMedium: TTextStyle.text_5xl,
      displaySmall: TTextStyle.text_4xl,
      headlineLarge: TTextStyle.text_4xl,
      headlineMedium: TTextStyle.text_3xl,
      headlineSmall: TTextStyle.text_2xl,
      titleLarge: TTextStyle.text_2xl,
      titleMedium: TTextStyle.text_lg,
      titleSmall: TTextStyle.text_md,
      bodyLarge: TTextStyle.text_lg,
      bodyMedium: TTextStyle.text_md,
      bodySmall: TTextStyle.text_sm,
      labelLarge: TTextStyle.text_md,
      labelMedium: TTextStyle.text_sm,
      labelSmall: TTextStyle.text_xs,
    ).apply(
      fontFamily: TTextStyle.fontFamily,
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
      extensions: [color],
      useMaterial3: true,
      brightness: brightness,
      fontFamily: TTextStyle.fontFamily,
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
      shadowColor: color.shadow,

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
        surfaceTintColor: Colors.transparent,
        shadowColor: color.shadow,
        elevation: TElevation.elevation_none,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: TBorderRadius.rounded_lg,
          side: BorderSide(color: color.divider),
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
        color: color.icon,
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

      /// Input
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        isCollapsed: true,
        iconColor: color.icon,
        prefixIconColor: color.icon,
        suffixIconColor: color.icon,
        labelStyle: const TextStyle(
          fontSize: TFontSize.text_sm,
        ),
        hintStyle: TextStyle(
          fontSize: TFontSize.text_sm,
          color: light ? TColors.gray.shade400 : TColors.gray.shade500,
        ),
        helperStyle: TextStyle(
          fontSize: TFontSize.text_xs + 1,
          height: 2, // Adds appropriate padding between text box and help text
          color: color.label,
        ),
        errorStyle: TextStyle(
          fontSize: TFontSize.text_xs + 1,
          height: 2, // Adds appropriate padding between text box and error text
          color: color.error,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: TBorderRadius.rounded_md,
          borderSide: BorderSide(color: color.divider),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: TBorderRadius.rounded_md,
          borderSide: BorderSide(color: color.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: TBorderRadius.rounded_md,
          borderSide: BorderSide(color: color.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: TBorderRadius.rounded_md,
          borderSide: BorderSide(color: color.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: TBorderRadius.rounded_md,
          borderSide: BorderSide(color: color.error, width: 2),
        ),
      ),

      /// Slider
      sliderTheme: SliderThemeData(
        thumbColor: color.primary,
        activeTrackColor: color.primary,
        inactiveTrackColor: color.divider,
        trackHeight: 5,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 8,
          disabledThumbRadius: 8,
          elevation: 0,
          pressedElevation: 0,
        ),
      ),

      /// Scrollbar
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all(TSpace.v8),
        trackBorderColor: WidgetStateProperty.all(
          light ? const Color(0xffe7e7e7) : const Color(0xff3d3d3d),
        ),
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.dragged) {
            return light ? const Color(0xff878787) : const Color(0xff939393);
          } else {
            return light ? const Color(0xffc7c7c7) : const Color(0xff6b6b6b);
          }
        }),
        trackColor: WidgetStateProperty.all(
          light ? const Color(0xfffafafa) : const Color(0xff2c2c2c),
        ),
      ),

      /// Text Selection
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: light ? TColors.gray.shade600 : TColors.gray.shade300,
        selectionColor: color.selection,
      ),

      /// Tooltip
      tooltipTheme: TooltipThemeData(
        preferBelow: false,
        verticalOffset: 16,
        waitDuration: const Duration(milliseconds: 350),
        decoration: BoxDecoration(
          color: light ? TColors.gray.shade900 : TColors.gray.shade700,
          borderRadius: TBorderRadius.rounded_md,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: TFontSize.text_xs - 1,
        ),
      ),
    );
  }
}
