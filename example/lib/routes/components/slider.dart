part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTSlider
// =============================================================================

class ComponentRouteTSlider extends StatelessWidget {
  const ComponentRouteTSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TSlider',
      description: 'Slider component',
      children: [
        AppSection(
          title: 'Slider with label',
          children: [
            AppPreviewCard(
              title: 'Simple',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderLabelTextSource.code,
              child: _TSliderLabelText(),
            ),
            AppPreviewCard(
              title: 'Custom',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderLabelWidgetSource.code,
              child: _TSliderLabelWidget(),
            ),
          ],
        ),
        AppSection(
          title: 'Slider States',
          children: [
            AppPreviewCard(
              title: 'Enabled',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderEnabledSource.code,
              child: _TSliderEnabled(),
            ),
            AppPreviewCard(
              title: 'Disabled',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderDisabledSource.code,
              child: _TSliderDisabled(),
            ),
          ],
        ),
        AppSection(
          title: 'Slider Interaction',
          children: [
            AppPreviewCard(
              title: 'Discrete',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderDiscreteSource.code,
              child: _TSliderDiscrete(),
            ),
            AppPreviewCard(
              title: 'Editable',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderEditableSource.code,
              child: _TSliderEditable(),
            ),
            AppPreviewCard(
              title: 'Discrete and editable',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderDiscreteEditableSource.code,
              child: _TSliderDiscreteEditable(),
            ),
          ],
        ),
        AppSection(
          title: 'Slider with Markings',
          children: [
            AppPreviewCard(
              title: 'Show default marks',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderValueLabelsSource.code,
              child: _TSliderValueLabels(),
            ),
            AppPreviewCard(
              title: 'Show default marks and editable',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderValueLabelsEditableSource.code,
              child: _TSliderValueLabelsEditable(),
            ),
            AppPreviewCard(
              title: 'Marking formatter',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderValueLabelsFormatterSource.code,
              child: _TSliderValueLabelsFormatter(),
            ),
          ],
        ),
        AppSection(
          title: 'Slider Tooltip',
          children: [
            AppPreviewCard(
              title: 'Customize tooltip',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderTooltipCustomizeSource.code,
              child: _TSliderTooltipCustomize(),
            ),
            AppPreviewCard(
              title: 'Value tooltip formatter',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderTooltipFormatterSource.code,
              child: _TSliderTooltipFormatter(),
            ),
          ],
        ),
        AppSection(
          title: 'Slider Controller',
          children: [
            AppPreviewCard(
              title: 'Controller to update the value',
              maxWidth: TScreen.max_w_sm,
              code: _TSliderControllerSource.code,
              child: _TSliderController(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSliderEnabled
// =============================================================================

@GenerateSource()
class _TSliderEnabled extends StatelessWidget {
  const _TSliderEnabled();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      initialValue: 0.5,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderDisabled
// =============================================================================

@GenerateSource()
class _TSliderDisabled extends StatelessWidget {
  const _TSliderDisabled();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      enabled: false,
      initialValue: 0.5,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderDiscrete
// =============================================================================

@GenerateSource()
class _TSliderDiscrete extends StatelessWidget {
  const _TSliderDiscrete();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      divisions: 10,
      initialValue: 0.5,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderEditable
// =============================================================================

@GenerateSource()
class _TSliderEditable extends StatelessWidget {
  const _TSliderEditable();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      editable: true,
      initialValue: 0.5,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderDiscreteEditable
// =============================================================================

@GenerateSource()
class _TSliderDiscreteEditable extends StatelessWidget {
  const _TSliderDiscreteEditable();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      editable: true,
      divisions: 10,
      initialValue: 0.5,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderLabelText
// =============================================================================

@GenerateSource()
class _TSliderLabelText extends StatelessWidget {
  const _TSliderLabelText();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      label: const Text('Slider Label'),
      initialValue: 0.5,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderLabelWidget
// =============================================================================

@GenerateSource()
class _TSliderLabelWidget extends StatelessWidget {
  const _TSliderLabelWidget();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      label: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Slider Label'),
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
      initialValue: 0.5,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderValueLabels
// =============================================================================

@GenerateSource()
class _TSliderValueLabels extends StatelessWidget {
  const _TSliderValueLabels();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      initialValue: 0.5,
      showDefaultMarks: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderValueLabelsEditable
// =============================================================================

@GenerateSource()
class _TSliderValueLabelsEditable extends StatelessWidget {
  const _TSliderValueLabelsEditable();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      initialValue: 0.5,
      showDefaultMarks: true,
      editable: true,
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderValueLabelsFormatter
// =============================================================================

@GenerateSource()
class _TSliderValueLabelsFormatter extends StatelessWidget {
  const _TSliderValueLabelsFormatter();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      initialValue: 0.5,
      showDefaultMarks: true,
      formatter: (value) => value.toStringAsFixed(3),
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderTooltipCustomize
// =============================================================================

@GenerateSource()
class _TSliderTooltipCustomize extends StatelessWidget {
  const _TSliderTooltipCustomize();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      initialValue: 0.5,
      tooltipBorderColor: Colors.black,
      tooltipColor: TColors.red.shade900,
      tooltipTextStyle: const TextStyle(color: Colors.white),
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderTooltipFormatter
// =============================================================================

@GenerateSource()
class _TSliderTooltipFormatter extends StatelessWidget {
  const _TSliderTooltipFormatter();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      initialValue: 0.5,
      tooltipFormatter: (value) => 'Current Value: ${value.toStringAsFixed(3)}',
      onChanged: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSliderController
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSliderController extends StatefulWidget {
  const _TSliderController();

  @override
  State<_TSliderController> createState() => _TSliderControllerState();
}

class _TSliderControllerState extends State<_TSliderController> {
  final buttonController = TWidgetStatesController();
  final sliderController = TSliderController(initialValue: 0.5);

  @override
  void dispose() {
    buttonController.dispose();
    sliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSlider(
          controller: sliderController,
          showDefaultMarks: true,
          onChanged: (value) {},
        ),
        TSizedBox.y8,
        TButton.outlined(
          controller: buttonController,
          onPressed: () => sliderController.value = 0.5,
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
