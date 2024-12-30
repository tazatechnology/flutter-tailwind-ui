// =================================================
// EXTENSION: double
// =================================================

/// Extension on [double] to provide useful methods
extension XTailwindDouble on double {
  /// Null-aware addition function
  double? add(double? other) {
    return other == null ? null : this + other;
  }

  /// Null-aware subtraction function
  double? subtract(double? other) {
    return other == null ? null : this - other;
  }

  /// Null-aware multiplication function
  double? multiply(double? other) {
    return other == null ? null : this * other;
  }

  /// Null-aware division function
  double? divide(double? other) {
    return other == null ? null : this / other;
  }
}
