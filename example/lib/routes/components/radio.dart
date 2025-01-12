part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTRadio
// =============================================================================

class ComponentRouteTRadio extends StatelessWidget {
  const ComponentRouteTRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TRadio',
      description: 'A widget',
      children: [
        AppSection(
          title: 'Radio States',
          children: const [
            AppPreviewCard(
              title: 'Active',
              code: _TRadioActiveSource.code,
              child: _TRadioActive(),
            ),
            AppPreviewCard(
              title: 'Active (Disabled)',
              code: _TRadioActiveDisabledSource.code,
              child: _TRadioActiveDisabled(),
            ),
            AppPreviewCard(
              title: 'Inactive (Disabled)',
              code: _TRadioInactiveDisabledSource.code,
              child: _TRadioInactiveDisabled(),
            ),
          ],
        ),
        AppSection(
          title: 'Radio Theming',
          children: const [
            AppPreviewCard(
              title: 'Colors',
              code: _TRadioColorsSource.code,
              child: _TRadioColors(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TRadioActive
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TRadioActive extends StatefulWidget {
  const _TRadioActive();

  @override
  State<_TRadioActive> createState() => _TRadioActiveState();
}

class _TRadioActiveState extends State<_TRadioActive> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TRadio(
      value: _value,
      onChanged: (value) => setState(() => _value = value),
    );
  }
}

// =============================================================================
// CLASS: _TRadioActiveDisabled
// =============================================================================

@GenerateSource()
class _TRadioActiveDisabled extends StatelessWidget {
  const _TRadioActiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TRadio(
      enabled: false,
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TRadioInactiveDisabled
// =============================================================================

@GenerateSource()
class _TRadioInactiveDisabled extends StatelessWidget {
  const _TRadioInactiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TRadio(
      enabled: false,
      value: false,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TRadioColors
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TRadioColors extends StatefulWidget {
  const _TRadioColors();

  @override
  State<_TRadioColors> createState() => _TRadioColorsState();
}

class _TRadioColorsState extends State<_TRadioColors> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TRadio(
            color: color,
            value: _value,
            onChanged: (value) => setState(() => _value = value),
          ),
      ],
    );
  }
}
