part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTSplitButton
// =============================================================================

class ComponentRouteTSplitButton extends StatelessWidget {
  const ComponentRouteTSplitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TSplitButton',
      description: 'A widget',
      children: [
        AppSection(
          title: 'Split Button Types',
          children: [
            AppPreviewCard(
              title: 'Basic',
              code: _TSplitButtonBasicSource.code,
              child: _TSplitButtonBasic(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              code: _TSplitButtonOutlinedSource.code,
              child: _TSplitButtonOutlined(),
            ),
            AppPreviewCard(
              title: 'Filled',
              code: _TSplitButtonFilledSource.code,
              child: _TSplitButtonFilled(),
            ),
            AppPreviewCard(
              title: 'Soft',
              code: _TSplitButtonSoftSource.code,
              child: _TSplitButtonSoft(),
            ),
          ],
        ),
        AppSection(
          title: 'Split Button Sizes',
          children: [
            AppPreviewCard(
              title: 'Basic',
              maxWidth: null,
              code: _TSplitButtonBasicSizesSource.code,
              child: _TSplitButtonBasicSizes(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              maxWidth: null,
              code: _TSplitButtonOutlinedSizesSource.code,
              child: _TSplitButtonOutlinedSizes(),
            ),
            AppPreviewCard(
              title: 'Filled',
              maxWidth: null,
              code: _TSplitButtonFilledSizesSource.code,
              child: _TSplitButtonFilledSizes(),
            ),
            AppPreviewCard(
              title: 'Soft',
              maxWidth: null,
              code: _TSplitButtonSoftSizesSource.code,
              child: _TSplitButtonSoftSizes(),
            ),
          ],
        ),
        AppSection(
          title: 'Split Button Colors',
          children: [
            AppPreviewCard(
              title: 'Basic',
              maxWidth: null,
              code: _TSplitButtonBasicColorsSource.code,
              child: _TSplitButtonBasicColors(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              maxWidth: null,
              code: _TSplitButtonOutlinedColorsSource.code,
              child: _TSplitButtonOutlinedColors(),
            ),
            AppPreviewCard(
              title: 'Filled',
              maxWidth: null,
              code: _TSplitButtonFilledColorsSource.code,
              child: _TSplitButtonFilledColors(),
            ),
            AppPreviewCard(
              title: 'Soft',
              maxWidth: null,
              code: _TSplitButtonSoftColorsSource.code,
              child: _TSplitButtonSoftColors(),
            ),
          ],
        ),
        AppSection(
          title: 'Leading, Trailing, and Callbacks',
          children: [
            AppPreviewCard(
              title: 'No leading and trailing provided',
              description:
                  'If no `leading` or `trailing` widget is provided, '
                  'the button will fallback to a standard `TButton`.',
              code: _TSplitButtonNoLeadingTrailingSource.code,
              child: _TSplitButtonNoLeadingTrailing(),
            ),
            AppPreviewCard(
              title: 'Mix and match leading and trailing',
              description:
                  'Define a `leading`, a `trailing`, or both. Each widget can also be customized with its own accompanying callbacks, controllers, tooltip, etc.',
              code: _TSplitButtonLeadingTrailingSource.code,
              child: _TSplitButtonLeadingTrailing(),
            ),
          ],
        ),
        AppSection(
          title: 'Split Button with Controller',
          children: [
            AppPreviewCard(
              title: 'Controller to manage loading state',
              description: 'Tap the button to see the default loading state.',
              maxWidth: null,
              code: _TSplitButtonLoadingSource.code,
              child: _TSplitButtonLoading(),
            ),
            AppPreviewCard(
              title: 'Custom loading widget',
              description: 'Tap the button to see the custom loading state.',
              maxWidth: null,
              code: _TSplitButtonLoadingCustomSource.code,
              child: _TSplitButtonLoadingCustom(),
            ),
            AppPreviewCard(
              title: 'Controller to manage disabled state',
              maxWidth: null,
              code: _TSplitButtonDisabledSource.code,
              child: _TSplitButtonDisabled(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonBasic
// =============================================================================

@GenerateSource()
class _TSplitButtonBasic extends StatelessWidget {
  const _TSplitButtonBasic();

  @override
  Widget build(BuildContext context) {
    return TSplitButton(
      onPressed: () {},
      onPressedTrailing: () {},
      trailing: const Icon(Icons.keyboard_arrow_down),
      child: const Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonOutlined
// =============================================================================

@GenerateSource()
class _TSplitButtonOutlined extends StatelessWidget {
  const _TSplitButtonOutlined();

  @override
  Widget build(BuildContext context) {
    return TSplitButton.outlined(
      onPressed: () {},
      onPressedTrailing: () {},
      trailing: const Icon(Icons.keyboard_arrow_down),
      child: const Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonFilled
// =============================================================================

@GenerateSource()
class _TSplitButtonFilled extends StatelessWidget {
  const _TSplitButtonFilled();

  @override
  Widget build(BuildContext context) {
    return TSplitButton.filled(
      onPressed: () {},
      onPressedTrailing: () {},
      trailing: const Icon(Icons.keyboard_arrow_down),
      child: const Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonSoft
// =============================================================================

@GenerateSource()
class _TSplitButtonSoft extends StatelessWidget {
  const _TSplitButtonSoft();

  @override
  Widget build(BuildContext context) {
    return TSplitButton.soft(
      onPressed: () {},
      onPressedTrailing: () {},
      trailing: const Icon(Icons.keyboard_arrow_down),
      child: const Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonBasicSizes
// =============================================================================

@GenerateSource()
class _TSplitButtonBasicSizes extends StatelessWidget {
  const _TSplitButtonBasicSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TWidgetSize.values)
          TSplitButton(
            size: size,
            tooltip: '``$size``',
            onPressed: () {},
            onPressedTrailing: () {},
            trailing: const Icon(Icons.keyboard_arrow_down),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonOutlinedSizes
// =============================================================================

@GenerateSource()
class _TSplitButtonOutlinedSizes extends StatelessWidget {
  const _TSplitButtonOutlinedSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TWidgetSize.values)
          TSplitButton.outlined(
            size: size,
            tooltip: '``$size``',
            onPressed: () {},
            onPressedTrailing: () {},
            trailing: const Icon(Icons.keyboard_arrow_down),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonFilledSizes
// =============================================================================

@GenerateSource()
class _TSplitButtonFilledSizes extends StatelessWidget {
  const _TSplitButtonFilledSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TWidgetSize.values)
          TSplitButton.filled(
            size: size,
            tooltip: '``$size``',
            onPressed: () {},
            onPressedTrailing: () {},
            trailing: const Icon(Icons.keyboard_arrow_down),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonSoftSizes
// =============================================================================

@GenerateSource()
class _TSplitButtonSoftSizes extends StatelessWidget {
  const _TSplitButtonSoftSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TWidgetSize.values)
          TSplitButton.soft(
            size: size,
            tooltip: '``$size``',
            onPressed: () {},
            onPressedTrailing: () {},
            trailing: const Icon(Icons.keyboard_arrow_down),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonBasicColors
// =============================================================================

@GenerateSource()
class _TSplitButtonBasicColors extends StatelessWidget {
  const _TSplitButtonBasicColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TSplitButton(
            color: color,
            onPressed: () {},
            onPressedTrailing: () {},
            trailing: const Icon(Icons.keyboard_arrow_down),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonOutlinedColors
// =============================================================================

@GenerateSource()
class _TSplitButtonOutlinedColors extends StatelessWidget {
  const _TSplitButtonOutlinedColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TSplitButton.outlined(
            color: color,
            onPressed: () {},
            onPressedTrailing: () {},
            trailing: const Icon(Icons.keyboard_arrow_down),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonFilledColors
// =============================================================================

@GenerateSource()
class _TSplitButtonFilledColors extends StatelessWidget {
  const _TSplitButtonFilledColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TSplitButton.filled(
            color: color,
            onPressed: () {},
            onPressedTrailing: () {},
            trailing: const Icon(Icons.keyboard_arrow_down),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonSoftColors
// =============================================================================

@GenerateSource()
class _TSplitButtonSoftColors extends StatelessWidget {
  const _TSplitButtonSoftColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TSplitButton.soft(
            color: color,
            onPressed: () {},
            onPressedTrailing: () {},
            trailing: const Icon(Icons.keyboard_arrow_down),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonNoLeadingTrailing
// =============================================================================

@GenerateSource()
class _TSplitButtonNoLeadingTrailing extends StatelessWidget {
  const _TSplitButtonNoLeadingTrailing();

  @override
  Widget build(BuildContext context) {
    return TSplitButton.filled(
      child: const Text('Button'),
      onPressed: () {},
      onHover: (value) {},
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonLeadingTrailing
// =============================================================================

@GenerateSource()
class _TSplitButtonLeadingTrailing extends StatelessWidget {
  const _TSplitButtonLeadingTrailing();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TSplitButton.filled(
          onPressed: () {},
          onPressedLeading: () {},
          onHover: (value) {},
          onHoverLeading: (value) {},
          tooltip: 'Child Tooltip',
          tooltipLeading: 'Leading Tooltip',
          controller: TWidgetStatesController(),
          controllerLeading: TWidgetStatesController(),
          leading: const Icon(Icons.add),
          child: const Text('Button'),
        ),
        TSplitButton.filled(
          onPressed: () {},
          onPressedLeading: () {},
          onPressedTrailing: () {},
          onHover: (value) {},
          onHoverLeading: (value) {},
          onHoverTrailing: (value) {},
          tooltip: 'Child Tooltip',
          tooltipLeading: 'Leading Tooltip',
          tooltipTrailing: 'Trailing Tooltip',
          controller: TWidgetStatesController(),
          controllerLeading: TWidgetStatesController(),
          controllerTrailing: TWidgetStatesController(),
          leading: const Icon(Icons.add),
          trailing: const Icon(Icons.remove),
          child: const Text('Button'),
        ),
        TSplitButton.filled(
          onPressed: () {},
          onPressedTrailing: () {},
          onHover: (value) {},
          onHoverTrailing: (value) {},
          tooltip: 'Child Tooltip',
          tooltipTrailing: 'Trailing Tooltip',
          controller: TWidgetStatesController(),
          controllerTrailing: TWidgetStatesController(),
          trailing: const Icon(Icons.remove),
          child: const Text('Button'),
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonLoading
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSplitButtonLoading extends StatefulWidget {
  const _TSplitButtonLoading();

  @override
  State<_TSplitButtonLoading> createState() => _TSplitButtonLoadingState();
}

class _TSplitButtonLoadingState extends State<_TSplitButtonLoading> {
  final List<TWidgetStatesController> controllers = List.generate(
    TStyleVariant.values.length,
    (_) => TWidgetStatesController(),
  );

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> onPressed() async {
    for (final controller in controllers) {
      controller.loading = true;
    }
    await Future.delayed(const Duration(seconds: 1), () {
      for (final controller in controllers) {
        controller.loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final variant in TStyleVariant.values)
          TSplitButton.raw(
            tooltip: '``$variant``',
            variant: variant,
            controllerTrailing: controllers[variant.index],
            onPressedTrailing: onPressed,
            trailing: const Icon(Icons.download),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonDisabled
// =============================================================================

@GenerateSource()
class _TSplitButtonDisabled extends StatelessWidget {
  const _TSplitButtonDisabled();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final variant in TStyleVariant.values)
          TSplitButton.raw(
            variant: variant,
            controller: TWidgetStatesController(disabled: true),
            controllerTrailing: TWidgetStatesController(disabled: true),
            trailing: const Icon(Icons.download),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSplitButtonLoadingCustom
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TSplitButtonLoadingCustom extends StatefulWidget {
  const _TSplitButtonLoadingCustom();

  @override
  State<_TSplitButtonLoadingCustom> createState() =>
      _TSplitButtonLoadingCustomState();
}

class _TSplitButtonLoadingCustomState
    extends State<_TSplitButtonLoadingCustom> {
  final List<TWidgetStatesController> controllers = List.generate(
    TStyleVariant.values.length,
    (_) => TWidgetStatesController(),
  );

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> onPressed() async {
    for (final controller in controllers) {
      controller.loading = true;
    }
    await Future.delayed(const Duration(seconds: 1), () {
      for (final controller in controllers) {
        controller.loading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final variant in TStyleVariant.values)
          TSplitButton.raw(
            tooltip: '``$variant``',
            variant: variant,
            controllerTrailing: controllers[variant.index],
            onPressedTrailing: onPressed,
            trailing: const Icon(Icons.download),
            loadingTrailing: const Icon(Icons.hourglass_bottom),
            child: const Text('Button'),
          ),
      ],
    );
  }
}
