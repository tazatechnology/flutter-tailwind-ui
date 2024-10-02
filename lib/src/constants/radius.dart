import 'package:flutter/material.dart';

import 'scale.dart';

// =================================================
// CLASS: TRadius
// =================================================

/// Tailwind radius system for defining rounded corners
///
/// Scaling system is based on 2px increments (and 9999px for full) defined in [TRadiusScale]
///
/// https://tailwindcss.com/docs/border-radius
class TRadius {
  /// Circular radius of 0px (no rounded corners)
  static const c0 = Radius.circular(TRadiusScale.r0);

  /// Circular radius of 2px (sm)
  static const c1 = Radius.circular(TRadiusScale.r1);

  /// Circular radius of 4px  (base)
  static const c2 = Radius.circular(TRadiusScale.r2);

  /// Circular radius of 6px  (md)
  static const c3 = Radius.circular(TRadiusScale.r3);

  /// Circular radius of 8px  (lg)
  static const c4 = Radius.circular(TRadiusScale.r4);

  /// Circular radius of 12px (xl)
  static const c5 = Radius.circular(TRadiusScale.r5);

  /// Circular radius of 16px (2xl)
  static const c6 = Radius.circular(TRadiusScale.r6);

  /// Circular radius of 24px (3xl)
  static const c7 = Radius.circular(TRadiusScale.r7);

  /// Circular radius of 9999px (full).
  static const c8 = Radius.circular(TRadiusScale.r8);
}

// =================================================
// CLASS: TBorderRadius
// =================================================

/// Tailwind border-radius system for defining rounded corners
///
/// Scaling system is based on 2px increments (and 9999px for full) defined in [TRadiusScale]
///
/// https://tailwindcss.com/docs/border-radius
class TBorderRadius {
  // -------------------------------------------------
  // Border Radius: All
  // -------------------------------------------------

  /// Border radius of 0px (no rounded corners)
  static const a0 = BorderRadius.all(TRadius.c0);

  /// Border radius of 2px (sm)
  static const a1 = BorderRadius.all(TRadius.c1);

  /// Border radius of 4px (base)
  static const a2 = BorderRadius.all(TRadius.c2);

  /// Border radius of 6px (md)
  static const a3 = BorderRadius.all(TRadius.c3);

  /// Border radius of 8px (lg)
  static const a4 = BorderRadius.all(TRadius.c4);

  /// Border radius of 12px (xl)
  static const a5 = BorderRadius.all(TRadius.c5);

  /// Border radius of 16px (2xl)
  static const a6 = BorderRadius.all(TRadius.c6);

  /// Border radius of 24px (3xl)
  static const a7 = BorderRadius.all(TRadius.c7);

  /// Border radius of 9999px (full)
  static const a8 = BorderRadius.all(TRadius.c8);

  // -------------------------------------------------
  // Border Radius: Top
  // -------------------------------------------------

  /// Border radius on the top side of 0px (no rounded corners)
  static const t0 =
      BorderRadius.only(topLeft: TRadius.c0, topRight: TRadius.c0);

  /// Border radius on the top side of 2px (sm)
  static const t1 =
      BorderRadius.only(topLeft: TRadius.c1, topRight: TRadius.c1);

  /// Border radius on the top side of 4px (base)
  static const t2 =
      BorderRadius.only(topLeft: TRadius.c2, topRight: TRadius.c2);

  /// Border radius on the top side of 6px (md)
  static const t3 =
      BorderRadius.only(topLeft: TRadius.c3, topRight: TRadius.c3);

  /// Border radius on the top side of 8px (lg)
  static const t4 =
      BorderRadius.only(topLeft: TRadius.c4, topRight: TRadius.c4);

  /// Border radius on the top side of 12px (xl)
  static const t5 =
      BorderRadius.only(topLeft: TRadius.c5, topRight: TRadius.c5);

  /// Border radius on the top side of 16px (2xl)
  static const t6 =
      BorderRadius.only(topLeft: TRadius.c6, topRight: TRadius.c6);

  /// Border radius on the top side of 24px (3xl)
  static const t7 =
      BorderRadius.only(topLeft: TRadius.c7, topRight: TRadius.c7);

  /// Border radius on the top side of 9999px (full)
  static const t8 =
      BorderRadius.only(topLeft: TRadius.c8, topRight: TRadius.c8);

  // -------------------------------------------------
  // Border Radius: Bottom
  // -------------------------------------------------

  /// Border radius on the bottom side of 0px (no rounded corners)
  static const b0 =
      BorderRadius.only(bottomLeft: TRadius.c0, bottomRight: TRadius.c0);

  /// Border radius on the bottom side of 2px (sm)
  static const b1 =
      BorderRadius.only(bottomLeft: TRadius.c1, bottomRight: TRadius.c1);

  /// Border radius on the bottom side of 4px (base)
  static const b2 =
      BorderRadius.only(bottomLeft: TRadius.c2, bottomRight: TRadius.c2);

  /// Border radius on the bottom side of 6px (md)
  static const b3 =
      BorderRadius.only(bottomLeft: TRadius.c3, bottomRight: TRadius.c3);

  /// Border radius on the bottom side of 8px (lg)
  static const b4 =
      BorderRadius.only(bottomLeft: TRadius.c4, bottomRight: TRadius.c4);

  /// Border radius on the bottom side of 12px (xl)
  static const b5 =
      BorderRadius.only(bottomLeft: TRadius.c5, bottomRight: TRadius.c5);

  /// Border radius on the bottom side of 16px (2xl)
  static const b6 =
      BorderRadius.only(bottomLeft: TRadius.c6, bottomRight: TRadius.c6);

  /// Border radius on the bottom side of 24px (3xl)
  static const b7 =
      BorderRadius.only(bottomLeft: TRadius.c7, bottomRight: TRadius.c7);

  /// Border radius on the bottom side of 9999px (full)
  static const b8 =
      BorderRadius.only(bottomLeft: TRadius.c8, bottomRight: TRadius.c8);

  // -------------------------------------------------
  // Border Radius: Left
  // -------------------------------------------------

  /// Border radius on the left side of 0px (no rounded corners)
  static const l0 =
      BorderRadius.only(topLeft: TRadius.c0, bottomLeft: TRadius.c0);

  /// Border radius on the left side of 2px (sm)
  static const l1 =
      BorderRadius.only(topLeft: TRadius.c1, bottomLeft: TRadius.c1);

  /// Border radius on the left side of 4px (base)
  static const l2 =
      BorderRadius.only(topLeft: TRadius.c2, bottomLeft: TRadius.c2);

  /// Border radius on the left side of 6px (md)
  static const l3 =
      BorderRadius.only(topLeft: TRadius.c3, bottomLeft: TRadius.c3);

  /// Border radius on the left side of 8px (lg)
  static const l4 =
      BorderRadius.only(topLeft: TRadius.c4, bottomLeft: TRadius.c4);

  /// Border radius on the left side of 12px (xl)
  static const l5 =
      BorderRadius.only(topLeft: TRadius.c5, bottomLeft: TRadius.c5);

  /// Border radius on the left side of 16px (2xl)
  static const l6 =
      BorderRadius.only(topLeft: TRadius.c6, bottomLeft: TRadius.c6);

  /// Border radius on the left side of 24px (3xl)
  static const l7 =
      BorderRadius.only(topLeft: TRadius.c7, bottomLeft: TRadius.c7);

  /// Border radius on the left side of 9999px (full)
  static const l8 =
      BorderRadius.only(topLeft: TRadius.c8, bottomLeft: TRadius.c8);

  // -------------------------------------------------
  // Border Radius: Right
  // -------------------------------------------------

  /// Border radius on the right side of 0px (no rounded corners)
  static const r0 =
      BorderRadius.only(topRight: TRadius.c0, bottomRight: TRadius.c0);

  /// Border radius on the right side of 2px (sm)
  static const r1 =
      BorderRadius.only(topRight: TRadius.c1, bottomRight: TRadius.c1);

  /// Border radius on the right side of 4px (base)
  static const r2 =
      BorderRadius.only(topRight: TRadius.c2, bottomRight: TRadius.c2);

  /// Border radius on the right side of 6px (md)
  static const r3 =
      BorderRadius.only(topRight: TRadius.c3, bottomRight: TRadius.c3);

  /// Border radius on the right side of 8px (lg)
  static const r4 =
      BorderRadius.only(topRight: TRadius.c4, bottomRight: TRadius.c4);

  /// Border radius on the right side of 12px (xl)
  static const r5 =
      BorderRadius.only(topRight: TRadius.c5, bottomRight: TRadius.c5);

  /// Border radius on the right side of 16px (2xl)
  static const r6 =
      BorderRadius.only(topRight: TRadius.c6, bottomRight: TRadius.c6);

  /// Border radius on the right side of 24px (3xl)
  static const r7 =
      BorderRadius.only(topRight: TRadius.c7, bottomRight: TRadius.c7);

  /// Border radius on the right side of 9999px (full)
  static const r8 =
      BorderRadius.only(topRight: TRadius.c8, bottomRight: TRadius.c8);

  // -------------------------------------------------
  // Border Radius: Top-Left
  // -------------------------------------------------

  /// Border radius on the top-left corner of 0px
  static const tl0 = BorderRadius.only(topLeft: TRadius.c0);

  /// Border radius on the top-left corner of 2px (sm)
  static const tl1 = BorderRadius.only(topLeft: TRadius.c1);

  /// Border radius on the top-left corner of 4px (base)
  static const tl2 = BorderRadius.only(topLeft: TRadius.c2);

  /// Border radius on the top-left corner of 6px (md)
  static const tl3 = BorderRadius.only(topLeft: TRadius.c3);

  /// Border radius on the top-left corner of 8px (lg)
  static const tl4 = BorderRadius.only(topLeft: TRadius.c4);

  /// Border radius on the top-left corner of 12px (xl)
  static const tl5 = BorderRadius.only(topLeft: TRadius.c5);

  /// Border radius on the top-left corner of 16px (2xl)
  static const tl6 = BorderRadius.only(topLeft: TRadius.c6);

  /// Border radius on the top-left corner of 24px (3xl)
  static const tl7 = BorderRadius.only(topLeft: TRadius.c7);

  /// Border radius on the top-left corner of 9999px (full)
  static const tl8 = BorderRadius.only(topLeft: TRadius.c8);

  // -------------------------------------------------
  // Border Radius: Top-Right
  // -------------------------------------------------

  /// Border radius on the top-right corner of 0px
  static const tr0 = BorderRadius.only(topRight: TRadius.c0);

  /// Border radius on the top-right corner of 2px (sm)
  static const tr1 = BorderRadius.only(topRight: TRadius.c1);

  /// Border radius on the top-right corner of 4px (base)
  static const tr2 = BorderRadius.only(topRight: TRadius.c2);

  /// Border radius on the top-right corner of 6px (md)
  static const tr3 = BorderRadius.only(topRight: TRadius.c3);

  /// Border radius on the top-right corner of 8px (lg)
  static const tr4 = BorderRadius.only(topRight: TRadius.c4);

  /// Border radius on the top-right corner of 12px (xl)
  static const tr5 = BorderRadius.only(topRight: TRadius.c5);

  /// Border radius on the top-right corner of 16px (2xl)
  static const tr6 = BorderRadius.only(topRight: TRadius.c6);

  /// Border radius on the top-right corner of 24px (3xl)
  static const tr7 = BorderRadius.only(topRight: TRadius.c7);

  /// Border radius on the top-right corner of 9999px (full)
  static const tr8 = BorderRadius.only(topRight: TRadius.c8);

  // -------------------------------------------------
  // Border Radius: Bottom-Right
  // -------------------------------------------------

  /// Border radius on the bottom-right corner of 0px
  static const br0 = BorderRadius.only(bottomRight: TRadius.c0);

  /// Border radius on the bottom-right corner of 2px (sm)
  static const br1 = BorderRadius.only(bottomRight: TRadius.c1);

  /// Border radius on the bottom-right corner of 4px (base)
  static const br2 = BorderRadius.only(bottomRight: TRadius.c2);

  /// Border radius on the bottom-right corner of 6px (md)
  static const br3 = BorderRadius.only(bottomRight: TRadius.c3);

  /// Border radius on the bottom-right corner of 8px (lg)
  static const br4 = BorderRadius.only(bottomRight: TRadius.c4);

  /// Border radius on the bottom-right corner of 12px (xl)
  static const br5 = BorderRadius.only(bottomRight: TRadius.c5);

  /// Border radius on the bottom-right corner of 16px (2xl)
  static const br6 = BorderRadius.only(bottomRight: TRadius.c6);

  /// Border radius on the bottom-right corner of 24px (3xl)
  static const br7 = BorderRadius.only(bottomRight: TRadius.c7);

  /// Border radius on the bottom-right corner of 9999px (full)
  static const br8 = BorderRadius.only(bottomRight: TRadius.c8);

  // -------------------------------------------------
  // Border Radius: Bottom-Left
  // -------------------------------------------------

  /// Border radius on the bottom-left corner of 0px
  static const bl0 = BorderRadius.only(bottomLeft: TRadius.c0);

  /// Border radius on the bottom-left corner of 2px (sm)
  static const bl1 = BorderRadius.only(bottomLeft: TRadius.c1);

  /// Border radius on the bottom-left corner of 4px (base)
  static const bl2 = BorderRadius.only(bottomLeft: TRadius.c2);

  /// Border radius on the bottom-left corner of 6px (md)
  static const bl3 = BorderRadius.only(bottomLeft: TRadius.c3);

  /// Border radius on the bottom-left corner of 8px (lg)
  static const bl4 = BorderRadius.only(bottomLeft: TRadius.c4);

  /// Border radius on the bottom-left corner of 12px (xl)
  static const bl5 = BorderRadius.only(bottomLeft: TRadius.c5);

  /// Border radius on the bottom-left corner of 16px (2xl)
  static const bl6 = BorderRadius.only(bottomLeft: TRadius.c6);

  /// Border radius on the bottom-left corner of 24px (3xl)
  static const bl7 = BorderRadius.only(bottomLeft: TRadius.c7);

  /// Border radius on the bottom-left corner of 9999px (full)
  static const bl8 = BorderRadius.only(bottomLeft: TRadius.c8);
}
