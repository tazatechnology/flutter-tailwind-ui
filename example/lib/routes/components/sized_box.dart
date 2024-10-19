import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/routes/components/component_route.dart';

// =================================================
// CLASS: ComponentRouteTSizedBox
// =================================================

class ComponentRouteTSizedBox extends StatelessWidget {
  const ComponentRouteTSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TSizedBox',
      description:
          'A SizedBox widget with pre-defined constructors using `TSpace` values.',
      children: [
        TText(
          'The Flutter Tailwind UI',
        ),
      ],
    );
  }
}
