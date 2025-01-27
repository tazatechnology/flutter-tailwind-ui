part of 'design_system.dart';

// =============================================================================
// CLASS: TypographyRouteLetterSpacing
// =============================================================================

class TypographyRouteLetterSpacing extends StatelessWidget {
  const TypographyRouteLetterSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.designSystem,
        title: 'Line Height',
        description: 'The built-in letter spacing breakpoints.',
        className: 'TLetterSpacing',
      ),
      children: [
        AppSection(
          title: 'Letter Spacing Values',
          children: [
            AppValueTable(
              header: const [Text('Variable'), Text('Value')],
              valueAlignment: Alignment.centerRight,
              items: [
                for (final letterSpacing in TLetterSpacing.values)
                  AppValueTableItem(
                    name: TLetterSpacing.getName(letterSpacing),
                    value: letterSpacing.toString(),
                  ),
              ],
            ),
          ],
        ),
        AppSection(
          title: 'Letter Spacing Examples',
          children: const [
            AppPreviewCard(
              alignment: Alignment.centerLeft,
              code: _TLetterSpacingExamplesSource.code,
              child: _TLetterSpacingExamples(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TLetterSpacingExamples
// =============================================================================

@GenerateSource()
class _TLetterSpacingExamples extends StatelessWidget {
  const _TLetterSpacingExamples();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: TSpace.v32,
      children: [
        for (final letterSpacing in TLetterSpacing.values)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TLetterSpacing.getName(letterSpacing),
                style: TTextStyle.text_xs.copyWith(
                  color: TColors.sky,
                  fontFamily: TTextStyle.fontFamilyMono,
                ),
              ),
              Text(
                'The quick brown fox jumps over the lazy dog.',
                style: TextStyle(letterSpacing: letterSpacing),
              ),
            ],
          ),
      ],
    );
  }
}
