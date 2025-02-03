part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTCheckboxItem
// =============================================================================

class ComponentRouteTCheckboxTile extends StatelessWidget {
  const ComponentRouteTCheckboxTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TCheckboxTile',
      description: 'A single checkbox item.',
      reference:
          'https://tailwindui.com/components/application-ui/forms/checkboxes',
      children: [
        AppSection(
          title: 'Checkbox Tile States',
          children: const [
            AppPreviewCard(
              maxWidth: TScreen.max_w_md,
              title: 'Active',
              code: _TCheckboxTileActiveSource.code,
              child: _TCheckboxTileActive(),
            ),
            AppPreviewCard(
              maxWidth: TScreen.max_w_md,
              title: 'Active (Disabled)',
              code: _TCheckboxTileActiveDisabledSource.code,
              child: _TCheckboxTileActiveDisabled(),
            ),
            AppPreviewCard(
              maxWidth: TScreen.max_w_md,
              title: 'Inactive (Disabled)',
              code: _TCheckboxTileInactiveDisabledSource.code,
              child: _TCheckboxTileInactiveDisabled(),
            ),
          ],
        ),
        AppSection(
          title: 'Checkbox Tile States (Card)',
          children: const [
            AppPreviewCard(
              maxWidth: TScreen.max_w_md,
              title: 'Active',
              code: _TCheckboxTileCardActiveSource.code,
              child: _TCheckboxTileCardActive(),
            ),
            AppPreviewCard(
              maxWidth: TScreen.max_w_md,
              title: 'Active (Disabled)',
              code: _TCheckboxTileCardActiveDisabledSource.code,
              child: _TCheckboxTileCardActiveDisabled(),
            ),
            AppPreviewCard(
              maxWidth: TScreen.max_w_md,
              title: 'Inactive (Disabled)',
              code: _TCheckboxTileCardInactiveDisabledSource.code,
              child: _TCheckboxTileCardInactiveDisabled(),
            ),
          ],
        ),
        AppSection(
          title: 'Checkbox Tile Control Affinity',
          children: const [
            AppPreviewCard(
              maxWidth: TScreen.max_w_md,
              title: 'Leading',
              code: _TCheckboxTileLeadingSource.code,
              child: _TCheckboxTileLeading(),
            ),
            AppPreviewCard(
              maxWidth: TScreen.max_w_md,
              title: 'Trailing',
              code: _TCheckboxTileTrailingSource.code,
              child: _TCheckboxTileTrailing(),
            ),
            AppPreviewCard(
              maxWidth: TScreen.max_w_md,
              title: 'Leading (Card)',
              code: _TCheckboxTileLeadingCardSource.code,
              child: _TCheckboxTileLeadingCard(),
            ),
            AppPreviewCard(
              maxWidth: TScreen.max_w_md,
              title: 'Trailing (Card)',
              code: _TCheckboxTileTrailingCardSource.code,
              child: _TCheckboxTileTrailingCard(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileActive
// =============================================================================

@GenerateSource()
class _TCheckboxTileActive extends StatelessWidget {
  const _TCheckboxTileActive();

  @override
  Widget build(BuildContext context) {
    return TCheckboxTile(
      title: const Text('Checkbox Tile'),
      description: const Text('This is active.'),
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileActiveDisabled
// =============================================================================

@GenerateSource()
class _TCheckboxTileActiveDisabled extends StatelessWidget {
  const _TCheckboxTileActiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TCheckboxTile(
      title: const Text('Checkbox Tile'),
      description: const Text('This is active and disabled.'),
      enabled: false,
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileInactiveDisabled
// =============================================================================

@GenerateSource()
class _TCheckboxTileInactiveDisabled extends StatelessWidget {
  const _TCheckboxTileInactiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TCheckboxTile(
      title: const Text('Checkbox Tile'),
      description: const Text('This is inactive and disabled.'),
      enabled: false,
      value: false,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileCardActive
// =============================================================================

@GenerateSource()
class _TCheckboxTileCardActive extends StatelessWidget {
  const _TCheckboxTileCardActive();

  @override
  Widget build(BuildContext context) {
    return TCheckboxTile.card(
      title: const Text('Checkbox Tile'),
      description: const Text('This is active.'),
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileCardActiveDisabled
// =============================================================================

@GenerateSource()
class _TCheckboxTileCardActiveDisabled extends StatelessWidget {
  const _TCheckboxTileCardActiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TCheckboxTile.card(
      title: const Text('Checkbox Tile'),
      description: const Text('This is active and disabled.'),
      enabled: false,
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileCardInactiveDisabled
// =============================================================================

@GenerateSource()
class _TCheckboxTileCardInactiveDisabled extends StatelessWidget {
  const _TCheckboxTileCardInactiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TCheckboxTile.card(
      title: const Text('Checkbox Tile'),
      description: const Text('This is inactive and disabled.'),
      enabled: false,
      value: false,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileLeading
// =============================================================================

@GenerateSource()
class _TCheckboxTileLeading extends StatelessWidget {
  const _TCheckboxTileLeading();

  @override
  Widget build(BuildContext context) {
    return TCheckboxTile(
      title: const Text('Checkbox Tile'),
      description: const Text('Control is placed at the leading side.'),
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileTrailing
// =============================================================================

@GenerateSource()
class _TCheckboxTileTrailing extends StatelessWidget {
  const _TCheckboxTileTrailing();

  @override
  Widget build(BuildContext context) {
    return TCheckboxTile(
      title: const Text('Checkbox Tile'),
      description: const Text('Control is placed at the trailing side.'),
      affinity: TControlAffinity.trailing,
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileLeadingCard
// =============================================================================

@GenerateSource()
class _TCheckboxTileLeadingCard extends StatelessWidget {
  const _TCheckboxTileLeadingCard();

  @override
  Widget build(BuildContext context) {
    return TCheckboxTile.card(
      title: const Text('Checkbox Tile'),
      description: const Text('Control is placed at the leading side.'),
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileTrailingCard
// =============================================================================

@GenerateSource()
class _TCheckboxTileTrailingCard extends StatelessWidget {
  const _TCheckboxTileTrailingCard();

  @override
  Widget build(BuildContext context) {
    return TCheckboxTile.card(
      title: const Text('Checkbox Tile'),
      description: const Text('Control is placed at the trailing side.'),
      affinity: TControlAffinity.trailing,
      value: true,
      onChanged: (value) {},
    );
  }
}
