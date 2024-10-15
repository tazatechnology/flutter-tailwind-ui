import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
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
        TText(
          'Having both a serif font (`Geist`) and a monospaced font (`JetBrains Mono`) pre-packaged in your design system is highly beneficial because it provides immediate access to a professional typographic hierarchy.',
        ),
        Text(
          '\nThe serif font offers readability and elegance for body text, while the monospaced font is perfect for code snippets and technical content, ensuring clarity and consistency across various elements. This eliminates the need for additional font setup, allowing developers to start building functional UIs right away.',
        ),
        TCodeBlock(
          code: '''
/// Example application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syntax Highlight Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
''',
        ),
        AppSubSectionHeader(title: 'Font Size'),
        Text(
          'The Flutter Tailwind UI package includes a standard set of font sizes that align with the Tailwind CSS default font size system, making it easy for developers to implement consistent typography across their UI. This pre-packaged sizing ensures an intuitive, scalable approach to font sizing, maintaining a cohesive visual hierarchy without the need for additional configuration.',
        ),
      ],
    );
  }
}
