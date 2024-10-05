import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

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
      interactive: false,
      child: ListView(
        padding: TOffset.x24 + TOffset.t24,
        controller: scrollController,
        children: [
          ListTile(
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            title: Text('About'),
            onTap: () {},
          ),
          for (var i = 0; i < 100; i++)
            ListTile(
              title: Text('Contact'),
              onTap: () {},
            ),
        ],
      ),
    );
  }
}
