import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TailwindColorTheme
// =============================================================================

/// Tailwind theme extension to replicate the Tailwind CSS design system
class TailwindColorTheme extends ThemeExtension<TailwindColorTheme> {
  /// Initialize all the color values
  TailwindColorTheme._(
    this._brightness, {
    required Color primary,
    required this.title,
    required this.body,
    required this.label,
    required this.link,
    required this.background,
    required this.shadow,
    required this.card,
    required this.icon,
    required this.focus,
    required this.divider,
    required this.selection,
    required this.disabled,
    required this.onDisabled,
    required this.error,
    required this.onError,
  }) {
    this.primary = primary.toMaterialColor();
  }

  /// The default constructor for [TailwindColorTheme]
  factory TailwindColorTheme.light({
    Color? primary,
    Color? title,
    Color? body,
    Color? label,
    Color? link,
    Color? background,
    Color? shadow,
    Color? card,
    Color? icon,
    Color? focus,
    Color? divider,
    Color? selection,
    Color? disabled,
    Color? onDisabled,
    Color? error,
    Color? onError,
  }) {
    final theme = TailwindColorTheme._fallback(brightness: Brightness.light);
    return theme.copyWith(
      primary: primary,
      title: title,
      body: body,
      label: label,
      link: link,
      background: background,
      shadow: shadow,
      card: card,
      icon: icon,
      focus: focus,
      divider: divider,
      selection: selection,
      disabled: disabled,
      onDisabled: onDisabled,
      error: error,
      onError: onError,
    );
  }

  /// The default constructor for [TailwindColorTheme]
  factory TailwindColorTheme.dark({
    Color? primary,
    Color? title,
    Color? body,
    Color? label,
    Color? link,
    Color? background,
    Color? shadow,
    Color? card,
    Color? icon,
    Color? focus,
    Color? divider,
    Color? selection,
    Color? disabled,
    Color? onDisabled,
    Color? error,
    Color? onError,
  }) {
    final theme = TailwindColorTheme._fallback(brightness: Brightness.dark);
    return theme.copyWith(
      primary: primary,
      title: title,
      body: body,
      label: label,
      link: link,
      background: background,
      shadow: shadow,
      card: card,
      icon: icon,
      focus: focus,
      divider: divider,
      selection: selection,
      disabled: disabled,
      onDisabled: onDisabled,
      error: error,
      onError: onError,
    );
  }

  /// Create a fallback color theme
  factory TailwindColorTheme._fallback({
    required Brightness brightness,
  }) {
    if (brightness == Brightness.light) {
      return TailwindColorTheme._(
        brightness,
        primary: TColors.indigo,
        title: TColors.gray.shade900,
        body: TColors.gray.shade800.withValues(alpha: 0.9),
        label: TColors.gray.shade800.withValues(alpha: 0.6),
        link: TColors.sky,
        background: Colors.white,
        shadow: Colors.black26,
        card: Colors.white,
        icon: TColors.gray.shade400,
        focus: TColors.gray.shade700,
        divider: TColors.gray.shade200,
        selection: const Color(0xffb6d7ff),
        disabled: TColors.gray.shade200,
        onDisabled: TColors.gray.shade500,
        error: TColors.red.shade600,
        onError: TColors.red.shade200,
      );
    } else {
      return TailwindColorTheme._(
        brightness,
        primary: TColors.indigo,
        title: TColors.gray.shade100,
        body: TColors.gray.shade200.withValues(alpha: 0.9),
        label: TColors.gray.shade200.withValues(alpha: 0.6),
        link: TColors.sky.shade400,
        background: TColors.gray.shade950,
        shadow: Colors.white12,
        card: TColors.gray.shade900,
        icon: TColors.gray.shade400,
        focus: TColors.gray.shade300,
        divider: TColors.gray.shade600,
        selection: const Color(0xff385479),
        disabled: TColors.gray.shade600,
        onDisabled: TColors.gray.shade400,
        error: TColors.red.shade600,
        onError: TColors.red.shade200,
      );
    }
  }

  /// Color of text on disabled elements
  final Brightness _brightness;

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

  /// The text color used for links
  final Color link;

  /// Background color
  ///
  /// Used for the scaffold background color
  final Color background;

  /// Shadow color
  ///
  /// Used for shadows and applying elevation
  final Color shadow;

  /// Card color
  ///
  /// The color of cards and surfaces
  final Color card;

  /// Icon color
  ///
  /// Default color for icons
  final Color icon;

  /// Focus color
  ///
  /// The focus border color for focusable widgets
  final Color focus;

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

  /// Color of text on disabled elements
  final Color onDisabled;

  /// Error color
  ///
  /// The color of elements in an error state
  final Color error;

  /// Color of text on error state elements
  final Color onError;

  /// Color of disabled text
  Color get disabledTextColor {
    if (_brightness == Brightness.light) {
      return Colors.black.withValues(alpha: 0.38);
    } else {
      return Colors.white.withValues(alpha: 0.38);
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  @override
  TailwindColorTheme copyWith({
    Color? primary,
    Color? title,
    Color? body,
    Color? label,
    Color? link,
    Color? background,
    Color? shadow,
    Color? card,
    Color? icon,
    Color? focus,
    Color? divider,
    Color? selection,
    Color? disabled,
    Color? onDisabled,
    Color? error,
    Color? onError,
  }) {
    return TailwindColorTheme._(
      _brightness,
      primary: primary?.toMaterialColor() ?? this.primary,
      title: title ?? this.title,
      body: body ?? this.body,
      label: label ?? this.label,
      link: link ?? this.link,
      background: background ?? this.background,
      shadow: shadow ?? this.shadow,
      card: card ?? this.card,
      icon: icon ?? this.icon,
      focus: focus ?? this.focus,
      divider: divider ?? this.divider,
      selection: selection ?? this.selection,
      disabled: disabled ?? this.disabled,
      onDisabled: onDisabled ?? this.onDisabled,
      error: error ?? this.error,
      onError: onError ?? this.onError,
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
    final interpolatedValue = Color.lerp(a, b, t)!.toInt();

    // Interpolate each shade
    // If no color can be resolved, fallback to the color being interpolated to
    final interpolatedSwatch = {
      for (final s in [50, 100, 200, 300, 400, 500, 600, 700, 800, 900])
        s: Color.lerp(a[s], b[s], t) ?? a[s] ?? b[s] ?? Color(b.toInt()),
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
    return TailwindColorTheme._(
      _brightness,
      primary: _lerpMaterialColor(primary, other.primary, t),
      title: _lerpColor(title, other.title, t),
      body: _lerpColor(body, other.body, t),
      label: _lerpColor(label, other.label, t),
      link: _lerpColor(link, other.link, t),
      background: _lerpColor(background, other.background, t),
      shadow: _lerpColor(shadow, other.shadow, t),
      card: _lerpColor(card, other.card, t),
      icon: _lerpColor(icon, other.icon, t),
      focus: _lerpColor(focus, other.focus, t),
      divider: _lerpColor(divider, other.divider, t),
      selection: _lerpColor(selection, other.selection, t),
      disabled: _lerpColor(disabled, other.disabled, t),
      onDisabled: _lerpColor(onDisabled, other.onDisabled, t),
      error: _lerpColor(error, other.error, t),
      onError: _lerpColor(onError, other.onError, t),
    );
  }
}
