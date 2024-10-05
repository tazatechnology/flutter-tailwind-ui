import 'package:flutter/widgets.dart';

import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// CLASS: TSizedBox
// =================================================

/// SizedBox with Tailwind CSS standard dimensions
class TSizedBox extends SizedBox {
  /// SizedBox with a fixed square dimension
  ///
  /// See [TSpacingScale] for standardized dimensions
  ///
  /// If possible, use the predefined static values that are available at each
  /// [TSpacingScale] increment, e.g. [TSizedBox.s16] for 16px square
  const TSizedBox.square({
    super.key,
    super.child,
    double? size,
  }) : super.square(dimension: size);

  /// SizedBox with fixed horizontal dimension
  ///
  /// See [TSpacingScale] for standardized dimensions
  ///
  /// If possible, use the predefined static values that are available at each
  /// [TSpacingScale] increment, e.g. [TSizedBox.x16] for 16px in width
  const TSizedBox.x({
    super.key,
    super.child,
    double? size,
  }) : super(width: size);

  /// SizedBox with fixed vertical dimension
  ///
  /// See [TSpacingScale] for standardized dimensions
  ///
  /// If possible, use the predefined static values that are available at each
  /// [TSpacingScale] increment, e.g. [TSizedBox.y16] for 16px in height
  const TSizedBox.y({
    super.key,
    super.child,
    double? size,
  }) : super(height: size);

  // -------------------------------------------------
  // Static: Square SizedBox
  // -------------------------------------------------

  /// SizedBox with a square dimension of 0px
  static const s0 = TSizedBox.square(size: TSpacingScale.v0);

  /// SizedBox with a square dimension of 1px
  static const s1 = TSizedBox.square(size: TSpacingScale.v1);

  /// SizedBox with a square dimension of 2px
  static const s2 = TSizedBox.square(size: TSpacingScale.v2);

  /// SizedBox with a square dimension of 4px
  static const s4 = TSizedBox.square(size: TSpacingScale.v4);

  /// SizedBox with a square dimension of 6px
  static const s6 = TSizedBox.square(size: TSpacingScale.v6);

  /// SizedBox with a square dimension of 8px
  static const s8 = TSizedBox.square(size: TSpacingScale.v8);

  /// SizedBox with a square dimension of 10px
  static const s10 = TSizedBox.square(size: TSpacingScale.v10);

  /// SizedBox with a square dimension of 12px
  static const s12 = TSizedBox.square(size: TSpacingScale.v12);

  /// SizedBox with a square dimension of 14px
  static const s14 = TSizedBox.square(size: TSpacingScale.v14);

  /// SizedBox with a square dimension of 16px
  static const s16 = TSizedBox.square(size: TSpacingScale.v16);

  /// SizedBox with a square dimension of 20px
  static const s20 = TSizedBox.square(size: TSpacingScale.v20);

  /// SizedBox with a square dimension of 24px
  static const s24 = TSizedBox.square(size: TSpacingScale.v24);

  /// SizedBox with a square dimension of 28px
  static const s28 = TSizedBox.square(size: TSpacingScale.v28);

  /// SizedBox with a square dimension of 32px
  static const s32 = TSizedBox.square(size: TSpacingScale.v32);

  /// SizedBox with a square dimension of 36px
  static const s36 = TSizedBox.square(size: TSpacingScale.v36);

  /// SizedBox with a square dimension of 40px
  static const s40 = TSizedBox.square(size: TSpacingScale.v40);

  /// SizedBox with a square dimension of 44px
  static const s44 = TSizedBox.square(size: TSpacingScale.v44);

  /// SizedBox with a square dimension of 48px
  static const s48 = TSizedBox.square(size: TSpacingScale.v48);

  /// SizedBox with a square dimension of 52px
  static const s52 = TSizedBox.square(size: TSpacingScale.v52);

  /// SizedBox with a square dimension of 56px
  static const s56 = TSizedBox.square(size: TSpacingScale.v56);

  /// SizedBox with a square dimension of 60px
  static const s60 = TSizedBox.square(size: TSpacingScale.v60);

  /// SizedBox with a square dimension of 64px
  static const s64 = TSizedBox.square(size: TSpacingScale.v64);

  /// SizedBox with a square dimension of 72px
  static const s72 = TSizedBox.square(size: TSpacingScale.v72);

  /// SizedBox with a square dimension of 80px
  static const s80 = TSizedBox.square(size: TSpacingScale.v80);

  /// SizedBox with a square dimension of 96px
  static const s96 = TSizedBox.square(size: TSpacingScale.v96);

  /// SizedBox with a square dimension of 160px
  static const s160 = TSizedBox.square(size: TSpacingScale.v160);

  /// SizedBox with a square dimension of 176px
  static const s176 = TSizedBox.square(size: TSpacingScale.v176);

  /// SizedBox with a square dimension of 192px
  static const s192 = TSizedBox.square(size: TSpacingScale.v192);

  /// SizedBox with a square dimension of 208px
  static const s208 = TSizedBox.square(size: TSpacingScale.v208);

  /// SizedBox with a square dimension of 224px
  static const s224 = TSizedBox.square(size: TSpacingScale.v224);

  /// SizedBox with a square dimension of 240px
  static const s240 = TSizedBox.square(size: TSpacingScale.v240);

  /// SizedBox with a square dimension of 256px
  static const s256 = TSizedBox.square(size: TSpacingScale.v256);

  /// SizedBox with a square dimension of 288px
  static const s288 = TSizedBox.square(size: TSpacingScale.v288);

  /// SizedBox with a square dimension of 320px
  static const s320 = TSizedBox.square(size: TSpacingScale.v320);

  /// SizedBox with a square dimension of 384px
  static const s384 = TSizedBox.square(size: TSpacingScale.v384);

  // -------------------------------------------------
  // Static: Horizontal SizedBox
  // -------------------------------------------------

  /// SizedBox with a width of 0px
  static const x0 = TSizedBox.x(size: TSpacingScale.v0);

  /// SizedBox with a width of 1px
  static const x1 = TSizedBox.x(size: TSpacingScale.v1);

  /// SizedBox with a width of 2px
  static const x2 = TSizedBox.x(size: TSpacingScale.v2);

  /// SizedBox with a width of 4px
  static const x4 = TSizedBox.x(size: TSpacingScale.v4);

  /// SizedBox with a width of 6px
  static const x6 = TSizedBox.x(size: TSpacingScale.v6);

  /// SizedBox with a width of 8px
  static const x8 = TSizedBox.x(size: TSpacingScale.v8);

  /// SizedBox with a width of 10px
  static const x10 = TSizedBox.x(size: TSpacingScale.v10);

  /// SizedBox with a width of 12px
  static const x12 = TSizedBox.x(size: TSpacingScale.v12);

  /// SizedBox with a width of 14px
  static const x14 = TSizedBox.x(size: TSpacingScale.v14);

  /// SizedBox with a width of 16px
  static const x16 = TSizedBox.x(size: TSpacingScale.v16);

  /// SizedBox with a width of 20px
  static const x20 = TSizedBox.x(size: TSpacingScale.v20);

  /// SizedBox with a width of 24px
  static const x24 = TSizedBox.x(size: TSpacingScale.v24);

  /// SizedBox with a width of 28px
  static const x28 = TSizedBox.x(size: TSpacingScale.v28);

  /// SizedBox with a width of 32px
  static const x32 = TSizedBox.x(size: TSpacingScale.v32);

  /// SizedBox with a width of 36px
  static const x36 = TSizedBox.x(size: TSpacingScale.v36);

  /// SizedBox with a width of 40px
  static const x40 = TSizedBox.x(size: TSpacingScale.v40);

  /// SizedBox with a width of 44px
  static const x44 = TSizedBox.x(size: TSpacingScale.v44);

  /// SizedBox with a width of 48px
  static const x48 = TSizedBox.x(size: TSpacingScale.v48);

  /// SizedBox with a width of 52px
  static const x52 = TSizedBox.x(size: TSpacingScale.v52);

  /// SizedBox with a width of 56px
  static const x56 = TSizedBox.x(size: TSpacingScale.v56);

  /// SizedBox with a width of 60px
  static const x60 = TSizedBox.x(size: TSpacingScale.v60);

  /// SizedBox with a width of 64px
  static const x64 = TSizedBox.x(size: TSpacingScale.v64);

  /// SizedBox with a width of 72px
  static const x72 = TSizedBox.x(size: TSpacingScale.v72);

  /// SizedBox with a width of 80px
  static const x80 = TSizedBox.x(size: TSpacingScale.v80);

  /// SizedBox with a width of 96px
  static const x96 = TSizedBox.x(size: TSpacingScale.v96);

  /// SizedBox with a width of 160px
  static const x160 = TSizedBox.x(size: TSpacingScale.v160);

  /// SizedBox with a width of 176px
  static const x176 = TSizedBox.x(size: TSpacingScale.v176);

  /// SizedBox with a width of 192px
  static const x192 = TSizedBox.x(size: TSpacingScale.v192);

  /// SizedBox with a width of 208px
  static const x208 = TSizedBox.x(size: TSpacingScale.v208);

  /// SizedBox with a width of 224px
  static const x224 = TSizedBox.x(size: TSpacingScale.v224);

  /// SizedBox with a width of 240px
  static const x240 = TSizedBox.x(size: TSpacingScale.v240);

  /// SizedBox with a width of 256px
  static const x256 = TSizedBox.x(size: TSpacingScale.v256);

  /// SizedBox with a width of 288px
  static const x288 = TSizedBox.x(size: TSpacingScale.v288);

  /// SizedBox with a width of 320px
  static const x320 = TSizedBox.x(size: TSpacingScale.v320);

  /// SizedBox with a width of 384px
  static const x384 = TSizedBox.x(size: TSpacingScale.v384);

  // -------------------------------------------------
  // Static: Vertical SizedBox
  // -------------------------------------------------

  /// SizedBox with a height of 0px
  static const y0 = TSizedBox.y(size: TSpacingScale.v0);

  /// SizedBox with a height of 1px
  static const y1 = TSizedBox.y(size: TSpacingScale.v1);

  /// SizedBox with a height of 2px
  static const y2 = TSizedBox.y(size: TSpacingScale.v2);

  /// SizedBox with a height of 4px
  static const y4 = TSizedBox.y(size: TSpacingScale.v4);

  /// SizedBox with a height of 6px
  static const y6 = TSizedBox.y(size: TSpacingScale.v6);

  /// SizedBox with a height of 8px
  static const y8 = TSizedBox.y(size: TSpacingScale.v8);

  /// SizedBox with a height of 10px
  static const y10 = TSizedBox.y(size: TSpacingScale.v10);

  /// SizedBox with a height of 12px
  static const y12 = TSizedBox.y(size: TSpacingScale.v12);

  /// SizedBox with a height of 14px
  static const y14 = TSizedBox.y(size: TSpacingScale.v14);

  /// SizedBox with a height of 16px
  static const y16 = TSizedBox.y(size: TSpacingScale.v16);

  /// SizedBox with a height of 20px
  static const y20 = TSizedBox.y(size: TSpacingScale.v20);

  /// SizedBox with a height of 24px
  static const y24 = TSizedBox.y(size: TSpacingScale.v24);

  /// SizedBox with a height of 28px
  static const y28 = TSizedBox.y(size: TSpacingScale.v28);

  /// SizedBox with a height of 32px
  static const y32 = TSizedBox.y(size: TSpacingScale.v32);

  /// SizedBox with a height of 36px
  static const y36 = TSizedBox.y(size: TSpacingScale.v36);

  /// SizedBox with a height of 40px
  static const y40 = TSizedBox.y(size: TSpacingScale.v40);

  /// SizedBox with a height of 44px
  static const y44 = TSizedBox.y(size: TSpacingScale.v44);

  /// SizedBox with a height of 48px
  static const y48 = TSizedBox.y(size: TSpacingScale.v48);

  /// SizedBox with a height of 52px
  static const y52 = TSizedBox.y(size: TSpacingScale.v52);

  /// SizedBox with a height of 56px
  static const y56 = TSizedBox.y(size: TSpacingScale.v56);

  /// SizedBox with a height of 60px
  static const y60 = TSizedBox.y(size: TSpacingScale.v60);

  /// SizedBox with a height of 64px
  static const y64 = TSizedBox.y(size: TSpacingScale.v64);

  /// SizedBox with a height of 72px
  static const y72 = TSizedBox.y(size: TSpacingScale.v72);

  /// SizedBox with a height of 80px
  static const y80 = TSizedBox.y(size: TSpacingScale.v80);

  /// SizedBox with a height of 96px
  static const y96 = TSizedBox.y(size: TSpacingScale.v96);

  /// SizedBox with a height of 160px
  static const y160 = TSizedBox.y(size: TSpacingScale.v160);

  /// SizedBox with a height of 176px
  static const y176 = TSizedBox.y(size: TSpacingScale.v176);

  /// SizedBox with a height of 192px
  static const y192 = TSizedBox.y(size: TSpacingScale.v192);

  /// SizedBox with a height of 208px
  static const y208 = TSizedBox.y(size: TSpacingScale.v208);

  /// SizedBox with a height of 224px
  static const y224 = TSizedBox.y(size: TSpacingScale.v224);

  /// SizedBox with a height of 240px
  static const y240 = TSizedBox.y(size: TSpacingScale.v240);

  /// SizedBox with a height of 256px
  static const y256 = TSizedBox.y(size: TSpacingScale.v256);

  /// SizedBox with a height of 288px
  static const y288 = TSizedBox.y(size: TSpacingScale.v288);

  /// SizedBox with a height of 320px
  static const y320 = TSizedBox.y(size: TSpacingScale.v320);

  /// SizedBox with a height of 384px
  static const y384 = TSizedBox.y(size: TSpacingScale.v384);
}
