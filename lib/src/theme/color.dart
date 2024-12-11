import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TailwindColorTheme
// =============================================================================

/// Tailwind theme extension to replicate the Tailwind CSS design system
class TailwindColorTheme extends ThemeExtension<TailwindColorTheme> {
  /// The default constructor for [TailwindColorTheme]
  factory TailwindColorTheme({
    required Brightness brightness,
    Color? primary,
    Color? title,
    Color? body,
    Color? label,
    Color? background,
    Color? card,
    Color? divider,
    Color? selection,
    Color? disabled,
  }) {
    return TailwindColorTheme.fallback(brightness: brightness).copyWith(
      primary: primary,
      title: title,
      body: body,
      label: label,
      background: background,
      card: card,
      divider: divider,
      selection: selection,
      disabled: disabled,
    );
  }

  /// Initialize all the color values
  TailwindColorTheme.raw({
    required Color primary,
    required this.title,
    required this.body,
    required this.label,
    required this.background,
    required this.card,
    required this.divider,
    required this.selection,
    required this.disabled,
  }) {
    this.primary = primary.toMaterialColor();
  }

  /// Create a fallback color theme
  factory TailwindColorTheme.fallback({
    required Brightness brightness,
  }) {
    if (brightness == Brightness.light) {
      return TailwindColorTheme.raw(
        primary: TColors.indigo,
        title: TColors.slate.shade900,
        body: TColors.slate.shade700,
        label: TColors.slate.shade400,
        background: Colors.white,
        card: Colors.white,
        divider: TColors.gray.shade200,
        selection: const Color(0xFFb6d7ff),
        disabled: TColors.gray.shade400,
      );
    } else {
      return TailwindColorTheme.raw(
        primary: TColors.indigo,
        title: TColors.slate.shade100,
        body: TColors.slate.shade400,
        label: TColors.slate.shade500,
        background: TColors.neutral.shade950,
        card: TColors.neutral.shade900,
        divider: TColors.neutral.shade800,
        selection: const Color(0xFF385479),
        disabled: TColors.gray.shade600,
      );
    }
  }

  /// Primary color palette (brand primary)
  ///
  /// Used for buttons,radios, checkboxes, and more
  late final MaterialColor primary;

  /// The text color used for titles and headings
  final Color title;

  /// The text color used for the body
  final Color body;

  /// The text color used for labels and captions
  final Color label;

  /// Background color
  ///
  /// Used for the scaffold background color
  final Color background;

  /// Card color
  ///
  /// The color of cards and surfaces
  final Color card;

  /// Divider color
  ///
  /// The color of dividers and default line separators
  final Color divider;

  /// Selection color
  ///
  /// The color of the text selection
  final Color selection;

  /// Disabled color
  ///
  /// The color of disabled elements
  final Color disabled;

  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  @override
  TailwindColorTheme copyWith({
    Color? primary,
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
      primary: primary?.toMaterialColor() ?? this.primary,
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

  // ---------------------------------------------------------------------------
  // METHOD: _lerpColor
  // ---------------------------------------------------------------------------

  /// Helper function to interpolate between two [Color] objects
  ///
  /// Similar to the [Color.lerp] method, but ensures that the returned value is not null
  Color _lerpColor(Color a, Color b, double t) {
    return Color.lerp(a, b, t) ?? b;
  }

  // ---------------------------------------------------------------------------
  // METHOD: _lerpMaterialColor
  // ---------------------------------------------------------------------------

  /// Helper function to interpolate between two [MaterialColor] objects
  ///
  /// Similar to the [Color.lerp] method, but performs the interpolation on each shade
  MaterialColor _lerpMaterialColor(
    MaterialColor a,
    MaterialColor b,
    double t,
  ) {
    // Interpolate the main color value
    final interpolatedValue = Color.lerp(a, b, t)!.value;

    // Interpolate each shade
    // If no color can be resolved, fallback to the color being interpolated to
    final interpolatedSwatch = {
      for (final s in [50, 100, 200, 300, 400, 500, 600, 700, 800, 900])
        s: Color.lerp(a[s], b[s], t) ?? a[s] ?? b[s] ?? Color(b.value),
    };

    return MaterialColor(interpolatedValue, interpolatedSwatch);
  }

  // ---------------------------------------------------------------------------
  // METHOD: lerp
  // ---------------------------------------------------------------------------

  @override
  TailwindColorTheme lerp(
    TailwindColorTheme? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }
    return TailwindColorTheme.raw(
      primary: _lerpMaterialColor(primary, other.primary, t),
      title: _lerpColor(title, other.title, t),
      body: _lerpColor(body, other.body, t),
      label: _lerpColor(label, other.label, t),
      background: _lerpColor(background, other.background, t),
      card: _lerpColor(card, other.card, t),
      divider: _lerpColor(divider, other.divider, t),
      selection: _lerpColor(selection, other.selection, t),
      disabled: _lerpColor(disabled, other.disabled, t),
    );
  }
}
