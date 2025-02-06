part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTExpand
// =============================================================================

class ComponentRouteTExpand extends StatelessWidget {
  const ComponentRouteTExpand({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TExpand',
      description: 'A widget',
      children: [
        AppSection(
          title: 'Section',
          children: [],
        ),
      ],
    );
  }
}
