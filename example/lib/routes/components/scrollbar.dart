import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/routes/components/component_route.dart';

// =================================================
// CLASS: ComponentRouteTScrollbar
// =================================================

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
