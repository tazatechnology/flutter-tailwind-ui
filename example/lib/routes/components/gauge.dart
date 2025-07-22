part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTGauge
// =============================================================================

class ComponentRouteTGauge extends StatelessWidget {
  const ComponentRouteTGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TGauge',
      description: 'Gauge component',
      children: [
        AppSection(
          title: 'Gauge with label',
          children: [
            AppPreviewCard(
              title: 'Simple',
              maxWidth: TScreen.max_sm,
              code: _TGaugeLabelTextSource.code,
              child: _TGaugeLabelText(),
            ),
            AppPreviewCard(
              title: 'Custom',
              maxWidth: TScreen.max_sm,
              code: _TGaugeLabelWidgetSource.code,
              child: _TGaugeLabelWidget(),
            ),
          ],
        ),
        AppSection(
          title: 'Gauge States',
          children: [
            AppPreviewCard(
              title: 'Enabled',
              maxWidth: TScreen.max_sm,
              code: _TGaugeEnabledSource.code,
              child: _TGaugeEnabled(),
            ),
            AppPreviewCard(
              title: 'Disabled',
              maxWidth: TScreen.max_sm,
              code: _TGaugeDisabledSource.code,
              child: _TGaugeDisabled(),
            ),
          ],
        ),
        AppSection(
          title: 'Gauge with Markings',
          children: [
            AppPreviewCard(
              title: 'Show default marks',
              maxWidth: TScreen.max_sm,
              code: _TGaugeValueLabelsSource.code,
              child: _TGaugeValueLabels(),
            ),
            AppPreviewCard(
              title: 'Marking formatter',
              maxWidth: TScreen.max_sm,
              code: _TGaugeValueLabelsFormatterSource.code,
              child: _TGaugeValueLabelsFormatter(),
            ),
          ],
        ),
        AppSection(
          title: 'Gauge with Indicators',
          children: [
            AppPreviewCard(
              title: 'Single indicator',
              maxWidth: TScreen.max_sm,
              code: _TGaugeSingleIndicatorSource.code,
              child: _TGaugeSingleIndicator(),
            ),
            AppPreviewCard(
              title: 'Multiple indicators',
              maxWidth: TScreen.max_sm,
              code: _TGaugeMultipleIndicatorsSource.code,
              child: _TGaugeMultipleIndicators(),
            ),
            AppPreviewCard(
              title: 'Customize indicators',
              maxWidth: TScreen.max_sm,
              code: _TGaugeCustomIndicatorsSource.code,
              child: _TGaugeCustomIndicators(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TGaugeLabelText
// =============================================================================

@GenerateSource()
class _TGaugeLabelText extends StatelessWidget {
  const _TGaugeLabelText();

  @override
  Widget build(BuildContext context) {
    return const TGauge(
      label: Text('Gauge Label'),
      value: 0.5,
    );
  }
}

// =============================================================================
// CLASS: _TGaugeLabelWidget
// =============================================================================

@GenerateSource()
class _TGaugeLabelWidget extends StatelessWidget {
  const _TGaugeLabelWidget();

  @override
  Widget build(BuildContext context) {
    return const TGauge(
      value: 0.5,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Gauge Label'),
          TText(
            '* Required',
            style: TextStyle(
              fontWeight: TFontWeight.normal,
              color: TColors.red,
              fontSize: TFontSize.text_xs,
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// CLASS: _TGaugeEnabled
// =============================================================================

@GenerateSource()
class _TGaugeEnabled extends StatelessWidget {
  const _TGaugeEnabled();

  @override
  Widget build(BuildContext context) {
    return const TGauge(
      value: 0.5,
    );
  }
}

// =============================================================================
// CLASS: _TGaugeDisabled
// =============================================================================

@GenerateSource()
class _TGaugeDisabled extends StatelessWidget {
  const _TGaugeDisabled();

  @override
  Widget build(BuildContext context) {
    return const TGauge(
      enabled: false,
      value: 0.5,
    );
  }
}

// =============================================================================
// CLASS: _TGaugeValueLabels
// =============================================================================

@GenerateSource()
class _TGaugeValueLabels extends StatelessWidget {
  const _TGaugeValueLabels();

  @override
  Widget build(BuildContext context) {
    return const TGauge(
      value: 0.5,
      showDefaultMarks: true,
    );
  }
}

// =============================================================================
// CLASS: _TGaugeValueLabelsFormatter
// =============================================================================

@GenerateSource()
class _TGaugeValueLabelsFormatter extends StatelessWidget {
  const _TGaugeValueLabelsFormatter();

  @override
  Widget build(BuildContext context) {
    return TGauge(
      value: 0.5,
      showDefaultMarks: true,
      formatter: (value) => value.toStringAsFixed(3),
    );
  }
}

// =============================================================================
// CLASS: _TGaugeSingleIndicator
// =============================================================================

@GenerateSource()
class _TGaugeSingleIndicator extends StatelessWidget {
  const _TGaugeSingleIndicator();

  @override
  Widget build(BuildContext context) {
    return TGauge(
      value: 0.5,
      showDefaultMarks: true,
      indicators: [
        TIndicator(value: 0.75),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TGaugeMultipleIndicators
// =============================================================================

@GenerateSource()
class _TGaugeMultipleIndicators extends StatelessWidget {
  const _TGaugeMultipleIndicators();

  @override
  Widget build(BuildContext context) {
    return TGauge(
      value: 0.5,
      showDefaultMarks: true,
      indicators: [
        TIndicator(value: 0.25),
        TIndicator(value: 0.75),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TGaugeCustomIndicators
// =============================================================================

@GenerateSource()
class _TGaugeCustomIndicators extends StatelessWidget {
  const _TGaugeCustomIndicators();

  @override
  Widget build(BuildContext context) {
    return TGauge(
      value: 0.5,
      showDefaultMarks: true,
      indicators: [
        TIndicator(
          value: 0.25,
          color: TColors.green,
          tooltip: 'Low',
        ),
        TIndicator(
          value: 0.75,
          color: TColors.red,
          tooltip: 'High',
          child: const Icon(Icons.arrow_upward, size: 14),
        ),
      ],
    );
  }
}
