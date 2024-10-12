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
  /// Equivalent to Tailwind spacing scale value: `0`
  static const v0 = 0.0;

  /// Spacing scale unit of 1px
  ///
  /// Equivalent to Tailwind spacing scale value: `px`
  static const v1 = 1.0;

  /// Spacing scale unit of 2px
  ///
  /// Equivalent to Tailwind spacing scale value: `0.5`
  static const v2 = 2.0;

  /// Spacing scale unit of 4px
  ///
  /// Equivalent to Tailwind spacing scale value: `1`
  static const v4 = 4.0;

  /// Spacing scale unit of 6px
  ///
  /// Equivalent to Tailwind spacing scale value: `1.5`
  static const v6 = 6.0;

  /// Spacing scale unit of 8px
  ///
  /// Equivalent to Tailwind spacing scale value: `2`
  static const v8 = 8.0;

  /// Spacing scale unit of 10px
  ///
  /// Equivalent to Tailwind spacing scale value: `2.5`
  static const v10 = 10.0;

  /// Spacing scale unit of 12px
  ///
  /// Equivalent to Tailwind spacing scale value: `3`
  static const v12 = 12.0;

  /// Spacing scale unit of 14px
  ///
  /// Equivalent to Tailwind spacing scale value: `3.5`
  static const v14 = 14.0;

  /// Spacing scale unit of 16px
  ///
  /// Equivalent to Tailwind spacing scale value: `4`
  static const v16 = 16.0;

  /// Spacing scale unit of 20px
  ///
  /// Equivalent to Tailwind spacing scale value: `5`
  static const v20 = 20.0;

  /// Spacing scale unit of 24px
  ///
  /// Equivalent to Tailwind spacing scale value: `6`
  static const v24 = 24.0;

  /// Spacing scale unit of 28px
  ///
  /// Equivalent to Tailwind spacing scale value: `7`
  static const v28 = 28.0;

  /// Spacing scale unit of 32px
  ///
  /// Equivalent to Tailwind spacing scale value: `8`
  static const v32 = 32.0;

  /// Spacing scale unit of 36px
  ///
  /// Equivalent to Tailwind spacing scale value: `9`
  static const v36 = 36.0;

  /// Spacing scale unit of 40px
  ///
  /// Equivalent to Tailwind spacing scale value: `10`
  static const v40 = 40.0;

  /// Spacing scale unit of 44px
  ///
  /// Equivalent to Tailwind spacing scale value: `11`
  static const v44 = 44.0;

  /// Spacing scale unit of 48px
  ///
  /// Equivalent to Tailwind spacing scale value: `12`
  static const v48 = 48.0;

  /// Spacing scale unit of 52px
  ///
  /// Equivalent to Tailwind spacing scale value: `13`
  static const v52 = 52.0;

  /// Spacing scale unit of 56px
  ///
  /// Equivalent to Tailwind spacing scale value: `14`
  static const v56 = 56.0;

  /// Spacing scale unit of 60px
  ///
  /// Equivalent to Tailwind spacing scale value: `15`
  static const v60 = 60.0;

  /// Spacing scale unit of 64px
  ///
  /// Equivalent to Tailwind spacing scale value: `16`
  static const v64 = 64.0;

  /// Spacing scale unit of 72px
  ///
  /// Equivalent to Tailwind spacing scale value: `18`
  static const v72 = 72.0;

  /// Spacing scale unit of 80px
  ///
  /// Equivalent to Tailwind spacing scale value: `20`
  static const v80 = 80.0;

  /// Spacing scale unit of 96px
  ///
  /// Equivalent to Tailwind spacing scale value: `24`
  static const v96 = 96.0;

  /// Spacing scale unit of 112px
  ///
  /// Equivalent to Tailwind spacing scale value: `28`
  static const v112 = 112.0;

  /// Spacing scale unit of 128px
  ///
  /// Equivalent to Tailwind spacing scale value: `32`
  static const v128 = 128.0;

  /// Spacing scale unit of 144px
  ///
  /// Equivalent to Tailwind spacing scale value: `36`
  static const v144 = 144.0;

  /// Spacing scale unit of 160px
  ///
  /// Equivalent to Tailwind spacing scale value: `40`
  static const v160 = 160.0;

  /// Spacing scale unit of 176px
  ///
  /// Equivalent to Tailwind spacing scale value: `44`
  static const v176 = 176.0;

  /// Spacing scale unit of 192px
  ///
  /// Equivalent to Tailwind spacing scale value: `48`
  static const v192 = 192.0;

  /// Spacing scale unit of 208px
  ///
  /// Equivalent to Tailwind spacing scale value: `52`
  static const v208 = 208.0;

  /// Spacing scale unit of 224px
  ///
  /// Equivalent to Tailwind spacing scale value: `56`
  static const v224 = 224.0;

  /// Spacing scale unit of 240px
  ///
  /// Equivalent to Tailwind spacing scale value: `60`
  static const v240 = 240.0;

  /// Spacing scale unit of 256px
  ///
  /// Equivalent to Tailwind spacing scale value: `64`
  static const v256 = 256.0;

  /// Spacing scale unit of 288px
  ///
  /// Equivalent to Tailwind spacing scale value: `72`
  static const v288 = 288.0;

  /// Spacing scale unit of 320px
  ///
  /// Equivalent to Tailwind spacing scale value: `80`
  static const v320 = 320.0;

  /// Spacing scale unit of 384px
  ///
  /// Equivalent to Tailwind spacing scale value: `96`
  static const v384 = 384.0;

  /// A complete list of all the Tailwind spacing scale names and values.
  static const Map<String, double> values = {
    'v0': v0,
    'v1': v1,
    'v2': v2,
    'v4': v4,
    'v6': v6,
    'v8': v8,
    'v10': v10,
    'v12': v12,
    'v14': v14,
    'v16': v16,
    'v20': v20,
    'v24': v24,
    'v28': v28,
    'v32': v32,
    'v36': v36,
    'v40': v40,
    'v44': v44,
    'v48': v48,
    'v52': v52,
    'v56': v56,
    'v60': v60,
    'v64': v64,
    'v72': v72,
    'v80': v80,
    'v96': v96,
    'v112': v112,
    'v128': v128,
    'v144': v144,
    'v160': v160,
    'v176': v176,
    'v192': v192,
    'v208': v208,
    'v224': v224,
    'v240': v240,
    'v256': v256,
    'v288': v288,
    'v320': v320,
    'v384': v384,
  };
}

// =================================================
// CLASS: TTextScale
// =================================================

/// Tailwind font size scaling system for text.
///
/// https://tailwindcss.com/docs/font-size
abstract final class TTextScale {
  /// Equivalent to Tailwind font size `text-xs`
  static const text_xs = 12.0;

  /// Equivalent to Tailwind font size `text-sm`
  static const text_sm = 14.0;

  /// Equivalent to Tailwind font size `text-base`
  static const text_base = 16.0;

  /// Equivalent to Tailwind font size `text-lg`
  static const text_lg = 18.0;

  /// Equivalent to Tailwind font size `text-xl`
  static const text_xl = 20.0;

  /// Equivalent to Tailwind font size `text-2xl`
  static const text_2xl = 24.0;

  /// Equivalent to Tailwind font size `text-3xl`
  static const text_3xl = 30.0;

  /// Equivalent to Tailwind font size `text-4xl`
  static const text_4xl = 36.0;

  /// Equivalent to Tailwind font size `text-5xl`
  static const text_5xl = 48.0;

  /// Equivalent to Tailwind font size `text-6xl`
  static const text_6xl = 60.0;

  /// Equivalent to Tailwind font size `text-7xl`
  static const text_7xl = 72.0;

  /// Equivalent to Tailwind font size `text-8xl`
  static const text_8xl = 96.0;

  /// Equivalent to Tailwind font size `text-9xl`
  static const text_9xl = 128.0;
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
  /// Equivalent to Tailwind radius scale value: `none`
  static const radius_none = 0.0;

  /// Radius scale unit of 2px
  ///
  /// Equivalent to Tailwind radius scale value: `sm`
  static const radius_sm = 2.0;

  /// Radius scale unit of 4px
  ///
  /// Equivalent to Tailwind radius scale value: `base`
  static const radius = 4.0;

  /// Radius scale unit of 6px
  ///
  /// Equivalent to Tailwind radius scale value: `md`
  static const radius_md = 6.0;

  /// Radius scale unit of 8px
  ///
  /// Equivalent to Tailwind radius scale value: `lg`
  static const radius_lg = 8.0;

  /// Radius scale unit of 12px
  ///
  /// Equivalent to Tailwind radius scale value: `xl`
  static const radius_xl = 12.0;

  /// Radius scale unit of 16px
  ///
  /// Equivalent to Tailwind radius scale value: `2xl`
  static const radius_2xl = 16.0;

  /// Radius scale unit of 24px
  ///
  /// Equivalent to Tailwind radius scale value: `3xl`
  static const radius_3xl = 24.0;

  /// Radius scale unit of 9999px
  ///
  /// Equivalent to Tailwind radius scale value: `full`
  static const radius_full = 9999.0;
}
