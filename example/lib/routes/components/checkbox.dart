part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTCheckbox
// =============================================================================

class ComponentRouteTCheckbox extends StatelessWidget {
  const ComponentRouteTCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TCheckbox',
      description: 'A primitive checkbox widget.',
      children: [
        AppSection(
          title: 'Checkbox States',
          children: const [
            AppPreviewCard(
              title: 'Active',
              code: _TCheckboxActiveSource.code,
              child: _TCheckboxActive(),
            ),
            AppPreviewCard(
              title: 'Active (Disabled)',
              code: _TCheckboxActiveDisabledSource.code,
              child: _TCheckboxActiveDisabled(),
            ),
            AppPreviewCard(
              title: 'Inactive (Disabled)',
              code: _TCheckboxInactiveDisabledSource.code,
              child: _TCheckboxInactiveDisabled(),
            ),
          ],
        ),
        AppSection(
          title: 'Checkbox Theming',
          children: const [
            AppPreviewCard(
              title: 'Custom Color',
              code: _TCheckboxColorsSource.code,
              child: _TCheckboxColors(),
            ),
            AppPreviewCard(
              title: 'Custom Indicator',
              code: _TCheckboxIndicatorSource.code,
              child: _TCheckboxIndicator(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxActive
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TCheckboxActive extends StatefulWidget {
  const _TCheckboxActive();

  @override
  State<_TCheckboxActive> createState() => _TCheckboxActiveState();
}

class _TCheckboxActiveState extends State<_TCheckboxActive> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TCheckbox(
      value: _value,
      onChanged: (value) => setState(() => _value = value),
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxActiveDisabled
// =============================================================================

@GenerateSource()
class _TCheckboxActiveDisabled extends StatelessWidget {
  const _TCheckboxActiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TCheckbox(
      enabled: false,
      value: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxInactiveDisabled
// =============================================================================

@GenerateSource()
class _TCheckboxInactiveDisabled extends StatelessWidget {
  const _TCheckboxInactiveDisabled();

  @override
  Widget build(BuildContext context) {
    return TCheckbox(
      enabled: false,
      value: false,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxColors
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TCheckboxColors extends StatefulWidget {
  const _TCheckboxColors();

  @override
  State<_TCheckboxColors> createState() => _TCheckboxColorsState();
}

class _TCheckboxColorsState extends State<_TCheckboxColors> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TCheckbox(
            color: color,
            value: _value,
            onChanged: (value) => setState(() => _value = value),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCheckboxIndicator
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TCheckboxIndicator extends StatefulWidget {
  const _TCheckboxIndicator();

  @override
  State<_TCheckboxIndicator> createState() => _TCheckboxIndicatorState();
}

class _TCheckboxIndicatorState extends State<_TCheckboxIndicator> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return TCheckbox(
      value: _value,
      indicator: const Icon(Icons.star),
      onChanged: (value) => setState(() => _value = value),
    );
  }
}
