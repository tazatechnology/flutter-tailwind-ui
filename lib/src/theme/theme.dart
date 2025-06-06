import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/slider.dart';
import 'package:flutter_tailwind_ui/src/internal/transitions.dart';

// =============================================================================
// CLASS: TailwindTheme
// =============================================================================

/// Tailwind theme data to replicate the Tailwind CSS design system
///
/// Reference: https://tailwindcss.com/docs
class TailwindTheme {
  /// Factory constructor for a light Tailwind inspired theme
  factory TailwindTheme.light({TailwindColorTheme? color}) {
    return TailwindTheme._(
      brightness: Brightness.light,
      color: color ?? TailwindColorTheme.light(),
    );
  }

  /// Factory constructor for a dark Tailwind inspired theme
  factory TailwindTheme.dark({TailwindColorTheme? color}) {
    return TailwindTheme._(
      brightness: Brightness.dark,
      color: color ?? TailwindColorTheme.dark(),
    );
  }

  /// Constructor for [TailwindTheme]
  TailwindTheme._({
    required Brightness brightness,
    required TailwindColorTheme color,
  }) : _brightness = brightness {
    themeData = _buildThemeData(color: color);
  }

  /// The Flutter [ThemeData] instance
  late final ThemeData themeData;

  /// The brightness of the theme (light or dark)
  final Brightness _brightness;

  // ---------------------------------------------------------------------------
  // METHOD: _buildThemeData
  // ---------------------------------------------------------------------------

  ThemeData _buildThemeData({required TailwindColorTheme color}) {
    final light = _brightness == Brightness.light;

    // Define the default text theme
    TextTheme textTheme =
        const TextTheme(
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
      brightness: _brightness,
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
          statusBarIconBrightness: _brightness,
          statusBarBrightness: _brightness,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarColor: color.background,
          systemNavigationBarIconBrightness: _brightness,
          systemNavigationBarContrastEnforced: true,
        ),
      ),

      /// Card
      cardTheme: CardThemeData(
        color: color.card,
        surfaceTintColor: Colors.transparent,
        shadowColor: color.shadow,
        elevation: TElevation.shadow_none,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: TBorderRadius.rounded_lg,
          side: BorderSide(color: color.divider),
        ),
      ),

      /// Dialog
      dialogTheme: DialogThemeData(
        backgroundColor: color.background,
        shadowColor: color.shadow,
        surfaceTintColor: Colors.transparent,
        barrierColor: color.barrier,
        elevation: TElevation.shadow_xl,
        titleTextStyle: TTextStyle.text_md.copyWith(
          color: color.title,
          fontWeight: TFontWeight.semibold,
        ),
        contentTextStyle: TTextStyle.text_sm.copyWith(color: color.label),
        shape: RoundedRectangleBorder(
          borderRadius: TBorderRadius.rounded_lg,
          side: BorderSide(color: color.shadow),
        ),
      ),

      /// Progress Indicator
      progressIndicatorTheme: ProgressIndicatorThemeData(color: color.primary),

      /// Chip
      chipTheme: const ChipThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        labelPadding: TOffset.a4,
        padding: TOffset.a4,
      ),

      /// Divider
      dividerTheme: DividerThemeData(color: color.divider, thickness: 1),

      /// Drawer
      drawerTheme: DrawerThemeData(backgroundColor: color.background),

      /// Icon
      iconTheme: IconThemeData(color: color.icon),

      /// Page Transitions
      pageTransitionsTheme: PageTransitionsTheme(
        builders: pageTransitionBuilders,
      ),

      /// Radio
      radioTheme: RadioThemeData(
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashRadius: 0,
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return color.disabled;
          } else if (states.contains(WidgetState.selected)) {
            return light ? color.primary.shade600 : color.primary;
          }
          return TColors.gray.shade300;
        }),
      ),

      /// Input
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        isCollapsed: true,
        iconColor: color.icon,
        prefixIconColor: color.icon,
        suffixIconColor: color.icon,
        labelStyle: const TextStyle(fontSize: TFontSize.text_sm),
        hintStyle: TextStyle(
          letterSpacing: TLetterSpacing.wide,
          fontSize: TFontSize.text_sm,
          height: kTextHeightNone,
          color: color.hint,
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
        outlineBorder: BorderSide(color: color.divider),
        activeIndicatorBorder: BorderSide(color: color.divider),
        border: OutlineInputBorder(
          borderRadius: TBorderRadius.rounded_md,
          borderSide: BorderSide(color: color.divider),
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

      /// Slider theme defaults
      sliderTheme: SliderThemeData(
        thumbColor: color.primary,
        activeTrackColor: color.primary,
        inactiveTrackColor: color.divider,
        disabledThumbColor: TColors.gray[light ? 400 : 700],
        disabledActiveTrackColor: TColors.gray[light ? 400 : 700],
        disabledInactiveTrackColor: color.disabled,
        showValueIndicator: ShowValueIndicator.always,
        overlayShape: SliderComponentShape.noOverlay,
        trackHeight: 5,
        valueIndicatorShape: TSliderValueIndicatorShape(color: color.tooltip),
        valueIndicatorTextStyle: TextStyle(
          fontSize: TFontSize.text_xs,
          height: kTextHeightNone,
          color: color.tooltip.contrastBlackWhite(),
        ),
        thumbShape: const TSliderThumbShape(),
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
          color: color.tooltip,
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

      /// Cupertino theme overrides
      cupertinoOverrideTheme: const CupertinoThemeData(
        // This will ensure that the selection handles are updated
        primaryColor: TColors.blue,
      ),
    );
  }
}
