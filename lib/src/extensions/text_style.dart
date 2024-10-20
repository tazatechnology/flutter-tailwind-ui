// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/constants/text.dart';

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
  TextStyle mono(BuildContext context) {
    return copyWith(fontFamily: context.tw.text.fontFamilyMono);
  }
}
