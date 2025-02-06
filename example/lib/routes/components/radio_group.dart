part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTRadioGroup
// =============================================================================

class ComponentRouteTRadioGroup extends StatelessWidget {
  const ComponentRouteTRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TRadioGroup',
      description: 'A radio group for single value selections',
      reference:
          'https://tailwindui.com/components/application-ui/forms/radio-groups',
      children: [
        AppSection(
          title: 'Radio Group Types',
          children: [
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
          title: 'Radio Group Axis',
          children: [
            AppPreviewCard(
              title: 'Basic',
              code: _TRadioGroupBasicHorizontalSource.code,
              child: _TRadioGroupBasicHorizontal(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TRadioGroupSeparatedHorizontalSource.code,
              child: _TRadioGroupSeparatedHorizontal(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TRadioGroupCardHorizontalSource.code,
              child: _TRadioGroupCardHorizontal(),
            ),
            AppPreviewCard(
              title: 'Panel',
              code: _TRadioGroupPanelHorizontalSource.code,
              child: _TRadioGroupPanelHorizontal(),
            ),
          ],
        ),
        AppSection(
          title: 'Radio Group Control Affinity',
          children: [
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
        AppSection(
          title: 'Radio Group with Disabled Items',
          children: [
            AppPreviewCard(
              title: 'Basic',
              code: _TRadioGroupBasicDisabledSource.code,
              child: _TRadioGroupBasicDisabled(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TRadioGroupSeparatedDisabledSource.code,
              child: _TRadioGroupSeparatedDisabled(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TRadioGroupCardDisabledSource.code,
              child: _TRadioGroupCardDisabled(),
            ),
            AppPreviewCard(
              title: 'Panel',
              code: _TRadioGroupPanelDisabledSource.code,
              child: _TRadioGroupPanelDisabled(),
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
      label: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: TSelectionGroupVariant.values.first,
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: Text(variant.title),
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
      label: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: TSelectionGroupVariant.values.first,
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: Text(variant.title),
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
      label: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: TSelectionGroupVariant.values.first,
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: Text(variant.title),
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
      label: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: TSelectionGroupVariant.values.first,
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: Text(variant.title),
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
      groupValue: TSelectionGroupVariant.values.first,
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: Text(variant.title),
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
      groupValue: TSelectionGroupVariant.values.first,
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: Text(variant.title),
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
      groupValue: TSelectionGroupVariant.values.first,
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: Text(variant.title),
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
      groupValue: TSelectionGroupVariant.values.first,
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TRadioGroupItem(
            title: Text(variant.title),
            description: Text('Creates a ${variant.name} radio group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupBasicHorizontal
// =============================================================================

@GenerateSource()
class _TRadioGroupBasicHorizontal extends StatelessWidget {
  const _TRadioGroupBasicHorizontal();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup(
      label: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: 'Small',
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Small', 'Medium', 'Large'])
          TRadioGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupSeparatedHorizontal
// =============================================================================

@GenerateSource()
class _TRadioGroupSeparatedHorizontal extends StatelessWidget {
  const _TRadioGroupSeparatedHorizontal();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.separated(
      label: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: 'Small',
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Small', 'Medium', 'Large'])
          TRadioGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupCardHorizontal
// =============================================================================

@GenerateSource()
class _TRadioGroupCardHorizontal extends StatelessWidget {
  const _TRadioGroupCardHorizontal();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.card(
      label: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: 'Small',
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Small', 'Medium', 'Large'])
          TRadioGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupPanelHorizontal
// =============================================================================

@GenerateSource()
class _TRadioGroupPanelHorizontal extends StatelessWidget {
  const _TRadioGroupPanelHorizontal();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.panel(
      label: const Text('Card Types'),
      description: const Text('Select the card type to use'),
      groupValue: 'Small',
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Small', 'Medium', 'Large'])
          TRadioGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupBasicDisabled
// =============================================================================

@GenerateSource()
class _TRadioGroupBasicDisabled extends StatelessWidget {
  const _TRadioGroupBasicDisabled();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup(
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TRadioGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Beta',
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupSeparatedDisabled
// =============================================================================

@GenerateSource()
class _TRadioGroupSeparatedDisabled extends StatelessWidget {
  const _TRadioGroupSeparatedDisabled();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.separated(
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TRadioGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Beta',
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupCardDisabled
// =============================================================================

@GenerateSource()
class _TRadioGroupCardDisabled extends StatelessWidget {
  const _TRadioGroupCardDisabled();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.card(
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TRadioGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Beta',
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioGroupPanelDisabled
// =============================================================================

@GenerateSource()
class _TRadioGroupPanelDisabled extends StatelessWidget {
  const _TRadioGroupPanelDisabled();

  @override
  Widget build(BuildContext context) {
    return TRadioGroup.panel(
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TRadioGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Beta',
          ),
      ],
    );
  }
}
