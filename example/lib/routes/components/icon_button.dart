part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTIconButton
// =============================================================================

class ComponentRouteTIconButton extends StatelessWidget {
  const ComponentRouteTIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TIconButton',
      description: 'A widget',
      children: [
        AppSection(
          title: 'Icon Button Types',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TIconButtonBasicSource.code,
              child: _TIconButtonBasic(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              code: _TIconButtonOutlinedSource.code,
              child: _TIconButtonOutlined(),
            ),
            AppPreviewCard(
              title: 'Filled',
              code: _TIconButtonFilledSource.code,
              child: _TIconButtonFilled(),
            ),
            AppPreviewCard(
              title: 'Soft',
              code: _TIconButtonSoftSource.code,
              child: _TIconButtonSoft(),
            ),
          ],
        ),
        AppSection(
          title: 'Icon Button Sizes',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TIconButtonBasicSizesSource.code,
              child: _TIconButtonBasicSizes(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              code: _TIconButtonOutlinedSizesSource.code,
              child: _TIconButtonOutlinedSizes(),
            ),
            AppPreviewCard(
              title: 'Filled',
              code: _TIconButtonFilledSizesSource.code,
              child: _TIconButtonFilledSizes(),
            ),
            AppPreviewCard(
              title: 'Soft',
              code: _TIconButtonSoftSizesSource.code,
              child: _TIconButtonSoftSizes(),
            ),
          ],
        ),
        AppSection(
          title: 'Icon Button Colors',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TIconButtonBasicColorsSource.code,
              child: _TIconButtonBasicColors(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              code: _TIconButtonOutlinedColorsSource.code,
              child: _TIconButtonOutlinedColors(),
            ),
            AppPreviewCard(
              title: 'Filled',
              code: _TIconButtonFilledColorsSource.code,
              child: _TIconButtonFilledColors(),
            ),
            AppPreviewCard(
              title: 'Soft',
              code: _TIconButtonSoftColorsSource.code,
              child: _TIconButtonSoftColors(),
            ),
          ],
        ),
        AppSection(
          title: 'Icon Button with callbacks',
          children: const [
            AppPreviewCard(
              title: 'Custom gesture callbacks',
              description:
                  '`TIconButton` supports `onPressed` and `onHover` callbacks.',
              code: _TIconButtonCallbackSource.code,
              child: _TIconButtonCallback(),
            ),
          ],
        ),
        AppSection(
          title: 'Icon Button with controller',
          children: const [
            AppPreviewCard(
              title: 'Controller to manage loading state',
              code: _TIconButtonLoadingSource.code,
              child: _TIconButtonLoading(),
            ),
            AppPreviewCard(
              title: 'Custom loading widget',
              code: _TIconButtonLoadingCustomSource.code,
              child: _TIconButtonLoadingCustom(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonBasic
// =============================================================================

@GenerateSource()
class _TIconButtonBasic extends StatelessWidget {
  const _TIconButtonBasic();

  @override
  Widget build(BuildContext context) {
    return const TIconButton(
      icon: Icon(Icons.add),
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonOutlined
// =============================================================================

@GenerateSource()
class _TIconButtonOutlined extends StatelessWidget {
  const _TIconButtonOutlined();

  @override
  Widget build(BuildContext context) {
    return const TIconButton.outlined(
      icon: Icon(Icons.add),
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonFilled
// =============================================================================

@GenerateSource()
class _TIconButtonFilled extends StatelessWidget {
  const _TIconButtonFilled();

  @override
  Widget build(BuildContext context) {
    return const TIconButton.filled(
      icon: Icon(Icons.add),
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonSoft
// =============================================================================

@GenerateSource()
class _TIconButtonSoft extends StatelessWidget {
  const _TIconButtonSoft();

  @override
  Widget build(BuildContext context) {
    return const TIconButton.soft(
      icon: Icon(Icons.add),
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonBasicSizes
// =============================================================================

@GenerateSource()
class _TIconButtonBasicSizes extends StatelessWidget {
  const _TIconButtonBasicSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TIconButtonSize.values)
          TIconButton(
            size: size,
            tooltip: '``$size``',
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonOutlinedSizes
// =============================================================================

@GenerateSource()
class _TIconButtonOutlinedSizes extends StatelessWidget {
  const _TIconButtonOutlinedSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TIconButtonSize.values)
          TIconButton.outlined(
            size: size,
            tooltip: '``$size``',
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonFilledSizes
// =============================================================================

@GenerateSource()
class _TIconButtonFilledSizes extends StatelessWidget {
  const _TIconButtonFilledSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TIconButtonSize.values)
          TIconButton.filled(
            size: size,
            tooltip: '``$size``',
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonSoftSizes
// =============================================================================

@GenerateSource()
class _TIconButtonSoftSizes extends StatelessWidget {
  const _TIconButtonSoftSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TIconButtonSize.values)
          TIconButton.soft(
            size: size,
            tooltip: '``$size``',
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonBasicColors
// =============================================================================

@GenerateSource()
class _TIconButtonBasicColors extends StatelessWidget {
  const _TIconButtonBasicColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in [
          TColors.slate,
          TColors.red,
          TColors.green,
          TColors.blue,
          TColors.yellow,
          TColors.purple,
        ])
          TIconButton(
            color: color,
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonOutlinedColors
// =============================================================================

@GenerateSource()
class _TIconButtonOutlinedColors extends StatelessWidget {
  const _TIconButtonOutlinedColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in [
          TColors.slate,
          TColors.red,
          TColors.green,
          TColors.blue,
          TColors.yellow,
          TColors.purple,
        ])
          TIconButton.outlined(
            color: color,
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonFilledColors
// =============================================================================

@GenerateSource()
class _TIconButtonFilledColors extends StatelessWidget {
  const _TIconButtonFilledColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in [
          TColors.slate,
          TColors.red,
          TColors.green,
          TColors.blue,
          TColors.yellow,
          TColors.purple,
        ])
          TIconButton.filled(
            color: color,
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonSoftColors
// =============================================================================

@GenerateSource()
class _TIconButtonSoftColors extends StatelessWidget {
  const _TIconButtonSoftColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in [
          TColors.slate,
          TColors.red,
          TColors.green,
          TColors.blue,
          TColors.yellow,
          TColors.purple,
        ])
          TIconButton.soft(
            color: color,
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonCallback
// =============================================================================

@GenerateSource()
class _TIconButtonCallback extends StatelessWidget {
  const _TIconButtonCallback();

  @override
  Widget build(BuildContext context) {
    return TIconButton.filled(
      icon: const Icon(Icons.add),
      onPressed: () {
        // Handle button press
      },
      onHover: (isHovered) {
        // Handle button hover
      },
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonLoading
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TIconButtonLoading extends StatefulWidget {
  const _TIconButtonLoading();

  @override
  State<_TIconButtonLoading> createState() => _TIconButtonLoadingState();
}

class _TIconButtonLoadingState extends State<_TIconButtonLoading> {
  late final controllers = List.generate(
    TIconButtonVariant.values.length,
    (_) => TWidgetController(),
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
        for (final variant in TIconButtonVariant.values)
          TIconButton.raw(
            variant: variant,
            controller: controllers[variant.index],
            onPressed: onPressed,
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonLoadingCustom
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TIconButtonLoadingCustom extends StatefulWidget {
  const _TIconButtonLoadingCustom();

  @override
  State<_TIconButtonLoadingCustom> createState() =>
      _TIconButtonLoadingCustomState();
}

class _TIconButtonLoadingCustomState extends State<_TIconButtonLoadingCustom> {
  late final controllers = List.generate(
    TIconButtonVariant.values.length,
    (_) => TWidgetController(),
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
        for (final variant in TIconButtonVariant.values)
          TIconButton.raw(
            variant: variant,
            controller: controllers[variant.index],
            onPressed: onPressed,
            loading: const Icon(Icons.hourglass_bottom_rounded),
            icon: const Icon(Icons.add),
          ),
      ],
    );
  }
}
