import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui_app/layout/header.dart';
import 'package:flutter_tailwind_ui_app/layout/scroll_view.dart';

// =============================================================================
// CLASS: UsageRoute
// =============================================================================

class UsageRoute extends StatelessWidget {
  const UsageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.gettingStarted,
        title: 'Quick Start',
        description: 'Get started quickly with Flutter Tailwind UI',
      ),
      children: const [
        Text('Content'),
      ],
    );
  }
}
