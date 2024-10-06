import 'package:flutter/rendering.dart';

import 'package:flutter_tailwind_ui/src/constants/scale.dart';

// TODO: Add documentation for tailwind equivalent

// =================================================
// CLASS: TOffset
// =================================================

/// [EdgeInsets] for padding and margin based on Tailwind scaling system.
///
/// Scaling system is based on 4px increments defined in [TSpacingScale].
///
/// https://tailwindcss.com/docs/customizing-spacing
abstract final class TOffset {
  // -------------------------------------------------
  // All Side Offset
  // -------------------------------------------------

  /// Offset of 0px on all sides
  static const a0 = EdgeInsets.zero;

  /// Offset of 1px on all sides
  static const a1 = EdgeInsets.all(TSpacingScale.v1);

  /// Offset of 2px on all sides
  static const a2 = EdgeInsets.all(TSpacingScale.v2);

  /// Offset of 4px on all sides
  static const a4 = EdgeInsets.all(TSpacingScale.v4);

  /// Offset of 6px on all sides
  static const a6 = EdgeInsets.all(TSpacingScale.v6);

  /// Offset of 8px on all sides
  static const a8 = EdgeInsets.all(TSpacingScale.v8);

  /// Offset of 10px on all sides
  static const a10 = EdgeInsets.all(TSpacingScale.v10);

  /// Offset of 12px on all sides
  static const a12 = EdgeInsets.all(TSpacingScale.v12);

  /// Offset of 14px on all sides
  static const a14 = EdgeInsets.all(TSpacingScale.v14);

  /// Offset of 16px on all sides
  static const a16 = EdgeInsets.all(TSpacingScale.v16);

  /// Offset of 20px on all sides
  static const a20 = EdgeInsets.all(TSpacingScale.v20);

  /// Offset of 24px on all sides
  static const a24 = EdgeInsets.all(TSpacingScale.v24);

  /// Offset of 28px on all sides
  static const a28 = EdgeInsets.all(TSpacingScale.v28);

  /// Offset of 32px on all sides
  static const a32 = EdgeInsets.all(TSpacingScale.v32);

  /// Offset of 36px on all sides
  static const a36 = EdgeInsets.all(TSpacingScale.v36);

  /// Offset of 40px on all sides
  static const a40 = EdgeInsets.all(TSpacingScale.v40);

  /// Offset of 44px on all sides
  static const a44 = EdgeInsets.all(TSpacingScale.v44);

  /// Offset of 48px on all sides
  static const a48 = EdgeInsets.all(TSpacingScale.v48);

  /// Offset of 52px on all sides
  static const a52 = EdgeInsets.all(TSpacingScale.v52);

  /// Offset of 56px on all sides
  static const a56 = EdgeInsets.all(TSpacingScale.v56);

  /// Offset of 60px on all sides
  static const a60 = EdgeInsets.all(TSpacingScale.v60);

  /// Offset of 64px on all sides
  static const a64 = EdgeInsets.all(TSpacingScale.v64);

  /// Offset of 72px on all sides
  static const a72 = EdgeInsets.all(TSpacingScale.v72);

  /// Offset of 80px on all sides
  static const a80 = EdgeInsets.all(TSpacingScale.v80);

  /// Offset of 96px on all sides
  static const a96 = EdgeInsets.all(TSpacingScale.v96);

  /// Offset of 160px on all sides
  static const a160 = EdgeInsets.all(TSpacingScale.v160);

  /// Offset of 176px on all sides
  static const a176 = EdgeInsets.all(TSpacingScale.v176);

  /// Offset of 192px on all sides
  static const a192 = EdgeInsets.all(TSpacingScale.v192);

  /// Offset of 208px on all sides
  static const a208 = EdgeInsets.all(TSpacingScale.v208);

  /// Offset of 224px on all sides
  static const a224 = EdgeInsets.all(TSpacingScale.v224);

  /// Offset of 240px on all sides
  static const a240 = EdgeInsets.all(TSpacingScale.v240);

  /// Offset of 256px on all sides
  static const a256 = EdgeInsets.all(TSpacingScale.v256);

  /// Offset of 288px on all sides
  static const a288 = EdgeInsets.all(TSpacingScale.v288);

  /// Offset of 320px on all sides
  static const a320 = EdgeInsets.all(TSpacingScale.v320);

  /// Offset of 320px on all sides
  static const a384 = EdgeInsets.all(TSpacingScale.v384);

  // -------------------------------------------------
  // Horizontal Offset
  // -------------------------------------------------

  /// Offset of 0px on the left and right sides
  static const x0 = EdgeInsets.zero;

  /// Offset of 1px on the left and right sides
  static const x1 = EdgeInsets.symmetric(horizontal: TSpacingScale.v1);

  /// Offset of 2px on the left and right sides
  static const x2 = EdgeInsets.symmetric(horizontal: TSpacingScale.v2);

  /// Offset of 4px on the left and right sides
  static const x4 = EdgeInsets.symmetric(horizontal: TSpacingScale.v4);

  /// Offset of 6px on the left and right sides
  static const x6 = EdgeInsets.symmetric(horizontal: TSpacingScale.v6);

  /// Offset of 8px on the left and right sides
  static const x8 = EdgeInsets.symmetric(horizontal: TSpacingScale.v8);

  /// Offset of 10px on the left and right sides
  static const x10 = EdgeInsets.symmetric(horizontal: TSpacingScale.v10);

  /// Offset of 12px on the left and right sides
  static const x12 = EdgeInsets.symmetric(horizontal: TSpacingScale.v12);

  /// Offset of 14px on the left and right sides
  static const x14 = EdgeInsets.symmetric(horizontal: TSpacingScale.v14);

  /// Offset of 16px on the left and right sides
  static const x16 = EdgeInsets.symmetric(horizontal: TSpacingScale.v16);

  /// Offset of 20px on the left and right sides
  static const x20 = EdgeInsets.symmetric(horizontal: TSpacingScale.v20);

  /// Offset of 24px on the left and right sides
  static const x24 = EdgeInsets.symmetric(horizontal: TSpacingScale.v24);

  /// Offset of 28px on the left and right sides
  static const x28 = EdgeInsets.symmetric(horizontal: TSpacingScale.v28);

  /// Offset of 32px on the left and right sides
  static const x32 = EdgeInsets.symmetric(horizontal: TSpacingScale.v32);

  /// Offset of 36px on the left and right sides
  static const x36 = EdgeInsets.symmetric(horizontal: TSpacingScale.v36);

  /// Offset of 40px on the left and right sides
  static const x40 = EdgeInsets.symmetric(horizontal: TSpacingScale.v40);

  /// Offset of 44px on the left and right sides
  static const x44 = EdgeInsets.symmetric(horizontal: TSpacingScale.v44);

  /// Offset of 48px on the left and right sides
  static const x48 = EdgeInsets.symmetric(horizontal: TSpacingScale.v48);

  /// Offset of 52px on the left and right sides
  static const x52 = EdgeInsets.symmetric(horizontal: TSpacingScale.v52);

  /// Offset of 56px on the left and right sides
  static const x56 = EdgeInsets.symmetric(horizontal: TSpacingScale.v56);

  /// Offset of 60px on the left and right sides
  static const x60 = EdgeInsets.symmetric(horizontal: TSpacingScale.v60);

  /// Offset of 64px on the left and right sides
  static const x64 = EdgeInsets.symmetric(horizontal: TSpacingScale.v64);

  /// Offset of 72px on the left and right sides
  static const x72 = EdgeInsets.symmetric(horizontal: TSpacingScale.v72);

  /// Offset of 80px on the left and right sides
  static const x80 = EdgeInsets.symmetric(horizontal: TSpacingScale.v80);

  /// Offset of 96px on the left and right sides
  static const x96 = EdgeInsets.symmetric(horizontal: TSpacingScale.v96);

  /// Offset of 160px on the left and right sides
  static const x160 = EdgeInsets.symmetric(horizontal: TSpacingScale.v160);

  /// Offset of 176px on the left and right sides
  static const x176 = EdgeInsets.symmetric(horizontal: TSpacingScale.v176);

  /// Offset of 192px on the left and right sides
  static const x192 = EdgeInsets.symmetric(horizontal: TSpacingScale.v192);

  /// Offset of 208px on the left and right sides
  static const x208 = EdgeInsets.symmetric(horizontal: TSpacingScale.v208);

  /// Offset of 224px on the left and right sides
  static const x224 = EdgeInsets.symmetric(horizontal: TSpacingScale.v224);

  /// Offset of 240px on the left and right sides
  static const x240 = EdgeInsets.symmetric(horizontal: TSpacingScale.v240);

  /// Offset of 256px on the left and right sides
  static const x256 = EdgeInsets.symmetric(horizontal: TSpacingScale.v256);

  /// Offset of 288px on the left and right sides
  static const x288 = EdgeInsets.symmetric(horizontal: TSpacingScale.v288);

  /// Offset of 320px on the left and right sides
  static const x320 = EdgeInsets.symmetric(horizontal: TSpacingScale.v320);

  /// Offset of 320px on the left and right sides
  static const x384 = EdgeInsets.symmetric(horizontal: TSpacingScale.v384);

  // -------------------------------------------------
  // Vertical Offset
  // -------------------------------------------------

  /// Offset of 0px on the top and bottom sides
  static const y0 = EdgeInsets.zero;

  /// Offset of 1px on the top and bottom sides
  static const y1 = EdgeInsets.symmetric(vertical: TSpacingScale.v1);

  /// Offset of 2px on the top and bottom sides
  static const y2 = EdgeInsets.symmetric(vertical: TSpacingScale.v2);

  /// Offset of 4px on the top and bottom sides
  static const y4 = EdgeInsets.symmetric(vertical: TSpacingScale.v4);

  /// Offset of 6px on the top and bottom sides
  static const y6 = EdgeInsets.symmetric(vertical: TSpacingScale.v6);

  /// Offset of 8px on the top and bottom sides
  static const y8 = EdgeInsets.symmetric(vertical: TSpacingScale.v8);

  /// Offset of 10px on the top and bottom sides
  static const y10 = EdgeInsets.symmetric(vertical: TSpacingScale.v10);

  /// Offset of 12px on the top and bottom sides
  static const y12 = EdgeInsets.symmetric(vertical: TSpacingScale.v12);

  /// Offset of 14px on the top and bottom sides
  static const y14 = EdgeInsets.symmetric(vertical: TSpacingScale.v14);

  /// Offset of 16px on the top and bottom sides
  static const y16 = EdgeInsets.symmetric(vertical: TSpacingScale.v16);

  /// Offset of 20px on the top and bottom sides
  static const y20 = EdgeInsets.symmetric(vertical: TSpacingScale.v20);

  /// Offset of 24px on the top and bottom sides
  static const y24 = EdgeInsets.symmetric(vertical: TSpacingScale.v24);

  /// Offset of 28px on the top and bottom sides
  static const y28 = EdgeInsets.symmetric(vertical: TSpacingScale.v28);

  /// Offset of 32px on the top and bottom sides
  static const y32 = EdgeInsets.symmetric(vertical: TSpacingScale.v32);

  /// Offset of 36px on the top and bottom sides
  static const y36 = EdgeInsets.symmetric(vertical: TSpacingScale.v36);

  /// Offset of 40px on the top and bottom sides
  static const y40 = EdgeInsets.symmetric(vertical: TSpacingScale.v40);

  /// Offset of 44px on the top and bottom sides
  static const y44 = EdgeInsets.symmetric(vertical: TSpacingScale.v44);

  /// Offset of 48px on the top and bottom sides
  static const y48 = EdgeInsets.symmetric(vertical: TSpacingScale.v48);

  /// Offset of 52px on the top and bottom sides
  static const y52 = EdgeInsets.symmetric(vertical: TSpacingScale.v52);

  /// Offset of 56px on the top and bottom sides
  static const y56 = EdgeInsets.symmetric(vertical: TSpacingScale.v56);

  /// Offset of 60px on the top and bottom sides
  static const y60 = EdgeInsets.symmetric(vertical: TSpacingScale.v60);

  /// Offset of 64px on the top and bottom sides
  static const y64 = EdgeInsets.symmetric(vertical: TSpacingScale.v64);

  /// Offset of 72px on the top and bottom sides
  static const y72 = EdgeInsets.symmetric(vertical: TSpacingScale.v72);

  /// Offset of 80px on the top and bottom sides
  static const y80 = EdgeInsets.symmetric(vertical: TSpacingScale.v80);

  /// Offset of 96px on the top and bottom sides
  static const y96 = EdgeInsets.symmetric(vertical: TSpacingScale.v96);

  /// Offset of 160px on the top and bottom sides
  static const y160 = EdgeInsets.symmetric(vertical: TSpacingScale.v160);

  /// Offset of 176px on the top and bottom sides
  static const y176 = EdgeInsets.symmetric(vertical: TSpacingScale.v176);

  /// Offset of 192px on the top and bottom sides
  static const y192 = EdgeInsets.symmetric(vertical: TSpacingScale.v192);

  /// Offset of 208px on the top and bottom sides
  static const y208 = EdgeInsets.symmetric(vertical: TSpacingScale.v208);

  /// Offset of 224px on the top and bottom sides
  static const y224 = EdgeInsets.symmetric(vertical: TSpacingScale.v224);

  /// Offset of 240px on the top and bottom sides
  static const y240 = EdgeInsets.symmetric(vertical: TSpacingScale.v240);

  /// Offset of 256px on the top and bottom sides
  static const y256 = EdgeInsets.symmetric(vertical: TSpacingScale.v256);

  /// Offset of 288px on the top and bottom sides
  static const y288 = EdgeInsets.symmetric(vertical: TSpacingScale.v288);

  /// Offset of 320px on the top and bottom sides
  static const y320 = EdgeInsets.symmetric(vertical: TSpacingScale.v320);

  /// Offset of 320px on the top and bottom sides
  static const y384 = EdgeInsets.symmetric(vertical: TSpacingScale.v384);

  // -------------------------------------------------
  // Left Side Offset
  // -------------------------------------------------

  /// Offset of 0px on the left side
  static const l0 = EdgeInsets.zero;

  /// Offset of 1px on the left side
  static const l1 = EdgeInsets.only(left: TSpacingScale.v1);

  /// Offset of 2px on the left side
  static const l2 = EdgeInsets.only(left: TSpacingScale.v2);

  /// Offset of 4px on the left side
  static const l4 = EdgeInsets.only(left: TSpacingScale.v4);

  /// Offset of 6px on the left side
  static const l6 = EdgeInsets.only(left: TSpacingScale.v6);

  /// Offset of 8px on the left side
  static const l8 = EdgeInsets.only(left: TSpacingScale.v8);

  /// Offset of 10px on the left side
  static const l10 = EdgeInsets.only(left: TSpacingScale.v10);

  /// Offset of 12px on the left side
  static const l12 = EdgeInsets.only(left: TSpacingScale.v12);

  /// Offset of 14px on the left side
  static const l14 = EdgeInsets.only(left: TSpacingScale.v14);

  /// Offset of 16px on the left side
  static const l16 = EdgeInsets.only(left: TSpacingScale.v16);

  /// Offset of 20px on the left side
  static const l20 = EdgeInsets.only(left: TSpacingScale.v20);

  /// Offset of 24px on the left side
  static const l24 = EdgeInsets.only(left: TSpacingScale.v24);

  /// Offset of 28px on the left side
  static const l28 = EdgeInsets.only(left: TSpacingScale.v28);

  /// Offset of 32px on the left side
  static const l32 = EdgeInsets.only(left: TSpacingScale.v32);

  /// Offset of 36px on the left side
  static const l36 = EdgeInsets.only(left: TSpacingScale.v36);

  /// Offset of 40px on the left side
  static const l40 = EdgeInsets.only(left: TSpacingScale.v40);

  /// Offset of 44px on the left side
  static const l44 = EdgeInsets.only(left: TSpacingScale.v44);

  /// Offset of 48px on the left side
  static const l48 = EdgeInsets.only(left: TSpacingScale.v48);

  /// Offset of 52px on the left side
  static const l52 = EdgeInsets.only(left: TSpacingScale.v52);

  /// Offset of 56px on the left side
  static const l56 = EdgeInsets.only(left: TSpacingScale.v56);

  /// Offset of 60px on the left side
  static const l60 = EdgeInsets.only(left: TSpacingScale.v60);

  /// Offset of 64px on the left side
  static const l64 = EdgeInsets.only(left: TSpacingScale.v64);

  /// Offset of 72px on the left side
  static const l72 = EdgeInsets.only(left: TSpacingScale.v72);

  /// Offset of 80px on the left side
  static const l80 = EdgeInsets.only(left: TSpacingScale.v80);

  /// Offset of 96px on the left side
  static const l96 = EdgeInsets.only(left: TSpacingScale.v96);

  /// Offset of 160px on the left side
  static const l160 = EdgeInsets.only(left: TSpacingScale.v160);

  /// Offset of 176px on the left side
  static const l176 = EdgeInsets.only(left: TSpacingScale.v176);

  /// Offset of 192px on the left side
  static const l192 = EdgeInsets.only(left: TSpacingScale.v192);

  /// Offset of 208px on the left side
  static const l208 = EdgeInsets.only(left: TSpacingScale.v208);

  /// Offset of 224px on the left side
  static const l224 = EdgeInsets.only(left: TSpacingScale.v224);

  /// Offset of 240px on the left side
  static const l240 = EdgeInsets.only(left: TSpacingScale.v240);

  /// Offset of 256px on the left side
  static const l256 = EdgeInsets.only(top: TSpacingScale.v256);

  /// Offset of 288px on the left side
  static const l288 = EdgeInsets.only(top: TSpacingScale.v288);

  /// Offset of 320px on the left side
  static const l320 = EdgeInsets.only(top: TSpacingScale.v320);

  /// Offset of 384px on the left side
  static const l384 = EdgeInsets.only(top: TSpacingScale.v384);

  // -------------------------------------------------
  // Top Side Offset
  // -------------------------------------------------

  /// Offset of 0px on the top side
  static const t0 = EdgeInsets.zero;

  /// Offset of 1px on the top side
  static const t1 = EdgeInsets.only(top: TSpacingScale.v1);

  /// Offset of 2px on the top side
  static const t2 = EdgeInsets.only(top: TSpacingScale.v2);

  /// Offset of 4px on the top side
  static const t4 = EdgeInsets.only(top: TSpacingScale.v4);

  /// Offset of 6px on the top side
  static const t6 = EdgeInsets.only(top: TSpacingScale.v6);

  /// Offset of 8px on the top side
  static const t8 = EdgeInsets.only(top: TSpacingScale.v8);

  /// Offset of 10px on the top side
  static const t10 = EdgeInsets.only(top: TSpacingScale.v10);

  /// Offset of 12px on the top side
  static const t12 = EdgeInsets.only(top: TSpacingScale.v12);

  /// Offset of 14px on the top side
  static const t14 = EdgeInsets.only(top: TSpacingScale.v14);

  /// Offset of 16px on the top side
  static const t16 = EdgeInsets.only(top: TSpacingScale.v16);

  /// Offset of 20px on the top side
  static const t20 = EdgeInsets.only(top: TSpacingScale.v20);

  /// Offset of 24px on the top side
  static const t24 = EdgeInsets.only(top: TSpacingScale.v24);

  /// Offset of 28px on the top side
  static const t28 = EdgeInsets.only(top: TSpacingScale.v28);

  /// Offset of 32px on the top side
  static const t32 = EdgeInsets.only(top: TSpacingScale.v32);

  /// Offset of 36px on the top side
  static const t36 = EdgeInsets.only(top: TSpacingScale.v36);

  /// Offset of 40px on the top side
  static const t40 = EdgeInsets.only(top: TSpacingScale.v40);

  /// Offset of 44px on the top side
  static const t44 = EdgeInsets.only(top: TSpacingScale.v44);

  /// Offset of 48px on the top side
  static const t48 = EdgeInsets.only(top: TSpacingScale.v48);

  /// Offset of 52px on the top side
  static const t52 = EdgeInsets.only(top: TSpacingScale.v52);

  /// Offset of 56px on the top side
  static const t56 = EdgeInsets.only(top: TSpacingScale.v56);

  /// Offset of 60px on the top side
  static const t60 = EdgeInsets.only(top: TSpacingScale.v60);

  /// Offset of 64px on the top side
  static const t64 = EdgeInsets.only(top: TSpacingScale.v64);

  /// Offset of 72px on the top side
  static const t72 = EdgeInsets.only(top: TSpacingScale.v72);

  /// Offset of 80px on the top side
  static const t80 = EdgeInsets.only(top: TSpacingScale.v80);

  /// Offset of 96px on the top side
  static const t96 = EdgeInsets.only(top: TSpacingScale.v96);

  /// Offset of 160px on the top side
  static const t160 = EdgeInsets.only(top: TSpacingScale.v160);

  /// Offset of 176px on the top side
  static const t176 = EdgeInsets.only(top: TSpacingScale.v176);

  /// Offset of 192px on the top side
  static const t192 = EdgeInsets.only(top: TSpacingScale.v192);

  /// Offset of 208px on the top side
  static const t208 = EdgeInsets.only(top: TSpacingScale.v208);

  /// Offset of 224px on the top side
  static const t224 = EdgeInsets.only(top: TSpacingScale.v224);

  /// Offset of 240px on the top side
  static const t240 = EdgeInsets.only(top: TSpacingScale.v240);

  /// Offset of 256px on the top side
  static const t256 = EdgeInsets.only(top: TSpacingScale.v256);

  /// Offset of 288px on the top side
  static const t288 = EdgeInsets.only(top: TSpacingScale.v288);

  /// Offset of 320px on the top side
  static const t320 = EdgeInsets.only(top: TSpacingScale.v320);

  /// Offset of 320px on the top side
  static const t384 = EdgeInsets.only(top: TSpacingScale.v384);

  // -------------------------------------------------
  // Right Side Offset
  // -------------------------------------------------

  /// Offset of 0px on the right side
  static const r0 = EdgeInsets.zero;

  /// Offset of 1px on the right side
  static const r1 = EdgeInsets.only(right: TSpacingScale.v1);

  /// Offset of 2px on the right side
  static const r2 = EdgeInsets.only(right: TSpacingScale.v2);

  /// Offset of 4px on the right side
  static const r4 = EdgeInsets.only(right: TSpacingScale.v4);

  /// Offset of 6px on the right side
  static const r6 = EdgeInsets.only(right: TSpacingScale.v6);

  /// Offset of 8px on the right side
  static const r8 = EdgeInsets.only(right: TSpacingScale.v8);

  /// Offset of 10px on the right side
  static const r10 = EdgeInsets.only(right: TSpacingScale.v10);

  /// Offset of 12px on the right side
  static const r12 = EdgeInsets.only(right: TSpacingScale.v12);

  /// Offset of 14px on the right side
  static const r14 = EdgeInsets.only(right: TSpacingScale.v14);

  /// Offset of 16px on the right side
  static const r16 = EdgeInsets.only(right: TSpacingScale.v16);

  /// Offset of 20px on the right side
  static const r20 = EdgeInsets.only(right: TSpacingScale.v20);

  /// Offset of 24px on the right side
  static const r24 = EdgeInsets.only(right: TSpacingScale.v24);

  /// Offset of 28px on the right side
  static const r28 = EdgeInsets.only(right: TSpacingScale.v28);

  /// Offset of 32px on the right side
  static const r32 = EdgeInsets.only(right: TSpacingScale.v32);

  /// Offset of 36px on the right side
  static const r36 = EdgeInsets.only(right: TSpacingScale.v36);

  /// Offset of 40px on the right side
  static const r40 = EdgeInsets.only(right: TSpacingScale.v40);

  /// Offset of 44px on the right side
  static const r44 = EdgeInsets.only(right: TSpacingScale.v44);

  /// Offset of 48px on the right side
  static const r48 = EdgeInsets.only(right: TSpacingScale.v48);

  /// Offset of 52px on the right side
  static const r52 = EdgeInsets.only(right: TSpacingScale.v52);

  /// Offset of 56px on the right side
  static const r56 = EdgeInsets.only(right: TSpacingScale.v56);

  /// Offset of 60px on the right side
  static const r60 = EdgeInsets.only(right: TSpacingScale.v60);

  /// Offset of 64px on the right side
  static const r64 = EdgeInsets.only(right: TSpacingScale.v64);

  /// Offset of 72px on the right side
  static const r72 = EdgeInsets.only(right: TSpacingScale.v72);

  /// Offset of 80px on the right side
  static const r80 = EdgeInsets.only(right: TSpacingScale.v80);

  /// Offset of 96px on the right side
  static const r96 = EdgeInsets.only(right: TSpacingScale.v96);

  /// Offset of 160px on the right side
  static const r160 = EdgeInsets.only(right: TSpacingScale.v160);

  /// Offset of 176px on the right side
  static const r176 = EdgeInsets.only(right: TSpacingScale.v176);

  /// Offset of 192px on the right side
  static const r192 = EdgeInsets.only(right: TSpacingScale.v192);

  /// Offset of 208px on the right side
  static const r208 = EdgeInsets.only(right: TSpacingScale.v208);

  /// Offset of 224px on the right side
  static const r224 = EdgeInsets.only(right: TSpacingScale.v224);

  /// Offset of 240px on the right side
  static const r240 = EdgeInsets.only(right: TSpacingScale.v240);

  /// Offset of 256px on the right side
  static const r256 = EdgeInsets.only(top: TSpacingScale.v256);

  /// Offset of 288px on the right side
  static const r288 = EdgeInsets.only(top: TSpacingScale.v288);

  /// Offset of 320px on the right side
  static const r320 = EdgeInsets.only(top: TSpacingScale.v320);

  /// Offset of 384px on the right side
  static const r384 = EdgeInsets.only(top: TSpacingScale.v384);

  // -------------------------------------------------
  // Bottom Side Offset
  // -------------------------------------------------

  /// Offset of 0px on the bottom side
  static const b0 = EdgeInsets.zero;

  /// Offset of 1px on the bottom side
  static const b1 = EdgeInsets.only(bottom: TSpacingScale.v1);

  /// Offset of 2px on the bottom side
  static const b2 = EdgeInsets.only(bottom: TSpacingScale.v2);

  /// Offset of 4px on the bottom side
  static const b4 = EdgeInsets.only(bottom: TSpacingScale.v4);

  /// Offset of 6px on the bottom side
  static const b6 = EdgeInsets.only(bottom: TSpacingScale.v6);

  /// Offset of 8px on the bottom side
  static const b8 = EdgeInsets.only(bottom: TSpacingScale.v8);

  /// Offset of 10px on the bottom side
  static const b10 = EdgeInsets.only(bottom: TSpacingScale.v10);

  /// Offset of 12px on the bottom side
  static const b12 = EdgeInsets.only(bottom: TSpacingScale.v12);

  /// Offset of 14px on the bottom side
  static const b14 = EdgeInsets.only(bottom: TSpacingScale.v14);

  /// Offset of 16px on the bottom side
  static const b16 = EdgeInsets.only(bottom: TSpacingScale.v16);

  /// Offset of 20px on the bottom side
  static const b20 = EdgeInsets.only(bottom: TSpacingScale.v20);

  /// Offset of 24px on the bottom side
  static const b24 = EdgeInsets.only(bottom: TSpacingScale.v24);

  /// Offset of 28px on the bottom side
  static const b28 = EdgeInsets.only(bottom: TSpacingScale.v28);

  /// Offset of 32px on the bottom side
  static const b32 = EdgeInsets.only(bottom: TSpacingScale.v32);

  /// Offset of 36px on the bottom side
  static const b36 = EdgeInsets.only(bottom: TSpacingScale.v36);

  /// Offset of 40px on the bottom side
  static const b40 = EdgeInsets.only(bottom: TSpacingScale.v40);

  /// Offset of 44px on the bottom side
  static const b44 = EdgeInsets.only(bottom: TSpacingScale.v44);

  /// Offset of 48px on the bottom side
  static const b48 = EdgeInsets.only(bottom: TSpacingScale.v48);

  /// Offset of 52px on the bottom side
  static const b52 = EdgeInsets.only(bottom: TSpacingScale.v52);

  /// Offset of 56px on the bottom side
  static const b56 = EdgeInsets.only(bottom: TSpacingScale.v56);

  /// Offset of 60px on the bottom side
  static const b60 = EdgeInsets.only(bottom: TSpacingScale.v60);

  /// Offset of 64px on the bottom side
  static const b64 = EdgeInsets.only(bottom: TSpacingScale.v64);

  /// Offset of 72px on the bottom side
  static const b72 = EdgeInsets.only(bottom: TSpacingScale.v72);

  /// Offset of 80px on the bottom side
  static const b80 = EdgeInsets.only(bottom: TSpacingScale.v80);

  /// Offset of 96px on the bottom side
  static const b96 = EdgeInsets.only(bottom: TSpacingScale.v96);

  /// Offset of 160px on the bottom side
  static const b160 = EdgeInsets.only(bottom: TSpacingScale.v160);

  /// Offset of 176px on the bottom side
  static const b176 = EdgeInsets.only(bottom: TSpacingScale.v176);

  /// Offset of 192px on the bottom side
  static const b192 = EdgeInsets.only(bottom: TSpacingScale.v192);

  /// Offset of 208px on the bottom side
  static const b208 = EdgeInsets.only(bottom: TSpacingScale.v208);

  /// Offset of 224px on the bottom side
  static const b224 = EdgeInsets.only(bottom: TSpacingScale.v224);

  /// Offset of 240px on the bottom side
  static const b240 = EdgeInsets.only(bottom: TSpacingScale.v240);

  /// Offset of 256px on the bottom side
  static const b256 = EdgeInsets.only(top: TSpacingScale.v256);

  /// Offset of 288px on the bottom side
  static const b288 = EdgeInsets.only(top: TSpacingScale.v288);

  /// Offset of 320px on the bottom side
  static const b320 = EdgeInsets.only(top: TSpacingScale.v320);

  /// Offset of 384px on the bottom side
  static const b384 = EdgeInsets.only(top: TSpacingScale.v384);
}
