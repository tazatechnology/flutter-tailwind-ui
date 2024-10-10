import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui_example/layout/header.dart';
import 'package:flutter_tailwind_ui_example/layout/scroll_view.dart';

// =================================================
// CLASS: SpacingRoute
// =================================================

class SpacingRoute extends StatelessWidget {
  const SpacingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppSectionHeader(
        section: 'Design System',
        title: 'Spacing Scale',
      ),
      children: const [
        Text('Content'),
      ],
    );
  }
}
