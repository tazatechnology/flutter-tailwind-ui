import 'package:flutter/rendering.dart';

import 'scale.dart';

// =================================================
// CLASS: TOffset
// =================================================

/// [EdgeInsets] for padding and margin based on Tailwind scaling system.
///
/// Scaling system is based on 4px increments defined in [TScale].
///
/// https://tailwindcss.com/docs/customizing-spacing
class TOffset {
  // -------------------------------------------------
  // All Side Offset
  // -------------------------------------------------

  /// Offset of 0px on all sides.
  static const a0 = EdgeInsets.all(TScale.s0);

  /// Offset of 4px on all sides.
  static const a1 = EdgeInsets.all(TScale.s1);

  /// Offset of 8px on all sides.
  static const a2 = EdgeInsets.all(TScale.s2);

  /// Offset of 12px on all sides.
  static const a3 = EdgeInsets.all(TScale.s3);

  /// Offset of 16px on all sides.
  static const a4 = EdgeInsets.all(TScale.s4);

  /// Offset of 20px on all sides.
  static const a5 = EdgeInsets.all(TScale.s5);

  /// Offset of 24px on all sides.
  static const a6 = EdgeInsets.all(TScale.s6);

  /// Offset of 28px on all sides.
  static const a7 = EdgeInsets.all(TScale.s7);

  /// Offset of 32px on all sides.
  static const a8 = EdgeInsets.all(TScale.s8);

  /// Offset of 36px on all sides.
  static const a9 = EdgeInsets.all(TScale.s9);

  /// Offset of 40px on all sides.
  static const a10 = EdgeInsets.all(TScale.s10);

  // -------------------------------------------------
  // Horizontal Offset
  // -------------------------------------------------

  /// Offset of 0px on the left and right sides.
  static const x0 = EdgeInsets.symmetric(horizontal: TScale.s0);

  /// Offset of 4px on the left and right sides.
  static const x1 = EdgeInsets.symmetric(horizontal: TScale.s1);

  /// Offset of 8px on the left and right sides.
  static const x2 = EdgeInsets.symmetric(horizontal: TScale.s2);

  /// Offset of 12px on the left and right sides.
  static const x3 = EdgeInsets.symmetric(horizontal: TScale.s3);

  /// Offset of 16px on the left and right sides.
  static const x4 = EdgeInsets.symmetric(horizontal: TScale.s4);

  /// Offset of 20px on the left and right sides.
  static const x5 = EdgeInsets.symmetric(horizontal: TScale.s5);

  /// Offset of 24px on the left and right sides.
  static const x6 = EdgeInsets.symmetric(horizontal: TScale.s6);

  /// Offset of 28px on the left and right sides.
  static const x7 = EdgeInsets.symmetric(horizontal: TScale.s7);

  /// Offset of 32px on the left and right sides.
  static const x8 = EdgeInsets.symmetric(horizontal: TScale.s8);

  /// Offset of 36px on the left and right sides.
  static const x9 = EdgeInsets.symmetric(horizontal: TScale.s9);

  /// Offset of 40px on the left and right sides.
  static const x10 = EdgeInsets.symmetric(horizontal: TScale.s10);

  // -------------------------------------------------
  // Vertical Offset
  // -------------------------------------------------

  /// Offset of 0px on the top and bottom sides.
  static const y0 = EdgeInsets.symmetric(vertical: TScale.s0);

  /// Offset of 4px on the top and bottom sides.
  static const y1 = EdgeInsets.symmetric(vertical: TScale.s1);

  /// Offset of 8px on the top and bottom sides.
  static const y2 = EdgeInsets.symmetric(vertical: TScale.s2);

  /// Offset of 12px on the top and bottom sides.
  static const y3 = EdgeInsets.symmetric(vertical: TScale.s3);

  /// Offset of 16px on the top and bottom sides.
  static const y4 = EdgeInsets.symmetric(vertical: TScale.s4);

  /// Offset of 20px on the top and bottom sides.
  static const y5 = EdgeInsets.symmetric(vertical: TScale.s5);

  /// Offset of 24px on the top and bottom sides.
  static const y6 = EdgeInsets.symmetric(vertical: TScale.s6);

  /// Offset of 28px on the top and bottom sides.
  static const y7 = EdgeInsets.symmetric(vertical: TScale.s7);

  /// Offset of 32px on the top and bottom sides.
  static const y8 = EdgeInsets.symmetric(vertical: TScale.s8);

  /// Offset of 36px on the top and bottom sides.
  static const y9 = EdgeInsets.symmetric(vertical: TScale.s9);

  /// Offset of 40px on the top and bottom sides.
  static const y10 = EdgeInsets.symmetric(vertical: TScale.s10);

  // -------------------------------------------------
  // Top Side Offset
  // -------------------------------------------------

  /// Offset of 0px on the top side
  static const t0 = EdgeInsets.only(top: TScale.s0);

  /// Offset of 4px on the top side
  static const t1 = EdgeInsets.only(top: TScale.s1);

  /// Offset of 8px on the top side
  static const t2 = EdgeInsets.only(top: TScale.s2);

  /// Offset of 12px on the top side
  static const t3 = EdgeInsets.only(top: TScale.s3);

  /// Offset of 16px on the top side
  static const t4 = EdgeInsets.only(top: TScale.s4);

  /// Offset of 20px on the top side
  static const t5 = EdgeInsets.only(top: TScale.s5);

  /// Offset of 24px on the top side
  static const t6 = EdgeInsets.only(top: TScale.s6);

  /// Offset of 28px on the top side
  static const t7 = EdgeInsets.only(top: TScale.s7);

  /// Offset of 32px on the top side
  static const t8 = EdgeInsets.only(top: TScale.s8);

  /// Offset of 36px on the top side
  static const t9 = EdgeInsets.only(top: TScale.s9);

  /// Offset of 40px on the top side
  static const t10 = EdgeInsets.only(top: TScale.s10);

  // -------------------------------------------------
  // Bottom Side Offset
  // -------------------------------------------------

  /// Offset of 0px on the bottom side
  static const b0 = EdgeInsets.only(bottom: TScale.s0);

  /// Offset of 4px on the bottom side
  static const b1 = EdgeInsets.only(bottom: TScale.s1);

  /// Offset of 8px on the bottom side
  static const b2 = EdgeInsets.only(bottom: TScale.s2);

  /// Offset of 12px on the bottom side
  static const b3 = EdgeInsets.only(bottom: TScale.s3);

  /// Offset of 16px on the bottom side
  static const b4 = EdgeInsets.only(bottom: TScale.s4);

  /// Offset of 20px on the bottom side
  static const b5 = EdgeInsets.only(bottom: TScale.s5);

  /// Offset of 24px on the bottom side
  static const b6 = EdgeInsets.only(bottom: TScale.s6);

  /// Offset of 28px on the bottom side
  static const b7 = EdgeInsets.only(bottom: TScale.s7);

  /// Offset of 32px on the bottom side
  static const b8 = EdgeInsets.only(bottom: TScale.s8);

  /// Offset of 36px on the bottom side
  static const b9 = EdgeInsets.only(bottom: TScale.s9);

  /// Offset of 40px on the bottom side
  static const b10 = EdgeInsets.only(bottom: TScale.s10);

  // -------------------------------------------------
  // Left Side Offset
  // -------------------------------------------------

  /// Offset of 0px on the left side
  static const l0 = EdgeInsets.only(left: TScale.s0);

  /// Offset of 4px on the left side
  static const l1 = EdgeInsets.only(left: TScale.s1);

  /// Offset of 8px on the left side
  static const l2 = EdgeInsets.only(left: TScale.s2);

  /// Offset of 12px on the left side
  static const l3 = EdgeInsets.only(left: TScale.s3);

  /// Offset of 16px on the left side
  static const l4 = EdgeInsets.only(left: TScale.s4);

  /// Offset of 20px on the left side
  static const l5 = EdgeInsets.only(left: TScale.s5);

  /// Offset of 24px on the left side
  static const l6 = EdgeInsets.only(left: TScale.s6);

  /// Offset of 28px on the left side
  static const l7 = EdgeInsets.only(left: TScale.s7);

  /// Offset of 32px on the left side
  static const l8 = EdgeInsets.only(left: TScale.s8);

  /// Offset of 36px on the left side
  static const l9 = EdgeInsets.only(left: TScale.s9);

  /// Offset of 40px on the left side
  static const l10 = EdgeInsets.only(left: TScale.s10);

  // -------------------------------------------------
  // Right Side Offset
  // -------------------------------------------------

  /// Offset of 0px on the right side
  static const r0 = EdgeInsets.only(right: TScale.s0);

  /// Offset of 4px on the right side
  static const r1 = EdgeInsets.only(right: TScale.s1);

  /// Offset of 8px on the right side
  static const r2 = EdgeInsets.only(right: TScale.s2);

  /// Offset of 12px on the right side
  static const r3 = EdgeInsets.only(right: TScale.s3);

  /// Offset of 16px on the right side
  static const r4 = EdgeInsets.only(right: TScale.s4);

  /// Offset of 20px on the right side
  static const r5 = EdgeInsets.only(right: TScale.s5);

  /// Offset of 24px on the right side
  static const r6 = EdgeInsets.only(right: TScale.s6);

  /// Offset of 28px on the right side
  static const r7 = EdgeInsets.only(right: TScale.s7);

  /// Offset of 32px on the right side
  static const r8 = EdgeInsets.only(right: TScale.s8);

  /// Offset of 36px on the right side
  static const r9 = EdgeInsets.only(right: TScale.s9);

  /// Offset of 40px on the right side
  static const r10 = EdgeInsets.only(right: TScale.s10);
}
