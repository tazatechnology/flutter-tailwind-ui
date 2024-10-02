import 'package:flutter/material.dart';

import 'scale.dart';

// =================================================
// CLASS: TSizedBox
// =================================================

/// [SizedBox] widgets for width and height based on Tailwind scaling system.
///
/// Scaling system is based on 4px increments defined in [TScale].
class TSizedBox {
  // -------------------------------------------------
  // Square SizedBox
  // -------------------------------------------------

  /// SizedBox with a square dimension of 0px
  static const s0 = SizedBox.square(dimension: TScale.s0);

  /// SizedBox with a square dimension of 4px
  static const s1 = SizedBox.square(dimension: TScale.s1);

  /// SizedBox with a square dimension of 8px
  static const s2 = SizedBox.square(dimension: TScale.s2);

  /// SizedBox with a square dimension of 12px
  static const s3 = SizedBox.square(dimension: TScale.s3);

  /// SizedBox with a square dimension of 16px
  static const s4 = SizedBox.square(dimension: TScale.s4);

  /// SizedBox with a square dimension of 20px
  static const s5 = SizedBox.square(dimension: TScale.s5);

  /// SizedBox with a square dimension of 24px
  static const s6 = SizedBox.square(dimension: TScale.s6);

  /// SizedBox with a square dimension of 28px
  static const s7 = SizedBox.square(dimension: TScale.s7);

  /// SizedBox with a square dimension of 32px
  static const s8 = SizedBox.square(dimension: TScale.s8);

  /// SizedBox with a square dimension of 36px
  static const s9 = SizedBox.square(dimension: TScale.s9);

  /// SizedBox with a square dimension of 40px
  static const s10 = SizedBox.square(dimension: TScale.s10);

  // -------------------------------------------------
  // Horizontal SizedBox
  // -------------------------------------------------

  /// SizedBox with a width of 0px
  static const x0 = SizedBox(width: TScale.s0);

  /// SizedBox with a width of 4px
  static const x1 = SizedBox(width: TScale.s1);

  /// SizedBox with a width of 8px
  static const x2 = SizedBox(width: TScale.s2);

  /// SizedBox with a width of 12px
  static const x3 = SizedBox(width: TScale.s3);

  /// SizedBox with a width of 16px
  static const x4 = SizedBox(width: TScale.s4);

  /// SizedBox with a width of 20px
  static const x5 = SizedBox(width: TScale.s5);

  /// SizedBox with a width of 24px
  static const x6 = SizedBox(width: TScale.s6);

  /// SizedBox with a width of 28px
  static const x7 = SizedBox(width: TScale.s7);

  /// SizedBox with a width of 32px
  static const x8 = SizedBox(width: TScale.s8);

  /// SizedBox with a width of 36px
  static const x9 = SizedBox(width: TScale.s9);

  /// SizedBox with a width of 40px
  static const x10 = SizedBox(width: TScale.s10);

  // -------------------------------------------------
  // Vertical SizedBox
  // -------------------------------------------------

  /// SizedBox with a height of 0px
  static const y0 = SizedBox(height: TScale.s0);

  /// SizedBox with a height of 4px
  static const y1 = SizedBox(height: TScale.s1);

  /// SizedBox with a height of 8px
  static const y2 = SizedBox(height: TScale.s2);

  /// SizedBox with a height of 12px
  static const y3 = SizedBox(height: TScale.s3);

  /// SizedBox with a height of 16px
  static const y4 = SizedBox(height: TScale.s4);

  /// SizedBox with a height of 20px
  static const y5 = SizedBox(height: TScale.s5);

  /// SizedBox with a height of 24px
  static const y6 = SizedBox(height: TScale.s6);

  /// SizedBox with a height of 28px
  static const y7 = SizedBox(height: TScale.s7);

  /// SizedBox with a height of 32px
  static const y8 = SizedBox(height: TScale.s8);

  /// SizedBox with a height of 36px
  static const y9 = SizedBox(height: TScale.s9);

  /// SizedBox with a height of 40px
  static const y10 = SizedBox(height: TScale.s10);
}
