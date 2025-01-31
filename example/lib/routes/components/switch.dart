part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTSwitch
// =============================================================================

class ComponentRouteTSwitch extends StatelessWidget {
  const ComponentRouteTSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TSwitch',
      description: 'A primitive checkbox widget.',
      reference:
          'https://tailwindui.com/components/application-ui/forms/toggles',
      children: [
        AppSection(
          title: 'Switch States',
          children: const [
            AppPreviewCard(
              title: 'Active',
              code: _TSwitchActiveSource.code,
              child: _TSwitchActive(),
            ),
            AppPreviewCard(
              title: 'Active (Disabled)',
              code: _TSwitchActiveDisabledSource.code,
              child: _TSwitchActiveDisabled(),
            ),
            AppPreviewCard(
              title: 'Inactive (Disabled)',
              code: _TSwitchInactiveDisabledSource.code,
              child: _TSwitchInactiveDisabled(),
            ),
          ],
        ),
        AppSection(
          title: 'Switch Theming',
          children: const [
            AppPreviewCard(
              title: 'Custom Color',
              code: _TSwitchColorsSource.code,
              child: _TSwitchColors(),
            ),
            AppPreviewCard(
              title: 'Custom Indicator',
              code: _TSwitchIndicatorSource.code,
              child: _TSwitchIndicator(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchActive
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSwitchActive extends StatefulWidget {
  const _TSwitchActive();

  @override
  State<_TSwitchActive> createState() => _TSwitchActiveState();
}

class _TSwitchActiveState extends State<_TSwitchActive> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TSwitch(
      value: _value,
      onChanged: (value) => setState(() => _value = value),
    );
  }
}

// =============================================================================
// CLASS: _TSwitchActiveDisabled
// =============================================================================

@GenerateSource()
class _TSwitchActiveDisabled extends StatelessWidget {
  const _TSwitchActiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TSwitch(
      enabled: false,
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchInactiveDisabled
// =============================================================================

@GenerateSource()
class _TSwitchInactiveDisabled extends StatelessWidget {
  const _TSwitchInactiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TSwitch(
      enabled: false,
      value: false,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSwitchColors
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSwitchColors extends StatefulWidget {
  const _TSwitchColors();

  @override
  State<_TSwitchColors> createState() => _TSwitchColorsState();
}

class _TSwitchColorsState extends State<_TSwitchColors> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TSwitch(
            color: color,
            value: _value,
            onChanged: (value) => setState(() => _value = value),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSwitchIndicator
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSwitchIndicator extends StatefulWidget {
  const _TSwitchIndicator();

  @override
  State<_TSwitchIndicator> createState() => _TSwitchIndicatorState();
}

class _TSwitchIndicatorState extends State<_TSwitchIndicator> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TSwitch(
      value: _value,
      indicator: Icon(_value ? Icons.check : Icons.close),
      onChanged: (value) => setState(() => _value = value),
    );
  }
}
