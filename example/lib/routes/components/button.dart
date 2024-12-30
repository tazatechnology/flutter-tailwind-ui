part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTButton
// =============================================================================

class ComponentRouteTButton extends StatelessWidget {
  const ComponentRouteTButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TButton',
      description: 'A highly customizable button widget.',
      children: [
        AppSection(
          title: 'Button Types',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TButtonBasicSource.code,
              child: _TButtonBasic(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              code: _TButtonOutlinedSource.code,
              child: _TButtonOutlined(),
            ),
            AppPreviewCard(
              title: 'Filled',
              code: _TButtonFilledSource.code,
              child: _TButtonFilled(),
            ),
            AppPreviewCard(
              title: 'Soft',
              code: _TButtonSoftSource.code,
              child: _TButtonSoft(),
            ),
            AppPreviewCard(
              title: 'Link',
              code: _TButtonLinkSource.code,
              child: _TButtonLink(),
            ),
          ],
        ),
        AppSection(
          title: 'Button Sizes',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TButtonBasicSizesSource.code,
              child: _TButtonBasicSizes(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              code: _TButtonOutlinedSizesSource.code,
              child: _TButtonOutlinedSizes(),
            ),
            AppPreviewCard(
              title: 'Filled',
              code: _TButtonFilledSizesSource.code,
              child: _TButtonFilledSizes(),
            ),
            AppPreviewCard(
              title: 'Soft',
              code: _TButtonSoftSizesSource.code,
              child: _TButtonSoftSizes(),
            ),
            AppPreviewCard(
              title: 'Link',
              code: _TButtonLinkSizesSource.code,
              child: _TButtonLinkSizes(),
            ),
          ],
        ),
        AppSection(
          title: 'Button Colors',
          children: const [
            AppPreviewCard(
              title: 'Basic',
              code: _TButtonBasicColorsSource.code,
              child: _TButtonBasicColors(),
            ),
            AppPreviewCard(
              title: 'Outlined',
              code: _TButtonOutlinedColorsSource.code,
              child: _TButtonOutlinedColors(),
            ),
            AppPreviewCard(
              title: 'Filled',
              code: _TButtonFilledColorsSource.code,
              child: _TButtonFilledColors(),
            ),
            AppPreviewCard(
              title: 'Soft',
              code: _TButtonSoftColorsSource.code,
              child: _TButtonSoftColors(),
            ),
            AppPreviewCard(
              title: 'Link',
              code: _TButtonLinkColorsSource.code,
              child: _TButtonLinkColors(),
            ),
          ],
        ),
        AppSection(
          title: 'Button with leading',
          children: const [
            AppPreviewCard(
              title: 'Custom leading widget',
              description:
                  'Note that icon is automatically styled to match the dynamic button theme.',
              code: _TButtonLeadingSource.code,
              child: _TButtonLeading(),
            ),
          ],
        ),
        AppSection(
          title: 'Button with trailing',
          children: const [
            AppPreviewCard(
              title: 'Custom trailing widget',
              description:
                  'Note that icon is automatically styled to match the dynamic button theme.',
              code: _TButtonTrailingSource.code,
              child: _TButtonTrailing(),
            ),
          ],
        ),
        AppSection(
          title: 'Button with callbacks',
          children: const [
            AppPreviewCard(
              title: 'Custom gesture callbacks',
              description:
                  '`TButton` supports `onPressed` and `onHover` callbacks.',
              code: _TButtonCallbackSource.code,
              child: _TButtonCallback(),
            ),
          ],
        ),
        AppSection(
          title: 'Button with controller',
          children: const [
            AppPreviewCard(
              title: 'Controller to manage loading state',
              code: _TButtonLoadingSource.code,
              child: _TButtonLoading(),
            ),
            AppPreviewCard(
              title: 'Controller to manage disabled state',
              code: _TButtonDisabledSource.code,
              child: _TButtonDisabled(),
            ),
            AppPreviewCard(
              title: 'Custom loading widget',
              code: _TButtonLoadingCustomSource.code,
              child: _TButtonLoadingCustom(),
            ),
          ],
        ),
        AppSection(
          title: 'Custom button theming',
          children: const [
            AppPreviewCard(
              title: 'Static theme (``TButtonTheme``)',
              description:
                  'All theming is powered by the Flutter `WidgetStateProperty` interface. If the you have no need dynamic theming, you can simply pass your styles to the  `TButtonTheme.all()` factory constructor which calls `WidgetStateProperty.all()` under the hood for all stateful properties.',
              code: _TButtonCustomThemeSource.code,
              child: _TButtonCustomTheme(),
            ),
            AppPreviewCard(
              title: 'Stateful theme (``TButtonTheme``)',
              description:
                  'For full theme control, you can use the `WidgetStateProperty.resolveWith()` method to dynamically change the button theme based on the current `WidgetState`.',
              code: _TButtonStatefulThemeSource.code,
              child: _TButtonStatefulTheme(),
            ),
          ],
        ),
        AppSection(
          title: 'Icon only button',
          children: const [
            AppPreviewCard(
              title: 'Use `TIconButton` for icon only buttons',
              description:
                  '`TButton` has a complimentary `TIconButton` widget for icon only buttons. This widget has the analogous sizing, styling, and theming capabilities as `TButton` to ensure UI consistency out of the box.',
              code: _TButtonIconCompareSource.code,
              child: _TButtonIconCompare(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonBasic
// =============================================================================

@GenerateSource()
class _TButtonBasic extends StatelessWidget {
  const _TButtonBasic();

  @override
  Widget build(BuildContext context) {
    return const TButton(
      child: Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TButtonOutlined
// =============================================================================

@GenerateSource()
class _TButtonOutlined extends StatelessWidget {
  const _TButtonOutlined();

  @override
  Widget build(BuildContext context) {
    return const TButton.outlined(
      child: Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TButtonFilled
// =============================================================================

@GenerateSource()
class _TButtonFilled extends StatelessWidget {
  const _TButtonFilled();

  @override
  Widget build(BuildContext context) {
    return const TButton.filled(
      child: Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TButtonSoft
// =============================================================================

@GenerateSource()
class _TButtonSoft extends StatelessWidget {
  const _TButtonSoft();

  @override
  Widget build(BuildContext context) {
    return const TButton.soft(
      child: Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TButtonLink
// =============================================================================

@GenerateSource()
class _TButtonLink extends StatelessWidget {
  const _TButtonLink();

  @override
  Widget build(BuildContext context) {
    return const TButton.link(
      child: Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TButtonBasicSizes
// =============================================================================

@GenerateSource()
class _TButtonBasicSizes extends StatelessWidget {
  const _TButtonBasicSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TButtonSize.values)
          TButton(
            size: size,
            tooltip: '``$size``',
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonOutlinedSizes
// =============================================================================

@GenerateSource()
class _TButtonOutlinedSizes extends StatelessWidget {
  const _TButtonOutlinedSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TButtonSize.values)
          TButton.outlined(
            size: size,
            tooltip: '``$size``',
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonFilledSizes
// =============================================================================

@GenerateSource()
class _TButtonFilledSizes extends StatelessWidget {
  const _TButtonFilledSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TButtonSize.values)
          TButton.filled(
            size: size,
            tooltip: '``$size``',
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonSoftSizes
// =============================================================================

@GenerateSource()
class _TButtonSoftSizes extends StatelessWidget {
  const _TButtonSoftSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TButtonSize.values)
          TButton.soft(
            size: size,
            tooltip: '``$size``',
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonLinkSizes
// =============================================================================

@GenerateSource()
class _TButtonLinkSizes extends StatelessWidget {
  const _TButtonLinkSizes();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final size in TButtonSize.values)
          TButton.link(
            size: size,
            tooltip: '``$size``',
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonBasicColors
// =============================================================================

@GenerateSource()
class _TButtonBasicColors extends StatelessWidget {
  const _TButtonBasicColors();

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
          TButton(
            color: color,
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonOutlinedColors
// =============================================================================

@GenerateSource()
class _TButtonOutlinedColors extends StatelessWidget {
  const _TButtonOutlinedColors();

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
          TButton.outlined(
            color: color,
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonFilledColors
// =============================================================================

@GenerateSource()
class _TButtonFilledColors extends StatelessWidget {
  const _TButtonFilledColors();

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
          TButton.filled(
            color: color,
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonSoftColors
// =============================================================================

@GenerateSource()
class _TButtonSoftColors extends StatelessWidget {
  const _TButtonSoftColors();

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
          TButton.soft(
            color: color,
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonLinkColors
// =============================================================================

@GenerateSource()
class _TButtonLinkColors extends StatelessWidget {
  const _TButtonLinkColors();

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
          TButton.link(
            color: color,
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonLeading
// =============================================================================

@GenerateSource()
class _TButtonLeading extends StatelessWidget {
  const _TButtonLeading();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final variant in TButtonVariant.values)
          TButton.raw(
            variant: variant,
            color: TColors.indigo,
            leading: const Icon(Icons.arrow_back),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonTrailing
// =============================================================================

@GenerateSource()
class _TButtonTrailing extends StatelessWidget {
  const _TButtonTrailing();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final variant in TButtonVariant.values)
          TButton.raw(
            variant: variant,
            color: TColors.indigo,
            trailing: const Icon(Icons.arrow_forward),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonCallback
// =============================================================================

@GenerateSource()
class _TButtonCallback extends StatelessWidget {
  const _TButtonCallback();

  @override
  Widget build(BuildContext context) {
    return TButton.filled(
      child: const Text('Button'),
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
// CLASS: _TButtonLoading
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TButtonLoading extends StatefulWidget {
  const _TButtonLoading();

  @override
  State<_TButtonLoading> createState() => _TButtonLoadingState();
}

class _TButtonLoadingState extends State<_TButtonLoading> {
  late final controllers = List.generate(
    TButtonVariant.values.length,
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
        for (final variant in TButtonVariant.values)
          TButton.raw(
            tooltip: '``$variant``',
            variant: variant,
            controller: controllers[variant.index],
            onPressed: onPressed,
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonDisabled
// =============================================================================

@GenerateSource()
class _TButtonDisabled extends StatelessWidget {
  const _TButtonDisabled();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final variant in TButtonVariant.values)
          TButton.raw(
            variant: variant,
            controller: TWidgetController(disabled: true),
            child: const Text('Button'),
            onPressed: () {},
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonLoadingCustom
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TButtonLoadingCustom extends StatefulWidget {
  const _TButtonLoadingCustom();

  @override
  State<_TButtonLoadingCustom> createState() => _TButtonLoadingCustomState();
}

class _TButtonLoadingCustomState extends State<_TButtonLoadingCustom> {
  late final controllers = List.generate(
    TButtonVariant.values.length,
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
        for (final variant in TButtonVariant.values)
          TButton.raw(
            variant: variant,
            controller: controllers[variant.index],
            onPressed: onPressed,
            loading: const Icon(Icons.hourglass_bottom_rounded),
            child: const Text('Button'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TButtonCustomTheme
// =============================================================================

@GenerateSource()
class _TButtonCustomTheme extends StatelessWidget {
  const _TButtonCustomTheme();

  @override
  Widget build(BuildContext context) {
    return TButton.filled(
      theme: TButtonTheme.all(
        border: Border.all(color: TColors.sky.shade100),
        backgroundColor: TColors.sky.shade50,
        padding: TOffset.x10 + TOffset.y4,
        borderRadius: TBorderRadius.rounded_none,
        textStyle: TextStyle(color: TColors.sky.shade800).medium,
      ),
      onPressed: () {},
      child: const Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TButtonStatefulTheme
// =============================================================================

@GenerateSource()
class _TButtonStatefulTheme extends StatelessWidget {
  const _TButtonStatefulTheme();

  @override
  Widget build(BuildContext context) {
    return TButton.filled(
      theme: TButtonTheme(
        animationDuration: const Duration(milliseconds: 250),
        border: WidgetStateProperty.resolveWith((states) {
          if (states.hovered) {
            return Border.all(color: TColors.sky);
          }
          return Border.all(color: TColors.sky.shade100);
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.hovered) {
            return TColors.sky.shade100;
          }
          return TColors.sky.shade50;
        }),
        padding: WidgetStateProperty.resolveWith((states) {
          if (states.hovered) {
            return TOffset.x16 + TOffset.y4;
          }
          return TOffset.x10 + TOffset.y4;
        }),
        borderRadius: WidgetStateProperty.resolveWith((states) {
          if (states.hovered) {
            return TBorderRadius.rounded_full;
          }
          return TBorderRadius.rounded_none;
        }),
        textStyle: WidgetStateProperty.resolveWith((states) {
          final style = TextStyle(color: TColors.sky.shade800).medium;
          if (states.hovered) {
            return style.semibold;
          }
          return style.medium;
        }),
      ),
      onPressed: () {},
      child: const Text('Button'),
    );
  }
}

// =============================================================================
// CLASS: _TButtonIconCompare
// =============================================================================

@GenerateSource()
class _TButtonIconCompare extends StatelessWidget {
  const _TButtonIconCompare();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSpace.v6,
      children: [
        for (final size in TButtonSize.values)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: TSpace.v6,
            children: [
              TIconButton.filled(
                size: size,
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              TButton.filled(
                size: size,
                onPressed: () {},
                child: const Text('Button'),
              ),
            ],
          ),
      ],
    );
  }
}
