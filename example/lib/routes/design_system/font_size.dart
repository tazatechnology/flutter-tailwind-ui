part of 'design_system.dart';

// =============================================================================
// CLASS: TypographyRouteFontSize
// =============================================================================

class TypographyRouteFontSize extends StatelessWidget {
  const TypographyRouteFontSize({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.designSystem,
        title: 'Font Size',
        description: 'The built-in font size breakpoints.',
        className: 'TFontSize',
      ),
      // children: [
      //   AppSection(title: 'Font Size Values'),
      //   const Text(
      //     'The Flutter Tailwind UI package includes a standard set of font sizes that align with the Tailwind CSS default font size system, making it easy for developers to implement consistent typography across their UI. This pre-packaged sizing ensures an intuitive, scalable approach to font sizing, maintaining a cohesive visual hierarchy without the need for additional configuration.',
      //   ),
      // ],
      children: [
        AppSection(
          title: 'Font Size Values',
          children: [
            AppValueTable(
              header: const [Text('Variable'), Text('Value')],
              items: [
                for (final fontSize in TFontSize.values)
                  AppValueTableItem(
                    name: TFontSize.getName(fontSize),
                    value: fontSize.toString(),
                  ),
              ],
            ),
          ],
        ),
        AppSection(
          title: 'Font Size Examples',
          children: const [
            AppPreviewCard(
              alignment: Alignment.centerLeft,
              code: _TFontSizeExamplesSource.code,
              child: _TFontSizeExamples(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFontSizeExamples
// =============================================================================

@GenerateSource()
class _TFontSizeExamples extends StatelessWidget {
  const _TFontSizeExamples();

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: TSpace.v32,
      children: [
        for (final fontSize in TFontSize.values)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TFontSize.getName(fontSize),
                style: tw.text.style_xs.copyWith(
                  color: TColors.sky,
                  fontFamily: tw.text.fontFamilyMono,
                ),
              ),
              Text(
                'The quick brown fox jumps over the lazy dog.',
                style: TextStyle(fontSize: fontSize),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
      ],
    );
  }
}
