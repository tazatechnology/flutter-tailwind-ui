part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTBackdropFilter
// =============================================================================

class ComponentRouteTBackdropFilter extends StatelessWidget {
  const ComponentRouteTBackdropFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TBackdropFilter',
      description: 'Built-in backdrop filter effects',
      children: [
        AppSection(
          title: 'Blur Filter',
          children: const [
            AppPreviewCard(
              description:
                  'Utilities for applying backdrop blur filters to an element.',
              reference: 'https://tailwindcss.com/docs/backdrop-filter-blur',
              code: _TBackdropFilterBlurSource.code,
              child: _TBackdropFilterBlur(),
            ),
          ],
        ),
        AppSection(
          title: 'Brightness Filter',
          children: const [
            AppPreviewCard(
              description:
                  'Utilities for applying backdrop brightness filters to an element.',
              reference:
                  'https://tailwindcss.com/docs/backdrop-filter-brightness',
              code: _TBackdropFilterBrightnessSource.code,
              child: _TBackdropFilterBrightness(),
            ),
          ],
        ),
        AppSection(
          title: 'Contrast Filter',
          children: const [
            AppPreviewCard(
              description:
                  'Utilities for applying backdrop contrast filters to an element.',
              reference:
                  'https://tailwindcss.com/docs/backdrop-filter-contrast',
              code: _TBackdropFilterContrastSource.code,
              child: _TBackdropFilterContrast(),
            ),
          ],
        ),
        AppSection(
          title: 'Grayscale Filter',
          children: const [
            AppPreviewCard(
              description:
                  'Utilities for applying backdrop grayscale filters to an element.',
              reference:
                  'https://tailwindcss.com/docs/backdrop-filter-grayscale',
              code: _TBackdropFilterGrayscaleSource.code,
              child: _TBackdropFilterGrayscale(),
            ),
          ],
        ),
        AppSection(
          title: 'Hue Rotation Filter',
          children: const [
            AppPreviewCard(
              description:
                  'Utilities for applying backdrop hue-rotate filters to an element.',
              reference:
                  'https://tailwindcss.com/docs/backdrop-filter-hue-rotate',
              code: _TBackdropFilterHueRotateSource.code,
              child: _TBackdropFilterHueRotate(),
            ),
          ],
        ),
        AppSection(
          title: 'Color Inversion Filter',
          children: const [
            AppPreviewCard(
              description:
                  'Utilities for applying backdrop invert filters to an element.',
              reference: 'https://tailwindcss.com/docs/backdrop-filter-invert',
              code: _TBackdropFilterInvertSource.code,
              child: _TBackdropFilterInvert(),
            ),
          ],
        ),
        AppSection(
          title: 'Saturation Filter',
          children: const [
            AppPreviewCard(
              description:
                  'Utilities for applying backdrop saturation filters to an element.',
              reference:
                  'https://tailwindcss.com/docs/backdrop-filter-saturate',
              code: _TBackdropFilterSaturateSource.code,
              child: _TBackdropFilterSaturate(),
            ),
          ],
        ),
        AppSection(
          title: 'Sepia Filter',
          children: const [
            AppPreviewCard(
              description:
                  'Utilities for backdrop applying sepia filters to an element.',
              reference: 'https://tailwindcss.com/docs/backdrop-filter-sepia',
              code: _TBackdropFilterSepiaSource.code,
              child: _TBackdropFilterSepia(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TBackdropFilterBlur
// =============================================================================

@GenerateSource()
class _TBackdropFilterBlur extends StatelessWidget {
  const _TBackdropFilterBlur();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.0, 2.0, 4.0, 8.0])
          TBackdropFilter.blur(
            value: value,
            background: Image.asset('assets/img/reference.jpeg', height: 100),
            child: Container(width: 60, height: 60, color: Colors.white30),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TBackdropFilterBlur
// =============================================================================

@GenerateSource()
class _TBackdropFilterBrightness extends StatelessWidget {
  const _TBackdropFilterBrightness();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.5, 1.0, 1.25, 1.5])
          TBackdropFilter.brightness(
            value: value,
            background: Image.asset('assets/img/reference.jpeg', height: 100),
            child: Container(width: 60, height: 60, color: Colors.white30),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TBackdropFilterContrast
// =============================================================================

@GenerateSource()
class _TBackdropFilterContrast extends StatelessWidget {
  const _TBackdropFilterContrast();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.5, 1.0, 1.25, 2.0])
          TBackdropFilter.contrast(
            value: value,
            background: Image.asset('assets/img/reference.jpeg', height: 100),
            child: Container(width: 60, height: 60, color: Colors.white30),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TBackdropFilterGrayscale
// =============================================================================

@GenerateSource()
class _TBackdropFilterGrayscale extends StatelessWidget {
  const _TBackdropFilterGrayscale();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.0, 0.5, 0.75, 1.0])
          TBackdropFilter.grayscale(
            value: value,
            background: Image.asset('assets/img/reference.jpeg', height: 100),
            child: Container(width: 60, height: 60, color: Colors.white30),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TBackdropFilterHueRotate
// =============================================================================

@GenerateSource()
class _TBackdropFilterHueRotate extends StatelessWidget {
  const _TBackdropFilterHueRotate();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.0, 90.0, 180.0, 270.0])
          TBackdropFilter.hueRotate(
            value: value,
            background: Image.asset('assets/img/reference.jpeg', height: 100),
            child: Container(width: 60, height: 60, color: Colors.white30),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TBackdropFilterInvert
// =============================================================================

@GenerateSource()
class _TBackdropFilterInvert extends StatelessWidget {
  const _TBackdropFilterInvert();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.0, 0.25, 0.75, 1.0])
          TBackdropFilter.invert(
            value: value,
            background: Image.asset('assets/img/reference.jpeg', height: 100),
            child: Container(width: 60, height: 60, color: Colors.white30),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TBackdropFilterSaturate
// =============================================================================

@GenerateSource()
class _TBackdropFilterSaturate extends StatelessWidget {
  const _TBackdropFilterSaturate();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.5, 1.0, 1.5, 2.0])
          TBackdropFilter.saturate(
            value: value,
            background: Image.asset('assets/img/reference.jpeg', height: 100),
            child: Container(width: 60, height: 60, color: Colors.white30),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TBackdropFilterSepia
// =============================================================================

@GenerateSource()
class _TBackdropFilterSepia extends StatelessWidget {
  const _TBackdropFilterSepia();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.0, 0.5, 0.75, 1.0])
          TBackdropFilter.sepia(
            value: value,
            background: Image.asset('assets/img/reference.jpeg', height: 100),
            child: Container(width: 60, height: 60, color: Colors.white30),
          ),
      ],
    );
  }
}
