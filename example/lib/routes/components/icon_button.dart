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
      description: 'A highly customizable icon button widget.',
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
              title: 'Controller to manage disabled state',
              code: _TIconButtonDisabledSource.code,
              child: _TIconButtonDisabled(),
            ),
            AppPreviewCard(
              title: 'Custom loading widget',
              code: _TIconButtonLoadingCustomSource.code,
              child: _TIconButtonLoadingCustom(),
            ),
          ],
        ),
        AppSection(
          title: 'Custom icon button theming',
          children: const [
            AppPreviewCard(
              title: 'Static theme (``TButtonTheme``)',
              description:
                  'All theming is powered by the Flutter `WidgetStateProperty` interface. If the you have no need dynamic theming, you can simply pass your styles to the  `TButtonTheme.all()` factory constructor which calls `WidgetStateProperty.all()` under the hood for all stateful properties.',
              code: _TIconButtonCustomThemeSource.code,
              child: _TIconButtonCustomTheme(),
            ),
            AppPreviewCard(
              title: 'Stateful theme (``TButtonTheme``)',
              description:
                  'For full theme control, you can use the `WidgetStateProperty.resolveWith()` method to dynamically change the button theme based on the current `WidgetState`.',
              code: _TIconButtonStatefulThemeSource.code,
              child: _TIconButtonStatefulTheme(),
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
    return TIconButton(
      onPressed: () {},
      icon: const Icon(Icons.add),
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
    return TIconButton.outlined(
      onPressed: () {},
      icon: const Icon(Icons.add),
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
    return TIconButton.filled(
      onPressed: () {},
      icon: const Icon(Icons.add),
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
    return TIconButton.soft(
      onPressed: () {},
      icon: const Icon(Icons.add),
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
        for (final size in TButtonSize.values)
          TIconButton(
            size: size,
            tooltip: '``$size``',
            onPressed: () {},
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
        for (final size in TButtonSize.values)
          TIconButton.outlined(
            size: size,
            tooltip: '``$size``',
            onPressed: () {},
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
        for (final size in TButtonSize.values)
          TIconButton.filled(
            size: size,
            tooltip: '``$size``',
            onPressed: () {},
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
        for (final size in TButtonSize.values)
          TIconButton.soft(
            size: size,
            tooltip: '``$size``',
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
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
            tooltip: '``$variant``',
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
// CLASS: _TIconButtonDisabled
// =============================================================================

@GenerateSource()
class _TIconButtonDisabled extends StatelessWidget {
  const _TIconButtonDisabled();

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
            controller: TWidgetController(disabled: true),
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

// =============================================================================
// CLASS: _TIconButtonCustomTheme
// =============================================================================

@GenerateSource()
class _TIconButtonCustomTheme extends StatelessWidget {
  const _TIconButtonCustomTheme();

  @override
  Widget build(BuildContext context) {
    return TIconButton.filled(
      theme: TButtonTheme.all(
        border: Border.all(color: TColors.slate),
        backgroundColor: Colors.black,
        elevation: TShadow.shadow,
        padding: TOffset.a6,
        borderRadius: TBorderRadius.rounded_none,
        textStyle: const TextStyle(color: Colors.white).medium,
      ),
      onPressed: () {},
      icon: const Icon(Icons.add),
    );
  }
}

// =============================================================================
// CLASS: _TIconButtonStatefulTheme
// =============================================================================

@GenerateSource()
class _TIconButtonStatefulTheme extends StatelessWidget {
  const _TIconButtonStatefulTheme();

  @override
  Widget build(BuildContext context) {
    return TIconButton.filled(
      theme: TButtonTheme(
        animationDuration: const Duration(milliseconds: 250),
        border: WidgetStateProperty.resolveWith((states) {
          if (states.hovered) {
            return Border.all(color: TColors.sky, width: 1.5);
          }
          return Border.all(color: TColors.slate);
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.hovered) {
            return TColors.slate.shade800;
          }
          return Colors.black;
        }),
        elevation: WidgetStateProperty.resolveWith((states) {
          if (states.hovered) {
            return TShadow.shadow_md;
          }
          return TShadow.shadow;
        }),
        padding: const WidgetStatePropertyAll(TOffset.a6),
        borderRadius: WidgetStateProperty.resolveWith((states) {
          if (states.hovered) {
            return TBorderRadius.rounded_full;
          }
          return TBorderRadius.rounded_none;
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          final style = const TextStyle(color: Colors.white).medium;
          if (states.hovered) {
            return style.semibold;
          }
          return style.medium;
        }),
      ),
      onPressed: () {},
      icon: const Icon(Icons.add),
    );
  }
}
