part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTScrollbar
// =============================================================================

class ComponentRouteTScrollbar extends StatelessWidget {
  const ComponentRouteTScrollbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TScrollbar',
      description: 'A widget',
      children: [
        TText(
          'The Flutter Tailwind UI',
        ),
      ],
    );
  }
}
