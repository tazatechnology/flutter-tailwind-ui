part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTGrid
// =============================================================================

class ComponentRouteTGrid extends StatelessWidget {
  const ComponentRouteTGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TGrid',
      description: 'A simple grid layout builder.',
      children: [
        AppSection(
          title: 'Basic Properties',
          children: [
            AppPreviewCard(
              title: 'Default',
              description: 'By default, `columns` is set to 1.',
              code: _TGridDefaultSource.code,
              child: _TGridDefault(),
            ),
            AppPreviewCard(
              title: 'Define grid columns',
              description: 'Items are automatically sized to fit the column.',
              code: _TGridColumnsSource.code,
              child: _TGridColumns(),
            ),
            AppPreviewCard(
              title: 'Define grid spacing',
              description:
                  'Spacing can be defined horizontally (`spacing`) and vertically (`runSpacing`).',
              code: _TGridSpacingSource.code,
              child: _TGridSpacing(),
            ),
            AppPreviewCard(
              title: 'Automatic wrapping',
              description: 'Items are automatically wrapped to the next row.',
              code: _TGridAsymmetricSource.code,
              child: _TGridAsymmetric(),
            ),
          ],
        ),
        AppSection(
          title: 'Cross Axis Alignment',
          children: [
            AppPreviewCard(
              title: 'Default: `WrapCrossAlignment.start`',
              description:
                  'By default, items are aligned to the start of the cross axis.',
              code: _TGridAlignmentStartSource.code,
              child: _TGridAlignmentStart(),
            ),
            AppPreviewCard(
              title: 'Align Center: `WrapCrossAlignment.center`',
              code: _TGridAlignmentCenterSource.code,
              child: _TGridAlignmentCenter(),
            ),
            AppPreviewCard(
              title: 'Align End: `WrapCrossAlignment.end`',
              code: _TGridAlignmentEndSource.code,
              child: _TGridAlignmentEnd(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TGridDefault
// =============================================================================

@GenerateSource()
class _TGridDefault extends StatelessWidget {
  const _TGridDefault();

  @override
  Widget build(BuildContext context) {
    return TGrid(
      children: List.generate(4, (index) {
        return TCard(
          borderRadius: TBorderRadius.rounded_none,
          child: Text('Item ${index + 1}'),
        );
      }),
    );
  }
}

// =============================================================================
// CLASS: _TGridColumns
// =============================================================================

@GenerateSource()
class _TGridColumns extends StatelessWidget {
  const _TGridColumns();

  @override
  Widget build(BuildContext context) {
    return TGrid(
      columns: 2,
      children: List.generate(4, (index) {
        return TCard(
          borderRadius: TBorderRadius.rounded_none,
          child: Text('Item ${index + 1}'),
        );
      }),
    );
  }
}

// =============================================================================
// CLASS: _TGridSpacing
// =============================================================================

@GenerateSource()
class _TGridSpacing extends StatelessWidget {
  const _TGridSpacing();

  @override
  Widget build(BuildContext context) {
    return TGrid(
      columns: 2,
      runSpacing: TSpace.v12,
      spacing: TSpace.v12,
      children: List.generate(4, (index) {
        return TCard(
          borderRadius: TBorderRadius.rounded_none,
          child: Text('Item ${index + 1}'),
        );
      }),
    );
  }
}

// =============================================================================
// CLASS: _TGridAsymmetric
// =============================================================================

@GenerateSource()
class _TGridAsymmetric extends StatelessWidget {
  const _TGridAsymmetric();

  @override
  Widget build(BuildContext context) {
    return TGrid(
      columns: 3,
      spacing: TSpace.v12,
      runSpacing: TSpace.v12,
      children: List.generate(4, (index) {
        return TCard(
          borderRadius: TBorderRadius.rounded_none,
          child: Text('Item ${index + 1}'),
        );
      }),
    );
  }
}

// =============================================================================
// CLASS: _TGridAlignmentStart
// =============================================================================

@GenerateSource()
class _TGridAlignmentStart extends StatelessWidget {
  const _TGridAlignmentStart();

  @override
  Widget build(BuildContext context) {
    return TGrid(
      columns: 3,
      spacing: TSpace.v12,
      runSpacing: TSpace.v12,
      children: List.generate(6, (index) {
        return SizedBox(
          height: index.isEven ? 50 : 75,
          child: TCard(
            borderRadius: TBorderRadius.rounded_none,
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: const TextStyle(height: kTextHeightNone),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// =============================================================================
// CLASS: _TGridAlignmentCenter
// =============================================================================

@GenerateSource()
class _TGridAlignmentCenter extends StatelessWidget {
  const _TGridAlignmentCenter();

  @override
  Widget build(BuildContext context) {
    return TGrid(
      columns: 3,
      spacing: TSpace.v12,
      runSpacing: TSpace.v12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(6, (index) {
        return SizedBox(
          height: index.isEven ? 50 : 75,
          child: TCard(
            borderRadius: TBorderRadius.rounded_none,
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: const TextStyle(height: kTextHeightNone),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// =============================================================================
// CLASS: _TGridAlignmentEnd
// =============================================================================

@GenerateSource()
class _TGridAlignmentEnd extends StatelessWidget {
  const _TGridAlignmentEnd();

  @override
  Widget build(BuildContext context) {
    return TGrid(
      columns: 3,
      spacing: TSpace.v12,
      runSpacing: TSpace.v12,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: List.generate(6, (index) {
        return SizedBox(
          height: index.isEven ? 50 : 75,
          child: TCard(
            borderRadius: TBorderRadius.rounded_none,
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: const TextStyle(height: kTextHeightNone),
              ),
            ),
          ),
        );
      }),
    );
  }
}
