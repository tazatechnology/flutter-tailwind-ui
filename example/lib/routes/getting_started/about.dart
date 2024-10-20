import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui_app/layout/header.dart';
import 'package:flutter_tailwind_ui_app/layout/scroll_view.dart';

// =================================================
// CLASS: AboutRoute
// =================================================

class AboutRoute extends StatelessWidget {
  const AboutRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppSection.gettingStarted,
        title: 'About',
        description: 'Philosophy and code principles',
      ),
      children: const [],
    );
  }
}
