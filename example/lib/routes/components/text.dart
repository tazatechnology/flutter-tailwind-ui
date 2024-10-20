import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/routes/components/component_route.dart';

// =================================================
// CLASS: ComponentRouteTText
// =================================================

class ComponentRouteTText extends StatelessWidget {
  const ComponentRouteTText({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TText',
      description: 'A rich text widget with basic markdown-like formatting.',
      children: [
        TText(
          'Content is **bold**\nThis should be _italic_\nThis should be _**bold/italic**_\nensuring the `currentIndex` is updated\nAnd here is a link to [google](google.com)',
        ),
        TText(
          'And here is a link to [`code link`](google.com)',
        ),
      ],
    );
  }
}
