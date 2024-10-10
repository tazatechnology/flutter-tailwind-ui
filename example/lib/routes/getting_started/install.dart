import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui_example/layout/header.dart';
import 'package:flutter_tailwind_ui_example/layout/scroll_view.dart';

// =================================================
// CLASS: InstallRoute
// =================================================

class InstallRoute extends StatelessWidget {
  const InstallRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppSectionHeader(
        section: 'Getting Started',
        title: 'Install',
      ),
      children: const [
        Text('Content'),
      ],
    );
  }
}
