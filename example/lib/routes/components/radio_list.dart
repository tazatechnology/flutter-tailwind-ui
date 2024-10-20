import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/routes/components/component_route.dart';

// =================================================
// CLASS: ComponentRouteTRadioList
// =================================================

class ComponentRouteTRadioList extends StatelessWidget {
  const ComponentRouteTRadioList({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TRadioList',
      description: 'A widget',
      children: [
        TText(
          'The Flutter Tailwind UI',
        ),
      ],
    );
  }
}
