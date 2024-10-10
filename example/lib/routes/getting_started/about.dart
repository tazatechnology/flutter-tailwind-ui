import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
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
        section: 'Getting Started',
        title: 'About',
      ),
      children: const [
        TText(
          'Content is _*bold*_\nThis should be _italic_\nensuring the `currentIndex` is updated\nAnd here is a link to [google](google.com)',
        ),
      ],
    );
  }
}
