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
              title: 'Active',
              code: _TCheckboxTileActiveSource.code,
              child: _TCheckboxTileActive(),
            ),
            AppPreviewCard(
              title: 'Active (Disabled)',
              code: _TCheckboxTileActiveDisabledSource.code,
              child: _TCheckboxTileActiveDisabled(),
            ),
            AppPreviewCard(
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
              title: 'Active',
              code: _TCheckboxTileCardActiveSource.code,
              child: _TCheckboxTileCardActive(),
            ),
            AppPreviewCard(
              title: 'Active (Disabled)',
              code: _TCheckboxTileCardActiveDisabledSource.code,
              child: _TCheckboxTileCardActiveDisabled(),
            ),
            AppPreviewCard(
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
              title: 'Leading',
              code: _TCheckboxTileLeadingSource.code,
              child: _TCheckboxTileLeading(),
            ),
            AppPreviewCard(
              title: 'Trailing',
              code: _TCheckboxTileTrailingSource.code,
              child: _TCheckboxTileTrailing(),
            ),
            AppPreviewCard(
              title: 'Leading (Card)',
              code: _TCheckboxTileLeadingCardSource.code,
              child: _TCheckboxTileLeadingCard(),
            ),
            AppPreviewCard(
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

@GenerateSource(buildMethodOnly: false)
class _TCheckboxTileActive extends StatefulWidget {
  const _TCheckboxTileActive();

  @override
  State<_TCheckboxTileActive> createState() => _TCheckboxTileActiveState();
}

class _TCheckboxTileActiveState extends State<_TCheckboxTileActive> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TCheckboxTile(
        title: const Text('Checkbox Tile'),
        description: const Text('This is active.'),
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
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
    return SizedBox(
      width: TSpace.v384,
      child: TCheckboxTile(
        title: const Text('Checkbox Tile'),
        description: const Text('This is active and disabled.'),
        enabled: false,
        value: true,
        onChanged: (value) {},
      ),
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
    return SizedBox(
      width: TSpace.v384,
      child: TCheckboxTile(
        title: const Text('Checkbox Tile'),
        description: const Text('This is inactive and disabled.'),
        enabled: false,
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileCardActive
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TCheckboxTileCardActive extends StatefulWidget {
  const _TCheckboxTileCardActive();

  @override
  State<_TCheckboxTileCardActive> createState() =>
      _TCheckboxTileCardActiveState();
}

class _TCheckboxTileCardActiveState extends State<_TCheckboxTileCardActive> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TCheckboxTile.card(
        title: const Text('Checkbox Tile'),
        description: const Text('This is active.'),
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
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
    return SizedBox(
      width: TSpace.v384,
      child: TCheckboxTile.card(
        title: const Text('Checkbox Tile'),
        description: const Text('This is active and disabled.'),
        enabled: false,
        value: true,
        onChanged: (value) {},
      ),
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
    return SizedBox(
      width: TSpace.v384,
      child: TCheckboxTile.card(
        title: const Text('Checkbox Tile'),
        description: const Text('This is inactive and disabled.'),
        enabled: false,
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileLeading
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TCheckboxTileLeading extends StatefulWidget {
  const _TCheckboxTileLeading();

  @override
  State<_TCheckboxTileLeading> createState() => _TCheckboxTileLeadingState();
}

class _TCheckboxTileLeadingState extends State<_TCheckboxTileLeading> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TCheckboxTile(
        title: const Text('Checkbox Tile'),
        description: const Text('Control is placed at the leading side.'),
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileTrailing
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TCheckboxTileTrailing extends StatefulWidget {
  const _TCheckboxTileTrailing();

  @override
  State<_TCheckboxTileTrailing> createState() => _TCheckboxTileTrailingState();
}

class _TCheckboxTileTrailingState extends State<_TCheckboxTileTrailing> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TCheckboxTile(
        title: const Text('Checkbox Tile'),
        description: const Text('Control is placed at the trailing side.'),
        affinity: TControlAffinity.trailing,
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileLeadingCard
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TCheckboxTileLeadingCard extends StatefulWidget {
  const _TCheckboxTileLeadingCard();

  @override
  State<_TCheckboxTileLeadingCard> createState() =>
      _TCheckboxTileLeadingCardState();
}

class _TCheckboxTileLeadingCardState extends State<_TCheckboxTileLeadingCard> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TCheckboxTile.card(
        title: const Text('Checkbox Tile'),
        description: const Text('Control is placed at the leading side.'),
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxTileTrailingCard
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TCheckboxTileTrailingCard extends StatefulWidget {
  const _TCheckboxTileTrailingCard();

  @override
  State<_TCheckboxTileTrailingCard> createState() =>
      _TCheckboxTileTrailingCardState();
}

class _TCheckboxTileTrailingCardState
    extends State<_TCheckboxTileTrailingCard> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TSpace.v384,
      child: TCheckboxTile.card(
        title: const Text('Checkbox Tile'),
        description: const Text('Control is placed at the trailing side.'),
        affinity: TControlAffinity.trailing,
        value: _value,
        onChanged: (value) => setState(() => _value = value),
      ),
    );
  }
}
