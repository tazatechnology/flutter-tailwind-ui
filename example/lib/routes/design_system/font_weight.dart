part of 'design_system.dart';

// =============================================================================
// CLASS: TypographyRouteFontWeight
// =============================================================================

class TypographyRouteFontWeight extends StatelessWidget {
  const TypographyRouteFontWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.designSystem,
        title: 'Font Weight',
        description: 'The built-in font weight breakpoints.',
        className: 'TFontWeight',
      ),
      children: [
        AppSection(
          title: 'Font Weight Values',
          children: [
            AppValueTable(
              header: const [Text('Variable'), Text('Value')],
              valueAlignment: Alignment.centerRight,
              items: [
                for (final fontWeight in TFontWeight.values)
                  AppValueTableItem(
                    name: TFontWeight.getName(fontWeight),
                    value: fontWeight.toString(),
                  ),
              ],
            ),
          ],
        ),
        AppSection(
          title: 'Font Weight Examples',
          children: const [
            AppPreviewCard(
              alignment: Alignment.centerLeft,
              code: _TFontWeightExamplesSource.code,
              child: _TFontWeightExamples(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TFontWeightExamples
// =============================================================================

@GenerateSource()
class _TFontWeightExamples extends StatelessWidget {
  const _TFontWeightExamples();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: TSpace.v32,
      children: [
        for (final fontWeight in TFontWeight.values)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TFontWeight.getName(fontWeight),
                style: TTextStyle.text_xs.copyWith(
                  color: TColors.sky,
                  fontFamily: TTextStyle.fontFamilyMono,
                ),
              ),
              Text(
                'The quick brown fox jumps over the lazy dog.',
                style: TextStyle(fontWeight: fontWeight),
              ),
            ],
          ),
      ],
    );
  }
}
