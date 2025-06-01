import 'package:flutter/rendering.dart';

import 'package:flutter_tailwind_ui/src/constants/space.dart';

// =============================================================================
// CLASS: TOffset
// =============================================================================

/// [EdgeInsets] for padding and margin based on Tailwind scaling system.
///
/// Scaling system is based on the increments defined in [TSpace].
///
/// https://tailwindcss.com/docs/customizing-spacing
abstract final class TOffset {
  /// Offset of zero on all sides (0px)
  ///
  /// Equivalent to EdgeInsets.zero and Tailwind padding class: `p-0`
  static const EdgeInsets zero = EdgeInsets.zero;

  // ---------------------------------------------------------------------------
  // All Side Offset
  // ---------------------------------------------------------------------------

  /// Creates [EdgeInsets] with the given value for all sides.
  static EdgeInsets a(double value) => EdgeInsets.all(value);

  /// Offset of [TSpace.v0] on all sides (0px)
  ///
  /// Equivalent to Tailwind padding class: `p-0`
  static const EdgeInsets a0 = EdgeInsets.zero;

  /// Offset of [TSpace.v1] on all sides (1px)
  ///
  /// Equivalent to Tailwind padding class: `p-px`
  static const a1 = EdgeInsets.all(TSpace.v1);

  /// Offset of [TSpace.v2] on all sides (2px)
  ///
  /// Equivalent to Tailwind padding class: `p-0.5`
  static const a2 = EdgeInsets.all(TSpace.v2);

  /// Offset of [TSpace.v4] on all sides (4px)
  ///
  /// Equivalent to Tailwind padding class: `p-1`
  static const a4 = EdgeInsets.all(TSpace.v4);

  /// Offset of [TSpace.v6] on all sides (6px)
  ///
  /// Equivalent to Tailwind padding class: `p-1.5`
  static const a6 = EdgeInsets.all(TSpace.v6);

  /// Offset of [TSpace.v8] on all sides (8px)
  ///
  /// Equivalent to Tailwind padding class: `p-2`
  static const a8 = EdgeInsets.all(TSpace.v8);

  /// Offset of [TSpace.v10] on all sides (10px)
  ///
  /// Equivalent to Tailwind padding class: `p-2.5`
  static const a10 = EdgeInsets.all(TSpace.v10);

  /// Offset of [TSpace.v12] on all sides (12px)
  ///
  /// Equivalent to Tailwind padding class: `p-3`
  static const a12 = EdgeInsets.all(TSpace.v12);

  /// Offset of [TSpace.v14] on all sides (14px)
  ///
  /// Equivalent to Tailwind padding class: `p-3.5`
  static const a14 = EdgeInsets.all(TSpace.v14);

  /// Offset of [TSpace.v16] on all sides (16px)
  ///
  /// Equivalent to Tailwind padding class: `p-4`
  static const a16 = EdgeInsets.all(TSpace.v16);

  /// Offset of [TSpace.v20] on all sides (20px)
  ///
  /// Equivalent to Tailwind padding class: `p-5`
  static const a20 = EdgeInsets.all(TSpace.v20);

  /// Offset of [TSpace.v24] on all sides (24px)
  ///
  /// Equivalent to Tailwind padding class: `p-6`
  static const a24 = EdgeInsets.all(TSpace.v24);

  /// Offset of [TSpace.v28] on all sides (28px)
  ///
  /// Equivalent to Tailwind padding class: `p-7`
  static const a28 = EdgeInsets.all(TSpace.v28);

  /// Offset of [TSpace.v32] on all sides (32px)
  ///
  /// Equivalent to Tailwind padding class: `p-8`
  static const a32 = EdgeInsets.all(TSpace.v32);

  /// Offset of [TSpace.v36] on all sides (36px)
  ///
  /// Equivalent to Tailwind padding class: `p-9`
  static const a36 = EdgeInsets.all(TSpace.v36);

  /// Offset of [TSpace.v40] on all sides (40px)
  ///
  /// Equivalent to Tailwind padding class: `p-10`
  static const a40 = EdgeInsets.all(TSpace.v40);

  /// Offset of [TSpace.v44] on all sides (44px)
  ///
  /// Equivalent to Tailwind padding class: `p-11`
  static const a44 = EdgeInsets.all(TSpace.v44);

  /// Offset of [TSpace.v48] on all sides (48px)
  ///
  /// Equivalent to Tailwind padding class: `p-12`
  static const a48 = EdgeInsets.all(TSpace.v48);

  /// Offset of [TSpace.v52] on all sides (52px)
  ///
  /// Equivalent to Tailwind padding class: `p-13`
  static const a52 = EdgeInsets.all(TSpace.v52);

  /// Offset of [TSpace.v56] on all sides (56px)
  ///
  /// Equivalent to Tailwind padding class: `p-14`
  static const a56 = EdgeInsets.all(TSpace.v56);

  /// Offset of [TSpace.v60] on all sides (60px)
  ///
  /// Equivalent to Tailwind padding class: `p-15`
  static const a60 = EdgeInsets.all(TSpace.v60);

  /// Offset of [TSpace.v64] on all sides (64px)
  ///
  /// Equivalent to Tailwind padding class: `p-16`
  static const a64 = EdgeInsets.all(TSpace.v64);

  /// Offset of [TSpace.v72] on all sides (72px)
  ///
  /// Equivalent to Tailwind padding class: `p-18`
  static const a72 = EdgeInsets.all(TSpace.v72);

  /// Offset of [TSpace.v80] on all sides (80px)
  ///
  /// Equivalent to Tailwind padding class: `p-20`
  static const a80 = EdgeInsets.all(TSpace.v80);

  /// Offset of [TSpace.v96] on all sides (96px)
  ///
  /// Equivalent to Tailwind padding class: `p-24`
  static const a96 = EdgeInsets.all(TSpace.v96);

  /// Offset of [TSpace.v160] on all sides (160px)
  ///
  /// Equivalent to Tailwind padding class: `p-40`
  static const a160 = EdgeInsets.all(TSpace.v160);

  /// Offset of [TSpace.v176] on all sides (176px)
  ///
  /// Equivalent to Tailwind padding class: `p-44`
  static const a176 = EdgeInsets.all(TSpace.v176);

  /// Offset of [TSpace.v192] on all sides (192px)
  ///
  /// Equivalent to Tailwind padding class: `p-48`
  static const a192 = EdgeInsets.all(TSpace.v192);

  /// Offset of [TSpace.v208] on all sides (208px)
  ///
  /// Equivalent to Tailwind padding class: `p-52`
  static const a208 = EdgeInsets.all(TSpace.v208);

  /// Offset of [TSpace.v224] on all sides (224px)
  ///
  /// Equivalent to Tailwind padding class: `p-56`
  static const a224 = EdgeInsets.all(TSpace.v224);

  /// Offset of [TSpace.v240] on all sides (240px)
  ///
  /// Equivalent to Tailwind padding class: `p-60`
  static const a240 = EdgeInsets.all(TSpace.v240);

  /// Offset of [TSpace.v256] on all sides (256px)
  ///
  /// Equivalent to Tailwind padding class: `p-64`
  static const a256 = EdgeInsets.all(TSpace.v256);

  /// Offset of [TSpace.v288] on all sides (288px)
  ///
  /// Equivalent to Tailwind padding class: `p-72`
  static const a288 = EdgeInsets.all(TSpace.v288);

  /// Offset of [TSpace.v320] on all sides (320px)
  ///
  /// Equivalent to Tailwind padding class: `p-80`
  static const a320 = EdgeInsets.all(TSpace.v320);

  /// Offset of [TSpace.v384] on all sides (384px)
  ///
  /// Equivalent to Tailwind padding class: `p-96`
  static const a384 = EdgeInsets.all(TSpace.v384);

  // ---------------------------------------------------------------------------
  // Horizontal Offset
  // ---------------------------------------------------------------------------

  /// Creates [EdgeInsets] with the given value in the horizontal direction.
  static EdgeInsets x(double value) => EdgeInsets.symmetric(horizontal: value);

  /// Offset of [TSpace.v0] on the left and right sides (0px)
  ///
  /// Equivalent to Tailwind padding class: `px-0`
  static const EdgeInsets x0 = EdgeInsets.zero;

  /// Offset of [TSpace.v1] on the left and right sides (1px)
  ///
  /// Equivalent to Tailwind padding class: `px-px`
  static const x1 = EdgeInsets.symmetric(horizontal: TSpace.v1);

  /// Offset of [TSpace.v2] on the left and right sides (2px)
  ///
  /// Equivalent to Tailwind padding class: `px-0.5`
  static const x2 = EdgeInsets.symmetric(horizontal: TSpace.v2);

  /// Offset of [TSpace.v4] on the left and right sides (4px)
  ///
  /// Equivalent to Tailwind padding class: `px-1`
  static const x4 = EdgeInsets.symmetric(horizontal: TSpace.v4);

  /// Offset of [TSpace.v6] on the left and right sides (6px)
  ///
  /// Equivalent to Tailwind padding class: `px-1.5`
  static const x6 = EdgeInsets.symmetric(horizontal: TSpace.v6);

  /// Offset of [TSpace.v8] on the left and right sides (8px)
  ///
  /// Equivalent to Tailwind padding class: `px-2`
  static const x8 = EdgeInsets.symmetric(horizontal: TSpace.v8);

  /// Offset of [TSpace.v10] on the left and right sides (10px)
  ///
  /// Equivalent to Tailwind padding class: `px-2.5`
  static const x10 = EdgeInsets.symmetric(horizontal: TSpace.v10);

  /// Offset of [TSpace.v12] on the left and right sides (12px)
  ///
  /// Equivalent to Tailwind padding class: `px-3`
  static const x12 = EdgeInsets.symmetric(horizontal: TSpace.v12);

  /// Offset of [TSpace.v14] on the left and right sides (14px)
  ///
  /// Equivalent to Tailwind padding class: `px-3.5`
  static const x14 = EdgeInsets.symmetric(horizontal: TSpace.v14);

  /// Offset of [TSpace.v16] on the left and right sides (16px)
  ///
  /// Equivalent to Tailwind padding class: `px-4`
  static const x16 = EdgeInsets.symmetric(horizontal: TSpace.v16);

  /// Offset of [TSpace.v20] on the left and right sides (20px)
  ///
  /// Equivalent to Tailwind padding class: `px-5`
  static const x20 = EdgeInsets.symmetric(horizontal: TSpace.v20);

  /// Offset of [TSpace.v24] on the left and right sides (24px)
  ///
  /// Equivalent to Tailwind padding class: `px-6`
  static const x24 = EdgeInsets.symmetric(horizontal: TSpace.v24);

  /// Offset of [TSpace.v28] on the left and right sides (28px)
  ///
  /// Equivalent to Tailwind padding class: `px-7`
  static const x28 = EdgeInsets.symmetric(horizontal: TSpace.v28);

  /// Offset of [TSpace.v32] on the left and right sides (32px)
  ///
  /// Equivalent to Tailwind padding class: `px-8`
  static const x32 = EdgeInsets.symmetric(horizontal: TSpace.v32);

  /// Offset of [TSpace.v36] on the left and right sides (36px)
  ///
  /// Equivalent to Tailwind padding class: `px-9`
  static const x36 = EdgeInsets.symmetric(horizontal: TSpace.v36);

  /// Offset of [TSpace.v40] on the left and right sides (40px)
  ///
  /// Equivalent to Tailwind padding class: `px-10`
  static const x40 = EdgeInsets.symmetric(horizontal: TSpace.v40);

  /// Offset of [TSpace.v44] on the left and right sides (44px)
  ///
  /// Equivalent to Tailwind padding class: `px-11`
  static const x44 = EdgeInsets.symmetric(horizontal: TSpace.v44);

  /// Offset of [TSpace.v48] on the left and right sides (48px)
  ///
  /// Equivalent to Tailwind padding class: `px-12`
  static const x48 = EdgeInsets.symmetric(horizontal: TSpace.v48);

  /// Offset of [TSpace.v52] on the left and right sides (52px)
  ///
  /// Equivalent to Tailwind padding class: `px-13`
  static const x52 = EdgeInsets.symmetric(horizontal: TSpace.v52);

  /// Offset of [TSpace.v56] on the left and right sides (56px)
  ///
  /// Equivalent to Tailwind padding class: `px-14`
  static const x56 = EdgeInsets.symmetric(horizontal: TSpace.v56);

  /// Offset of [TSpace.v60] on the left and right sides (60px)
  ///
  /// Equivalent to Tailwind padding class: `px-15`
  static const x60 = EdgeInsets.symmetric(horizontal: TSpace.v60);

  /// Offset of [TSpace.v64] on the left and right sides (64px)
  ///
  /// Equivalent to Tailwind padding class: `px-16`
  static const x64 = EdgeInsets.symmetric(horizontal: TSpace.v64);

  /// Offset of [TSpace.v72] on the left and right sides (72px)
  ///
  /// Equivalent to Tailwind padding class: `px-18`
  static const x72 = EdgeInsets.symmetric(horizontal: TSpace.v72);

  /// Offset of [TSpace.v80] on the left and right sides (80px)
  ///
  /// Equivalent to Tailwind padding class: `px-20`
  static const x80 = EdgeInsets.symmetric(horizontal: TSpace.v80);

  /// Offset of [TSpace.v96] on the left and right sides (96px)
  ///
  /// Equivalent to Tailwind padding class: `px-24`
  static const x96 = EdgeInsets.symmetric(horizontal: TSpace.v96);

  /// Offset of [TSpace.v160] on the left and right sides (160px)
  ///
  /// Equivalent to Tailwind padding class: `px-40`
  static const x160 = EdgeInsets.symmetric(horizontal: TSpace.v160);

  /// Offset of [TSpace.v176] on the left and right sides (176px)
  ///
  /// Equivalent to Tailwind padding class: `px-44`
  static const x176 = EdgeInsets.symmetric(horizontal: TSpace.v176);

  /// Offset of [TSpace.v192] on the left and right sides (192px)
  ///
  /// Equivalent to Tailwind padding class: `px-48`
  static const x192 = EdgeInsets.symmetric(horizontal: TSpace.v192);

  /// Offset of [TSpace.v208] on the left and right sides (208px)
  ///
  /// Equivalent to Tailwind padding class: `px-52`
  static const x208 = EdgeInsets.symmetric(horizontal: TSpace.v208);

  /// Offset of [TSpace.v224] on the left and right sides (224px)
  ///
  /// Equivalent to Tailwind padding class: `px-56`
  static const x224 = EdgeInsets.symmetric(horizontal: TSpace.v224);

  /// Offset of [TSpace.v240] on the left and right sides (240px)
  ///
  /// Equivalent to Tailwind padding class: `px-60`
  static const x240 = EdgeInsets.symmetric(horizontal: TSpace.v240);

  /// Offset of [TSpace.v256] on the left and right sides (256px)
  ///
  /// Equivalent to Tailwind padding class: `px-64`
  static const x256 = EdgeInsets.symmetric(horizontal: TSpace.v256);

  /// Offset of [TSpace.v288] on the left and right sides (288px)
  ///
  /// Equivalent to Tailwind padding class: `px-72`
  static const x288 = EdgeInsets.symmetric(horizontal: TSpace.v288);

  /// Offset of [TSpace.v320] on the left and right sides (320px)
  ///
  /// Equivalent to Tailwind padding class: `px-80`
  static const x320 = EdgeInsets.symmetric(horizontal: TSpace.v320);

  /// Offset of [TSpace.v384] on the left and right sides (384px)
  ///
  /// Equivalent to Tailwind padding class: `px-96`
  static const x384 = EdgeInsets.symmetric(horizontal: TSpace.v384);

  // ---------------------------------------------------------------------------
  // Vertical Offset
  // ---------------------------------------------------------------------------

  /// Creates [EdgeInsets] with the given value in the vertical direction.
  static EdgeInsets y(double value) => EdgeInsets.symmetric(vertical: value);

  /// Offset of [TSpace.v0] on the top and bottom sides (0px)
  ///
  /// Equivalent to Tailwind padding class: `py-0`
  static const EdgeInsets y0 = EdgeInsets.zero;

  /// Offset of [TSpace.v1] on the top and bottom sides (1px)
  ///
  /// Equivalent to Tailwind padding class: `py-px`
  static const y1 = EdgeInsets.symmetric(vertical: TSpace.v1);

  /// Offset of [TSpace.v2] on the top and bottom sides (2px)
  ///
  /// Equivalent to Tailwind padding class: `py-0.5`
  static const y2 = EdgeInsets.symmetric(vertical: TSpace.v2);

  /// Offset of [TSpace.v4] on the top and bottom sides (4px)
  ///
  /// Equivalent to Tailwind padding class: `py-1`
  static const y4 = EdgeInsets.symmetric(vertical: TSpace.v4);

  /// Offset of [TSpace.v6] on the top and bottom sides (6px)
  ///
  /// Equivalent to Tailwind padding class: `py-1.5`
  static const y6 = EdgeInsets.symmetric(vertical: TSpace.v6);

  /// Offset of [TSpace.v8] on the top and bottom sides (8px)
  ///
  /// Equivalent to Tailwind padding class: `py-2`
  static const y8 = EdgeInsets.symmetric(vertical: TSpace.v8);

  /// Offset of [TSpace.v10] on the top and bottom sides (10px)
  ///
  /// Equivalent to Tailwind padding class: `py-2.5`
  static const y10 = EdgeInsets.symmetric(vertical: TSpace.v10);

  /// Offset of [TSpace.v12] on the top and bottom sides (12px)
  ///
  /// Equivalent to Tailwind padding class: `py-3`
  static const y12 = EdgeInsets.symmetric(vertical: TSpace.v12);

  /// Offset of [TSpace.v14] on the top and bottom sides (14px)
  ///
  /// Equivalent to Tailwind padding class: `py-3.5`
  static const y14 = EdgeInsets.symmetric(vertical: TSpace.v14);

  /// Offset of [TSpace.v16] on the top and bottom sides (16px)
  ///
  /// Equivalent to Tailwind padding class: `py-4`
  static const y16 = EdgeInsets.symmetric(vertical: TSpace.v16);

  /// Offset of [TSpace.v20] on the top and bottom sides (20px)
  ///
  /// Equivalent to Tailwind padding class: `py-5`
  static const y20 = EdgeInsets.symmetric(vertical: TSpace.v20);

  /// Offset of [TSpace.v24] on the top and bottom sides (24px)
  ///
  /// Equivalent to Tailwind padding class: `py-6`
  static const y24 = EdgeInsets.symmetric(vertical: TSpace.v24);

  /// Offset of [TSpace.v28] on the top and bottom sides (28px)
  ///
  /// Equivalent to Tailwind padding class: `py-7`
  static const y28 = EdgeInsets.symmetric(vertical: TSpace.v28);

  /// Offset of [TSpace.v32] on the top and bottom sides (32px)
  ///
  /// Equivalent to Tailwind padding class: `py-8`
  static const y32 = EdgeInsets.symmetric(vertical: TSpace.v32);

  /// Offset of [TSpace.v36] on the top and bottom sides (36px)
  ///
  /// Equivalent to Tailwind padding class: `py-9`
  static const y36 = EdgeInsets.symmetric(vertical: TSpace.v36);

  /// Offset of [TSpace.v40] on the top and bottom sides (40px)
  ///
  /// Equivalent to Tailwind padding class: `py-10`
  static const y40 = EdgeInsets.symmetric(vertical: TSpace.v40);

  /// Offset of [TSpace.v44] on the top and bottom sides (44px)
  ///
  /// Equivalent to Tailwind padding class: `py-11`
  static const y44 = EdgeInsets.symmetric(vertical: TSpace.v44);

  /// Offset of [TSpace.v48] on the top and bottom sides (48px)
  ///
  /// Equivalent to Tailwind padding class: `py-12`
  static const y48 = EdgeInsets.symmetric(vertical: TSpace.v48);

  /// Offset of [TSpace.v52] on the top and bottom sides (52px)
  ///
  /// Equivalent to Tailwind padding class: `py-13`
  static const y52 = EdgeInsets.symmetric(vertical: TSpace.v52);

  /// Offset of [TSpace.v56] on the top and bottom sides (56px)
  ///
  /// Equivalent to Tailwind padding class: `py-14`
  static const y56 = EdgeInsets.symmetric(vertical: TSpace.v56);

  /// Offset of [TSpace.v60] on the top and bottom sides (60px)
  ///
  /// Equivalent to Tailwind padding class: `py-15`
  static const y60 = EdgeInsets.symmetric(vertical: TSpace.v60);

  /// Offset of [TSpace.v64] on the top and bottom sides (64px)
  ///
  /// Equivalent to Tailwind padding class: `py-16`
  static const y64 = EdgeInsets.symmetric(vertical: TSpace.v64);

  /// Offset of [TSpace.v72] on the top and bottom sides (72px)
  ///
  /// Equivalent to Tailwind padding class: `py-18`
  static const y72 = EdgeInsets.symmetric(vertical: TSpace.v72);

  /// Offset of [TSpace.v80] on the top and bottom sides (80px)
  ///
  /// Equivalent to Tailwind padding class: `py-20`
  static const y80 = EdgeInsets.symmetric(vertical: TSpace.v80);

  /// Offset of [TSpace.v96] on the top and bottom sides (96px)
  ///
  /// Equivalent to Tailwind padding class: `py-24`
  static const y96 = EdgeInsets.symmetric(vertical: TSpace.v96);

  /// Offset of [TSpace.v160] on the top and bottom sides (160px)
  ///
  /// Equivalent to Tailwind padding class: `py-40`
  static const y160 = EdgeInsets.symmetric(vertical: TSpace.v160);

  /// Offset of [TSpace.v176] on the top and bottom sides (176px)
  ///
  /// Equivalent to Tailwind padding class: `py-44`
  static const y176 = EdgeInsets.symmetric(vertical: TSpace.v176);

  /// Offset of [TSpace.v192] on the top and bottom sides (192px)
  ///
  /// Equivalent to Tailwind padding class: `py-48`
  static const y192 = EdgeInsets.symmetric(vertical: TSpace.v192);

  /// Offset of [TSpace.v208] on the top and bottom sides (208px)
  ///
  /// Equivalent to Tailwind padding class: `py-52`
  static const y208 = EdgeInsets.symmetric(vertical: TSpace.v208);

  /// Offset of [TSpace.v224] on the top and bottom sides (224px)
  ///
  /// Equivalent to Tailwind padding class: `py-56`
  static const y224 = EdgeInsets.symmetric(vertical: TSpace.v224);

  /// Offset of [TSpace.v240] on the top and bottom sides (240px)
  ///
  /// Equivalent to Tailwind padding class: `py-60`
  static const y240 = EdgeInsets.symmetric(vertical: TSpace.v240);

  /// Offset of [TSpace.v256] on the top and bottom sides (256px)
  ///
  /// Equivalent to Tailwind padding class: `py-64`
  static const y256 = EdgeInsets.symmetric(vertical: TSpace.v256);

  /// Offset of [TSpace.v288] on the top and bottom sides (288px)
  ///
  /// Equivalent to Tailwind padding class: `py-72`
  static const y288 = EdgeInsets.symmetric(vertical: TSpace.v288);

  /// Offset of [TSpace.v320] on the top and bottom sides (320px)
  ///
  /// Equivalent to Tailwind padding class: `py-80`
  static const y320 = EdgeInsets.symmetric(vertical: TSpace.v320);

  /// Offset of [TSpace.v384] on the top and bottom sides (384px)
  ///
  /// Equivalent to Tailwind padding class: `py-96`
  static const y384 = EdgeInsets.symmetric(vertical: TSpace.v384);

  // ---------------------------------------------------------------------------
  // Left Side Offset
  // ---------------------------------------------------------------------------

  /// Creates [EdgeInsets] with only the given value on the left side.
  static EdgeInsets l(double value) => EdgeInsets.only(left: value);

  /// Offset of [TSpace.v0] on the left side (0px)
  ///
  /// Equivalent to Tailwind padding class: `pl-0`
  static const EdgeInsets l0 = EdgeInsets.zero;

  /// Offset of [TSpace.v1] on the left side (1px)
  ///
  /// Equivalent to Tailwind padding class: `pl-px`
  static const l1 = EdgeInsets.only(left: TSpace.v1);

  /// Offset of [TSpace.v2] on the left side (2px)
  ///
  /// Equivalent to Tailwind padding class: `pl-0.5`
  static const l2 = EdgeInsets.only(left: TSpace.v2);

  /// Offset of [TSpace.v4] on the left side (4px)
  ///
  /// Equivalent to Tailwind padding class: `pl-1`
  static const l4 = EdgeInsets.only(left: TSpace.v4);

  /// Offset of [TSpace.v6] on the left side (6px)
  ///
  /// Equivalent to Tailwind padding class: `pl-1.5`
  static const l6 = EdgeInsets.only(left: TSpace.v6);

  /// Offset of [TSpace.v8] on the left side (8px)
  ///
  /// Equivalent to Tailwind padding class: `pl-2`
  static const l8 = EdgeInsets.only(left: TSpace.v8);

  /// Offset of [TSpace.v10] on the left side (10px)
  ///
  /// Equivalent to Tailwind padding class: `pl-2.5`
  static const l10 = EdgeInsets.only(left: TSpace.v10);

  /// Offset of [TSpace.v12] on the left side (12px)
  ///
  /// Equivalent to Tailwind padding class: `pl-3`
  static const l12 = EdgeInsets.only(left: TSpace.v12);

  /// Offset of [TSpace.v14] on the left side (14px)
  ///
  /// Equivalent to Tailwind padding class: `pl-3.5`
  static const l14 = EdgeInsets.only(left: TSpace.v14);

  /// Offset of [TSpace.v16] on the left side (16px)
  ///
  /// Equivalent to Tailwind padding class: `pl-4`
  static const l16 = EdgeInsets.only(left: TSpace.v16);

  /// Offset of [TSpace.v20] on the left side (20px)
  ///
  /// Equivalent to Tailwind padding class: `pl-5`
  static const l20 = EdgeInsets.only(left: TSpace.v20);

  /// Offset of [TSpace.v24] on the left side (24px)
  ///
  /// Equivalent to Tailwind padding class: `pl-6`
  static const l24 = EdgeInsets.only(left: TSpace.v24);

  /// Offset of [TSpace.v28] on the left side (28px)
  ///
  /// Equivalent to Tailwind padding class: `pl-7`
  static const l28 = EdgeInsets.only(left: TSpace.v28);

  /// Offset of [TSpace.v32] on the left side (32px)
  ///
  /// Equivalent to Tailwind padding class: `pl-8`
  static const l32 = EdgeInsets.only(left: TSpace.v32);

  /// Offset of [TSpace.v36] on the left side (36px)
  ///
  /// Equivalent to Tailwind padding class: `pl-9`
  static const l36 = EdgeInsets.only(left: TSpace.v36);

  /// Offset of [TSpace.v40] on the left side (40px)
  ///
  /// Equivalent to Tailwind padding class: `pl-10`
  static const l40 = EdgeInsets.only(left: TSpace.v40);

  /// Offset of [TSpace.v44] on the left side (44px)
  ///
  /// Equivalent to Tailwind padding class: `pl-11`
  static const l44 = EdgeInsets.only(left: TSpace.v44);

  /// Offset of [TSpace.v48] on the left side (48px)
  ///
  /// Equivalent to Tailwind padding class: `pl-12`
  static const l48 = EdgeInsets.only(left: TSpace.v48);

  /// Offset of [TSpace.v52] on the left side (52px)
  ///
  /// Equivalent to Tailwind padding class: `pl-13`
  static const l52 = EdgeInsets.only(left: TSpace.v52);

  /// Offset of [TSpace.v56] on the left side (56px)
  ///
  /// Equivalent to Tailwind padding class: `pl-14`
  static const l56 = EdgeInsets.only(left: TSpace.v56);

  /// Offset of [TSpace.v60] on the left side (60px)
  ///
  /// Equivalent to Tailwind padding class: `pl-15`
  static const l60 = EdgeInsets.only(left: TSpace.v60);

  /// Offset of [TSpace.v64] on the left side (64px)
  ///
  /// Equivalent to Tailwind padding class: `pl-16`
  static const l64 = EdgeInsets.only(left: TSpace.v64);

  /// Offset of [TSpace.v72] on the left side (72px)
  ///
  /// Equivalent to Tailwind padding class: `pl-18`
  static const l72 = EdgeInsets.only(left: TSpace.v72);

  /// Offset of [TSpace.v80] on the left side (80px)
  ///
  /// Equivalent to Tailwind padding class: `pl-20`
  static const l80 = EdgeInsets.only(left: TSpace.v80);

  /// Offset of [TSpace.v96] on the left side (96px)
  ///
  /// Equivalent to Tailwind padding class: `pl-24`
  static const l96 = EdgeInsets.only(left: TSpace.v96);

  /// Offset of [TSpace.v160] on the left side (160px)
  ///
  /// Equivalent to Tailwind padding class: `pl-40`
  static const l160 = EdgeInsets.only(left: TSpace.v160);

  /// Offset of [TSpace.v176] on the left side (176px)
  ///
  /// Equivalent to Tailwind padding class: `pl-44`
  static const l176 = EdgeInsets.only(left: TSpace.v176);

  /// Offset of [TSpace.v192] on the left side (192px)
  ///
  /// Equivalent to Tailwind padding class: `pl-48`
  static const l192 = EdgeInsets.only(left: TSpace.v192);

  /// Offset of [TSpace.v208] on the left side (208px)
  ///
  /// Equivalent to Tailwind padding class: `pl-52`
  static const l208 = EdgeInsets.only(left: TSpace.v208);

  /// Offset of [TSpace.v224] on the left side (224px)
  ///
  /// Equivalent to Tailwind padding class: `pl-56`
  static const l224 = EdgeInsets.only(left: TSpace.v224);

  /// Offset of [TSpace.v240] on the left side (240px)
  ///
  /// Equivalent to Tailwind padding class: `pl-60`
  static const l240 = EdgeInsets.only(left: TSpace.v240);

  /// Offset of [TSpace.v256] on the left side (256px)
  ///
  /// Equivalent to Tailwind padding class: `pl-64`
  static const l256 = EdgeInsets.only(left: TSpace.v256);

  /// Offset of [TSpace.v288] on the left side (288px)
  ///
  /// Equivalent to Tailwind padding class: `pl-72`
  static const l288 = EdgeInsets.only(left: TSpace.v288);

  /// Offset of [TSpace.v320] on the left side (320px)
  ///
  /// Equivalent to Tailwind padding class: `pl-80`
  static const l320 = EdgeInsets.only(left: TSpace.v320);

  /// Offset of [TSpace.v384] on the left side (384px)
  ///
  /// Equivalent to Tailwind padding class: `pl-96`
  static const l384 = EdgeInsets.only(left: TSpace.v384);

  // ---------------------------------------------------------------------------
  // Top Side Offset
  // ---------------------------------------------------------------------------

  /// Creates [EdgeInsets] with only the given value on the top side.
  static EdgeInsets t(double value) => EdgeInsets.only(top: value);

  /// Offset of [TSpace.v0] on the top side (0px)
  ///
  /// Equivalent to Tailwind padding class: `pt-0`
  static const EdgeInsets t0 = EdgeInsets.zero;

  /// Offset of [TSpace.v1] on the top side (1px)
  ///
  /// Equivalent to Tailwind padding class: `pt-px`
  static const t1 = EdgeInsets.only(top: TSpace.v1);

  /// Offset of [TSpace.v2] on the top side (2px)
  ///
  /// Equivalent to Tailwind padding class: `pt-0.5`
  static const t2 = EdgeInsets.only(top: TSpace.v2);

  /// Offset of [TSpace.v4] on the top side (4px)
  ///
  /// Equivalent to Tailwind padding class: `pt-1`
  static const t4 = EdgeInsets.only(top: TSpace.v4);

  /// Offset of [TSpace.v6] on the top side (6px)
  ///
  /// Equivalent to Tailwind padding class: `pt-1.5`
  static const t6 = EdgeInsets.only(top: TSpace.v6);

  /// Offset of [TSpace.v8] on the top side (8px)
  ///
  /// Equivalent to Tailwind padding class: `pt-2`
  static const t8 = EdgeInsets.only(top: TSpace.v8);

  /// Offset of [TSpace.v10] on the top side (10px)
  ///
  /// Equivalent to Tailwind padding class: `pt-2.5`
  static const t10 = EdgeInsets.only(top: TSpace.v10);

  /// Offset of [TSpace.v12] on the top side (12px)
  ///
  /// Equivalent to Tailwind padding class: `pt-3`
  static const t12 = EdgeInsets.only(top: TSpace.v12);

  /// Offset of [TSpace.v14] on the top side (14px)
  ///
  /// Equivalent to Tailwind padding class: `pt-3.5`
  static const t14 = EdgeInsets.only(top: TSpace.v14);

  /// Offset of [TSpace.v16] on the top side (16px)
  ///
  /// Equivalent to Tailwind padding class: `pt-4`
  static const t16 = EdgeInsets.only(top: TSpace.v16);

  /// Offset of [TSpace.v20] on the top side (20px)
  ///
  /// Equivalent to Tailwind padding class: `pt-5`
  static const t20 = EdgeInsets.only(top: TSpace.v20);

  /// Offset of [TSpace.v24] on the top side (24px)
  ///
  /// Equivalent to Tailwind padding class: `pt-6`
  static const t24 = EdgeInsets.only(top: TSpace.v24);

  /// Offset of [TSpace.v28] on the top side (28px)
  ///
  /// Equivalent to Tailwind padding class: `pt-7`
  static const t28 = EdgeInsets.only(top: TSpace.v28);

  /// Offset of [TSpace.v32] on the top side (32px)
  ///
  /// Equivalent to Tailwind padding class: `pt-8`
  static const t32 = EdgeInsets.only(top: TSpace.v32);

  /// Offset of [TSpace.v36] on the top side (36px)
  ///
  /// Equivalent to Tailwind padding class: `pt-9`
  static const t36 = EdgeInsets.only(top: TSpace.v36);

  /// Offset of [TSpace.v40] on the top side (40px)
  ///
  /// Equivalent to Tailwind padding class: `pt-10`
  static const t40 = EdgeInsets.only(top: TSpace.v40);

  /// Offset of [TSpace.v44] on the top side (44px)
  ///
  /// Equivalent to Tailwind padding class: `pt-11`
  static const t44 = EdgeInsets.only(top: TSpace.v44);

  /// Offset of [TSpace.v48] on the top side (48px)
  ///
  /// Equivalent to Tailwind padding class: `pt-12`
  static const t48 = EdgeInsets.only(top: TSpace.v48);

  /// Offset of [TSpace.v52] on the top side (52px)
  ///
  /// Equivalent to Tailwind padding class: `pt-13`
  static const t52 = EdgeInsets.only(top: TSpace.v52);

  /// Offset of [TSpace.v56] on the top side (56px)
  ///
  /// Equivalent to Tailwind padding class: `pt-14`
  static const t56 = EdgeInsets.only(top: TSpace.v56);

  /// Offset of [TSpace.v60] on the top side (60px)
  ///
  /// Equivalent to Tailwind padding class: `pt-15`
  static const t60 = EdgeInsets.only(top: TSpace.v60);

  /// Offset of [TSpace.v64] on the top side (64px)
  ///
  /// Equivalent to Tailwind padding class: `pt-16`
  static const t64 = EdgeInsets.only(top: TSpace.v64);

  /// Offset of [TSpace.v72] on the top side (72px)
  ///
  /// Equivalent to Tailwind padding class: `pt-18`
  static const t72 = EdgeInsets.only(top: TSpace.v72);

  /// Offset of [TSpace.v80] on the top side (80px)
  ///
  /// Equivalent to Tailwind padding class: `pt-20`
  static const t80 = EdgeInsets.only(top: TSpace.v80);

  /// Offset of [TSpace.v96] on the top side (96px)
  ///
  /// Equivalent to Tailwind padding class: `pt-24`
  static const t96 = EdgeInsets.only(top: TSpace.v96);

  /// Offset of [TSpace.v160] on the top side (160px)
  ///
  /// Equivalent to Tailwind padding class: `pt-40`
  static const t160 = EdgeInsets.only(top: TSpace.v160);

  /// Offset of [TSpace.v176] on the top side (176px)
  ///
  /// Equivalent to Tailwind padding class: `pt-44`
  static const t176 = EdgeInsets.only(top: TSpace.v176);

  /// Offset of [TSpace.v192] on the top side (192px)
  ///
  /// Equivalent to Tailwind padding class: `pt-48`
  static const t192 = EdgeInsets.only(top: TSpace.v192);

  /// Offset of [TSpace.v208] on the top side (208px)
  ///
  /// Equivalent to Tailwind padding class: `pt-52`
  static const t208 = EdgeInsets.only(top: TSpace.v208);

  /// Offset of [TSpace.v224] on the top side (224px)
  ///
  /// Equivalent to Tailwind padding class: `pt-56`
  static const t224 = EdgeInsets.only(top: TSpace.v224);

  /// Offset of [TSpace.v240] on the top side (240px)
  ///
  /// Equivalent to Tailwind padding class: `pt-60`
  static const t240 = EdgeInsets.only(top: TSpace.v240);

  /// Offset of [TSpace.v256] on the top side (256px)
  ///
  /// Equivalent to Tailwind padding class: `pt-64`
  static const t256 = EdgeInsets.only(top: TSpace.v256);

  /// Offset of [TSpace.v288] on the top side (288px)
  ///
  /// Equivalent to Tailwind padding class: `pt-72`
  static const t288 = EdgeInsets.only(top: TSpace.v288);

  /// Offset of [TSpace.v320] on the top side (320px)
  ///
  /// Equivalent to Tailwind padding class: `pt-80`
  static const t320 = EdgeInsets.only(top: TSpace.v320);

  /// Offset of [TSpace.v384] on the top side (384px)
  ///
  /// Equivalent to Tailwind padding class: `pt-96`
  static const t384 = EdgeInsets.only(top: TSpace.v384);

  // ---------------------------------------------------------------------------
  // Right Side Offset
  // ---------------------------------------------------------------------------

  /// Creates [EdgeInsets] with only the given value on the right side.
  static EdgeInsets r(double value) => EdgeInsets.only(right: value);

  /// Offset of [TSpace.v0] on the right side (0px)
  ///
  /// Equivalent to Tailwind padding class: `pr-0`
  static const EdgeInsets r0 = EdgeInsets.zero;

  /// Offset of [TSpace.v1] on the right side (1px)
  ///
  /// Equivalent to Tailwind padding class: `pr-px`
  static const r1 = EdgeInsets.only(right: TSpace.v1);

  /// Offset of [TSpace.v2] on the right side (2px)
  ///
  /// Equivalent to Tailwind padding class: `pr-0.5`
  static const r2 = EdgeInsets.only(right: TSpace.v2);

  /// Offset of [TSpace.v4] on the right side (4px)
  ///
  /// Equivalent to Tailwind padding class: `pr-1`
  static const r4 = EdgeInsets.only(right: TSpace.v4);

  /// Offset of [TSpace.v6] on the right side (6px)
  ///
  /// Equivalent to Tailwind padding class: `pr-1.5`
  static const r6 = EdgeInsets.only(right: TSpace.v6);

  /// Offset of [TSpace.v8] on the right side (8px)
  ///
  /// Equivalent to Tailwind padding class: `pr-2`
  static const r8 = EdgeInsets.only(right: TSpace.v8);

  /// Offset of [TSpace.v10] on the right side (10px)
  ///
  /// Equivalent to Tailwind padding class: `pr-2.5`
  static const r10 = EdgeInsets.only(right: TSpace.v10);

  /// Offset of [TSpace.v12] on the right side (12px)
  ///
  /// Equivalent to Tailwind padding class: `pr-3`
  static const r12 = EdgeInsets.only(right: TSpace.v12);

  /// Offset of [TSpace.v14] on the right side (14px)
  ///
  /// Equivalent to Tailwind padding class: `pr-3.5`
  static const r14 = EdgeInsets.only(right: TSpace.v14);

  /// Offset of [TSpace.v16] on the right side (16px)
  ///
  /// Equivalent to Tailwind padding class: `pr-4`
  static const r16 = EdgeInsets.only(right: TSpace.v16);

  /// Offset of [TSpace.v20] on the right side (20px)
  ///
  /// Equivalent to Tailwind padding class: `pr-5`
  static const r20 = EdgeInsets.only(right: TSpace.v20);

  /// Offset of [TSpace.v24] on the right side (24px)
  ///
  /// Equivalent to Tailwind padding class: `pr-6`
  static const r24 = EdgeInsets.only(right: TSpace.v24);

  /// Offset of [TSpace.v28] on the right side (28px)
  ///
  /// Equivalent to Tailwind padding class: `pr-7`
  static const r28 = EdgeInsets.only(right: TSpace.v28);

  /// Offset of [TSpace.v32] on the right side (32px)
  ///
  /// Equivalent to Tailwind padding class: `pr-8`
  static const r32 = EdgeInsets.only(right: TSpace.v32);

  /// Offset of [TSpace.v36] on the right side (36px)
  ///
  /// Equivalent to Tailwind padding class: `pr-9`
  static const r36 = EdgeInsets.only(right: TSpace.v36);

  /// Offset of [TSpace.v40] on the right side (40px)
  ///
  /// Equivalent to Tailwind padding class: `pr-10`
  static const r40 = EdgeInsets.only(right: TSpace.v40);

  /// Offset of [TSpace.v44] on the right side (44px)
  ///
  /// Equivalent to Tailwind padding class: `pr-11`
  static const r44 = EdgeInsets.only(right: TSpace.v44);

  /// Offset of [TSpace.v48] on the right side (48px)
  ///
  /// Equivalent to Tailwind padding class: `pr-12`
  static const r48 = EdgeInsets.only(right: TSpace.v48);

  /// Offset of [TSpace.v52] on the right side (52px)
  ///
  /// Equivalent to Tailwind padding class: `pr-13`
  static const r52 = EdgeInsets.only(right: TSpace.v52);

  /// Offset of [TSpace.v56] on the right side (56px)
  ///
  /// Equivalent to Tailwind padding class: `pr-14`
  static const r56 = EdgeInsets.only(right: TSpace.v56);

  /// Offset of [TSpace.v60] on the right side (60px)
  ///
  /// Equivalent to Tailwind padding class: `pr-15`
  static const r60 = EdgeInsets.only(right: TSpace.v60);

  /// Offset of [TSpace.v64] on the right side (64px)
  ///
  /// Equivalent to Tailwind padding class: `pr-16`
  static const r64 = EdgeInsets.only(right: TSpace.v64);

  /// Offset of [TSpace.v72] on the right side (72px)
  ///
  /// Equivalent to Tailwind padding class: `pr-18`
  static const r72 = EdgeInsets.only(right: TSpace.v72);

  /// Offset of [TSpace.v80] on the right side (80px)
  ///
  /// Equivalent to Tailwind padding class: `pr-20`
  static const r80 = EdgeInsets.only(right: TSpace.v80);

  /// Offset of [TSpace.v96] on the right side (96px)
  ///
  /// Equivalent to Tailwind padding class: `pr-24`
  static const r96 = EdgeInsets.only(right: TSpace.v96);

  /// Offset of [TSpace.v160] on the right side (160px)
  ///
  /// Equivalent to Tailwind padding class: `pr-40`
  static const r160 = EdgeInsets.only(right: TSpace.v160);

  /// Offset of [TSpace.v176] on the right side (176px)
  ///
  /// Equivalent to Tailwind padding class: `pr-44`
  static const r176 = EdgeInsets.only(right: TSpace.v176);

  /// Offset of [TSpace.v192] on the right side (192px)
  ///
  /// Equivalent to Tailwind padding class: `pr-48`
  static const r192 = EdgeInsets.only(right: TSpace.v192);

  /// Offset of [TSpace.v208] on the right side (208px)
  ///
  /// Equivalent to Tailwind padding class: `pr-52`
  static const r208 = EdgeInsets.only(right: TSpace.v208);

  /// Offset of [TSpace.v224] on the right side (224px)
  ///
  /// Equivalent to Tailwind padding class: `pr-56`
  static const r224 = EdgeInsets.only(right: TSpace.v224);

  /// Offset of [TSpace.v240] on the right side (240px)
  ///
  /// Equivalent to Tailwind padding class: `pr-60`
  static const r240 = EdgeInsets.only(right: TSpace.v240);

  /// Offset of [TSpace.v256] on the right side (256px)
  ///
  /// Equivalent to Tailwind padding class: `pr-64`
  static const r256 = EdgeInsets.only(right: TSpace.v256);

  /// Offset of [TSpace.v288] on the right side (288px)
  ///
  /// Equivalent to Tailwind padding class: `pr-72`
  static const r288 = EdgeInsets.only(right: TSpace.v288);

  /// Offset of [TSpace.v320] on the right side (320px)
  ///
  /// Equivalent to Tailwind padding class: `pr-80`
  static const r320 = EdgeInsets.only(right: TSpace.v320);

  /// Offset of [TSpace.v384] on the right side (384px)
  ///
  /// Equivalent to Tailwind padding class: `pr-96`
  static const r384 = EdgeInsets.only(right: TSpace.v384);

  // ---------------------------------------------------------------------------
  // Bottom Side Offset
  // ---------------------------------------------------------------------------

  /// Creates [EdgeInsets] with only the given value on the bottom side.
  static EdgeInsets b(double value) => EdgeInsets.only(bottom: value);

  /// Offset of [TSpace.v0] on the bottom side (0px)
  ///
  /// Equivalent to Tailwind padding class: `pb-0`
  static const EdgeInsets b0 = EdgeInsets.zero;

  /// Offset of [TSpace.v1] on the bottom side (1px)
  ///
  /// Equivalent to Tailwind padding class: `pb-px`
  static const b1 = EdgeInsets.only(bottom: TSpace.v1);

  /// Offset of [TSpace.v2] on the bottom side (2px)
  ///
  /// Equivalent to Tailwind padding class: `pb-0.5`
  static const b2 = EdgeInsets.only(bottom: TSpace.v2);

  /// Offset of [TSpace.v4] on the bottom side (4px)
  ///
  /// Equivalent to Tailwind padding class: `pb-1`
  static const b4 = EdgeInsets.only(bottom: TSpace.v4);

  /// Offset of [TSpace.v6] on the bottom side (6px)
  ///
  /// Equivalent to Tailwind padding class: `pb-1.5`
  static const b6 = EdgeInsets.only(bottom: TSpace.v6);

  /// Offset of [TSpace.v8] on the bottom side (8px)
  ///
  /// Equivalent to Tailwind padding class: `pb-2`
  static const b8 = EdgeInsets.only(bottom: TSpace.v8);

  /// Offset of [TSpace.v10] on the bottom side (10px)
  ///
  /// Equivalent to Tailwind padding class: `pb-2.5`
  static const b10 = EdgeInsets.only(bottom: TSpace.v10);

  /// Offset of [TSpace.v12] on the bottom side (12px)
  ///
  /// Equivalent to Tailwind padding class: `pb-3`
  static const b12 = EdgeInsets.only(bottom: TSpace.v12);

  /// Offset of [TSpace.v14] on the bottom side (14px)
  ///
  /// Equivalent to Tailwind padding class: `pb-3.5`
  static const b14 = EdgeInsets.only(bottom: TSpace.v14);

  /// Offset of [TSpace.v16] on the bottom side (16px)
  ///
  /// Equivalent to Tailwind padding class: `pb-4`
  static const b16 = EdgeInsets.only(bottom: TSpace.v16);

  /// Offset of [TSpace.v20] on the bottom side (20px)
  ///
  /// Equivalent to Tailwind padding class: `pb-5`
  static const b20 = EdgeInsets.only(bottom: TSpace.v20);

  /// Offset of [TSpace.v24] on the bottom side (24px)
  ///
  /// Equivalent to Tailwind padding class: `pb-6`
  static const b24 = EdgeInsets.only(bottom: TSpace.v24);

  /// Offset of [TSpace.v28] on the bottom side (28px)
  ///
  /// Equivalent to Tailwind padding class: `pb-7`
  static const b28 = EdgeInsets.only(bottom: TSpace.v28);

  /// Offset of [TSpace.v32] on the bottom side (32px)
  ///
  /// Equivalent to Tailwind padding class: `pb-8`
  static const b32 = EdgeInsets.only(bottom: TSpace.v32);

  /// Offset of [TSpace.v36] on the bottom side (36px)
  ///
  /// Equivalent to Tailwind padding class: `pb-9`
  static const b36 = EdgeInsets.only(bottom: TSpace.v36);

  /// Offset of [TSpace.v40] on the bottom side (40px)
  ///
  /// Equivalent to Tailwind padding class: `pb-10`
  static const b40 = EdgeInsets.only(bottom: TSpace.v40);

  /// Offset of [TSpace.v44] on the bottom side (44px)
  ///
  /// Equivalent to Tailwind padding class: `pb-11`
  static const b44 = EdgeInsets.only(bottom: TSpace.v44);

  /// Offset of [TSpace.v48] on the bottom side (48px)
  ///
  /// Equivalent to Tailwind padding class: `pb-12`
  static const b48 = EdgeInsets.only(bottom: TSpace.v48);

  /// Offset of [TSpace.v52] on the bottom side (52px)
  ///
  /// Equivalent to Tailwind padding class: `pb-13`
  static const b52 = EdgeInsets.only(bottom: TSpace.v52);

  /// Offset of [TSpace.v56] on the bottom side (56px)
  ///
  /// Equivalent to Tailwind padding class: `pb-14`
  static const b56 = EdgeInsets.only(bottom: TSpace.v56);

  /// Offset of [TSpace.v60] on the bottom side (60px)
  ///
  /// Equivalent to Tailwind padding class: `pb-15`
  static const b60 = EdgeInsets.only(bottom: TSpace.v60);

  /// Offset of [TSpace.v64] on the bottom side (64px)
  ///
  /// Equivalent to Tailwind padding class: `pb-16`
  static const b64 = EdgeInsets.only(bottom: TSpace.v64);

  /// Offset of [TSpace.v72] on the bottom side (72px)
  ///
  /// Equivalent to Tailwind padding class: `pb-18`
  static const b72 = EdgeInsets.only(bottom: TSpace.v72);

  /// Offset of [TSpace.v80] on the bottom side (80px)
  ///
  /// Equivalent to Tailwind padding class: `pb-20`
  static const b80 = EdgeInsets.only(bottom: TSpace.v80);

  /// Offset of [TSpace.v96] on the bottom side (96px)
  ///
  /// Equivalent to Tailwind padding class: `pb-24`
  static const b96 = EdgeInsets.only(bottom: TSpace.v96);

  /// Offset of [TSpace.v160] on the bottom side (160px)
  ///
  /// Equivalent to Tailwind padding class: `pb-40`
  static const b160 = EdgeInsets.only(bottom: TSpace.v160);

  /// Offset of [TSpace.v176] on the bottom side (176px)
  ///
  /// Equivalent to Tailwind padding class: `pb-44`
  static const b176 = EdgeInsets.only(bottom: TSpace.v176);

  /// Offset of [TSpace.v192] on the bottom side (192px)
  ///
  /// Equivalent to Tailwind padding class: `pb-48`
  static const b192 = EdgeInsets.only(bottom: TSpace.v192);

  /// Offset of [TSpace.v208] on the bottom side (208px)
  ///
  /// Equivalent to Tailwind padding class: `pb-52`
  static const b208 = EdgeInsets.only(bottom: TSpace.v208);

  /// Offset of [TSpace.v224] on the bottom side (224px)
  ///
  /// Equivalent to Tailwind padding class: `pb-56`
  static const b224 = EdgeInsets.only(bottom: TSpace.v224);

  /// Offset of [TSpace.v240] on the bottom side (240px)
  ///
  /// Equivalent to Tailwind padding class: `pb-60`
  static const b240 = EdgeInsets.only(bottom: TSpace.v240);

  /// Offset of [TSpace.v256] on the bottom side (256px)
  ///
  /// Equivalent to Tailwind padding class: `pb-64`
  static const b256 = EdgeInsets.only(bottom: TSpace.v256);

  /// Offset of [TSpace.v288] on the bottom side (288px)
  ///
  /// Equivalent to Tailwind padding class: `pb-72`
  static const b288 = EdgeInsets.only(bottom: TSpace.v288);

  /// Offset of [TSpace.v320] on the bottom side (320px)
  ///
  /// Equivalent to Tailwind padding class: `pb-80`
  static const b320 = EdgeInsets.only(bottom: TSpace.v320);

  /// Offset of [TSpace.v384] on the bottom side (384px)
  ///
  /// Equivalent to Tailwind padding class: `pb-96`
  static const b384 = EdgeInsets.only(bottom: TSpace.v384);
}
