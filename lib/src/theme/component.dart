import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TailwindComponentTheme
// =============================================================================

/// Theme definitions for each Flutter Tailwind UI component
/// TODO: should this be removed in favor of component level styling only
class TailwindComponentTheme extends ThemeExtension<TailwindComponentTheme> {
  /// Light theme constructor for [TailwindComponentTheme]
  const TailwindComponentTheme({
    this.badge = const TBadgeTheme(),
    this.codeBlock = const TCodeBlockTheme(),
  });

  /// Theme options for the [TBadge] component
  final TBadgeTheme badge;

  /// Theme options for the [TCodeBlock] component
  final TCodeBlockTheme codeBlock;

  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  @override
  TailwindComponentTheme copyWith({
    TBadgeTheme? badge,
    TCodeBlockTheme? codeBlock,
  }) {
    return TailwindComponentTheme(
      badge: badge ?? this.badge,
      codeBlock: codeBlock ?? this.codeBlock,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: lerp
  // ---------------------------------------------------------------------------

  @override
  TailwindComponentTheme lerp(
    TailwindComponentTheme? other,
    double t,
  ) {
    return other ?? this;
  }
}
