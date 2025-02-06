part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTSwitchTile
// =============================================================================

class ComponentRouteTSwitchTile extends StatelessWidget {
  const ComponentRouteTSwitchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TSwitchTile',
      description: 'A single switch item.',
      reference:
          'https://tailwindui.com/components/application-ui/forms/toggles',
      children: [
        AppSection(
          title: 'Switch Tile States',
          children: [
            AppPreviewCard(
              title: 'Active',
              code: _TSwitchTileActiveSource.code,
              child: _TSwitchTileActive(),
            ),
            AppPreviewCard(
              title: 'Active (Disabled)',
              code: _TSwitchTileActiveDisabledSource.code,
              child: _TSwitchTileActiveDisabled(),
            ),
            AppPreviewCard(
              title: 'Inactive (Disabled)',
              code: _TSwitchTileInactiveDisabledSource.code,
              child: _TSwitchTileInactiveDisabled(),
            ),
          ],
        ),
        AppSection(
          title: 'Switch Tile States (Card)',
          children: [
            AppPreviewCard(
              title: 'Active',
              code: _TSwitchTileCardActiveSource.code,
              child: _TSwitchTileCardActive(),
            ),
            AppPreviewCard(
              title: 'Active (Disabled)',
              code: _TSwitchTileCardActiveDisabledSource.code,
              child: _TSwitchTileCardActiveDisabled(),
            ),
            AppPreviewCard(
              title: 'Inactive (Disabled)',
              code: _TSwitchTileCardInactiveDisabledSource.code,
              child: _TSwitchTileCardInactiveDisabled(),
            ),
          ],
        ),
        AppSection(
          title: 'Switch Tile Control Affinity',
          children: [
            AppPreviewCard(
              title: 'Leading',
              code: _TSwitchTileLeadingSource.code,
              child: _TSwitchTileLeading(),
            ),
            AppPreviewCard(
              title: 'Trailing',
              code: _TSwitchTileTrailingSource.code,
              child: _TSwitchTileTrailing(),
            ),
            AppPreviewCard(
              title: 'Leading (Card)',
              code: _TSwitchTileLeadingCardSource.code,
              child: _TSwitchTileLeadingCard(),
            ),
            AppPreviewCard(
              title: 'Trailing (Card)',
              code: _TSwitchTileTrailingCardSource.code,
              child: _TSwitchTileTrailingCard(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileActive
// =============================================================================

@GenerateSource()
class _TSwitchTileActive extends StatelessWidget {
  const _TSwitchTileActive();

  @override
  Widget build(BuildContext context) {
    return TSwitchTile(
      title: const Text('Switch Tile'),
      description: const Text('This is active.'),
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileActiveDisabled
// =============================================================================

@GenerateSource()
class _TSwitchTileActiveDisabled extends StatelessWidget {
  const _TSwitchTileActiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TSwitchTile(
      title: const Text('Switch Tile'),
      description: const Text('This is active and disabled.'),
      enabled: false,
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileInactiveDisabled
// =============================================================================

@GenerateSource()
class _TSwitchTileInactiveDisabled extends StatelessWidget {
  const _TSwitchTileInactiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TSwitchTile(
      title: const Text('Switch Tile'),
      description: const Text('This is inactive and disabled.'),
      enabled: false,
      value: false,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileCardActive
// =============================================================================

@GenerateSource()
class _TSwitchTileCardActive extends StatelessWidget {
  const _TSwitchTileCardActive();

  @override
  Widget build(BuildContext context) {
    return TSwitchTile.card(
      title: const Text('Switch Tile'),
      description: const Text('This is active.'),
      value: false,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileCardActiveDisabled
// =============================================================================

@GenerateSource()
class _TSwitchTileCardActiveDisabled extends StatelessWidget {
  const _TSwitchTileCardActiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TSwitchTile.card(
      title: const Text('Switch Tile'),
      description: const Text('This is active and disabled.'),
      enabled: false,
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileCardInactiveDisabled
// =============================================================================

@GenerateSource()
class _TSwitchTileCardInactiveDisabled extends StatelessWidget {
  const _TSwitchTileCardInactiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TSwitchTile.card(
      title: const Text('Switch Tile'),
      description: const Text('This is inactive and disabled.'),
      enabled: false,
      value: false,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileLeading
// =============================================================================

@GenerateSource()
class _TSwitchTileLeading extends StatelessWidget {
  const _TSwitchTileLeading();

  @override
  Widget build(BuildContext context) {
    return TSwitchTile(
      title: const Text('Switch Tile'),
      description: const Text('Control is placed at the leading side.'),
      value: true,
      onChanged: (value) => {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileTrailing
// =============================================================================

@GenerateSource()
class _TSwitchTileTrailing extends StatelessWidget {
  const _TSwitchTileTrailing();

  @override
  Widget build(BuildContext context) {
    return TSwitchTile(
      title: const Text('Switch Tile'),
      description: const Text('Control is placed at the trailing side.'),
      affinity: TControlAffinity.trailing,
      value: true,
      onChanged: (value) => {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileLeadingCard
// =============================================================================

@GenerateSource()
class _TSwitchTileLeadingCard extends StatelessWidget {
  const _TSwitchTileLeadingCard();

  @override
  Widget build(BuildContext context) {
    return TSwitchTile.card(
      title: const Text('Switch Tile'),
      description: const Text('Control is placed at the leading side.'),
      value: true,
      onChanged: (value) => {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileTrailingCard
// =============================================================================

@GenerateSource()
class _TSwitchTileTrailingCard extends StatelessWidget {
  const _TSwitchTileTrailingCard();

  @override
  Widget build(BuildContext context) {
    return TSwitchTile.card(
      title: const Text('Switch Tile'),
      description: const Text('Control is placed at the trailing side.'),
      affinity: TControlAffinity.trailing,
      value: true,
      onChanged: (value) => {},
    );
  }
}
