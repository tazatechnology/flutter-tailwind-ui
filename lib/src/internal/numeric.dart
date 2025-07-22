import 'package:intl/intl.dart';

/// Formats [value] (a `num`) as a human-readable string suitable for scientific contexts.
///
/// - If [precision] is non-null, it uses `toStringAsFixed(precision)`.
/// - Otherwise, it uses `toStringAsPrecision(6)` by default, which:
///   - Produces scientific notation for very large or very small values.
///   - Uses up to 6 significant digits for moderate ranges.
/// - Trailing zeros (and a trailing decimal point) are stripped to keep it neat.
///
/// Examples:
///   formatNumber(12345.6789)            => "12346" (6 significant digits)
///   formatNumber(12345.6789, precision: 2) => "12345.68"
///   formatNumber(1.23456789e-7)         => "1.23457e-7"
///   formatNumber(0.000123456)           => "0.000123456" or "1.23456e-4", etc.
///   formatNumber(42)                    => "42"
String formatNumber(
  num value, {
  int? precision,
}) {
  if (value == 0) {
    return '0';
  }

  if (value is int || precision == 0) {
    return NumberFormat('###,###').format(value);
  }

  // Convert num to double so we can use the string formatting methods
  final doubleValue = value.toDouble();

  // If the user explicitly wants an exact precision, we honor that first.
  if (precision != null) {
    return NumberFormat('###,##0.${'#' * precision}').format(doubleValue);
  }

  // Otherwise, use a "best guess" for scientific usage.
  final precisionString = doubleValue.toStringAsPrecision(6);

  // If the result is in scientific notation, keep it as-is
  // Otherwise, apply thousands separator formatting
  final raw = precisionString.contains('e')
      ? precisionString
      : NumberFormat('###,##0.######').format(doubleValue);

  // Strip trailing zeros and a trailing decimal point for a cleaner look.
  return _stripTrailingZeros(raw);
}

/// Removes trailing zeros and a trailing decimal point from a decimal string.
///
/// Examples:
///   "123.4500" -> "123.45"
///   "123.000"  -> "123"
///   "1.23400e-5" -> "1.234e-5"
String _stripTrailingZeros(String value) {
  String str = value;

  // If it's a normal decimal string (no 'e'), just strip trailing zeros.
  if (str.contains('.') && !str.contains('e')) {
    str = str.replaceAll(RegExp(r'0+$'), ''); // remove trailing zeros
    if (str.endsWith('.')) {
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

  // If the string is in scientific notation (e.g. "1.2300e-5"),
  // we can split at 'e', strip trailing zeros in the first part, then recombine.
  if (str.contains('e')) {
    final parts = str.split('e');
    if (parts.length == 2) {
      String mainPart = parts[0];
      final String exponentPart = parts[1];

      // Strip trailing zeros in main part if there's a decimal point.
      if (mainPart.contains('.')) {
        mainPart = mainPart.replaceAll(RegExp(r'0+$'), '');
        if (mainPart.endsWith('.')) {
          mainPart = mainPart.substring(0, mainPart.length - 1);
        }
      }

      return '$mainPart e$exponentPart'.replaceAll(' ', '');
    }
  }

  // Otherwise, just return as-is.
  return str;
}
