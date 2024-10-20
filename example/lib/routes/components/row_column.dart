import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/routes/components/component_route.dart';

// =================================================
// CLASS: ComponentRouteTRowColumn
// =================================================

class ComponentRouteTRowColumn extends StatelessWidget {
  const ComponentRouteTRowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TRowColumn',
      description: 'A widget',
      children: [
        TText(
          'The Flutter Tailwind UI',
        ),
      ],
    );
  }
}
