// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/constants/text.dart';

// =================================================
// EXTENSION: XTailwindBuildContext
// =================================================

/// Extension methods for the [BuildContext] class
///
/// This extension provides a set of useful methods to the [BuildContext] class
/// used to simplify the access to common properties and methods.
extension XTailwindBuildContext on BuildContext {
  /// The current Tailwind theme context
  TailwindBuildContext get tw => TailwindBuildContext._(this);

  /// The current theme data
  ThemeData get theme => Theme.of(this);
}

// =================================================
// CLASS: TailwindBuildContext
// =================================================

/// Wrapper class for all the Tailwind related context properties
///
/// Can be accessed via the `context.tw` extension property
class TailwindBuildContext {
  TailwindBuildContext._(this.context);

  /// The current [BuildContext] instance
  final BuildContext context;

  /// The current screen size
  Size get screen_size => MediaQuery.sizeOf(context);

  /// The current screen width
  double get screen_width => screen_size.width;

  /// The current screen height
  double get screen_height => screen_size.height;

  /// Screen width is greater than or equal to [TScreen.screen_xs] (480px)
  bool get screen_xs => screen_width >= TScreen.screen_xs;

  /// Screen width is greater than or equal to [TScreen.screen_sm] (640px)
  bool get screen_sm => screen_width >= TScreen.screen_sm;

  /// Screen width is greater than or equal to [TScreen.screen_md] (768px)
  bool get screen_md => screen_width >= TScreen.screen_md;

  /// Screen width is greater than or equal to [TScreen.screen_lg] (1024px)
  bool get screen_lg => screen_width >= TScreen.screen_lg;

  /// Screen width is greater than or equal to [TScreen.screen_xl] (1280px)
  bool get screen_xl => screen_width >= TScreen.screen_xl;

  /// Screen width is greater than or equal to [TScreen.screen_2xl] (1536px)
  bool get screen_2xl => screen_width >= TScreen.screen_2xl;

  /// Screen width is greater than or equal to [TScreen.screen_3xl] (1920px)
  bool get screen_3xl => screen_width >= TScreen.screen_3xl;

  /// Screen width is greater than or equal to [TScreen.screen_4xl] (2560px)
  bool get screen_4xl => screen_width >= TScreen.screen_4xl;

  /// Screen width is greater than or equal to [TScreen.screen_5xl] (3840px)
  bool get screen_5xl => screen_width >= TScreen.screen_5xl;

  /// The current theme data
  ThemeData get _theme => Theme.of(context);

  /// Is the current theme the light theme
  bool get light => _theme.brightness == Brightness.light;

  /// Is the current theme the dark theme
  bool get dark => _theme.brightness == Brightness.dark;

  /// The current text theme data
  TextTheme get _textTheme => Theme.of(context).textTheme;

  /// The baseline text style for the current context
  TextStyle get _body => _textTheme.bodyMedium ?? TTextStyle.text_base;

  /// The primary color pallette
  MaterialColor get primaryColor {
    final p = _theme.primaryColor;
    if (p is MaterialColor) {
      return p;
    } else {
      return MaterialColor(p.value, {
        50: p,
        100: p,
        200: p,
        300: p,
        400: p,
        500: p,
        600: p,
        700: p,
        800: p,
        900: p,
        950: p,
      });
    }
  }

  /// The display text color (e.g. for titles, headings, etc.)
  ///
  /// Inherited the [TextTheme.displayMedium] color definition
  Color get displayColor =>
      _textTheme.displayMedium?.color ?? (light ? Colors.black : Colors.white);

  /// The body text color (e.g. for primary text content)
  ///
  /// Inherited the [TextTheme.bodyMedium] color definition
  Color get bodyColor =>
      _textTheme.bodyMedium?.color ??
      (light ? TColors.gray.shade800 : TColors.slate.shade400);

  /// The secondary text color (e.g. for labels, descriptions, etc.)
  ///
  /// Inherited the [TextTheme.labelMedium] color definition
  Color get labelColor =>
      _textTheme.labelMedium?.color ??
      (light ? TColors.gray.shade400 : TColors.slate.shade500);

  /// The current context's `text_xs` text style
  TextStyle get text_xs => _body.merge(TTextStyle.text_xs);

  /// The current context's `text_sm` text style
  TextStyle get text_sm => _body.merge(TTextStyle.text_sm);

  /// The current context's `text_base` text style
  TextStyle get text_base => _body.merge(TTextStyle.text_base);

  /// The current context's `text_lg` text style
  TextStyle get text_lg => _body.merge(TTextStyle.text_lg);

  /// The current context's `text_xl` text style
  TextStyle get text_xl => _body.merge(TTextStyle.text_xl);

  /// The current context's `text_2xl` text style
  TextStyle get text_2xl => _body.merge(TTextStyle.text_2xl);

  /// The current context's `text_3xl` text style
  TextStyle get text_3xl => _body.merge(TTextStyle.text_3xl);

  /// The current context's `text_4xl` text style
  TextStyle get text_4xl => _body.merge(TTextStyle.text_4xl);

  /// The current context's `text_5xl` text style
  TextStyle get text_5xl => _body.merge(TTextStyle.text_5xl);

  /// The current context's `text_6xl` text style
  TextStyle get text_6xl => _body.merge(TTextStyle.text_6xl);

  /// The current context's `text_7xl` text style
  TextStyle get text_7xl => _body.merge(TTextStyle.text_7xl);

  /// The current context's `text_8xl` text style
  TextStyle get text_8xl => _body.merge(TTextStyle.text_8xl);

  /// The current context's `text_9xl` text style
  TextStyle get text_9xl => _body.merge(TTextStyle.text_9xl);
}
