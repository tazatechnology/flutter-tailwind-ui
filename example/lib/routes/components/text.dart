part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTText
// =============================================================================

class ComponentRouteTText extends StatelessWidget {
  const ComponentRouteTText({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TText',
      description:
          'A rich text widget with basic markdown formatting and extendable styling',
      children: [
        const TText(
          'Content is **bold**\nThis should be _italic_\nThis should be _**bold/italic**_\nensuring the `currentIndex` is updated\nAnd here is a link to [google](https://google.com)',
        ),
        const TText(
          'Content is `_italic_` and so is this: *italic*',
        ),
        Text.rich(
          TRichParser().parse(
            context: context,
            text: '`code snippet`',
          ),
        ),
        Text.rich(
          TRichParser().parse(
            context: context,
            text: '**BOLD**',
          ),
        ),
      ],
    );
  }
}
