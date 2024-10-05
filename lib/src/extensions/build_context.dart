import 'package:flutter/material.dart';

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

  /// Is light theme
  bool get isLightTheme => theme.brightness == Brightness.light;

  /// Is dark theme
  bool get isDarkTheme => theme.brightness == Brightness.dark;
}
