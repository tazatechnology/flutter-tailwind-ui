part of 'typography.dart';

// =============================================================================
// CLASS: TypographyRouteFontSize
// =============================================================================

class TypographyRouteFontSize extends StatelessWidget {
  const TypographyRouteFontSize({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.typography,
        title: 'Font Size',
        description: 'The built-in font size breakpoints.',
        className: 'TFontSize',
        reference: 'https://tailwindcss.com/docs/font-size',
      ),
      children: [
        AppSection(
          title: 'Font Size Values',
          children: [
            AppValueTable(
              header: const [Text('Variable'), Text('Value')],
              valueAlignment: Alignment.centerRight,
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
        const AppSection(
          title: 'Font Size Examples',
          children: [
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
                style: TTextStyle.text_xs.copyWith(
                  color: TColors.sky,
                  fontFamily: TTextStyle.fontFamilyMono,
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
