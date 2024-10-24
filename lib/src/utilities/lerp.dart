import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/src/constants/colors.dart';

// -------------------------------------------------
// METHOD: lerpDouble
// -------------------------------------------------

/// Helper function to interpolate between two [double] values
double lerpDouble(num a, num b, double t) {
  return (ui.lerpDouble(a, b, t) ?? b).toDouble();
}

/// Helper function to interpolate between two [Duration] objects
Duration lerpDuration(Duration a, Duration b, double t) {
  return Duration(
    milliseconds: lerpDouble(a.inMilliseconds, b.inMilliseconds, t).round(),
  );
}

// -------------------------------------------------
// METHOD: lerpColor
// -------------------------------------------------

/// Helper function to interpolate between two [Color] objects
///
/// Similar to the [Color.lerp] method, but ensures that the returned value is not null
Color lerpColor(Color a, Color b, double t) {
  return Color.lerp(a, b, t) ?? b;
}

// -------------------------------------------------
// METHOD: lerpTextStyle
// -------------------------------------------------

/// Helper function to interpolate between two [TextStyle] objects
///
/// Similar to the [TextStyle.lerp] method, but ensures that the returned value is not null
TextStyle lerpTextStyle(TextStyle a, TextStyle b, double t) {
  return TextStyle.lerp(a, b, t) ?? b;
}

// -------------------------------------------------
// METHOD: lerpBorder
// -------------------------------------------------

/// Helper function to interpolate between two [BoxBorder] objects
///
/// Similar to the [BoxBorder.lerp] method, but ensures that the returned value is not null
BoxBorder lerpBorder(BoxBorder a, BoxBorder b, double t) {
  return BoxBorder.lerp(a, b, t) ?? b;
}

// -------------------------------------------------
// METHOD: lerpBorderRadius
// -------------------------------------------------

/// Helper function to interpolate between two [BorderRadius] objects
///
/// Similar to the [BorderRadius.lerp] method, but ensures that the returned value is not null
BorderRadius lerpBorderRadius(BorderRadius a, BorderRadius b, double t) {
  return BorderRadius.lerp(a, b, t) ?? b;
}

/// Helper function to interpolate between two [BorderRadius] objects
///
/// Similar to the [BorderRadius.lerp] method, but ensures that the returned value is not null
EdgeInsetsGeometry lerpEdgeInsets(
  EdgeInsetsGeometry a,
  EdgeInsetsGeometry b,
  double t,
) {
  return EdgeInsetsGeometry.lerp(a, b, t) ?? b;
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
