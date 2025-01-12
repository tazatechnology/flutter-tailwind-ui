part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTCheckboxGroup
// =============================================================================

class ComponentRouteTCheckboxGroup extends StatelessWidget {
  const ComponentRouteTCheckboxGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TCheckboxGroup',
      description: 'A widget',
      children: [
        AppSection(
          title: 'Checkbox Group Types',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TCheckboxGroupBasicSource.code,
              child: _TCheckboxGroupBasic(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TCheckboxGroupSeparatedSource.code,
              child: _TCheckboxGroupSeparated(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TCheckboxGroupCardSource.code,
              child: _TCheckboxGroupCard(),
            ),
            AppPreviewCard(
              title: 'Panel',
              code: _TCheckboxGroupPanelSource.code,
              child: _TCheckboxGroupPanel(),
            ),
          ],
        ),
        AppSection(
          title: 'Checkbox Group Control Affinity',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TCheckboxGroupBasicTrailingSource.code,
              child: _TCheckboxGroupBasicTrailing(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TCheckboxGroupSeparatedTrailingSource.code,
              child: _TCheckboxGroupSeparatedTrailing(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TCheckboxGroupCardTrailingSource.code,
              child: _TCheckboxGroupCardTrailing(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TCheckboxGroupPanelTrailingSource.code,
              child: _TCheckboxGroupPanelTrailing(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupBasic
// =============================================================================

@GenerateSource()
class _TCheckboxGroupBasic extends StatelessWidget {
  const _TCheckboxGroupBasic();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup(
      groupValues: [TSelectionGroupVariant.values.first],
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} checkbox group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupSeparated
// =============================================================================

@GenerateSource()
class _TCheckboxGroupSeparated extends StatelessWidget {
  const _TCheckboxGroupSeparated();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.separated(
      groupValues: [TSelectionGroupVariant.values.first],
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} checkbox group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupCard
// =============================================================================

@GenerateSource()
class _TCheckboxGroupCard extends StatelessWidget {
  const _TCheckboxGroupCard();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.card(
      groupValues: [TSelectionGroupVariant.values.first],
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} checkbox group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupPanel
// =============================================================================

@GenerateSource()
class _TCheckboxGroupPanel extends StatelessWidget {
  const _TCheckboxGroupPanel();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.panel(
      groupValues: [TSelectionGroupVariant.values.first],
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} checkbox group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupBasicTrailing
// =============================================================================

@GenerateSource()
class _TCheckboxGroupBasicTrailing extends StatelessWidget {
  const _TCheckboxGroupBasicTrailing();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup(
      groupValues: [TSelectionGroupVariant.values.first],
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} checkbox group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupSeparatedTrailing
// =============================================================================

@GenerateSource()
class _TCheckboxGroupSeparatedTrailing extends StatelessWidget {
  const _TCheckboxGroupSeparatedTrailing();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.separated(
      groupValues: [TSelectionGroupVariant.values.first],
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} checkbox group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupCardTrailing
// =============================================================================

@GenerateSource()
class _TCheckboxGroupCardTrailing extends StatelessWidget {
  const _TCheckboxGroupCardTrailing();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.card(
      groupValues: [TSelectionGroupVariant.values.first],
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} checkbox group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupPanelTrailing
// =============================================================================

@GenerateSource()
class _TCheckboxGroupPanelTrailing extends StatelessWidget {
  const _TCheckboxGroupPanelTrailing();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.panel(
      groupValues: [TSelectionGroupVariant.values.first],
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} checkbox group'),
            value: variant,
          ),
      ],
    );
  }
}
