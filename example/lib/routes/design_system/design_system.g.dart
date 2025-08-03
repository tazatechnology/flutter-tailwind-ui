// Generated code - do not modify by hand
// ignore_for_file: unnecessary_raw_strings, prefer_single_quotes

part of 'design_system.dart';

/// Source code for [_TColorsBlack]
class _TColorsBlackSource {
  static const String code = r"""
final tw = context.tw;
final blacks = [
  TColors.black5,
  TColors.black10,
  TColors.black20,
  TColors.black25,
  TColors.black30,
  TColors.black40,
  TColors.black50,
  TColors.black60,
  TColors.black70,
  TColors.black75,
  TColors.black80,
  TColors.black90,
  TColors.black95,
  TColors.black,
];
return Row(
  spacing: tw.screen.is_md ? TSpace.v6 : TSpace.v4,
  children: [
    for (final black in blacks)
      Expanded(
        child: Container(
          alignment: Alignment.center,
          height: TSpace.v40,
          decoration: BoxDecoration(
            color: black,
            border: Border.all(
              color: tw.light ? TColors.black10 : TColors.white25,
              width: 0.5,
            ),
            borderRadius: TBorderRadius.rounded_sm,
          ),
          child: Text(
            (black.a * 100).round().toString(),
            style: TTextStyle.text_xs.copyWith(
              color: tw.light
                  ? black.a > 0.5
                        ? TColors.white
                        : TColors.black
                  : TColors.white,
            ),
          ),
        ),
      ),
  ],
);
""";
}

/// Source code for [_TColorsWhite]
class _TColorsWhiteSource {
  static const String code = r"""
final tw = context.tw;
final whites = [
  TColors.white5,
  TColors.white10,
  TColors.white20,
  TColors.white25,
  TColors.white30,
  TColors.white40,
  TColors.white50,
  TColors.white60,
  TColors.white70,
  TColors.white75,
  TColors.white80,
  TColors.white90,
  TColors.white95,
  TColors.white,
];
return Row(
  spacing: tw.screen.is_md ? TSpace.v6 : TSpace.v4,
  children: [
    for (final white in whites)
      Expanded(
        child: Container(
          alignment: Alignment.center,
          height: TSpace.v40,
          decoration: BoxDecoration(
            color: white,
            border: Border.all(
              color: TColors.black20,
              width: 0.5,
            ),
            borderRadius: TBorderRadius.rounded_sm,
          ),
          child: Text(
            (white.a * 100).round().toString(),
            style: TTextStyle.text_xs.copyWith(
              color: tw.light
                  ? Colors.black
                  : white.a < 0.5
                  ? TColors.white
                  : TColors.black,
            ),
          ),
        ),
      ),
  ],
);
""";
}

/// Source code for [_TBorderRadiusAll]
class _TBorderRadiusAllSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final borderRadius in [
      TBorderRadius.rounded_none,
      TBorderRadius.rounded_xs,
      TBorderRadius.rounded_sm,
      TBorderRadius.rounded_md,
      TBorderRadius.rounded_lg,
      TBorderRadius.rounded_xl,
      TBorderRadius.rounded_2xl,
      TBorderRadius.rounded_3xl,
      TBorderRadius.rounded_full,
    ])
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: TColors.slate,
          borderRadius: borderRadius,
        ),
      ),
  ],
)
""";
}

/// Source code for [_TBorderRadiusTop]
class _TBorderRadiusTopSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final borderRadius in [
      TBorderRadius.rounded_t_none,
      TBorderRadius.rounded_t_xs,
      TBorderRadius.rounded_t_sm,
      TBorderRadius.rounded_t_md,
      TBorderRadius.rounded_t_lg,
      TBorderRadius.rounded_t_xl,
      TBorderRadius.rounded_t_2xl,
      TBorderRadius.rounded_t_3xl,
      TBorderRadius.rounded_t_full,
    ])
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: TColors.slate,
          borderRadius: borderRadius,
        ),
      ),
  ],
)
""";
}

/// Source code for [_TBorderRadiusBottom]
class _TBorderRadiusBottomSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final borderRadius in [
      TBorderRadius.rounded_b_none,
      TBorderRadius.rounded_b_xs,
      TBorderRadius.rounded_b_sm,
      TBorderRadius.rounded_b_md,
      TBorderRadius.rounded_b_lg,
      TBorderRadius.rounded_b_xl,
      TBorderRadius.rounded_b_2xl,
      TBorderRadius.rounded_b_3xl,
      TBorderRadius.rounded_b_full,
    ])
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: TColors.slate,
          borderRadius: borderRadius,
        ),
      ),
  ],
)
""";
}

/// Source code for [_TBorderRadiusLeft]
class _TBorderRadiusLeftSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final borderRadius in [
      TBorderRadius.rounded_l_none,
      TBorderRadius.rounded_l_xs,
      TBorderRadius.rounded_l_sm,
      TBorderRadius.rounded_l_md,
      TBorderRadius.rounded_l_lg,
      TBorderRadius.rounded_l_xl,
      TBorderRadius.rounded_l_2xl,
      TBorderRadius.rounded_l_3xl,
      TBorderRadius.rounded_l_full,
    ])
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: TColors.slate,
          borderRadius: borderRadius,
        ),
      ),
  ],
)
""";
}

/// Source code for [_TBorderRadiusRight]
class _TBorderRadiusRightSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final borderRadius in [
      TBorderRadius.rounded_r_none,
      TBorderRadius.rounded_r_xs,
      TBorderRadius.rounded_r_sm,
      TBorderRadius.rounded_r_md,
      TBorderRadius.rounded_r_lg,
      TBorderRadius.rounded_r_xl,
      TBorderRadius.rounded_r_2xl,
      TBorderRadius.rounded_r_3xl,
      TBorderRadius.rounded_r_full,
    ])
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: TColors.slate,
          borderRadius: borderRadius,
        ),
      ),
  ],
)
""";
}

/// Source code for [_TBorderRadiusTopLeft]
class _TBorderRadiusTopLeftSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final borderRadius in [
      TBorderRadius.rounded_tl_none,
      TBorderRadius.rounded_tl_xs,
      TBorderRadius.rounded_tl_sm,
      TBorderRadius.rounded_tl_md,
      TBorderRadius.rounded_tl_lg,
      TBorderRadius.rounded_tl_xl,
      TBorderRadius.rounded_tl_2xl,
      TBorderRadius.rounded_tl_3xl,
      TBorderRadius.rounded_tl_full,
    ])
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: TColors.slate,
          borderRadius: borderRadius,
        ),
      ),
  ],
)
""";
}

/// Source code for [_TBorderRadiusTopRight]
class _TBorderRadiusTopRightSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final borderRadius in [
      TBorderRadius.rounded_tr_none,
      TBorderRadius.rounded_tr_xs,
      TBorderRadius.rounded_tr_sm,
      TBorderRadius.rounded_tr_md,
      TBorderRadius.rounded_tr_lg,
      TBorderRadius.rounded_tr_xl,
      TBorderRadius.rounded_tr_2xl,
      TBorderRadius.rounded_tr_3xl,
      TBorderRadius.rounded_tr_full,
    ])
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: TColors.slate,
          borderRadius: borderRadius,
        ),
      ),
  ],
)
""";
}

/// Source code for [_TBorderRadiusBottomRight]
class _TBorderRadiusBottomRightSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final borderRadius in [
      TBorderRadius.rounded_br_none,
      TBorderRadius.rounded_br_xs,
      TBorderRadius.rounded_br_sm,
      TBorderRadius.rounded_br_md,
      TBorderRadius.rounded_br_lg,
      TBorderRadius.rounded_br_xl,
      TBorderRadius.rounded_br_2xl,
      TBorderRadius.rounded_br_3xl,
      TBorderRadius.rounded_br_full,
    ])
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: TColors.slate,
          borderRadius: borderRadius,
        ),
      ),
  ],
)
""";
}

/// Source code for [_TBorderRadiusBottomLeft]
class _TBorderRadiusBottomLeftSource {
  static const String code = r"""
Wrap(
  spacing: TSpace.v16,
  runSpacing: TSpace.v8,
  crossAxisAlignment: WrapCrossAlignment.center,
  children: [
    for (final borderRadius in [
      TBorderRadius.rounded_bl_none,
      TBorderRadius.rounded_bl_xs,
      TBorderRadius.rounded_bl_sm,
      TBorderRadius.rounded_bl_md,
      TBorderRadius.rounded_bl_lg,
      TBorderRadius.rounded_bl_xl,
      TBorderRadius.rounded_bl_2xl,
      TBorderRadius.rounded_bl_3xl,
      TBorderRadius.rounded_bl_full,
    ])
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: TColors.slate,
          borderRadius: borderRadius,
        ),
      ),
  ],
)
""";
}
