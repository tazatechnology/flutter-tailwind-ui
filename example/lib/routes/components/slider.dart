part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTSlider
// =============================================================================

class ComponentRouteTSlider extends StatelessWidget {
  const ComponentRouteTSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TSlider',
      description: 'A slider widget',
      children: [
        AppSection(
          title: 'Slider with label',
          children: const [
            AppPreviewCard(
              title: 'Example',
              maxWidth: TScreen.max_w_md,
              code: _TSliderSource.code,
              child: _TSlider(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TSlider
// =============================================================================

@GenerateSource()
class _TSlider extends StatelessWidget {
  const _TSlider();

  @override
  Widget build(BuildContext context) {
    return TSlider(
      onChanged: (value) {},
    );
  }
}
