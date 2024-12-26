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
          TColors.yellow,
          TColors.green,
          TColors.blue,
          TColors.violet,
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
          TColors.yellow,
          TColors.green,
          TColors.blue,
          TColors.violet,
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
          TColors.yellow,
          TColors.green,
          TColors.blue,
          TColors.violet,
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
          TColors.yellow,
          TColors.green,
          TColors.blue,
          TColors.violet,
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
          TColors.yellow,
          TColors.green,
          TColors.blue,
          TColors.violet,
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
    return const Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TButton(
          color: TColors.indigo,
          leading: Icon(Icons.arrow_back),
          child: Text('Button'),
        ),
        TButton.outlined(
          color: TColors.indigo,
          leading: Icon(Icons.arrow_back),
          child: Text('Button'),
        ),
        TButton.filled(
          color: TColors.indigo,
          leading: Icon(Icons.arrow_back),
          child: Text('Button'),
        ),
        TButton.soft(
          color: TColors.indigo,
          leading: Icon(Icons.arrow_back),
          child: Text('Button'),
        ),
        TButton.link(
          color: TColors.indigo,
          leading: Icon(Icons.arrow_back),
          child: Text('Button'),
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
    return const Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TButton(
          color: TColors.indigo,
          trailing: Icon(Icons.arrow_forward),
          child: Text('Button'),
        ),
        TButton.outlined(
          color: TColors.indigo,
          trailing: Icon(Icons.arrow_forward),
          child: Text('Button'),
        ),
        TButton.filled(
          color: TColors.indigo,
          trailing: Icon(Icons.arrow_forward),
          child: Text('Button'),
        ),
        TButton.soft(
          color: TColors.indigo,
          trailing: Icon(Icons.arrow_forward),
          child: Text('Button'),
        ),
        TButton.link(
          color: TColors.indigo,
          trailing: Icon(Icons.arrow_forward),
          child: Text('Button'),
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
