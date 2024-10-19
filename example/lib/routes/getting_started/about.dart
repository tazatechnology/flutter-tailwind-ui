import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui_example/layout/header.dart';
import 'package:flutter_tailwind_ui_example/layout/scroll_view.dart';

// =================================================
// CLASS: AboutRoute
// =================================================

class AboutRoute extends StatelessWidget {
  const AboutRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppSectionHeader(
        section: AppSection.gettingStarted,
        title: 'About',
        description: 'Philosophy and code principles',
      ),
      children: const [],
    );
  }
}
