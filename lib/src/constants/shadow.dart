// Match Tailwind naming conventions for traceability
// ignore_for_file: constant_identifier_names

// =============================================================================
// CLASS: TShadow
// =============================================================================

/// Tailwind shadow (elevation) values.
///
/// See the following link for more information:
///
/// https://tailwindcss.com/docs/box-shadow
abstract final class TShadow {
  /// Shadow value mapping to a Flutter elevation of 0.0
  ///
  /// Equivalent to Tailwind shadow value: `none`
  static const shadow_none = 0.0;

  /// Shadow value mapping to a Flutter elevation of 1.0
  ///
  /// Equivalent to Tailwind shadow value: `sm`
  static const shadow_sm = 1.0;

  /// Shadow value mapping to a Flutter elevation of 2.0
  ///
  /// Equivalent to Tailwind shadow value: `base`
  static const shadow = 2.0;

  /// Shadow value mapping to a Flutter elevation of 4.0
  ///
  /// Equivalent to Tailwind shadow value: `md`
  static const shadow_md = 4.0;

  /// Shadow value mapping to a Flutter elevation of 6.0
  ///
  /// Equivalent to Tailwind shadow value: `lg`
  static const shadow_lg = 6.0;

  /// Shadow value mapping to a Flutter elevation of 8.0
  ///
  /// Equivalent to Tailwind shadow value: `xl`
  static const shadow_xl = 8.0;

  /// Shadow value mapping to a Flutter elevation of 12.0
  ///
  /// Equivalent to Tailwind shadow value: `2xl`
  static const shadow_2xl = 12.0;
}
