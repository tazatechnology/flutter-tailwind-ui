import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/src/constants/colors.dart';

// -------------------------------------------------
// METHOD: lerpColor
// -------------------------------------------------

/// Helper function to interpolate between two [Color] objects
///
/// Similar to the [Color.lerp] method, but ensures that the color is not null
Color lerpColor(Color a, Color b, double t) {
  return Color.lerp(a, b, t) ?? a;
}

// -------------------------------------------------
// METHOD: lerpMaterialColor
// -------------------------------------------------

/// Helper function to interpolate between two [MaterialColor] objects
///
/// Similar to the [Color.lerp] method, but performs the interpolation on each shade
MaterialColor lerpMaterialColor(
  MaterialColor a,
  MaterialColor b,
  double t, {
  List<int> shades = DEFAULT_COLOR_SWATCH_SHADES,
}) {
  // Interpolate the main color value
  final interpolatedValue = Color.lerp(a, b, t)!.value;

  // Interpolate each shade
  // If no color can be resolved, fallback to the color being interpolated to
  final interpolatedSwatch = {
    for (final key in shades)
      key: Color.lerp(a[key], b[key], t) ?? a[key] ?? b[key] ?? Color(b.value),
  };

  return MaterialColor(interpolatedValue, interpolatedSwatch);
}
