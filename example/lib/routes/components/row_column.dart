part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTRowColumn
// =============================================================================

class ComponentRouteTRowColumn extends StatelessWidget {
  const ComponentRouteTRowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TRowColumn',
      description: 'A widget',
      children: [
        AppSection(
          title: 'Section',
          children: const [],
        ),
      ],
    );
  }
}
