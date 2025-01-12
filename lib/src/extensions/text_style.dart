// Match Tailwind naming conventions for traceability
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// EXTENSION: TextStyle
// =============================================================================

/// Extension methods for the [TextStyle] class
extension XTailwindTextStyle on TextStyle {
  /// Add thin font weight (100)
  ///
  /// Equivalent to Tailwind font weight: `font-thin`
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);

  /// Add extra light font weight (200)
  ///
  /// Equivalent to Tailwind font weight: `font-extralight`
  TextStyle get extralight => copyWith(fontWeight: FontWeight.w200);

  /// Add light font weight (300)
  ///
  /// Equivalent to Tailwind font weight: `font-light`
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Add normal font weight (400)
  ///
  /// Equivalent to Tailwind font weight: `font-normal`
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);

  /// Add medium font weight (500)
  ///
  /// Equivalent to Tailwind font weight: `font-medium`
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Add semibold font weight (600)
  ///
  /// Equivalent to Tailwind font weight: `font-semibold`
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);

  /// Add bold font weight (700)
  ///
  /// Equivalent to Tailwind font weight: `font-bold`
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Add extra bold font weight (800)
  ///
  /// Equivalent to Tailwind font weight: `font-extrabold`
  TextStyle get extrabold => copyWith(fontWeight: FontWeight.w800);

  /// Add heavy font weight (900)
  ///
  /// Equivalent to Tailwind font weight: `font-heavy`
  TextStyle get heavy => copyWith(fontWeight: FontWeight.w900);

  /// Add italic font to existing text style
  ///
  /// Equivalent to Tailwind font style: `italic`
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// Add underline text decoration to existing text style
  ///
  /// Equivalent to Tailwind font decoration: `underline`
  TextStyle get underline {
    return copyWith(decoration: TextDecoration.underline);
  }

  /// Add line-through text decoration to existing text style
  ///
  /// Equivalent to Tailwind font decoration: `line-through`
  TextStyle get line_through {
    return copyWith(decoration: TextDecoration.lineThrough);
  }

  /// Add tighter letter spacing
  ///
  /// See: [TLetterSpacing.tracking_tighter]
  TextStyle get tracking_tighter =>
      copyWith(letterSpacing: TLetterSpacing.tracking_tighter);

  /// Add tight letter spacing
  ///
  /// See: [TLetterSpacing.tracking_tight]
  TextStyle get tracking_tight =>
      copyWith(letterSpacing: TLetterSpacing.tracking_tight);

  /// Add normal letter spacing
  ///
  /// See: [TLetterSpacing.tracking_normal]
  TextStyle get tracking_normal =>
      copyWith(letterSpacing: TLetterSpacing.tracking_normal);

  /// Add wide letter spacing
  ///
  /// See: [TLetterSpacing.tracking_wide]
  TextStyle get tracking_wide =>
      copyWith(letterSpacing: TLetterSpacing.tracking_wide);

  /// Add wider letter spacing
  ///
  /// See: [TLetterSpacing.tracking_wider]
  TextStyle get tracking_wider =>
      copyWith(letterSpacing: TLetterSpacing.tracking_wider);

  /// Add widest letter spacing
  ///
  /// See: [TLetterSpacing.tracking_widest]
  TextStyle get tracking_widest =>
      copyWith(letterSpacing: TLetterSpacing.tracking_widest);

  /// Convert existing text style to monospace font
  ///
  /// If [context] is provided, it will use the [TailwindTextTheme] monospaced
  /// font family for the given [BuildContext]. Otherwise, it will use the
  /// default monospaced font family.
  TextStyle mono([BuildContext? context]) {
    return copyWith(
      fontFamily: context?.tw.text.fontFamilyMono ??
          TailwindTextTheme.defaultFontFamilyMono,
    );
  }

  /// Add line height of none
  ///
  /// See: [TLeading.leading_none]
  TextStyle get leading_none => copyWith(height: TLeading.leading_none);

  /// Add line height of normal
  ///
  /// See: [TLeading.leading_normal]
  TextStyle get leading_normal => copyWith(height: TLeading.leading_normal);

  /// Method to copy this [TextStyle] without a given property
  TextStyle copyWithout({
    bool removeColor = false,
    bool removeBackgroundColor = false,
    bool removeFontSize = false,
    bool removeFontWeight = false,
    bool removeFontStyle = false,
    bool removeLetterSpacing = false,
    bool removeWordSpacing = false,
    bool removeTextBaseline = false,
    bool removeHeight = false,
    bool removeLocale = false,
    bool removeForeground = false,
    bool removeBackground = false,
    bool removeShadows = false,
    bool removeFontFeatures = false,
    bool removeDecoration = false,
    bool removeDecorationColor = false,
    bool removeDecorationStyle = false,
    bool removeDecorationThickness = false,
    bool removeDebugLabel = false,
    bool removeOverflow = false,
  }) {
    return TextStyle(
      color: removeColor ? null : color,
      backgroundColor: removeBackgroundColor ? null : backgroundColor,
      fontSize: removeFontSize ? null : fontSize,
      fontWeight: removeFontWeight ? null : fontWeight,
      fontStyle: removeFontStyle ? null : fontStyle,
      letterSpacing: removeLetterSpacing ? null : letterSpacing,
      wordSpacing: removeWordSpacing ? null : wordSpacing,
      textBaseline: removeTextBaseline ? null : textBaseline,
      height: removeHeight ? null : height,
      locale: removeLocale ? null : locale,
      foreground: removeForeground ? null : foreground,
      background: removeBackground ? null : background,
      shadows: removeShadows ? null : shadows,
      fontFeatures: removeFontFeatures ? null : fontFeatures,
      decoration: removeDecoration ? null : decoration,
      decorationColor: removeDecorationColor ? null : decorationColor,
      decorationStyle: removeDecorationStyle ? null : decorationStyle,
      decorationThickness:
          removeDecorationThickness ? null : decorationThickness,
      debugLabel: removeDebugLabel ? null : debugLabel,
      overflow: removeOverflow ? null : overflow,
    );
  }
}
