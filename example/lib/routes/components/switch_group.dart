part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTSwitchGroup
// =============================================================================

class ComponentRouteTSwitchGroup extends StatelessWidget {
  const ComponentRouteTSwitchGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TSwitchGroup',
      description: 'A switch group for multiple value selections',
      reference:
          'https://tailwindui.com/components/application-ui/forms/toggles',
      children: [
        AppSection(
          title: 'Switch Group Types',
          children: [
            AppPreviewCard(
              title: 'Basic',
              code: _TSwitchGroupBasicSource.code,
              child: _TSwitchGroupBasic(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TSwitchGroupSeparatedSource.code,
              child: _TSwitchGroupSeparated(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TSwitchGroupCardSource.code,
              child: _TSwitchGroupCard(),
            ),
            AppPreviewCard(
              title: 'Panel',
              code: _TSwitchGroupPanelSource.code,
              child: _TSwitchGroupPanel(),
            ),
          ],
        ),
        AppSection(
          title: 'Switch Group Axis',
          children: [
            AppPreviewCard(
              title: 'Basic',
              code: _TSwitchGroupBasicHorizontalSource.code,
              child: _TSwitchGroupBasicHorizontal(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TSwitchGroupSeparatedHorizontalSource.code,
              child: _TSwitchGroupSeparatedHorizontal(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TSwitchGroupCardHorizontalSource.code,
              child: _TSwitchGroupCardHorizontal(),
            ),
            AppPreviewCard(
              title: 'Panel',
              code: _TSwitchGroupPanelHorizontalSource.code,
              child: _TSwitchGroupPanelHorizontal(),
            ),
          ],
        ),
        AppSection(
          title: 'Switch Group Control Affinity',
          children: [
            AppPreviewCard(
              title: 'Basic',
              code: _TSwitchGroupBasicTrailingSource.code,
              child: _TSwitchGroupBasicTrailing(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TSwitchGroupSeparatedTrailingSource.code,
              child: _TSwitchGroupSeparatedTrailing(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TSwitchGroupCardTrailingSource.code,
              child: _TSwitchGroupCardTrailing(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TSwitchGroupPanelTrailingSource.code,
              child: _TSwitchGroupPanelTrailing(),
            ),
          ],
        ),
        AppSection(
          title: 'Switch Group with Disabled Items',
          children: [
            AppPreviewCard(
              title: 'Basic',
              code: _TSwitchGroupBasicDisabledSource.code,
              child: _TSwitchGroupBasicDisabled(),
            ),
            AppPreviewCard(
              title: 'Separated',
              code: _TSwitchGroupSeparatedDisabledSource.code,
              child: _TSwitchGroupSeparatedDisabled(),
            ),
            AppPreviewCard(
              title: 'Card',
              code: _TSwitchGroupCardDisabledSource.code,
              child: _TSwitchGroupCardDisabled(),
            ),
            AppPreviewCard(
              title: 'Panel',
              code: _TSwitchGroupPanelDisabledSource.code,
              child: _TSwitchGroupPanelDisabled(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupBasic
// =============================================================================

@GenerateSource()
class _TSwitchGroupBasic extends StatelessWidget {
  const _TSwitchGroupBasic();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup(
      title: const Text('Group Types'),
      description: const Text('Select the group type to use'),
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TSwitchGroupItem(
            title: Text(variant.title),
            description: Text('Creates a ${variant.name} switch group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupSeparated
// =============================================================================

@GenerateSource()
class _TSwitchGroupSeparated extends StatelessWidget {
  const _TSwitchGroupSeparated();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.separated(
      title: const Text('Group Types'),
      description: const Text('Select the group type to use'),
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TSwitchGroupItem(
            title: Text(variant.title),
            description: Text('Creates a ${variant.name} switch group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupCard
// =============================================================================

@GenerateSource()
class _TSwitchGroupCard extends StatelessWidget {
  const _TSwitchGroupCard();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.card(
      title: const Text('Group Types'),
      description: const Text('Select the group type to use'),
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TSwitchGroupItem(
            title: Text(variant.title),
            description: Text('Creates a ${variant.name} switch group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupPanel
// =============================================================================

@GenerateSource()
class _TSwitchGroupPanel extends StatelessWidget {
  const _TSwitchGroupPanel();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.panel(
      title: const Text('Group Types'),
      description: const Text('Select the group type to use'),
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TSwitchGroupItem(
            title: Text(variant.title),
            description: Text('Creates a ${variant.name} switch group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupBasicTrailing
// =============================================================================

@GenerateSource()
class _TSwitchGroupBasicTrailing extends StatelessWidget {
  const _TSwitchGroupBasicTrailing();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup(
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TSwitchGroupItem(
            title: Text(variant.title),
            description: Text('Creates a ${variant.name} switch group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupSeparatedTrailing
// =============================================================================

@GenerateSource()
class _TSwitchGroupSeparatedTrailing extends StatelessWidget {
  const _TSwitchGroupSeparatedTrailing();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.separated(
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TSwitchGroupItem(
            title: Text(variant.title),
            description: Text('Creates a ${variant.name} switch group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupCardTrailing
// =============================================================================

@GenerateSource()
class _TSwitchGroupCardTrailing extends StatelessWidget {
  const _TSwitchGroupCardTrailing();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.card(
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TSwitchGroupItem(
            title: Text(variant.title),
            description: Text('Creates a ${variant.name} switch group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupPanelTrailing
// =============================================================================

@GenerateSource()
class _TSwitchGroupPanelTrailing extends StatelessWidget {
  const _TSwitchGroupPanelTrailing();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.panel(
      groupValue: [TSelectionGroupVariant.values.first],
      onChanged: (value) {},
      affinity: TControlAffinity.trailing,
      children: [
        for (final variant in TSelectionGroupVariant.values)
          TSwitchGroupItem(
            title: Text(variant.title),
            description: Text('Creates a ${variant.name} switch group'),
            value: variant,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupBasicHorizontal
// =============================================================================

@GenerateSource()
class _TSwitchGroupBasicHorizontal extends StatelessWidget {
  const _TSwitchGroupBasicHorizontal();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup(
      title: const Text('Group Types'),
      description: const Text('Select the group type to use'),
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TSwitchGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupSeparatedHorizontal
// =============================================================================

@GenerateSource()
class _TSwitchGroupSeparatedHorizontal extends StatelessWidget {
  const _TSwitchGroupSeparatedHorizontal();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.separated(
      title: const Text('Group Types'),
      description: const Text('Select the group type to use'),
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TSwitchGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupCardHorizontal
// =============================================================================

@GenerateSource()
class _TSwitchGroupCardHorizontal extends StatelessWidget {
  const _TSwitchGroupCardHorizontal();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.card(
      title: const Text('Group Types'),
      description: const Text('Select the group type to use'),
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TSwitchGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupPanelHorizontal
// =============================================================================

@GenerateSource()
class _TSwitchGroupPanelHorizontal extends StatelessWidget {
  const _TSwitchGroupPanelHorizontal();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.panel(
      title: const Text('Group Types'),
      description: const Text('Select the group type to use'),
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      axis: Axis.horizontal,
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TSwitchGroupItem(
            title: Text(item),
            value: item,
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupBasicDisabled
// =============================================================================

@GenerateSource()
class _TSwitchGroupBasicDisabled extends StatelessWidget {
  const _TSwitchGroupBasicDisabled();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup(
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TSwitchGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Beta',
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupSeparatedDisabled
// =============================================================================

@GenerateSource()
class _TSwitchGroupSeparatedDisabled extends StatelessWidget {
  const _TSwitchGroupSeparatedDisabled();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.separated(
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TSwitchGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Beta',
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupCardDisabled
// =============================================================================

@GenerateSource()
class _TSwitchGroupCardDisabled extends StatelessWidget {
  const _TSwitchGroupCardDisabled();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.card(
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TSwitchGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Beta',
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchGroupPanelDisabled
// =============================================================================

@GenerateSource()
class _TSwitchGroupPanelDisabled extends StatelessWidget {
  const _TSwitchGroupPanelDisabled();

  @override
  Widget build(BuildContext context) {
    return TSwitchGroup.panel(
      groupValue: const ['Alpha'],
      onChanged: (value) {},
      children: [
        for (final item in ['Alpha', 'Beta', 'Gamma'])
          TSwitchGroupItem(
            title: Text(item),
            value: item,
            enabled: item != 'Beta',
          ),
      ],
    );
  }
}
