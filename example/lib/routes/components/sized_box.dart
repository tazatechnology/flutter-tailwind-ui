part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTSizedBox
// =============================================================================

class ComponentRouteTSizedBox extends StatelessWidget {
  const ComponentRouteTSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TSizedBox',
      description: 'Size widget with pre-defined `TSpace` constructors.',
      children: [
        AppSection(
          title: 'Section',
          children: [],
        ),
      ],
    );
  }
}
