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
        section: 'Getting Started',
        title: 'Quick Start',
      ),
      children: const [
        Text('Content'),
      ],
    );
  }
}
