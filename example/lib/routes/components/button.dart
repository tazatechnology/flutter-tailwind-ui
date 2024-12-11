part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTButton
// =============================================================================

class ComponentRouteTButton extends StatelessWidget {
  const ComponentRouteTButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'Tbutton',
      description: 'A highly customizable button widget.',
      children: [
        AppPreviewCard(
          title: 'Basic button',
          code: _TButtonBasicSource.code,
          child: _TButtonBasic(),
        ),
        AppPreviewCard(
          title: 'Outlined button',
          code: _TButtonOutlinedSource.code,
          child: _TButtonOutlined(),
        ),
        AppPreviewCard(
          title: 'Filled button',
          code: _TButtonFilledSource.code,
          child: _TButtonFilled(),
        ),
        AppPreviewCard(
          title: 'Link button',
          code: _TButtonLinkSource.code,
          child: _TButtonLink(),
        ),
        AppPreviewCard(
          title: 'Basic button (sizes)',
          code: _TButtonBasicSizesSource.code,
          child: _TButtonBasicSizes(),
        ),
        AppPreviewCard(
          title: 'Outlined button (sizes)',
          code: _TButtonOutlinedSizesSource.code,
          child: _TButtonOutlinedSizes(),
        ),
        AppPreviewCard(
          title: 'Filled button (sizes)',
          code: _TButtonFilledSizesSource.code,
          child: _TButtonFilledSizes(),
        ),
        AppPreviewCard(
          title: 'Link button (sizes)',
          code: _TButtonLinkSizesSource.code,
          child: _TButtonLinkSizes(),
        ),
        AppPreviewCard(
          title: 'Outlined button (colors)',
          code: _TButtonOutlinedColorsSource.code,
          child: _TButtonOutlinedColors(),
        ),
        AppPreviewCard(
          title: 'Filled button (colors)',
          code: _TButtonFilledColorsSource.code,
          child: _TButtonFilledColors(),
        ),
        AppPreviewCard(
          title: 'Link button (colors)',
          code: _TButtonLinkColorsSource.code,
          child: _TButtonLinkColors(),
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
    return TButton(
      child: const Text('Button'),
      onPressed: () {},
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
    return TButton.link(
      child: const Text('Button'),
      onPressed: () {},
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
    return TButton.filled(
      child: const Text('Button'),
      onPressed: () {},
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
    return TButton.outlined(
      child: const Text('Button'),
      onPressed: () {},
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
      spacing: TSpace.v32,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        for (final size in TButtonSize.values)
          TButton(
            size: size,
            tooltip: '``$size``',
            child: const Text('Button'),
            onPressed: () {},
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
      spacing: TSpace.v32,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        for (final size in TButtonSize.values)
          TButton.link(
            size: size,
            tooltip: '``$size``',
            child: const Text('Button'),
            onPressed: () {},
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
      spacing: TSpace.v32,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        for (final size in TButtonSize.values)
          TButton.filled(
            size: size,
            tooltip: '``$size``',
            child: const Text('Button'),
            onPressed: () {},
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
      spacing: TSpace.v32,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        for (final size in TButtonSize.values)
          TButton.outlined(
            size: size,
            tooltip: '``$size``',
            child: const Text('Button'),
            onPressed: () {},
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
      spacing: TSpace.v16,
      runSpacing: TSpace.v8,
      children: [
        for (final color in [
          Colors.black,
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
            onPressed: () {},
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
      spacing: TSpace.v16,
      runSpacing: TSpace.v8,
      children: [
        for (final color in [
          Colors.black,
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
            onPressed: () {},
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
      spacing: TSpace.v16,
      runSpacing: TSpace.v8,
      children: [
        for (final color in [
          Colors.black,
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
            onPressed: () {},
          ),
      ],
    );
  }
}
