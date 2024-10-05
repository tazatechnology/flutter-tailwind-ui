import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

/// Extension methods for the [TextStyle] class
extension TailwindExtensionTextStyle on TextStyle {
  /// Add thin font weight (100)
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);

  /// Add extra light font weight (200)
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);

  /// Add light font weight (300)
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Add normal font weight (400)
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);

  /// Add medium font weight (500)
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Add semibold font weight (600)
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);

  /// Add bold font weight (700)
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Add extra bold font weight (800)
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  /// Add heavy font weight (900)
  TextStyle get heavy => copyWith(fontWeight: FontWeight.w900);

  /// Add italic font to existing text style
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// Add underline text decoration to existing text style
  TextStyle get underline {
    return copyWith(decoration: TextDecoration.underline);
  }

  /// Add line-through text decoration to existing text style
  TextStyle get strike {
    return copyWith(decoration: TextDecoration.lineThrough);
  }

  /// Convert existing text style to monospace font
  TextStyle get mono {
    return copyWith(fontFamily: TailwindTheme.fontFamilyMono);
  }
}
