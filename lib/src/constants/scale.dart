// =================================================
// CLASS: TScale
// =================================================

/// Tailwind scaling system for padding, margin, width, height, etc.
///
/// Scaling system is based on 4px increments.
///
/// https://tailwindcss.com/docs/customizing-spacing
class TScale {
  /// Spacing scale unit of 0px
  static const double s0 = 0.0;

  /// Spacing scale unit of 4px
  static const double s1 = 4.0;

  /// Spacing scale unit of 8px
  static const double s2 = 8.0;

  /// Spacing scale unit of 12px
  static const double s3 = 12.0;

  /// Spacing scale unit of 16px
  static const double s4 = 16.0;

  /// Spacing scale unit of 20px
  static const double s5 = 20.0;

  /// Spacing scale unit of 24px
  static const double s6 = 24.0;

  /// Spacing scale unit of 28px
  static const double s7 = 28.0;

  /// Spacing scale unit of 32px
  static const double s8 = 32.0;

  /// Spacing scale unit of 36px
  static const double s9 = 36.0;

  /// Spacing scale unit of 40px
  static const double s10 = 40.0;

  /// Spacing scale map of all levels and their values.
  static const Map<int, double> spaceMap = {
    0: s0,
    1: s1,
    2: s2,
    3: s3,
    4: s4,
    5: s5,
    6: s6,
    7: s7,
    8: s8,
    9: s9,
    10: s10,
  };
}

// =================================================
// CLASS: TRadiusScale
// =================================================

/// Tailwind radius system for rounded shapes.
///
/// Radius scaling system is based on 2px increments.
///
/// https://tailwindcss.com/docs/border-radius
class TRadiusScale {
  /// Radius scale unit of 0px
  static const double r0 = 0.0;

  /// Radius scale unit of 2px
  static const double r1 = 2.0;

  /// Radius scale unit of 4px
  static const double r2 = 4.0;

  /// Radius scale unit of 6px
  static const double r3 = 6.0;

  /// Radius scale unit of 8px
  static const double r4 = 8.0;

  /// Radius scale unit of 12px
  static const double r5 = 12.0;

  /// Radius scale unit of 16px
  static const double r6 = 16.0;

  /// Radius scale unit of 24px
  static const double r7 = 24.0;

  /// Radius scale unit of 9999px
  static const double r8 = 9999.0;

  /// Radius scale map of all levels and their values.
  static const Map<int, double> radiusMap = {
    0: r0,
    1: r1,
    2: r2,
    3: r3,
    4: r4,
    5: r5,
    6: r6,
    7: r7,
    8: r8,
  };
}
