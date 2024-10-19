import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/layout.dart';
import 'package:flutter_tailwind_ui_example/widgets/code_result_card.dart';
import 'package:flutter_tailwind_ui_example/widgets/value_table.dart';

// =================================================
// CLASS: TypographyRoute
// =================================================

class TypographyRoute extends StatelessWidget {
  const TypographyRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    final styles = [
      tw.text.style_xs,
      tw.text.style_sm,
      tw.text.style_md,
      tw.text.style_lg,
      tw.text.style_xl,
      tw.text.style_2xl,
    ];

    final styleNames = [
      'tw.text.style_xs',
      'tw.text.style_sm',
      'tw.text.style_md',
      'tw.text.style_lg',
      'tw.text.style_xl',
      'tw.text.style_2xl',
    ];

    // Build the table items
    final items = <AppValueTableItem>[];
    for (var ii = 0; ii < TFontSize.values.length; ii++) {
      final name = TFontSize.values.keys.elementAt(ii);
      final item = AppValueTableItem(
        name: 'TFontSize.$name',
        value: TFontSize.values.values.elementAt(ii).toString(),
        widget: TText('`tw.$name`', style: tw.text.style_sm.mono),
      );
      items.add(item);
    }

    return AppScrollView.children(
      header: const AppSectionHeader(
        section: AppSection.designSystem,
        title: 'Typography',
        description:
            'The default font family and font size system for consistent typography.',
      ),
      children: [
        /// Font Family
        const AppSubSectionHeader(title: 'Font Family'),
        const TText(
          'Having both a serif font (`Geist`) and a monospaced font (`JetBrains Mono`) pre-packaged in your design system is highly beneficial because it provides immediate access to a professional typographic hierarchy. The serif font offers readability and elegance for body text, while the monospaced font is perfect for code snippets and technical content, ensuring clarity and consistency across various elements.',
        ),
        const Text(
          '\nUsers may of course define their own font families for use, but these two fonts are provided automatically and are ready for use right away. This eliminates the need for additional font setup, allowing developers to start building functional UIs right away.',
        ),
        const TCodeBlock(
          brightness: Brightness.dark,
          code: '''
// Default serif font family
// Defined as static constant: TailwindTheme.fontFamily
Text(
  'This is the default serif font family.',
)

// Default monospaced font family
// Defined as static constant: TailwindTheme.fontFamilyMono
Text(
  'This is the default monospaced font family.',
  style: TextStyle(fontFamily: TailwindTheme.fontFamilyMono),
)
''',
        ),
        const AppCodeResultCard(
          children: [
            Text(
              'This is the default serif font family.',
            ),
            TSizedBox.y10,
            Text(
              'This is the default monospaced font family.',
              style: TextStyle(fontFamily: TailwindTheme.fontFamilyMono),
            ),
          ],
        ),

        /// Font Size
        const AppSubSectionHeader(title: 'Font Size'),
        const Text(
          'The Flutter Tailwind UI package includes a standard set of font sizes that align with the Tailwind CSS default font size system, making it easy for developers to implement consistent typography across their UI. This pre-packaged sizing ensures an intuitive, scalable approach to font sizing, maintaining a cohesive visual hierarchy without the need for additional configuration.',
        ),

        /// Font size Examples
        AppValueTable(
          header: const [Text('Scale'), Text('Value'), Text('Text Style')],
          items: items,
        ),
        const TCodeBlock(
          brightness: Brightness.dark,
          code: '''
Text(
  'The quick brown fox jumps over the lazy dog.',
  style: tw.text.style_xs,
)

// The font styles can also be converted to monospaced
Text(
  'The quick brown fox jumps over the lazy dog.',
  style: tw.text.style_xs.mono,
)
''',
        ),
        AppCodeResultCard(
          children: [
            for (var ii = 0; ii < styles.length; ii++) ...[
              Padding(
                padding: TOffset.b4,
                child: Text(
                  styleNames[ii],
                  style: tw.text.style_sm.mono.copyWith(color: TColors.gray),
                ),
              ),
              Padding(
                padding: TOffset.b4,
                child: Text(
                  'The quick brown fox jumps over the lazy dog.',
                  style: styles[ii],
                ),
              ),
              Padding(
                padding: TOffset.b12,
                child: Text(
                  'The quick brown fox jumps over the lazy dog.',
                  style: styles[ii].mono,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
