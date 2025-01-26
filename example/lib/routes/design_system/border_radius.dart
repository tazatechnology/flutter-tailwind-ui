part of 'design_system.dart';

// =============================================================================
// CLASS: BorderRadiusRoute
// =============================================================================

class BorderRadiusRoute extends StatelessWidget {
  const BorderRadiusRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.designSystem,
        title: 'Border Radius',
        description: 'The built-in border radius breakpoints.',
        className: 'TBorderRadius',
      ),
      children: [
        AppSection(
          title: 'Radius Values',
          children: [
            AppValueTable(
              header: const [Text('Variable'), Text('Value')],
              items: [
                for (final scale in TRadius.values)
                  AppValueTableItem(
                    name: TRadius.getName(scale),
                    value: scale.toString(),
                  ),
              ],
            ),
          ],
        ),
        AppSection(
          title: 'Border Radius Gallery',
          children: const [
            AppPreviewCard(
              title: 'All Sides',
              code: _TBorderRadiusAllSource.code,
              child: _TBorderRadiusAll(),
            ),
            AppPreviewCard(
              title: 'Top Only',
              code: _TBorderRadiusTopSource.code,
              child: _TBorderRadiusTop(),
            ),
            AppPreviewCard(
              title: 'Bottom Only',
              code: _TBorderRadiusBottomSource.code,
              child: _TBorderRadiusBottom(),
            ),
            AppPreviewCard(
              title: 'Left Only',
              code: _TBorderRadiusLeftSource.code,
              child: _TBorderRadiusLeft(),
            ),
            AppPreviewCard(
              title: 'Right Only',
              code: _TBorderRadiusRightSource.code,
              child: _TBorderRadiusRight(),
            ),
            AppPreviewCard(
              title: 'Top-Left Only',
              code: _TBorderRadiusTopLeftSource.code,
              child: _TBorderRadiusTopLeft(),
            ),
            AppPreviewCard(
              title: 'Top-Right Only',
              code: _TBorderRadiusTopRightSource.code,
              child: _TBorderRadiusTopRight(),
            ),
            AppPreviewCard(
              title: 'Bottom-Right Only',
              code: _TBorderRadiusBottomRightSource.code,
              child: _TBorderRadiusBottomRight(),
            ),
            AppPreviewCard(
              title: 'Bottom-Left Only',
              code: _TBorderRadiusBottomLeftSource.code,
              child: _TBorderRadiusBottomLeft(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TBorderRadiusAll
// =============================================================================

@GenerateSource()
class _TBorderRadiusAll extends StatelessWidget {
  const _TBorderRadiusAll();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBorderRadiusTop
// =============================================================================

@GenerateSource()
class _TBorderRadiusTop extends StatelessWidget {
  const _TBorderRadiusTop();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBorderRadiusBottom
// =============================================================================

@GenerateSource()
class _TBorderRadiusBottom extends StatelessWidget {
  const _TBorderRadiusBottom();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBorderRadiusLeft
// =============================================================================

@GenerateSource()
class _TBorderRadiusLeft extends StatelessWidget {
  const _TBorderRadiusLeft();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBorderRadiusRight
// =============================================================================

@GenerateSource()
class _TBorderRadiusRight extends StatelessWidget {
  const _TBorderRadiusRight();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBorderRadiusTopLeft
// =============================================================================

@GenerateSource()
class _TBorderRadiusTopLeft extends StatelessWidget {
  const _TBorderRadiusTopLeft();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBorderRadiusTopRight
// =============================================================================

@GenerateSource()
class _TBorderRadiusTopRight extends StatelessWidget {
  const _TBorderRadiusTopRight();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBorderRadiusBottomRight
// =============================================================================

@GenerateSource()
class _TBorderRadiusBottomRight extends StatelessWidget {
  const _TBorderRadiusBottomRight();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}

// =============================================================================
// CLASS: _TBorderRadiusBottomLeft
// =============================================================================

@GenerateSource()
class _TBorderRadiusBottomLeft extends StatelessWidget {
  const _TBorderRadiusBottomLeft();

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}
