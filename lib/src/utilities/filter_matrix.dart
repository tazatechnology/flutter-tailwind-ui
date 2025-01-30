import 'dart:math' show cos, pi, sin;

// =============================================================================
// CLASS: TFilterMatrix
// =============================================================================

/// Compute filter matrix for various filter types.
abstract class TFilterMatrix {
  // These numbers represent the relative luminance weights of the each
  // channel in the human eye’s perception.
  static const double _rW = 0.213;
  static const double _gW = 0.715;
  static const double _bW = 0.072;

  /// The minimum value for a brightness filter.
  static const double blurMin = 0;

  /// The maximum value for a brightness filter.
  static const double blurMax = 20;

  // ---------------------------------------------------------------------------
  // METHOD: brightness
  // ---------------------------------------------------------------------------

  /// The minimum value for a brightness filter.
  static const double brightnessMin = 0;

  /// The maximum value for a brightness filter.
  static const double brightnessMax = 2;

  /// Compute the filter matrix for a brightness filter.
  static List<double> brightness(
    double value, [
    double min = brightnessMin,
    double max = brightnessMax,
  ]) {
    // Apply reasonable limits to the intensity value
    final v = value.clamp(min, max);
    return <double>[
      v, 0, 0, 0, 0, // Red
      0, v, 0, 0, 0, // Green
      0, 0, v, 0, 0, // Blue
      0, 0, 0, 1, 0, // Alpha
    ];
  }

  // ---------------------------------------------------------------------------
  // METHOD: contrast
  // ---------------------------------------------------------------------------

  /// The minimum value for a contrast filter.
  static const double contrastMin = 0;

  /// The maximum value for a contrast filter.
  static const double contrastMax = 2;

  /// Compute the filter matrix for a contrast filter.
  static List<double> contrast(
    double value, [
    double min = contrastMin,
    double max = contrastMax,
  ]) {
    // Apply reasonable limits to the intensity value
    final v = value.clamp(min, max);
    // Notice that the user code uses (1 - value) here (not 1 - v)
    final t = (1 - value) * 128;
    return <double>[
      v, 0, 0, 0, t, // Red
      0, v, 0, 0, t, // Green
      0, 0, v, 0, t, // Blue
      0, 0, 0, 1, 0, // Alpha
    ];
  }

  // ---------------------------------------------------------------------------
  // METHOD: grayscale
  // ---------------------------------------------------------------------------

  /// The minimum value for a grayscale filter.
  static const double grayscaleMin = 0;

  /// The maximum value for a grayscale filter.
  static const double grayscaleMax = 1;

  /// Compute the filter matrix for a grayscale filter.
  static List<double> grayscale(
    double value, [
    double min = grayscaleMin,
    double max = grayscaleMax,
  ]) {
    final v = value.clamp(min, max);
    final r = 0.33 * v + (1 - v);
    final g = 0.33 * v + (1 - v);
    final b = 0.33 * v + (1 - v);
    return <double>[
      r, 0.33 * v, 0.33 * v, 0, 0, // Red
      0.33 * v, g, 0.33 * v, 0, 0, // Green
      0.33 * v, 0.33 * v, b, 0, 0, // Blue
      0, 0, 0, 1, 0, // Alpha
    ];
  }

  // ---------------------------------------------------------------------------
  // METHOD: hueRotate
  // ---------------------------------------------------------------------------

  /// The minimum value for a hue-rotate filter (in degrees).
  static const double hueRotateMin = 0;

  /// The maximum value for a hue-rotate filter (in degrees).
  static const double hueRotateMax = 360;

  /// Compute the filter matrix for a hue-rotate filter.
  static List<double> hueRotate(
    double value, [
    double min = hueRotateMin,
    double max = hueRotateMax,
  ]) {
    // Apply reasonable limits to the intensity value
    final v = value.clamp(min, max);
    // Convert degrees to radians
    final double radians = v * (pi / 180);
    final double cosA = cos(radians);
    final double sinA = sin(radians);

    return <double>[
      // Red channel
      _rW + cosA * (1 - _rW) + sinA * (-_rW),
      _gW + cosA * (-_gW) + sinA * (-_gW),
      _bW + cosA * (-_bW) + sinA * (1 - _bW),
      0,
      0,
      // Green channel
      _rW + cosA * (-_rW) + sinA * (0.143),
      _gW + cosA * (1 - _gW) + sinA * (0.140),
      _bW + cosA * (-_bW) + sinA * (-0.283),
      0,
      0,
      // Blue channel
      _rW + cosA * (-_rW) + sinA * (-(1 - _rW)),
      _gW + cosA * (-_gW) + sinA * _gW,
      _bW + cosA * (1 - _bW) + sinA * _bW,
      0,
      0,
      // Alpha
      0, 0, 0, 1, 0,
    ];
  }

  // ---------------------------------------------------------------------------
  // METHOD: invert
  // ---------------------------------------------------------------------------

  /// The minimum value for an invert filter.
  static const double invertMin = 0;

  /// The maximum value for an invert filter.
  static const double invertMax = 1;

  /// Compute the filter matrix for an invert filter.
  static List<double> invert(
    double value, [
    double min = invertMin,
    double max = invertMax,
  ]) {
    final v = value.clamp(min, max);
    return <double>[
      1 - 2 * v, 0, 0, 0, 255 * v, // Red
      0, 1 - 2 * v, 0, 0, 255 * v, // Green
      0, 0, 1 - 2 * v, 0, 255 * v, // Blue
      0, 0, 0, 1, 0, // Alpha
    ];
  }

  // ---------------------------------------------------------------------------
  // METHOD: saturate
  // ---------------------------------------------------------------------------

  /// The minimum value for a saturate filter.
  static const double saturateMin = 0;

  /// The maximum value for a saturate filter.
  static const double saturateMax = 2;

  /// Compute the filter matrix for a saturate filter.
  static List<double> saturate(
    double value, [
    double min = saturateMin,
    double max = saturateMax,
  ]) {
    final v = value.clamp(min, max);
    return [
      _rW * (1 - v) + v, _gW * (1 - v), _bW * (1 - v), 0, 0, // Red
      _rW * (1 - v), _gW * (1 - v) + v, _bW * (1 - v), 0, 0, // Green
      _rW * (1 - v), _gW * (1 - v), _bW * (1 - v) + v, 0, 0, // Blue
      0, 0, 0, 1, 0, // Alpha
    ];
  }

  // ---------------------------------------------------------------------------
  // METHOD: sepia
  // ---------------------------------------------------------------------------

  /// The minimum value for a sepia filter.
  static const double sepiaMin = 0;

  /// The maximum value for a sepia filter.
  static const double sepiaMax = 1;

  /// Compute the filter matrix for a sepia filter.
  static List<double> sepia(
    double value, [
    double min = sepiaMin,
    double max = sepiaMax,
  ]) {
    final v = value.clamp(min, max);
    // Identity (no change) matrix
    final List<double> identity = [
      1, 0, 0, 0, 0, // Red
      0, 1, 0, 0, 0, // Green
      0, 0, 1, 0, 0, // Blue
      0, 0, 0, 1, 0, // Alpha
    ];
    // Full sepia matrix
    final List<double> sepia = [
      0.393, 0.769, 0.189, 0, 0, // Red
      0.349, 0.686, 0.168, 0, 0, // Green
      0.272, 0.534, 0.131, 0, 0, // Blue
      0, 0, 0, 1, 0, // Alpha
    ];
    // Linear interpolation between identity and sepia
    return List<double>.generate(20, (i) {
      return identity[i] * (1 - v) + sepia[i] * v;
    });
  }
}
