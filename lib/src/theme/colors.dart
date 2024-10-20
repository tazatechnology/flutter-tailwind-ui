import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// CLASS: TailwindColorTheme
// =================================================

/// Tailwind theme extension to replicate the Tailwind CSS design system
class TailwindColorTheme extends ThemeExtension<TailwindColorTheme> {
  /// Initialize a light themed color palette
  TailwindColorTheme.raw({
    required this.primary,
    required this.secondary,
    required this.title,
    required this.body,
    required this.label,
    required this.background,
    required this.card,
    required this.divider,
    required this.selection,
    required this.disabled,
  });

  /// Initialize a light themed color palette
  TailwindColorTheme.light({
    MaterialColor? primary,
    MaterialColor? secondary,
    Color? title,
    Color? body,
    Color? label,
    Color? background,
    Color? card,
    Color? divider,
    Color? selection,
    Color? disabled,
  }) {
    this.primary = primary ?? TColors.indigo;
    this.secondary = secondary ?? TColors.sky;
    this.title = title ?? TColors.slate.shade900;
    this.body = body ?? TColors.slate.shade700;
    this.label = label ?? TColors.slate.shade400;
    this.background = background ?? TColors.white;
    this.card = card ?? this.background;
    this.divider = divider ?? TColors.gray.shade200;
    this.selection = selection ?? const Color(0xFFb6d7ff);
    this.disabled = disabled ?? TColors.gray.shade400;
  }

  /// Initialize a dark themed color palette
  TailwindColorTheme.dark({
    MaterialColor? primary,
    MaterialColor? secondary,
    Color? title,
    Color? body,
    Color? label,
    Color? background,
    Color? card,
    Color? divider,
    Color? selection,
    Color? disabled,
  }) {
    this.primary = primary ?? TColors.indigo;
    this.secondary = secondary ?? TColors.sky;
    this.title = title ?? TColors.slate.shade100;
    this.body = body ?? TColors.slate.shade400;
    this.label = label ?? TColors.slate.shade500;
    this.background = background ?? TColors.neutral.shade800;
    this.card = card ?? this.background;
    this.divider = divider ?? TColors.gray.shade700;
    this.selection = selection ?? const Color(0xFF385479);
    this.disabled = disabled ?? TColors.gray.shade600;
  }

  /// Primary color palette (brand primary)
  ///
  /// Used for buttons,radios, checkboxes, and more
  late final MaterialColor primary;

  /// Secondary color palette (brand secondary)
  ///
  /// Used as an accent color
  late final MaterialColor secondary;

  /// The text color used for titles and headings
  late final Color title;

  /// The text color used for the body
  late final Color body;

  /// The text color used for labels and captions
  late final Color label;

  /// Background color
  ///
  /// Used for the scaffold background color
  late final Color background;

  /// Card color
  ///
  /// The color of cards and surfaces
  late final Color card;

  /// Divider color
  ///
  /// The color of dividers and default line separators
  late final Color divider;

  /// Selection color
  ///
  /// The color of the text selection
  late final Color selection;

  /// Disabled color
  ///
  /// The color of disabled elements
  late final Color disabled;

  // -------------------------------------------------
  // METHOD: copyWith
  // -------------------------------------------------

  @override
  TailwindColorTheme copyWith({
    MaterialColor? primary,
    MaterialColor? secondary,
    Color? title,
    Color? body,
    Color? label,
    Color? background,
    Color? card,
    Color? divider,
    Color? selection,
    Color? disabled,
  }) {
    return TailwindColorTheme.raw(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      title: title ?? this.title,
      body: body ?? this.body,
      label: label ?? this.label,
      background: background ?? this.background,
      card: card ?? this.card,
      divider: divider ?? this.divider,
      selection: selection ?? this.selection,
      disabled: disabled ?? this.disabled,
    );
  }

  // -------------------------------------------------
  // METHOD: lerp
  // -------------------------------------------------

  @override
  TailwindColorTheme lerp(
    TailwindColorTheme? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }
    return TailwindColorTheme.raw(
      primary: lerpMaterialColor(primary, other.primary, t),
      secondary: lerpMaterialColor(secondary, other.secondary, t),
      title: lerpColor(title, other.title, t),
      body: lerpColor(body, other.body, t),
      label: lerpColor(label, other.label, t),
      background: lerpColor(background, other.background, t),
      card: lerpColor(card, other.card, t),
      divider: lerpColor(divider, other.divider, t),
      selection: lerpColor(selection, other.selection, t),
      disabled: lerpColor(disabled, other.disabled, t),
    );
  }
}
