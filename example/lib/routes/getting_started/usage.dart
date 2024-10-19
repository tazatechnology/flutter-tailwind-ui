import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui_example/layout/header.dart';
import 'package:flutter_tailwind_ui_example/layout/scroll_view.dart';

// =================================================
// CLASS: UsageRoute
// =================================================

class UsageRoute extends StatelessWidget {
  const UsageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppSectionHeader(
        section: AppSection.gettingStarted,
        title: 'Quick Start',
        description: 'Get started quickly with Flutter Tailwind UI',
      ),
      children: const [
        Text('Content'),
      ],
    );
  }
}
