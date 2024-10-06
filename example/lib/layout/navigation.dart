import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/scaffold.dart';
import 'package:flutter_tailwind_ui_example/providers/router.dart';
import 'package:go_router/go_router.dart';

// =================================================
// CLASS: AppNavigation
// =================================================

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final scrollController = ScrollController();

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      child: ListView(
        padding: TOffset.x24 +
            const EdgeInsets.only(
              top: AppScaffold.toolbarHeight + TSpacingScale.v40,
            ),
        controller: scrollController,
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () => context.goNamed(AppRouter.home),
          ),
          ListTile(
            title: const Text('Colors'),
            onTap: () => context.goNamed(AppRouter.colors),
          ),
          ListTile(
            title: const Text('Spacing'),
            onTap: () => context.goNamed(AppRouter.spacing),
          ),
          ListTile(
            title: const Text('Typography'),
            onTap: () => context.goNamed(AppRouter.typography),
          ),
        ],
      ),
    );
  }
}
