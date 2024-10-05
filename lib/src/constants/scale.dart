// =================================================
// CLASS: TScale
// =================================================

// ignore_for_file: constant_identifier_names

/// Tailwind scaling system for padding, margin, width, height, etc.
///
/// See the following link for more information:
///
/// https://tailwindcss.com/docs/customizing-spacing#default-spacing-scale
///
/// Note: Naming convention has been adapted to be more transparent and make it
/// easier to understand the scale values. This is not the same as the Tailwind
/// but is discussed as a possible future improvement.
///
/// https://github.com/tailwindlabs/tailwindcss/discussions/12263
abstract final class TSpacingScale {
  /// Spacing scale unit of 0px
  ///
  /// Equivalent to tailwind spacing scale value: `0`
  static const v0 = 0.0;

  /// Spacing scale unit of 1px
  ///
  /// Equivalent to tailwind spacing scale value: `px`
  static const v1 = 1.0;

  /// Spacing scale unit of 2px
  ///
  /// Equivalent to tailwind spacing scale value: `0.5`
  static const v2 = 2.0;

  /// Spacing scale unit of 4px
  ///
  /// Equivalent to tailwind spacing scale value: `1`
  static const v4 = 4.0;

  /// Spacing scale unit of 6px
  ///
  /// Equivalent to tailwind spacing scale value: `1.5`
  static const v6 = 6.0;

  /// Spacing scale unit of 8px
  ///
  /// Equivalent to tailwind spacing scale value: `2`
  static const v8 = 8.0;

  /// Spacing scale unit of 10px
  ///
  /// Equivalent to tailwind spacing scale value: `2.5`
  static const v10 = 10.0;

  /// Spacing scale unit of 12px
  ///
  /// Equivalent to tailwind spacing scale value: `3`
  static const v12 = 12.0;

  /// Spacing scale unit of 14px
  ///
  /// Equivalent to tailwind spacing scale value: `3.5`
  static const v14 = 14.0;

  /// Spacing scale unit of 16px
  ///
  /// Equivalent to tailwind spacing scale value: `4`
  static const v16 = 16.0;

  /// Spacing scale unit of 20px
  ///
  /// Equivalent to tailwind spacing scale value: `5`
  static const v20 = 20.0;

  /// Spacing scale unit of 24px
  ///
  /// Equivalent to tailwind spacing scale value: `6`
  static const v24 = 24.0;

  /// Spacing scale unit of 28px
  ///
  /// Equivalent to tailwind spacing scale value: `7`
  static const v28 = 28.0;

  /// Spacing scale unit of 32px
  ///
  /// Equivalent to tailwind spacing scale value: `8`
  static const v32 = 32.0;

  /// Spacing scale unit of 36px
  ///
  /// Equivalent to tailwind spacing scale value: `9`
  static const v36 = 36.0;

  /// Spacing scale unit of 40px
  ///
  /// Equivalent to tailwind spacing scale value: `10`
  static const v40 = 40.0;

  /// Spacing scale unit of 44px
  ///
  /// Equivalent to tailwind spacing scale value: `11`
  static const v44 = 44.0;

  /// Spacing scale unit of 48px
  ///
  /// Equivalent to tailwind spacing scale value: `12`
  static const v48 = 48.0;

  /// Spacing scale unit of 52px
  ///
  /// Equivalent to tailwind spacing scale value: `13`
  static const v52 = 52.0;

  /// Spacing scale unit of 56px
  ///
  /// Equivalent to tailwind spacing scale value: `14`
  static const v56 = 56.0;

  /// Spacing scale unit of 60px
  ///
  /// Equivalent to tailwind spacing scale value: `15`
  static const v60 = 60.0;

  /// Spacing scale unit of 64px
  ///
  /// Equivalent to tailwind spacing scale value: `16`
  static const v64 = 64.0;

  /// Spacing scale unit of 72px
  ///
  /// Equivalent to tailwind spacing scale value: `18`
  static const v72 = 72.0;

  /// Spacing scale unit of 80px
  ///
  /// Equivalent to tailwind spacing scale value: `20`
  static const v80 = 80.0;

  /// Spacing scale unit of 96px
  ///
  /// Equivalent to tailwind spacing scale value: `24`
  static const v96 = 96.0;

  /// Spacing scale unit of 160px
  ///
  /// Equivalent to tailwind spacing scale value: `40`
  static const v160 = 160.0;

  /// Spacing scale unit of 176px
  ///
  /// Equivalent to tailwind spacing scale value: `44`
  static const v176 = 176.0;

  /// Spacing scale unit of 192px
  ///
  /// Equivalent to tailwind spacing scale value: `48`
  static const v192 = 192.0;

  /// Spacing scale unit of 208px
  ///
  /// Equivalent to tailwind spacing scale value: `52`
  static const v208 = 208.0;

  /// Spacing scale unit of 224px
  ///
  /// Equivalent to tailwind spacing scale value: `56`
  static const v224 = 224.0;

  /// Spacing scale unit of 240px
  ///
  /// Equivalent to tailwind spacing scale value: `60`
  static const v240 = 240.0;

  /// Spacing scale unit of 256px
  ///
  /// Equivalent to tailwind spacing scale value: `64`
  static const v256 = 256.0;

  /// Spacing scale unit of 288px
  ///
  /// Equivalent to tailwind spacing scale value: `72`
  static const v288 = 288.0;

  /// Spacing scale unit of 320px
  ///
  /// Equivalent to tailwind spacing scale value: `80`
  static const v320 = 320.0;

  /// Spacing scale unit of 384px
  ///
  /// Equivalent to tailwind spacing scale value: `96`
  static const v384 = 384.0;
}

// =================================================
// CLASS: TRadiusScale
// =================================================

/// Tailwind radius scaling system for rounded shapes.
///
/// See the following link for more information:
///
/// https://tailwindcss.com/docs/border-radius
abstract final class TRadiusScale {
  /// Radius scale unit of 0px
  ///
  /// Equivalent to tailwind radius scale value: `none`
  static const radius_none = 0.0;

  /// Radius scale unit of 2px
  ///
  /// Equivalent to tailwind radius scale value: `sm`
  static const radius_sm = 2.0;

  /// Radius scale unit of 4px
  ///
  /// Equivalent to tailwind radius scale value: `base`
  static const radius = 4.0;

  /// Radius scale unit of 6px
  ///
  /// Equivalent to tailwind radius scale value: `md`
  static const radius_md = 6.0;

  /// Radius scale unit of 8px
  ///
  /// Equivalent to tailwind radius scale value: `lg`
  static const radius_lg = 8.0;

  /// Radius scale unit of 12px
  ///
  /// Equivalent to tailwind radius scale value: `xl`
  static const radius_xl = 12.0;

  /// Radius scale unit of 16px
  ///
  /// Equivalent to tailwind radius scale value: `2xl`
  static const radius_2xl = 16.0;

  /// Radius scale unit of 24px
  ///
  /// Equivalent to tailwind radius scale value: `3xl`
  static const radius_3xl = 24.0;

  /// Radius scale unit of 9999px
  ///
  /// Equivalent to tailwind radius scale value: `full`
  static const radius_full = 9999.0;
}
