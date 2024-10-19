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
    final tw = context.tw;
    return AppScrollView.children(
      header: const AppSectionHeader(
        section: 'Getting Started',
        title: 'About',
      ),
      children: [
        const TText(
          'Content is **bold**\nThis should be _italic_\nThis should be _**bold/italic**_\nensuring the `currentIndex` is updated\nAnd here is a link to [google](google.com)',
        ),
        const TText(
          'And here is a link to [`code link`](google.com)',
        ),
        TSizedBox.y20,
        TText(
          'Primary headline',
          style: tw.text.style_lg.bold.copyWith(color: tw.colors.title),
        ),
        TText(
          'Limited time only',
          style: tw.text.style_sm.copyWith(color: tw.colors.label),
        ),
        TText(
          'Enjoy all of the free features',
          style: tw.text.style_md.copyWith(color: tw.colors.body),
        ),
        const Card(
          child: TSizedBox.s160,
        ),
      ],
    );
  }
}
