import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui_example/layout/header.dart';
import 'package:flutter_tailwind_ui_example/layout/scroll_view.dart';

// =================================================
// CLASS: TypographyRoute
// =================================================

class TypographyRoute extends StatelessWidget {
  const TypographyRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppSectionHeader(
        section: 'Design System',
        title: 'Typography',
      ),
      children: const [
        AppSubSectionHeader(
          title: 'Font Family',
        ),
        Text(
          'Having both a serif font (Geist) and a monospaced font (JetBrains Mono) pre-packaged in your design system is highly beneficial because it provides immediate access to a professional typographic hierarchy.\n\nThe serif font offers readability and elegance for body text, while the monospaced font is perfect for code snippets and technical content, ensuring clarity and consistency across various elements. This eliminates the need for additional font setup, allowing developers to start building  functional UIs right away.',
        ),
      ],
    );
  }
}
