part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTForm
// =============================================================================

class ComponentRouteTForm extends StatelessWidget {
  const ComponentRouteTForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TForm',
      description: 'A form to manage and track user input.',
      reference:
          'https://tailwindui.com/components/application-ui/forms/form-layouts',
      children: [
        AppSection(
          title: 'Section',
          children: [],
        ),
      ],
    );
  }
}
