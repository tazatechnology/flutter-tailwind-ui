// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

// =============================================================================
// CLASS: TRadiusScale
// =============================================================================

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

// =============================================================================
// CLASS: TRadius
// =============================================================================

/// Tailwind radius constants for defining rounded corners
///
/// Scaling system is based on 2px increments (and 9999px for full) defined in
/// [TRadiusScale]
///
/// https://tailwindcss.com/docs/border-radius
abstract final class TRadius {
  /// Circular radius of 0px (none)
  ///
  /// Used to define Tailwind equivalents for: `rounded-*-none`
  static const rounded_none = Radius.zero;

  /// Circular radius of 2px (sm)
  ///
  /// Used to define Tailwind equivalents for: `rounded-*-sm`
  static const rounded_sm = Radius.circular(
    TRadiusScale.radius_sm,
  );

  /// Circular radius of 4px (base)
  ///
  /// Used to define Tailwind equivalents for: `rounded-*`
  static const rounded = Radius.circular(
    TRadiusScale.radius,
  );

  /// Circular radius of 6px (md)
  ///
  /// Used to define Tailwind equivalents for: `rounded-*-md`
  static const rounded_md = Radius.circular(
    TRadiusScale.radius_md,
  );

  /// Circular radius of 8px (lg)
  ///
  /// Used to define Tailwind equivalents for: `rounded-*-lg`
  static const rounded_lg = Radius.circular(
    TRadiusScale.radius_lg,
  );

  /// Circular radius of 12px (xl)
  ///
  /// Used to define Tailwind equivalents for: `rounded-*-xl`
  static const rounded_xl = Radius.circular(
    TRadiusScale.radius_xl,
  );

  /// Circular radius of 16px (2xl)
  ///
  /// Used to define Tailwind equivalents for: `rounded-*-2xl`
  static const rounded_2xl = Radius.circular(
    TRadiusScale.radius_2xl,
  );

  /// Circular radius of 24px (3xl)
  ///
  /// Used to define Tailwind equivalents for: `rounded-*-3xl`
  static const rounded_3xl = Radius.circular(
    TRadiusScale.radius_3xl,
  );

  /// Circular radius of 9999px (full).
  ///
  /// Used to define Tailwind equivalents for: `rounded-*-full`
  static const rounded_full = Radius.circular(
    TRadiusScale.radius_full,
  );
}

// =============================================================================
// CLASS: TBorderRadius
// =============================================================================

/// Tailwind border-radius system for defining rounded corners
///
/// Scaling system is based on 2px increments as defined in [TRadiusScale]
///
/// https://tailwindcss.com/docs/border-radius
class TBorderRadius {
  // ---------------------------------------------------------------------------
  // Border Radius: All
  // ---------------------------------------------------------------------------

  /// Border radius of 0px (none)
  ///
  /// Equivalent to Tailwind class: `rounded-none`
  static const rounded_none = BorderRadius.zero;

  /// Border radius of 2px (sm)
  ///
  /// Equivalent to Tailwind class: `rounded-sm`
  static const rounded_sm = BorderRadius.all(
    TRadius.rounded_sm,
  );

  /// Border radius of 4px (base)
  ///
  /// Equivalent to Tailwind class: `rounded`
  static const rounded = BorderRadius.all(
    TRadius.rounded,
  );

  /// Border radius of 6px (md)
  ///
  /// Equivalent to Tailwind class: `rounded-md`
  static const rounded_md = BorderRadius.all(
    TRadius.rounded_md,
  );

  /// Border radius of 8px (lg)
  ///
  /// Equivalent to Tailwind class: `rounded-lg`
  static const rounded_lg = BorderRadius.all(
    TRadius.rounded_lg,
  );

  /// Border radius of 12px (xl)
  ///
  /// Equivalent to Tailwind class: `rounded-xl`
  static const rounded_xl = BorderRadius.all(
    TRadius.rounded_xl,
  );

  /// Border radius of 16px (2xl)
  ///
  /// Equivalent to Tailwind class: `rounded-2xl`
  static const rounded_2xl = BorderRadius.all(
    TRadius.rounded_2xl,
  );

  /// Border radius of 24px (3xl)
  ///
  /// Equivalent to Tailwind class: `rounded-3xl`
  static const rounded_3xl = BorderRadius.all(
    TRadius.rounded_3xl,
  );

  /// Border radius of 9999px (full)
  ///
  /// Equivalent to Tailwind class: `rounded-full`
  static const rounded_full = BorderRadius.all(
    TRadius.rounded_full,
  );

  // ---------------------------------------------------------------------------
  // Border Radius: Top
  // ---------------------------------------------------------------------------

  /// Border radius on the top side of 0px (none)
  ///
  /// Equivalent to Tailwind class: `rounded-t-none`
  static const rounded_t_none = BorderRadius.zero;

  /// Border radius on the top side of 2px (sm)
  ///
  /// Equivalent to Tailwind class: `rounded-t-sm`
  static const rounded_t_sm = BorderRadius.only(
    topLeft: TRadius.rounded_sm,
    topRight: TRadius.rounded_sm,
  );

  /// Border radius on the top side of 4px (base)
  ///
  /// Equivalent to Tailwind class: `rounded-t`
  static const rounded_t = BorderRadius.only(
    topLeft: TRadius.rounded,
    topRight: TRadius.rounded,
  );

  /// Border radius on the top side of 6px (md)
  ///
  /// Equivalent to Tailwind class: `rounded-t-md`
  static const rounded_t_md = BorderRadius.only(
    topLeft: TRadius.rounded_md,
    topRight: TRadius.rounded_md,
  );

  /// Border radius on the top side of 8px (lg)
  ///
  /// Equivalent to Tailwind class: `rounded-t-lg`
  static const rounded_t_lg = BorderRadius.only(
    topLeft: TRadius.rounded_lg,
    topRight: TRadius.rounded_lg,
  );

  /// Border radius on the top side of 12px (xl)
  ///
  /// Equivalent to Tailwind class: `rounded-t-xl`
  static const rounded_t_xl = BorderRadius.only(
    topLeft: TRadius.rounded_xl,
    topRight: TRadius.rounded_xl,
  );

  /// Border radius on the top side of 16px (2xl)
  ///
  /// Equivalent to Tailwind class: `rounded-t-2xl`
  static const rounded_t_2xl = BorderRadius.only(
    topLeft: TRadius.rounded_2xl,
    topRight: TRadius.rounded_2xl,
  );

  /// Border radius on the top side of 24px (3xl)
  ///
  /// Equivalent to Tailwind class: `rounded-t-3xl`
  static const rounded_t_3xl = BorderRadius.only(
    topLeft: TRadius.rounded_3xl,
    topRight: TRadius.rounded_3xl,
  );

  /// Border radius on the top side of 9999px (full)
  ///
  /// Equivalent to Tailwind class: `rounded-t-full`
  static const rounded_t_full = BorderRadius.only(
    topLeft: TRadius.rounded_full,
    topRight: TRadius.rounded_full,
  );

  // ---------------------------------------------------------------------------
  // Border Radius: Bottom
  // ---------------------------------------------------------------------------

  /// Border radius on the bottom side of 0px (none)
  ///
  /// Equivalent to Tailwind class: `rounded-b-none`
  static const rounded_b_none = BorderRadius.zero;

  /// Border radius on the bottom side of 2px (sm)
  ///
  /// Equivalent to Tailwind class: `rounded-b-sm`
  static const rounded_b_sm = BorderRadius.only(
    bottomLeft: TRadius.rounded_sm,
    bottomRight: TRadius.rounded_sm,
  );

  /// Border radius on the bottom side of 4px (base)
  ///
  /// Equivalent to Tailwind class: `rounded-b`
  static const rounded_b = BorderRadius.only(
    bottomLeft: TRadius.rounded,
    bottomRight: TRadius.rounded,
  );

  /// Border radius on the bottom side of 6px (md)
  ///
  /// Equivalent to Tailwind class: `rounded-b-md`
  static const rounded_b_md = BorderRadius.only(
    bottomLeft: TRadius.rounded_md,
    bottomRight: TRadius.rounded_md,
  );

  /// Border radius on the bottom side of 8px (lg)
  ///
  /// Equivalent to Tailwind class: `rounded-b-lg`
  static const rounded_b_lg = BorderRadius.only(
    bottomLeft: TRadius.rounded_lg,
    bottomRight: TRadius.rounded_lg,
  );

  /// Border radius on the bottom side of 12px (xl)
  ///
  /// Equivalent to Tailwind class: `rounded-b-xl`
  static const rounded_b_xl = BorderRadius.only(
    bottomLeft: TRadius.rounded_xl,
    bottomRight: TRadius.rounded_xl,
  );

  /// Border radius on the bottom side of 16px (2xl)
  ///
  /// Equivalent to Tailwind class: `rounded-b-2xl`
  static const rounded_b_2xl = BorderRadius.only(
    bottomLeft: TRadius.rounded_2xl,
    bottomRight: TRadius.rounded_2xl,
  );

  /// Border radius on the bottom side of 24px (3xl)
  ///
  /// Equivalent to Tailwind class: `rounded-b-3xl`
  static const rounded_b_3xl = BorderRadius.only(
    bottomLeft: TRadius.rounded_3xl,
    bottomRight: TRadius.rounded_3xl,
  );

  /// Border radius on the bottom side of 9999px (full)
  ///
  /// Equivalent to Tailwind class: `rounded-b-full`
  static const rounded_b_full = BorderRadius.only(
    bottomLeft: TRadius.rounded_full,
    bottomRight: TRadius.rounded_full,
  );

  // ---------------------------------------------------------------------------
  // Border Radius: Left
  // ---------------------------------------------------------------------------

  /// Border radius on the left side of 0px (none)
  ///
  /// Equivalent to Tailwind class: `rounded-l-none`
  static const rounded_l_none = BorderRadius.zero;

  /// Border radius on the left side of 2px (sm)
  ///
  /// Equivalent to Tailwind class: `rounded-l-sm`
  static const rounded_l_sm = BorderRadius.only(
    topLeft: TRadius.rounded_sm,
    bottomLeft: TRadius.rounded_sm,
  );

  /// Border radius on the left side of 4px (base)
  ///
  /// Equivalent to Tailwind class: `rounded-l`
  static const rounded_l = BorderRadius.only(
    topLeft: TRadius.rounded,
    bottomLeft: TRadius.rounded,
  );

  /// Border radius on the left side of 6px (md)
  ///
  /// Equivalent to Tailwind class: `rounded-l-md`
  static const rounded_l_md = BorderRadius.only(
    topLeft: TRadius.rounded_md,
    bottomLeft: TRadius.rounded_md,
  );

  /// Border radius on the left side of 8px (lg)
  ///
  /// Equivalent to Tailwind class: `rounded-l-lg`
  static const rounded_l_lg = BorderRadius.only(
    topLeft: TRadius.rounded_lg,
    bottomLeft: TRadius.rounded_lg,
  );

  /// Border radius on the left side of 12px (xl)
  ///
  /// Equivalent to Tailwind class: `rounded-l-xl`
  static const rounded_l_xl = BorderRadius.only(
    topLeft: TRadius.rounded_xl,
    bottomLeft: TRadius.rounded_xl,
  );

  /// Border radius on the left side of 16px (2xl)
  ///
  /// Equivalent to Tailwind class: `rounded-l-2xl`
  static const rounded_l_2xl = BorderRadius.only(
    topLeft: TRadius.rounded_2xl,
    bottomLeft: TRadius.rounded_2xl,
  );

  /// Border radius on the left side of 24px (3xl)
  ///
  /// Equivalent to Tailwind class: `rounded-l-3xl`
  static const rounded_l_3xl = BorderRadius.only(
    topLeft: TRadius.rounded_3xl,
    bottomLeft: TRadius.rounded_3xl,
  );

  /// Border radius on the left side of 9999px (full)
  ///
  /// Equivalent to Tailwind class: `rounded-l-full`
  static const rounded_l_full = BorderRadius.only(
    topLeft: TRadius.rounded_full,
    bottomLeft: TRadius.rounded_full,
  );

  // ---------------------------------------------------------------------------
  // Border Radius: Right
  // ---------------------------------------------------------------------------

  /// Border radius on the right side of 0px (none)
  ///
  /// Equivalent to Tailwind class: `rounded-r-none`
  static const rounded_r_none = BorderRadius.zero;

  /// Border radius on the right side of 2px (sm)
  ///
  /// Equivalent to Tailwind class: `rounded-r-sm`
  static const rounded_r_sm = BorderRadius.only(
    topRight: TRadius.rounded_sm,
    bottomRight: TRadius.rounded_sm,
  );

  /// Border radius on the right side of 4px (base)
  ///
  /// Equivalent to Tailwind class: `rounded-r`
  static const rounded_r = BorderRadius.only(
    topRight: TRadius.rounded,
    bottomRight: TRadius.rounded,
  );

  /// Border radius on the right side of 6px (md)
  ///
  /// Equivalent to Tailwind class: `rounded-r-md`
  static const rounded_r_md = BorderRadius.only(
    topRight: TRadius.rounded_md,
    bottomRight: TRadius.rounded_md,
  );

  /// Border radius on the right side of 8px (lg)
  ///
  /// Equivalent to Tailwind class: `rounded-r-lg`
  static const rounded_r_lg = BorderRadius.only(
    topRight: TRadius.rounded_lg,
    bottomRight: TRadius.rounded_lg,
  );

  /// Border radius on the right side of 12px (xl)
  ///
  /// Equivalent to Tailwind class: `rounded-r-xl`
  static const rounded_r_xl = BorderRadius.only(
    topRight: TRadius.rounded_xl,
    bottomRight: TRadius.rounded_xl,
  );

  /// Border radius on the right side of 16px (2xl)
  ///
  /// Equivalent to Tailwind class: `rounded-r-2xl`
  static const rounded_r_2xl = BorderRadius.only(
    topRight: TRadius.rounded_2xl,
    bottomRight: TRadius.rounded_2xl,
  );

  /// Border radius on the right side of 24px (3xl)
  ///
  /// Equivalent to Tailwind class: `rounded-r-3xl`
  static const rounded_r_3xl = BorderRadius.only(
    topRight: TRadius.rounded_3xl,
    bottomRight: TRadius.rounded_3xl,
  );

  /// Border radius on the right side of 9999px (full)
  ///
  /// Equivalent to Tailwind class: `rounded-r-full`
  static const rounded_r_full = BorderRadius.only(
    topRight: TRadius.rounded_full,
    bottomRight: TRadius.rounded_full,
  );

  // ---------------------------------------------------------------------------
  // Border Radius: Top-Left
  // ---------------------------------------------------------------------------

  /// Border radius on the top-left corner of 0px
  ///
  /// Equivalent to Tailwind class: `rounded-tl-none`
  static const rounded_tl_none = BorderRadius.zero;

  /// Border radius on the top-left corner of 2px (sm)
  ///
  /// Equivalent to Tailwind class: `rounded-tl-sm`
  static const rounded_tl_sm = BorderRadius.only(
    topLeft: TRadius.rounded_sm,
  );

  /// Border radius on the top-left corner of 4px (base)
  ///
  /// Equivalent to Tailwind class: `rounded-tl`
  static const rounded_tl = BorderRadius.only(
    topLeft: TRadius.rounded,
  );

  /// Border radius on the top-left corner of 6px (md)
  ///
  /// Equivalent to Tailwind class: `rounded-tl-md`
  static const rounded_tl_md = BorderRadius.only(
    topLeft: TRadius.rounded_md,
  );

  /// Border radius on the top-left corner of 8px (lg)
  ///
  /// Equivalent to Tailwind class: `rounded-tl-lg`
  static const rounded_tl_lg = BorderRadius.only(
    topLeft: TRadius.rounded_lg,
  );

  /// Border radius on the top-left corner of 12px (xl)
  ///
  /// Equivalent to Tailwind class: `rounded-tl-xl`
  static const rounded_tl_xl = BorderRadius.only(
    topLeft: TRadius.rounded_xl,
  );

  /// Border radius on the top-left corner of 16px (2xl)
  ///
  /// Equivalent to Tailwind class: `rounded-tl-2xl`
  static const rounded_tl_2xl = BorderRadius.only(
    topLeft: TRadius.rounded_2xl,
  );

  /// Border radius on the top-left corner of 24px (3xl)
  ///
  /// Equivalent to Tailwind class: `rounded-tl-3xl`
  static const rounded_tl_3xl = BorderRadius.only(
    topLeft: TRadius.rounded_3xl,
  );

  /// Border radius on the top-left corner of 9999px (full)
  ///
  /// Equivalent to Tailwind class: `rounded-tl-full`
  static const rounded_tl_full = BorderRadius.only(
    topLeft: TRadius.rounded_full,
  );

  // ---------------------------------------------------------------------------
  // Border Radius: Top-Right
  // ---------------------------------------------------------------------------

  /// Border radius on the top-right corner of 0px
  ///
  /// Equivalent to Tailwind class: `rounded-tr-none`
  static const rounded_tr_none = BorderRadius.zero;

  /// Border radius on the top-right corner of 2px (sm)
  ///
  /// Equivalent to Tailwind class: `rounded-tr-sm`
  static const rounded_tr_sm = BorderRadius.only(
    topRight: TRadius.rounded_sm,
  );

  /// Border radius on the top-right corner of 4px (base)
  ///
  /// Equivalent to Tailwind class: `rounded-tr`
  static const rounded_tr = BorderRadius.only(
    topRight: TRadius.rounded,
  );

  /// Border radius on the top-right corner of 6px (md)
  ///
  /// Equivalent to Tailwind class: `rounded-tr-md`
  static const rounded_tr_md = BorderRadius.only(
    topRight: TRadius.rounded_md,
  );

  /// Border radius on the top-right corner of 8px (lg)
  ///
  /// Equivalent to Tailwind class: `rounded-tr-lg`
  static const rounded_tr_lg = BorderRadius.only(
    topRight: TRadius.rounded_lg,
  );

  /// Border radius on the top-right corner of 12px (xl)
  ///
  /// Equivalent to Tailwind class: `rounded-tr-xl`
  static const rounded_tr_xl = BorderRadius.only(
    topRight: TRadius.rounded_xl,
  );

  /// Border radius on the top-right corner of 16px (2xl)
  ///
  /// Equivalent to Tailwind class: `rounded-tr-2xl`
  static const rounded_tr_2xl = BorderRadius.only(
    topRight: TRadius.rounded_2xl,
  );

  /// Border radius on the top-right corner of 24px (3xl)
  ///
  /// Equivalent to Tailwind class: `rounded-tr-3xl`
  static const rounded_tr_3xl = BorderRadius.only(
    topRight: TRadius.rounded_3xl,
  );

  /// Border radius on the top-right corner of 9999px (full)
  ///
  /// Equivalent to Tailwind class: `rounded-tr-full`
  static const rounded_tr_full = BorderRadius.only(
    topRight: TRadius.rounded_full,
  );

  // ---------------------------------------------------------------------------
  // Border Radius: Bottom-Right
  // ---------------------------------------------------------------------------

  /// Border radius on the bottom-right corner of 0px
  ///
  /// Equivalent to Tailwind class: `rounded-br-none`
  static const rounded_br_none = BorderRadius.zero;

  /// Border radius on the bottom-right corner of 2px (sm)
  ///
  /// Equivalent to Tailwind class: `rounded-br-sm`
  static const rounded_br_sm = BorderRadius.only(
    bottomRight: TRadius.rounded_sm,
  );

  /// Border radius on the bottom-right corner of 4px (base)
  ///
  /// Equivalent to Tailwind class: `rounded-br`
  static const rounded_br = BorderRadius.only(
    bottomRight: TRadius.rounded,
  );

  /// Border radius on the bottom-right corner of 6px (md)
  ///
  /// Equivalent to Tailwind class: `rounded-br-md`
  static const rounded_br_md = BorderRadius.only(
    bottomRight: TRadius.rounded_md,
  );

  /// Border radius on the bottom-right corner of 8px (lg)
  ///
  /// Equivalent to Tailwind class: `rounded-br-lg`
  static const rounded_br_lg = BorderRadius.only(
    bottomRight: TRadius.rounded_lg,
  );

  /// Border radius on the bottom-right corner of 12px (xl)
  ///
  /// Equivalent to Tailwind class: `rounded-br-xl`
  static const rounded_br_xl = BorderRadius.only(
    bottomRight: TRadius.rounded_xl,
  );

  /// Border radius on the bottom-right corner of 16px (2xl)
  ///
  /// Equivalent to Tailwind class: `rounded-br-2xl`
  static const rounded_br_2xl = BorderRadius.only(
    bottomRight: TRadius.rounded_2xl,
  );

  /// Border radius on the bottom-right corner of 24px (3xl)
  ///
  /// Equivalent to Tailwind class: `rounded-br-3xl`
  static const rounded_br_3xl = BorderRadius.only(
    bottomRight: TRadius.rounded_3xl,
  );

  /// Border radius on the bottom-right corner of 9999px (full)
  ///
  /// Equivalent to Tailwind class: `rounded-br-full`
  static const rounded_br_full = BorderRadius.only(
    bottomRight: TRadius.rounded_full,
  );

  // ---------------------------------------------------------------------------
  // Border Radius: Bottom-Left
  // ---------------------------------------------------------------------------

  /// Border radius on the bottom-left corner of 0px
  ///
  /// Equivalent to Tailwind class: `rounded-bl-none`
  static const rounded_bl_none = BorderRadius.zero;

  /// Border radius on the bottom-left corner of 2px (sm)
  ///
  /// Equivalent to Tailwind class: `rounded-bl-sm`
  static const rounded_bl_sm = BorderRadius.only(
    bottomLeft: TRadius.rounded_sm,
  );

  /// Border radius on the bottom-left corner of 4px (base)
  ///
  /// Equivalent to Tailwind class: `rounded-bl`
  static const rounded_bl = BorderRadius.only(
    bottomLeft: TRadius.rounded,
  );

  /// Border radius on the bottom-left corner of 6px (md)
  ///
  /// Equivalent to Tailwind class: `rounded-bl-md`
  static const rounded_bl_md = BorderRadius.only(
    bottomLeft: TRadius.rounded_md,
  );

  /// Border radius on the bottom-left corner of 8px (lg)
  ///
  /// Equivalent to Tailwind class: `rounded-bl-lg`
  static const rounded_bl_lg = BorderRadius.only(
    bottomLeft: TRadius.rounded_lg,
  );

  /// Border radius on the bottom-left corner of 12px (xl)
  ///
  /// Equivalent to Tailwind class: `rounded-bl-xl`
  static const rounded_bl_xl = BorderRadius.only(
    bottomLeft: TRadius.rounded_xl,
  );

  /// Border radius on the bottom-left corner of 16px (2xl)
  ///
  /// Equivalent to Tailwind class: `rounded-bl-2xl`
  static const rounded_bl_2xl = BorderRadius.only(
    bottomLeft: TRadius.rounded_2xl,
  );

  /// Border radius on the bottom-left corner of 24px (3xl)
  ///
  /// Equivalent to Tailwind class: `rounded-bl-3xl`
  static const rounded_bl_3xl = BorderRadius.only(
    bottomLeft: TRadius.rounded_3xl,
  );

  /// Border radius on the bottom-left corner of 9999px (full)
  ///
  /// Equivalent to Tailwind class: `rounded-bl-full`
  static const rounded_bl_full = BorderRadius.only(
    bottomLeft: TRadius.rounded_full,
  );
}
