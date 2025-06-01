// Match Tailwind naming conventions for traceability
// ignore_for_file: constant_identifier_names

import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

/// Tailwind screen breakpoints for responsive design.
///
/// https://tailwindcss.com/docs/screens
abstract final class TScreen {
  /// Screen size for extra small devices, starting at 480px (xs)
  static const screen_xs = 480.0;

  /// Screen size for small devices, starting at 640px (sm)
  static const screen_sm = 640.0;

  /// Screen size for medium devices, starting at 768px (md)
  static const screen_md = 768.0;

  /// Screen size for large devices, starting at 1024px (lg)
  static const screen_lg = 1024.0;

  /// Screen size for extra-large devices, starting at 1280px (xl)
  static const screen_xl = 1280.0;

  /// Screen size for extra-extra-large devices, starting at 1536px (2xl)
  static const screen_2xl = 1536.0;

  /// Screen size for full HD screens, starting at 1920px (3xl)
  static const screen_3xl = 1920.0;

  /// Screen size for quad HD screens, starting at 2560px (4xl)
  static const screen_4xl = 2560.0;

  /// Screen size for 4K Ultra HD screens, starting at 3840px (5xl)
  static const screen_5xl = 3840.0;

  /// Max screen width/height equal to [TSpace.v0] (0px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-0`
  static const double max_0 = TSpace.v0;

  /// Max screen width/height equal to [TSpace.v1] (1px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-px`
  static const double max_1 = TSpace.v1;

  /// Max screen width/height equal to [TSpace.v2] (2px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-0.5`
  static const double max_2 = TSpace.v2;

  /// Max screen width/height equal to [TSpace.v4] (4px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-1`
  static const double max_4 = TSpace.v4;

  /// Max screen width/height equal to [TSpace.v6] (6px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-1.5`
  static const double max_6 = TSpace.v6;

  /// Max screen width/height equal to [TSpace.v8] (8px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-2`
  static const double max_8 = TSpace.v8;

  /// Max screen width/height equal to [TSpace.v10] (10px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-2.5`
  static const double max_10 = TSpace.v10;

  /// Max screen width/height equal to [TSpace.v12] (12px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-3`
  static const double max_12 = TSpace.v12;

  /// Max screen width/height equal to [TSpace.v14] (14px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-3.5`
  static const double max_14 = TSpace.v14;

  /// Max screen width/height equal to [TSpace.v16] (16px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-4`
  static const double max_16 = TSpace.v16;

  /// Max screen width/height equal to [TSpace.v20] (20px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-5`
  static const double max_20 = TSpace.v20;

  /// Max screen width/height equal to [TSpace.v24] (24px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-6`
  static const double max_24 = TSpace.v24;

  /// Max screen width/height equal to [TSpace.v28] (28px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-7`
  static const double max_28 = TSpace.v28;

  /// Max screen width/height equal to [TSpace.v32] (32px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-8`
  static const double max_32 = TSpace.v32;

  /// Max screen width/height equal to [TSpace.v36] (36px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-9`
  static const double max_36 = TSpace.v36;

  /// Max screen width/height equal to [TSpace.v40] (40px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-10`
  static const double max_40 = TSpace.v40;

  /// Max screen width/height equal to [TSpace.v44] (44px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-11`
  static const double max_44 = TSpace.v44;

  /// Max screen width/height equal to [TSpace.v48] (48px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-12`
  static const double max_48 = TSpace.v48;

  /// Max screen width/height equal to [TSpace.v56] (56px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-14`
  static const double max_56 = TSpace.v56;

  /// Max screen width/height equal to [TSpace.v64] (64px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-16`
  static const double max_64 = TSpace.v64;

  /// Max screen width/height equal to [TSpace.v80] (80px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-20`
  static const double max_80 = TSpace.v80;

  /// Max screen width/height equal to [TSpace.v96] (96px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-24`
  static const double max_96 = TSpace.v96;

  /// Max screen width/height equal to [TSpace.v112] (112px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-28`
  static const double max_112 = TSpace.v112;

  /// Max screen width/height equal to [TSpace.v128] (128px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-32`
  static const double max_128 = TSpace.v128;

  /// Max screen width/height equal to [TSpace.v144] (144px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-36`
  static const double max_144 = TSpace.v144;

  /// Max screen width/height equal to [TSpace.v160] (160px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-40`
  static const double max_160 = TSpace.v160;

  /// Max screen width/height equal to [TSpace.v176] (176px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-44`
  static const double max_176 = TSpace.v176;

  /// Max screen width/height equal to [TSpace.v192] (192px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-48`
  static const double max_192 = TSpace.v192;

  /// Max screen width/height equal to [TSpace.v208] (208px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-52`
  static const double max_208 = TSpace.v208;

  /// Max screen width/height equal to [TSpace.v224] (224px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-56`
  static const double max_224 = TSpace.v224;

  /// Max screen width/height equal to [TSpace.v240] (240px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-60`
  static const double max_240 = TSpace.v240;

  /// Max screen width/height equal to [TSpace.v256] (256px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-64`
  static const double max_256 = TSpace.v256;

  /// Max screen width/height equal to [TSpace.v288] (288px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-72`
  static const double max_288 = TSpace.v288;

  /// Max screen width/height equal to [TSpace.v320] (320px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-80`
  static const double max_320 = TSpace.v320;

  /// Max screen width/height equal to [TSpace.v384] (384px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-96`
  static const double max_384 = TSpace.v384;

  /// Max screen width/height of 20rem (320px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-xs`
  static const max_xs = 320.0;

  /// Max screen width/height of 24rem (384px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-sm`
  static const max_sm = 384.0;

  /// Max screen width/height of 28rem (448px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-md`
  static const max_md = 448.0;

  /// Max screen width/height of 32rem (512px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-lg`
  static const max_lg = 512.0;

  /// Max screen width/height of 36rem (576px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-xl`
  static const max_xl = 576.0;

  /// Max screen width/height of 42rem (672px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-2xl`
  static const max_2xl = 672.0;

  /// Max screen width/height of 48rem (768px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-3xl`
  static const max_3xl = 768.0;

  /// Max screen width/height of 56rem (896px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-4xl`
  static const max_4xl = 896.0;

  /// Max screen width/height of 64rem (1024px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-5xl`
  static const max_5xl = 1024.0;

  /// Max screen width/height of 72rem (1152px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-6xl`
  static const max_6xl = 1152.0;

  /// Max screen width/height of 80rem (1280px)
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-7xl`
  static const max_7xl = 1280.0;

  /// Max screen width/height of 100%
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-full`
  static const double max_full = double.infinity;

  /// Max screen width/height of none
  ///
  /// Equivalent to Tailwind max width value: `max-w/h-none`
  static const double max_none = double.infinity;
}
