part of 'design_system.dart';

// =============================================================================
// CLASS: TypographyRoute
// =============================================================================

class TypographyRoute extends StatelessWidget {
  const TypographyRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    // Build the table items
    final items = <AppValueTableItem>[];
    for (var ii = 0; ii < TFontSize.values.length; ii++) {
      final name = TFontSize.values.keys.elementAt(ii);
      final item = AppValueTableItem(
        name: 'TFontSize.$name',
        value: TFontSize.values.values.elementAt(ii).toString(),
        widget: TText(
          '`tw.text.${name.replaceAll('text_', 'style_')}`',
          style: tw.text.style_sm..mono(context),
        ),
      );
      items.add(item);
    }

    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.designSystem,
        title: 'Typography',
        description:
            'The default font family and font size system for consistent typography.',
      ),
      children: [
        /// Font Family
        AppSection(title: 'Font Family'),
        const TText(
          'Having both a serif font (`Geist`) and a monospaced font (`JetBrains Mono`) pre-packaged in your design system is highly beneficial because it provides immediate access to a professional typographic hierarchy. The serif font offers readability and elegance for body text, while the monospaced font is perfect for code snippets and technical content, ensuring clarity and consistency across various elements.',
        ),
        const Text(
          '\nUsers may of course define their own font families for use, but these two fonts are provided automatically and are ready for use right away. This eliminates the need for additional font setup, allowing developers to start building functional UIs right away.',
        ),
        const AppPreviewCard(
          title: 'Font Family Example',
          code: _TFontFamilySource.code,
          child: _TFontFamily(),
        ),

        /// Font Size
        AppSection(title: 'Font Size'),
        const Text(
          'The Flutter Tailwind UI package includes a standard set of font sizes that align with the Tailwind CSS default font size system, making it easy for developers to implement consistent typography across their UI. This pre-packaged sizing ensures an intuitive, scalable approach to font sizing, maintaining a cohesive visual hierarchy without the need for additional configuration.',
        ),

        /// Font size table
        AppValueTable(
          header: const [Text('Scale'), Text('Value'), Text('Text Style')],
          nameWidth: tw.screen.is_md ? TSpace.v176 : TSpace.v160,
          valueWidth: tw.screen.is_md ? TSpace.v176 : TSpace.v112,
          valueAlignment: Alignment.center,
          items: items,
        ),

        /// Font size examples
        const AppPreviewCard(
          title: 'Example Font Sizes',
          alignment: Alignment.centerLeft,
          code: _TFontSizesSource.code,
          child: _TFontSizes(),
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFontFamily
// =============================================================================

@GenerateSource()
class _TFontFamily extends StatelessWidget {
  const _TFontFamily();

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return Column(
      children: [
        Text(
          'This is the default serif font family.',
          style: TextStyle(fontFamily: tw.text.fontFamily),
        ),
        TSizedBox.y10,
        Text(
          'This is the default monospaced font family.',
          style: TextStyle(fontFamily: tw.text.fontFamilyMono),
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFontFamilySource
// =============================================================================

@GenerateSource()
class _TFontSizes extends StatelessWidget {
  const _TFontSizes();

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var ii = 0; ii < styles.length; ii++) ...[
          Padding(
            padding: TOffset.b4,
            child: Text(
              styleNames[ii],
              style: tw.text.style_sm.copyWith(
                color: tw.colors.label,
                fontFamily: tw.text.fontFamilyMono,
              ),
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
              style: styles[ii].mono(context),
            ),
          ),
        ],
      ],
    );
  }
}
