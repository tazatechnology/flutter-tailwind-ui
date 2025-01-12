part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTRadioGroup
// =============================================================================

class ComponentRouteTRadioGroup extends StatelessWidget {
  const ComponentRouteTRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TRadioGroup',
      description: 'A widget',
      children: [
        AppSection(
          title: 'Radio Group Types',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TRadioGroupBasicSource.code,
              child: _TRadioGroupBasic(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TRadioGroupSeparatedSource.code,
              child: _TRadioGroupSeparated(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TRadioGroupCardSource.code,
              child: _TRadioGroupCard(),
            ),
            AppPreviewCard(
              title: 'Panel',
              code: _TRadioGroupPanelSource.code,
              child: _TRadioGroupPanel(),
            ),
          ],
        ),
        AppSection(
          title: 'Radio Group Control Affinity',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TRadioGroupBasicTrailingSource.code,
              child: _TRadioGroupBasicTrailing(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TRadioGroupSeparatedTrailingSource.code,
              child: _TRadioGroupSeparatedTrailing(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TRadioGroupCardTrailingSource.code,
              child: _TRadioGroupCardTrailing(),
            ),
            AppPreviewCard(
              title: 'Panel',
              code: _TRadioGroupPanelTrailingSource.code,
              child: _TRadioGroupPanelTrailing(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupBasic
// =============================================================================

@GenerateSource()
class _TRadioGroupBasic extends StatelessWidget {
  const _TRadioGroupBasic();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup(
      groupValue: TSelectionGroupVariant.values.first,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} radio group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupSeparated
// =============================================================================

@GenerateSource()
class _TRadioGroupSeparated extends StatelessWidget {
  const _TRadioGroupSeparated();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.separated(
      groupValue: TSelectionGroupVariant.values.first,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} radio group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupCard
// =============================================================================

@GenerateSource()
class _TRadioGroupCard extends StatelessWidget {
  const _TRadioGroupCard();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.card(
      groupValue: TSelectionGroupVariant.values.first,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} radio group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupPanel
// =============================================================================

@GenerateSource()
class _TRadioGroupPanel extends StatelessWidget {
  const _TRadioGroupPanel();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.panel(
      groupValue: TSelectionGroupVariant.values.first,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} radio group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupBasicTrailing
// =============================================================================

@GenerateSource()
class _TRadioGroupBasicTrailing extends StatelessWidget {
  const _TRadioGroupBasicTrailing();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup(
      affinity: TControlAffinity.trailing,
      groupValue: TSelectionGroupVariant.values.first,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} radio group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupSeparatedTrailing
// =============================================================================

@GenerateSource()
class _TRadioGroupSeparatedTrailing extends StatelessWidget {
  const _TRadioGroupSeparatedTrailing();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.separated(
      affinity: TControlAffinity.trailing,
      groupValue: TSelectionGroupVariant.values.first,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} radio group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupCardTrailing
// =============================================================================

@GenerateSource()
class _TRadioGroupCardTrailing extends StatelessWidget {
  const _TRadioGroupCardTrailing();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.card(
      affinity: TControlAffinity.trailing,
      groupValue: TSelectionGroupVariant.values.first,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} radio group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupPanelTrailing
// =============================================================================

@GenerateSource()
class _TRadioGroupPanelTrailing extends StatelessWidget {
  const _TRadioGroupPanelTrailing();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.panel(
      affinity: TControlAffinity.trailing,
      groupValue: TSelectionGroupVariant.values.first,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: TText(variant.title),
            description: Text('Creates a ${variant.name} radio group'),
            value: variant,
          ),
      ],
    );
  }
}
