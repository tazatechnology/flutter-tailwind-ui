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

  /// Max screen width equal to [TSpacingScale.v0] (0px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-0`
  static const max_w_0 = TSpacingScale.v0;

  /// Max screen width equal to [TSpacingScale.v1] (1px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-px`
  static const max_w_1 = TSpacingScale.v1;

  /// Max screen width equal to [TSpacingScale.v2] (2px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-0.5`
  static const max_w_2 = TSpacingScale.v2;

  /// Max screen width equal to [TSpacingScale.v4] (4px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-1`
  static const max_w_4 = TSpacingScale.v4;

  /// Max screen width equal to [TSpacingScale.v6] (6px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-1.5`
  static const max_w_6 = TSpacingScale.v6;

  /// Max screen width equal to [TSpacingScale.v8] (8px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-2`
  static const max_w_8 = TSpacingScale.v8;

  /// Max screen width equal to [TSpacingScale.v10] (10px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-2.5`
  static const max_w_10 = TSpacingScale.v10;

  /// Max screen width equal to [TSpacingScale.v12] (12px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-3`
  static const max_w_12 = TSpacingScale.v12;

  /// Max screen width equal to [TSpacingScale.v14] (14px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-3.5`
  static const max_w_14 = TSpacingScale.v14;

  /// Max screen width equal to [TSpacingScale.v16] (16px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-4`
  static const max_w_16 = TSpacingScale.v16;

  /// Max screen width equal to [TSpacingScale.v20] (20px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-5`
  static const max_w_20 = TSpacingScale.v20;

  /// Max screen width equal to [TSpacingScale.v24] (24px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-6`
  static const max_w_24 = TSpacingScale.v24;

  /// Max screen width equal to [TSpacingScale.v28] (28px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-7`
  static const max_w_28 = TSpacingScale.v28;

  /// Max screen width equal to [TSpacingScale.v32] (32px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-8`
  static const max_w_32 = TSpacingScale.v32;

  /// Max screen width equal to [TSpacingScale.v36] (36px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-9`
  static const max_w_36 = TSpacingScale.v36;

  /// Max screen width equal to [TSpacingScale.v40] (40px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-10`
  static const max_w_40 = TSpacingScale.v40;

  /// Max screen width equal to [TSpacingScale.v44] (44px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-11`
  static const max_w_44 = TSpacingScale.v44;

  /// Max screen width equal to [TSpacingScale.v48] (48px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-12`
  static const max_w_48 = TSpacingScale.v48;

  /// Max screen width equal to [TSpacingScale.v56] (56px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-14`
  static const max_w_56 = TSpacingScale.v56;

  /// Max screen width equal to [TSpacingScale.v64] (64px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-16`
  static const max_w_64 = TSpacingScale.v64;

  /// Max screen width equal to [TSpacingScale.v80] (80px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-20`
  static const max_w_80 = TSpacingScale.v80;

  /// Max screen width equal to [TSpacingScale.v96] (96px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-24`
  static const max_w_96 = TSpacingScale.v96;

  /// Max screen width equal to [TSpacingScale.v112] (112px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-28`
  static const max_w_112 = TSpacingScale.v112;

  /// Max screen width equal to [TSpacingScale.v128] (128px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-32`
  static const max_w_128 = TSpacingScale.v128;

  /// Max screen width equal to [TSpacingScale.v144] (144px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-36`
  static const max_w_144 = TSpacingScale.v144;

  /// Max screen width equal to [TSpacingScale.v160] (160px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-40`
  static const max_w_160 = TSpacingScale.v160;

  /// Max screen width equal to [TSpacingScale.v176] (176px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-44`
  static const max_w_176 = TSpacingScale.v176;

  /// Max screen width equal to [TSpacingScale.v192] (192px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-48`
  static const max_w_192 = TSpacingScale.v192;

  /// Max screen width equal to [TSpacingScale.v208] (208px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-52`
  static const max_w_208 = TSpacingScale.v208;

  /// Max screen width equal to [TSpacingScale.v224] (224px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-56`
  static const max_w_224 = TSpacingScale.v224;

  /// Max screen width equal to [TSpacingScale.v240] (240px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-60`
  static const max_w_240 = TSpacingScale.v240;

  /// Max screen width equal to [TSpacingScale.v256] (256px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-64`
  static const max_w_256 = TSpacingScale.v256;

  /// Max screen width equal to [TSpacingScale.v288] (288px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-72`
  static const max_w_288 = TSpacingScale.v288;

  /// Max screen width equal to [TSpacingScale.v320] (320px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-80`
  static const max_w_320 = TSpacingScale.v320;

  /// Max screen width equal to [TSpacingScale.v384] (384px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-96`
  static const max_w_384 = TSpacingScale.v384;

  /// Max screen width of none
  ///
  /// Equivalent to Tailwind max width value: `max-w-none`
  static const max_w_none = double.infinity;

  /// Max screen width of 20rem (320px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-xs`
  static const max_w_xs = 320.0;

  /// Max screen width of 24rem (384px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-sm`
  static const max_w_sm = 384.0;

  /// Max screen width of 28rem (448px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-md`
  static const max_w_md = 448.0;

  /// Max screen width of 32rem (512px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-lg`
  static const max_w_lg = 512.0;

  /// Max screen width of 36rem (576px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-xl`
  static const max_w_xl = 576.0;

  /// Max screen width of 42rem (672px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-2xl`
  static const max_w_2xl = 672.0;

  /// Max screen width of 48rem (768px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-3xl`
  static const max_w_3xl = 768.0;

  /// Max screen width of 56rem (896px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-4xl`
  static const max_w_4xl = 896.0;

  /// Max screen width of 64rem (1024px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-5xl`
  static const max_w_5xl = 1024.0;

  /// Max screen width of 72rem (1152px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-6xl`
  static const max_w_6xl = 1152.0;

  /// Max screen width of 80rem (1280px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-7xl`
  static const max_w_7xl = 1280.0;

  /// Max screen width of 100%
  ///
  /// Equivalent to Tailwind max width value: `max-w-full`
  static const max_w_full = double.infinity;

  /// Max screen width equal to screen breakpoint [TScreen.screen_sm] (640px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-screen-sm`
  static const max_w_screen_sm = screen_sm;

  /// Max screen width equal to screen breakpoint [TScreen.screen_md] (768px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-screen-md`
  static const max_w_screen_md = screen_md;

  /// Max screen width equal to screen breakpoint [TScreen.screen_lg] (1024px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-screen-lg`
  static const max_w_screen_lg = screen_lg;

  /// Max screen width equal to screen breakpoint [TScreen.screen_xl] (1280px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-screen-xl`
  static const max_w_screen_xl = screen_xl;

  /// Max screen width equal to screen breakpoint [TScreen.screen_2xl] (1536px)
  ///
  /// Equivalent to Tailwind max width value: `max-w-screen-2xl`
  static const max_w_screen_2xl = screen_2xl;
}
