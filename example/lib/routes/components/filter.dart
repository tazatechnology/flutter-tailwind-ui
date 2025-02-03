part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTFilter
// =============================================================================

class ComponentRouteTFilter extends StatelessWidget {
  const ComponentRouteTFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TFilter',
      description: 'Apply filter effects to a widget',
      children: [
        AppSection(
          title: 'Blur Filter',
          children: [
            AppPreviewCard(
              description: 'Utilities for applying blur filters to an element.',
              reference: 'https://tailwindcss.com/docs/filter-blur',
              code: _TFilterBlurSource.code,
              child: _TFilterBlur(),
            ),
          ],
        ),
        AppSection(
          title: 'Brightness Filter',
          children: [
            AppPreviewCard(
              description:
                  'Utilities for applying brightness filters to an element.',
              reference: 'https://tailwindcss.com/docs/filter-brightness',
              code: _TFilterBrightnessSource.code,
              child: _TFilterBrightness(),
            ),
          ],
        ),
        AppSection(
          title: 'Contrast Filter',
          children: [
            AppPreviewCard(
              description:
                  'Utilities for applying contrast filters to an element.',
              reference: 'https://tailwindcss.com/docs/filter-contrast',
              code: _TFilterContrastSource.code,
              child: _TFilterContrast(),
            ),
          ],
        ),
        AppSection(
          title: 'Grayscale Filter',
          children: [
            AppPreviewCard(
              description:
                  'Utilities for applying grayscale filters to an element.',
              reference: 'https://tailwindcss.com/docs/filter-grayscale',
              code: _TFilterGrayscaleSource.code,
              child: _TFilterGrayscale(),
            ),
          ],
        ),
        AppSection(
          title: 'Hue Rotation Filter',
          children: [
            AppPreviewCard(
              description:
                  'Utilities for applying hue-rotate filters to an element.',
              reference: 'https://tailwindcss.com/docs/filter-hue-rotate',
              code: _TFilterHueRotateSource.code,
              child: _TFilterHueRotate(),
            ),
          ],
        ),
        AppSection(
          title: 'Color Inversion Filter',
          children: [
            AppPreviewCard(
              description:
                  'Utilities for applying invert filters to an element.',
              reference: 'https://tailwindcss.com/docs/filter-invert',
              code: _TFilterInvertSource.code,
              child: _TFilterInvert(),
            ),
          ],
        ),
        AppSection(
          title: 'Saturation Filter',
          children: [
            AppPreviewCard(
              description:
                  'Utilities for applying saturation filters to an element.',
              reference: 'https://tailwindcss.com/docs/filter-saturate',
              code: _TFilterSaturateSource.code,
              child: _TFilterSaturate(),
            ),
          ],
        ),
        AppSection(
          title: 'Sepia Filter',
          children: [
            AppPreviewCard(
              description:
                  'Utilities for applying sepia filters to an element.',
              reference: 'https://tailwindcss.com/docs/filter-sepia',
              code: _TFilterSepiaSource.code,
              child: _TFilterSepia(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFilterBlur
// =============================================================================

@GenerateSource()
class _TFilterBlur extends StatelessWidget {
  const _TFilterBlur();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.0, 2.0, 4.0, 8.0])
          TFilter.blur(
            value: value,
            child: Image.asset('assets/img/reference.jpeg', height: 100),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFilterBrightness
// =============================================================================

@GenerateSource()
class _TFilterBrightness extends StatelessWidget {
  const _TFilterBrightness();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.5, 1.0, 1.25, 1.5])
          TFilter.brightness(
            value: value,
            child: Image.asset('assets/img/reference.jpeg', height: 100),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFilterContrast
// =============================================================================

@GenerateSource()
class _TFilterContrast extends StatelessWidget {
  const _TFilterContrast();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.5, 1.0, 1.25, 2.0])
          TFilter.contrast(
            value: value,
            child: Image.asset('assets/img/reference.jpeg', height: 100),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFilterGrayscale
// =============================================================================

@GenerateSource()
class _TFilterGrayscale extends StatelessWidget {
  const _TFilterGrayscale();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.0, 0.5, 0.75, 1.0])
          TFilter.grayscale(
            value: value,
            child: Image.asset('assets/img/reference.jpeg', height: 100),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFilterHueRotate
// =============================================================================

@GenerateSource()
class _TFilterHueRotate extends StatelessWidget {
  const _TFilterHueRotate();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.0, 90.0, 180.0, 270.0])
          TFilter.hueRotate(
            value: value,
            child: Image.asset('assets/img/reference.jpeg', height: 100),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFilterInvert
// =============================================================================

@GenerateSource()
class _TFilterInvert extends StatelessWidget {
  const _TFilterInvert();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.0, 0.25, 0.75, 1.0])
          TFilter.invert(
            value: value,
            child: Image.asset('assets/img/reference.jpeg', height: 100),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFilterSaturate
// =============================================================================

@GenerateSource()
class _TFilterSaturate extends StatelessWidget {
  const _TFilterSaturate();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.5, 1.0, 1.5, 2.0])
          TFilter.saturate(
            value: value,
            child: Image.asset('assets/img/reference.jpeg', height: 100),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFilterSepia
// =============================================================================

@GenerateSource()
class _TFilterSepia extends StatelessWidget {
  const _TFilterSepia();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v20,
      runSpacing: TSpace.v20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final value in [0.0, 0.5, 0.75, 1.0])
          TFilter.sepia(
            value: value,
            child: Image.asset('assets/img/reference.jpeg', height: 100),
          ),
      ],
    );
  }
}
