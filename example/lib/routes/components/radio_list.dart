part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTRadioList
// =============================================================================

class ComponentRouteTRadioList extends StatelessWidget {
  const ComponentRouteTRadioList({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TRadioList',
      description: 'A widget',
      children: [
        TText(
          'The Flutter Tailwind UI',
        ),
      ],
    );
  }
}
