// Match Tailwind naming conventions for traceability
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// EXTENSION: XTailwindBuildContext
// =============================================================================

/// Extension methods for the [BuildContext] class
///
/// This extension provides a set of useful methods to the [BuildContext] class
/// used to simplify the access to common properties and methods.
extension XTailwindBuildContext on BuildContext {
  /// The current Tailwind theme context
  TailwindContext get tw => TailwindContext._(this);

  /// The current theme data
  ThemeData get theme => Theme.of(this);
}

// =============================================================================
// CLASS: TailwindContext
// =============================================================================

/// Wrapper class for all the Tailwind related context properties
///
/// Can be accessed via the `context.tw` extension property
class TailwindContext {
  TailwindContext._(this._ctx);

  /// The current [BuildContext] instance
  final BuildContext _ctx;

  /// The current theme data
  ThemeData get _theme => Theme.of(_ctx);

  /// Is the current theme [Brightness] value
  Brightness get brightness => _theme.brightness;

  /// Is the current theme the light theme
  bool get light => _theme.brightness == Brightness.light;

  /// Is the current theme the dark theme
  bool get dark => _theme.brightness == Brightness.dark;

  /// The current screen context
  TailwindScreenContext get screen => TailwindScreenContext._(_ctx);

  /// The current Tailwind color theme
  TailwindColorTheme get color {
    return Theme.of(_ctx).extension<TailwindColorTheme>() ??
        (dark ? TailwindColorTheme.dark() : TailwindColorTheme.light());
  }
}

// =============================================================================
// CLASS: TailwindScreenContext
// =============================================================================

/// Text
class TailwindScreenContext {
  TailwindScreenContext._(this._ctx);

  /// The current [BuildContext] instance
  final BuildContext _ctx;

  /// The current screen size
  Size get size => MediaQuery.sizeOf(_ctx);

  /// The current screen width
  double get width => size.width;

  /// The current screen height
  double get height => size.height;

  /// Screen width is greater than or equal to [TScreen.screen_xs] (480px)
  bool get is_xs => width >= TScreen.screen_xs;

  /// Screen width is greater than or equal to [TScreen.screen_sm] (640px)
  bool get is_sm => width >= TScreen.screen_sm;

  /// Screen width is greater than or equal to [TScreen.screen_md] (768px)
  bool get is_md => width >= TScreen.screen_md;

  /// Screen width is greater than or equal to [TScreen.screen_lg] (1024px)
  bool get is_lg => width >= TScreen.screen_lg;

  /// Screen width is greater than or equal to [TScreen.screen_xl] (1280px)
  bool get is_xl => width >= TScreen.screen_xl;

  /// Screen width is greater than or equal to [TScreen.screen_2xl] (1536px)
  bool get is_2xl => width >= TScreen.screen_2xl;

  /// Screen width is greater than or equal to [TScreen.screen_3xl] (1920px)
  bool get is_3xl => width >= TScreen.screen_3xl;

  /// Screen width is greater than or equal to [TScreen.screen_4xl] (2560px)
  bool get is_4xl => width >= TScreen.screen_4xl;

  /// Screen width is greater than or equal to [TScreen.screen_5xl] (3840px)
  bool get is_5xl => width >= TScreen.screen_5xl;
}
