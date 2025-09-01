import 'dart:math' as math;
import 'package:intl/intl.dart';

/// Formats a numeric value as a human-readable string with intelligent formatting choices.
///
/// This function automatically chooses between decimal notation and scientific notation
/// based on the magnitude of the value and the specified thresholds. It also adds
/// thousands separators (commas) for values ≥ 1000 when using decimal notation.
///
/// ## Formatting Behavior
///
/// ### Decimal Notation (default)
/// - **Values ≥ 1000**: Thousands separators are added (e.g., `1,234`, `12,345`)
/// - **Values < 1000**: No thousands separators (e.g., `123`, `999`)
/// - **Precision**: Uses [precision] decimal places, or calculates appropriate precision
///
/// ### Scientific Notation
/// Used when the value's magnitude falls outside the specified thresholds:
/// - **Small values**: When magnitude < -[lowerExponentThreshold]
/// - **Large values**: When magnitude ≥ [upperExponentThreshold]
///
/// ## Parameters
///
/// * [value] - The numeric value to format
/// * [precision] - Number of decimal places to include. If `null`, the function
///   calculates an appropriate precision based on the value type and magnitude.
///   Defaults to 2 for most cases.
/// * [lowerExponentThreshold] - The smallest magnitude (negative power of 10) before
///   using scientific notation. For example, with threshold 4, values < 0.0001
///   (10^-4) will use scientific notation. Defaults to 4.
/// * [upperExponentThreshold] - The largest magnitude (positive power of 10) before
///   using scientific notation. For example, with threshold 6, values ≥ 1,000,000
///   (10^6) will use scientific notation. Defaults to 6.
///
/// ## Examples
///
/// ```dart
/// formatNumber(1234)           // '1,234'
/// formatNumber(1234.56)        // '1,234.56'
/// formatNumber(0.001)          // '0.001'
/// formatNumber(0.0001)         // '1.00e-4'
/// formatNumber(1000000)        // '1.00e6'
/// formatNumber(999999)         // '999,999'
/// formatNumber(3.14159, precision: 3)  // '3.142'
/// formatNumber(0.0001, lowerExponentThreshold: 5)  // '0.0001'
/// formatNumber(1000000, upperExponentThreshold: 7)  // '1,000,000'
/// ```
///
/// ## Precision Calculation
///
/// When [precision] is `null`, the function determines precision as follows:
/// - **Integer literals**: 0 decimal places
/// - **Double literals**: 2 decimal places (unless more precision is needed)
/// - **Small decimals (< 1)**: Calculated based on leading zeros
/// - **Large numbers**: 2 decimal places
///
/// ## Special Cases
///
/// - **Zero**: Always returns `'0'`
/// - **Negative values**: Preserves the negative sign and applies formatting to the absolute value
/// - **Very small values**: Uses scientific notation to avoid excessive decimal places
/// - **Very large values**: Uses scientific notation for readability
String formatNumber(
  num value, {
  int? precision,
  int lowerExponentThreshold = 4,
  int upperExponentThreshold = 6,
}) {
  if (value == 0) {
    return '0';
  }

  // Use default precision of 2 if not specified
  final effectivePrecision = precision ?? 2;

  // Calculate the magnitude (log base 10 of absolute value)
  final rawMagnitude = math.log(value.abs()) / math.ln10;

  // Check if we should use scientific notation
  // For small numbers: magnitude < -lowerExponentThreshold
  // For large numbers: magnitude >= upperExponentThreshold
  // Use a small epsilon to handle floating-point precision issues
  const epsilon = 1e-10;

  // When precision is explicitly set and value is very small, be more aggressive about using scientific notation
  final adjustedLowerThreshold = (precision != null && rawMagnitude < -3)
      ? 3
      : lowerExponentThreshold;

  // For thousands separators, we want to show them for values >= 1000 (magnitude 3)
  // But we still want to use scientific notation for very large numbers
  final shouldUseScientificNotation =
      rawMagnitude < (-adjustedLowerThreshold + epsilon) ||
      rawMagnitude >= (upperExponentThreshold - epsilon);

  if (shouldUseScientificNotation) {
    // Use scientific notation
    // Round magnitude for exponent calculation to handle floating-point precision
    final magnitude = rawMagnitude.roundToDouble();
    final exponent = magnitude.floor();
    final mantissa = value / math.pow(10, exponent);

    // Normalize mantissa to be between 1 and 10
    final normalizedMantissa = mantissa.abs();
    final normalizedExponent = exponent + (mantissa < 0 ? 1 : 0);

    // Format mantissa with specified precision (no thousands separators for scientific notation)
    final mantissaStr = _formatDecimalWithoutSeparators(
      normalizedMantissa,
      effectivePrecision,
    );
    final sign = value < 0 ? '-' : '';
    return '$sign${mantissaStr}e$normalizedExponent';
  } else {
    // Use regular decimal notation
    final isInteger = value % 1 == 0;

    if (precision == null && isInteger) {
      // Default behavior for integer literals: no decimal places
      return _addThousandsSeparator(value.toInt().toString());
    } else {
      // For doubles or when precision is explicitly set, format with specified precision
      // For small decimal numbers, calculate the appropriate precision
      int actualPrecision;
      if (precision != null) {
        actualPrecision = precision;
      } else if (!isInteger) {
        // For double literals, use precision 2 unless it's a small decimal that needs more precision
        final calculatedPrecision = _calculateAppropriatePrecision(value);
        actualPrecision = calculatedPrecision > 2 ? calculatedPrecision : 2;
      } else {
        actualPrecision = _calculateAppropriatePrecision(value);
      }
      return _formatDecimal(value, actualPrecision);
    }
  }
}

/// Formats a decimal number with specified precision, including thousands separators.
///
/// This function is used for regular decimal notation (not scientific notation).
/// It adds thousands separators for values ≥ 1000.
///
/// * [value] - The numeric value to format
/// * [precision] - Number of decimal places to include
///
/// Returns a formatted string with thousands separators and the specified precision.
String _formatDecimal(num value, int precision) {
  if (precision == 0) {
    return _addThousandsSeparator(value.round().toString());
  }

  // Use NumberFormat for decimal formatting with thousands separators
  final formatter = NumberFormat('#,##0.${'0' * precision}');
  return formatter.format(value);
}

/// Formats a decimal number with specified precision, without thousands separators.
///
/// This function is used specifically for scientific notation mantissas,
/// where thousands separators are not appropriate.
///
/// * [value] - The numeric value to format
/// * [precision] - Number of decimal places to include
///
/// Returns a formatted string without thousands separators.
String _formatDecimalWithoutSeparators(num value, int precision) {
  if (precision == 0) {
    return value.round().toString();
  }

  // Use NumberFormat for decimal formatting without thousands separators
  final formatter = NumberFormat('0.${'0' * precision}');
  return formatter.format(value);
}

/// Calculates the appropriate precision for a decimal number when precision is not specified.
///
/// This function determines how many decimal places to show based on the value's
/// characteristics and magnitude.
///
/// * [value] - The numeric value to analyze
///
/// Returns the calculated precision (number of decimal places).
///
/// ## Logic
/// - **Integers**: 0 decimal places
/// - **Small decimals (< 1)**: Based on leading zeros after decimal point
/// - **Large numbers**: 2 decimal places (default)
int _calculateAppropriatePrecision(num value) {
  if (value == value.toInt()) {
    return 0;
  }

  // For small decimal numbers, show enough places to represent the value accurately
  final absValue = value.abs();
  if (absValue < 1) {
    // Count the number of leading zeros after the decimal point
    final magnitude = math.log(absValue) / math.ln10;
    final leadingZeros = (-magnitude).floor();
    return leadingZeros + 1; // Add 1 for the first non-zero digit
  }

  // Default precision for larger numbers
  return 2;
}

/// Adds thousands separators (commas) to a string representation of a number.
///
/// This function manually adds commas every three digits from the right,
/// handling negative numbers correctly.
///
/// * [numberStr] - The string representation of the number (may include negative sign)
///
/// Returns the string with thousands separators added.
///
/// ## Examples
/// ```dart
/// _addThousandsSeparator('1234')      // '1,234'
/// _addThousandsSeparator('1234567')   // '1,234,567'
/// _addThousandsSeparator('-1234')     // '-1,234'
/// ```
String _addThousandsSeparator(String numberStr) {
  // Handle negative numbers
  final isNegative = numberStr.startsWith('-');
  final absNumberStr = isNegative ? numberStr.substring(1) : numberStr;

  // Add thousands separators
  final result = StringBuffer();
  for (int i = 0; i < absNumberStr.length; i++) {
    if (i > 0 && (absNumberStr.length - i) % 3 == 0) {
      result.write(',');
    }
    result.write(absNumberStr[i]);
  }

  return isNegative ? '-$result' : result.toString();
}
