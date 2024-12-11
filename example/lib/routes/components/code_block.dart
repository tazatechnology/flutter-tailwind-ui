part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTCodeBlock
// =============================================================================

class ComponentRouteTCodeBlock extends StatelessWidget {
  const ComponentRouteTCodeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TCodeBlock',
      description: 'A widget',
      children: [
        TText(
          'The Flutter Tailwind UI',
        ),
      ],
    );
  }
}
