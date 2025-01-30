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
      description: 'A checkbox group for multiple value selections',
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
          title: 'Checkbox Group Axis',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TCheckboxGroupBasicHorizontalSource.code,
              child: _TCheckboxGroupBasicHorizontal(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TCheckboxGroupSeparatedHorizontalSource.code,
              child: _TCheckboxGroupSeparatedHorizontal(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TCheckboxGroupCardHorizontalSource.code,
              child: _TCheckboxGroupCardHorizontal(),
            ),
            AppPreviewCard(
              title: 'Panel',
              code: _TCheckboxGroupPanelHorizontalSource.code,
              child: _TCheckboxGroupPanelHorizontal(),
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
        AppSection(
          title: 'Checkbox Group with Disabled Items',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TCheckboxGroupBasicDisabledSource.code,
              child: _TCheckboxGroupBasicDisabled(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TCheckboxGroupSeparatedDisabledSource.code,
              child: _TCheckboxGroupSeparatedDisabled(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TCheckboxGroupCardDisabledSource.code,
              child: _TCheckboxGroupCardDisabled(),
            ),
            AppPreviewCard(
              title: 'Panel',
              code: _TCheckboxGroupPanelDisabledSource.code,
              child: _TCheckboxGroupPanelDisabled(),
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
      title: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: Text(variant.title),
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
      title: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: Text(variant.title),
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
      title: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: Text(variant.title),
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
      title: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: Text(variant.title),
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
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: Text(variant.title),
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
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: Text(variant.title),
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
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: Text(variant.title),
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
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TCheckboxGroupItem(
            title: Text(variant.title),
            description: Text('Creates a ${variant.name} checkbox group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupBasicHorizontal
// =============================================================================

@GenerateSource()
class _TCheckboxGroupBasicHorizontal extends StatelessWidget {
  const _TCheckboxGroupBasicHorizontal();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup(
      title: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: const ['Read'],
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Read', 'Write', 'Execute'])
          TCheckboxGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupSeparatedHorizontal
// =============================================================================

@GenerateSource()
class _TCheckboxGroupSeparatedHorizontal extends StatelessWidget {
  const _TCheckboxGroupSeparatedHorizontal();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.separated(
      title: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: const ['Read'],
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Read', 'Write', 'Execute'])
          TCheckboxGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupCardHorizontal
// =============================================================================

@GenerateSource()
class _TCheckboxGroupCardHorizontal extends StatelessWidget {
  const _TCheckboxGroupCardHorizontal();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.card(
      title: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: const ['Read'],
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Read', 'Write', 'Execute'])
          TCheckboxGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupPanelHorizontal
// =============================================================================

@GenerateSource()
class _TCheckboxGroupPanelHorizontal extends StatelessWidget {
  const _TCheckboxGroupPanelHorizontal();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.panel(
      title: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: const ['Read'],
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Read', 'Write', 'Execute'])
          TCheckboxGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupBasicDisabled
// =============================================================================

@GenerateSource()
class _TCheckboxGroupBasicDisabled extends StatelessWidget {
  const _TCheckboxGroupBasicDisabled();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup(
      groupValue: const ['Read'],
      onChanged: (value) {},
      children: [
        for (final item in ['Read', 'Write', 'Execute'])
          TCheckboxGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Write',
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupSeparatedDisabled
// =============================================================================

@GenerateSource()
class _TCheckboxGroupSeparatedDisabled extends StatelessWidget {
  const _TCheckboxGroupSeparatedDisabled();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.separated(
      groupValue: const ['Read'],
      onChanged: (value) {},
      children: [
        for (final item in ['Read', 'Write', 'Execute'])
          TCheckboxGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Write',
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupCardDisabled
// =============================================================================

@GenerateSource()
class _TCheckboxGroupCardDisabled extends StatelessWidget {
  const _TCheckboxGroupCardDisabled();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.card(
      groupValue: const ['Read'],
      onChanged: (value) {},
      children: [
        for (final item in ['Read', 'Write', 'Execute'])
          TCheckboxGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Write',
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxGroupPanelDisabled
// =============================================================================

@GenerateSource()
class _TCheckboxGroupPanelDisabled extends StatelessWidget {
  const _TCheckboxGroupPanelDisabled();

  @override
  Widget build(BuildContext context) {
    return TCheckboxGroup.panel(
      groupValue: const ['Read'],
      onChanged: (value) {},
      children: [
        for (final item in ['Read', 'Write', 'Execute'])
          TCheckboxGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Write',
          ),
      ],
    );
  }
}
