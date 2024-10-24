import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// CLASS: TailwindComponentsTheme
// =================================================

/// Theme definitions for each Flutter Tailwind UI component
class TailwindComponentsTheme extends ThemeExtension<TailwindComponentsTheme> {
  /// Light theme constructor for [TailwindComponentsTheme]
  TailwindComponentsTheme.raw({
    required this.badge,
    required this.text,
  });

  /// Light theme constructor for [TailwindComponentsTheme]
  TailwindComponentsTheme.light({
    TBadgeTheme? badge,
    TTextTheme? text,
  }) {
    this.badge = badge ?? TBadgeTheme.light();
    this.text = text ?? TTextTheme.light();
  }

  /// Dark theme constructor for [TailwindComponentsTheme]
  TailwindComponentsTheme.dark({
    TBadgeTheme? badge,
    TTextTheme? text,
  }) {
    this.badge = badge ?? TBadgeTheme.dark();
    this.text = text ?? TTextTheme.dark();
  }

  /// Theme options for the [TBadge] component
  late final TBadgeTheme badge;

  /// Theme options for the [TText] component
  late final TTextTheme text;

  // -------------------------------------------------
  // METHOD: copyWith
  // -------------------------------------------------

  @override
  TailwindComponentsTheme copyWith({
    TBadgeTheme? badge,
    TTextTheme? text,
  }) {
    return TailwindComponentsTheme.raw(
      badge: badge ?? this.badge,
      text: text ?? this.text,
    );
  }

  // -------------------------------------------------
  // METHOD: lerp
  // -------------------------------------------------

  @override
  TailwindComponentsTheme lerp(
    TailwindComponentsTheme? other,
    double t,
  ) {
    return other ?? this;
  }
}
