// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/src/constants/text.dart';

/// Extension methods for the [BuildContext] class
///
/// This extension provides a set of useful methods to the [BuildContext] class
/// used to simplify the access to common properties and methods.
extension TailwindExtensionBuildContext on BuildContext {
  /// The current screens size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// The current screens width
  double get screenWidth => screenSize.width;

  /// The current screens height
  double get screenHeight => screenSize.height;

  /// The current theme data
  ThemeData get theme => Theme.of(this);

  /// Is the current theme the light theme
  bool get isLightTheme => theme.brightness == Brightness.light;

  /// Is the current theme the dark theme
  bool get isDarkTheme => theme.brightness == Brightness.dark;

  /// The current text theme data
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// The baseline text style for the current context
  TextStyle get _body => textTheme.bodyMedium ?? TTextStyle.text_base;

  /// The current context's [TTextStyle.text_xs] text style
  TextStyle get text_xs => _body.merge(TTextStyle.text_xs);

  /// The current context's [TTextStyle.text_sm] text style
  TextStyle get text_sm => _body.merge(TTextStyle.text_sm);

  /// The current context's [TTextStyle.text_base] text style
  TextStyle get text_base => _body.merge(TTextStyle.text_base);

  /// The current context's [TTextStyle.text_lg] text style
  TextStyle get text_lg => _body.merge(TTextStyle.text_lg);

  /// The current context's [TTextStyle.text_xl] text style
  TextStyle get text_xl => _body.merge(TTextStyle.text_xl);

  /// The current context's [TTextStyle.text_2xl] text style
  TextStyle get text_2xl => _body.merge(TTextStyle.text_2xl);

  /// The current context's [TTextStyle.text_3xl] text style
  TextStyle get text_3xl => _body.merge(TTextStyle.text_3xl);

  /// The current context's [TTextStyle.text_4xl] text style
  TextStyle get text_4xl => _body.merge(TTextStyle.text_4xl);

  /// The current context's [TTextStyle.text_5xl] text style
  TextStyle get text_5xl => _body.merge(TTextStyle.text_5xl);

  /// The current context's [TTextStyle.text_6xl] text style
  TextStyle get text_6xl => _body.merge(TTextStyle.text_6xl);

  /// The current context's [TTextStyle.text_7xl] text style
  TextStyle get text_7xl => _body.merge(TTextStyle.text_7xl);

  /// The current context's [TTextStyle.text_8xl] text style
  TextStyle get text_8xl => _body.merge(TTextStyle.text_8xl);

  /// The current context's [TTextStyle.text_9xl] text style
  TextStyle get text_9xl => _body.merge(TTextStyle.text_9xl);
}
