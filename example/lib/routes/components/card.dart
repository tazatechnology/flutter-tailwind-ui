part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTCard
// =============================================================================

class ComponentRouteTCard extends StatelessWidget {
  const ComponentRouteTCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TCard',
      description: 'A widget',
      children: [
        AppSection(
          title: 'Card Features',
          children: [
            AppPreviewCard(
              title: 'Basic',
              code: _TCardBasicSource.code,
              child: _TCardBasic(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCardBasic
// =============================================================================

@GenerateSource()
class _TCardBasic extends StatelessWidget {
  const _TCardBasic();

  @override
  Widget build(BuildContext context) {
    return const TCard(
      child: Text('Example Card'),
    );
  }
}
