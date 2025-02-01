part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTSelect
// =============================================================================

class ComponentRouteTSelect extends StatelessWidget {
  const ComponentRouteTSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TSelect',
      description: 'A select widget',
      children: [
        AppSection(
          title: 'Section',
          children: const [],
        ),
      ],
    );
  }
}
