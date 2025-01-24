part of 'design_system.dart';

// =============================================================================
// CLASS: TypographyRouteLineHeight
// =============================================================================

class TypographyRouteLineHeight extends StatelessWidget {
  const TypographyRouteLineHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.designSystem,
        title: 'Line Height',
        description: 'The built-in line height breakpoints.',
        className: 'TLineHeight',
      ),
      children: [
        AppSection(
          title: 'Line Height Values',
          children: [
            AppValueTable(
              header: const [Text('Variable'), Text('Value')],
              items: [
                for (final lineHeight in TLineHeight.values)
                  AppValueTableItem(
                    name: TLineHeight.getName(lineHeight),
                    value: lineHeight.toString(),
                  ),
              ],
            ),
          ],
        ),
        AppSection(
          title: 'Line Height Examples',
          children: const [
            AppPreviewCard(
              alignment: Alignment.centerLeft,
              code: _TLineHeightExamplesSource.code,
              child: _TLineHeightExamples(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TLineHeightExamples
// =============================================================================

@GenerateSource()
class _TLineHeightExamples extends StatelessWidget {
  const _TLineHeightExamples();

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: TSpace.v32,
      children: [
        for (final lineHeight in TLineHeight.values)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: TOffset.b4,
                child: Text(
                  TLineHeight.getName(lineHeight),
                  style: tw.text.style_xs.copyWith(
                    color: TColors.sky,
                    fontFamily: tw.text.fontFamilyMono,
                  ),
                ),
              ),
              Text(
                "So I started to walk into the water. I won't lie to you boys, I was terrified. But I pressed on, and as I made my way past the breakers a strange calm came over me. I don't know if it was divine intervention or the kinship of all living things but I tell you Jerry at that moment, I was a marine biologist.",
                style: TextStyle(height: lineHeight),
              ),
            ],
          ),
      ],
    );
  }
}
