part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTSwitchTile
// =============================================================================

class ComponentRouteTSwitchTile extends StatelessWidget {
  const ComponentRouteTSwitchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TSwitchTile',
      description: 'A single switch item.',
      reference:
          'https://tailwindui.com/components/application-ui/forms/toggles',
      children: [
        AppSection(
          title: 'Switch Tile States',
          children: const [
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
          children: const [
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
          children: const [
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

@GenerateSource(buildMethodOnly: false)
class _TSwitchTileActive extends StatefulWidget {
  const _TSwitchTileActive();

  @override
  State<_TSwitchTileActive> createState() => _TSwitchTileActiveState();
}

class _TSwitchTileActiveState extends State<_TSwitchTileActive> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TSwitchTile(
        title: const Text('Switch Tile'),
        description: const Text('This is active.'),
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
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
    return SizedBox(
      width: TSpace.v384,
      child: TSwitchTile(
        title: const Text('Switch Tile'),
        description: const Text('This is active and disabled.'),
        enabled: false,
        value: true,
        onChanged: (value) {},
      ),
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
    return SizedBox(
      width: TSpace.v384,
      child: TSwitchTile(
        title: const Text('Switch Tile'),
        description: const Text('This is inactive and disabled.'),
        enabled: false,
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileCardActive
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSwitchTileCardActive extends StatefulWidget {
  const _TSwitchTileCardActive();

  @override
  State<_TSwitchTileCardActive> createState() => _TSwitchTileCardActiveState();
}

class _TSwitchTileCardActiveState extends State<_TSwitchTileCardActive> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TSwitchTile.card(
        title: const Text('Switch Tile'),
        description: const Text('This is active.'),
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
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
    return SizedBox(
      width: TSpace.v384,
      child: TSwitchTile.card(
        title: const Text('Switch Tile'),
        description: const Text('This is active and disabled.'),
        enabled: false,
        value: true,
        onChanged: (value) {},
      ),
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
    return SizedBox(
      width: TSpace.v384,
      child: TSwitchTile.card(
        title: const Text('Switch Tile'),
        description: const Text('This is inactive and disabled.'),
        enabled: false,
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileLeading
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSwitchTileLeading extends StatefulWidget {
  const _TSwitchTileLeading();

  @override
  State<_TSwitchTileLeading> createState() => _TSwitchTileLeadingState();
}

class _TSwitchTileLeadingState extends State<_TSwitchTileLeading> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TSwitchTile(
        title: const Text('Switch Tile'),
        description: const Text('Control is placed at the leading side.'),
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileTrailing
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSwitchTileTrailing extends StatefulWidget {
  const _TSwitchTileTrailing();

  @override
  State<_TSwitchTileTrailing> createState() => _TSwitchTileTrailingState();
}

class _TSwitchTileTrailingState extends State<_TSwitchTileTrailing> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TSwitchTile(
        title: const Text('Switch Tile'),
        description: const Text('Control is placed at the trailing side.'),
        affinity: TControlAffinity.trailing,
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileLeadingCard
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSwitchTileLeadingCard extends StatefulWidget {
  const _TSwitchTileLeadingCard();

  @override
  State<_TSwitchTileLeadingCard> createState() =>
      _TSwitchTileLeadingCardState();
}

class _TSwitchTileLeadingCardState extends State<_TSwitchTileLeadingCard> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TSwitchTile.card(
        title: const Text('Switch Tile'),
        description: const Text('Control is placed at the leading side.'),
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}

// =============================================================================
// CLASS: _TSwitchTileTrailingCard
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSwitchTileTrailingCard extends StatefulWidget {
  const _TSwitchTileTrailingCard();

  @override
  State<_TSwitchTileTrailingCard> createState() =>
      _TSwitchTileTrailingCardState();
}

class _TSwitchTileTrailingCardState extends State<_TSwitchTileTrailingCard> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TSwitchTile.card(
        title: const Text('Switch Tile'),
        description: const Text('Control is placed at the trailing side.'),
        affinity: TControlAffinity.trailing,
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}
