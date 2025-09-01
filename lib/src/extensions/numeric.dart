import 'package:flutter_tailwind_ui/src/internal/numeric.dart';

// =============================================================================
// EXTENSION: num
// =============================================================================

/// Extension on [num] to provide useful methods
extension XTailwindNum on num {
  /// Null-aware addition function
  num? add(num? other) {
    return other == null ? null : this + other;
  }

  /// Null-aware subtraction function
  num? subtract(num? other) {
    return other == null ? null : this - other;
  }

  /// Null-aware multiplication function
  num? multiply(num? other) {
    return other == null ? null : this * other;
  }

  /// Null-aware division function
  num? divide(num? other) {
    return other == null ? null : this / other;
  }

  /// An auto formatter for a [num] value.
  String toDisplayString({
    int? precision,
    int lowerExponentThreshold = 4,
    int upperExponentThreshold = 6,
  }) {
    return formatNumber(
      this,
      precision: precision,
      lowerExponentThreshold: lowerExponentThreshold,
      upperExponentThreshold: upperExponentThreshold,
    );
  }
}

// =============================================================================
// EXTENSION: int
// =============================================================================

/// Extension on [int] to provide useful methods
extension XTailwindInt on int {
  /// Null-aware addition function
  int? add(int? other) {
    return other == null ? null : this + other;
  }

  /// Null-aware subtraction function
  int? subtract(int? other) {
    return other == null ? null : this - other;
  }

  /// Null-aware multiplication function
  int? multiply(int? other) {
    return other == null ? null : this * other;
  }

  /// Null-aware division function
  double? divide(int? other) {
    return other == null ? null : this / other;
  }

  /// An auto formatter for an [int] value.
  String toDisplayString({
    int? precision,
    int lowerExponentThreshold = 4,
    int upperExponentThreshold = 6,
  }) {
    return formatNumber(
      this,
      precision: precision,
      lowerExponentThreshold: lowerExponentThreshold,
      upperExponentThreshold: upperExponentThreshold,
    );
  }
}

// =============================================================================
// EXTENSION: double
// =============================================================================

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

  /// An auto formatter for a [double] value.
  String toDisplayString({
    int? precision,
    int lowerExponentThreshold = 4,
    int upperExponentThreshold = 6,
  }) {
    return formatNumber(
      this,
      precision: precision,
      lowerExponentThreshold: lowerExponentThreshold,
      upperExponentThreshold: upperExponentThreshold,
    );
  }
}
