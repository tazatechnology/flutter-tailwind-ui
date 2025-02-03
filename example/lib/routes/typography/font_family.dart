part of 'typography.dart';

// =============================================================================
// CLASS: TypographyRouteFontFamily
// =============================================================================

class TypographyRouteFontFamily extends StatelessWidget {
  const TypographyRouteFontFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.typography,
        title: 'Font Family',
        description: 'The built-in font families.',
        className: 'TTextStyle',
        reference: 'https://tailwindcss.com/docs/font-family',
      ),
      children: const [
        AppSection(title: 'Font Family'),
        TText(
          'Having both a serif font and a monospaced font pre-packaged in your design system is highly beneficial because it provides immediate access to a professional typographic hierarchy. The serif font offers readability and elegance for body text, while the monospaced font is perfect for code snippets and technical content, ensuring clarity and consistency across various elements.\n\nUsers may of course define their own font families for use, but this package **pre-packages** two fonts that are ready for use right away. This eliminates the need for additional font setup, allowing developers to start building functional UIs right away. The pre-packaged fonts were chosen because they are modern, popular, and open-source.',
        ),
        TSizedBox.y24,
        AppPreviewCard(
          title: 'Serif Font Family',
          description: 'Geist by [Vercel](https://vercel.com/font)',
          code: _TFontFamilySource.code,
          child: _TFontFamily(),
        ),
        AppPreviewCard(
          title: 'Monospace Font Family',
          description:
              'JetBrains Mono by [JetBrains](https://www.jetbrains.com/lp/mono)',
          code: _TFontFamilyMonoSource.code,
          child: _TFontFamilyMono(),
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
    return const Text(
      'This is the default serif font family.',
      style: TextStyle(fontFamily: TTextStyle.fontFamily),
    );
  }
}

// =============================================================================
// CLASS: _TFontFamilyMono
// =============================================================================

@GenerateSource()
class _TFontFamilyMono extends StatelessWidget {
  const _TFontFamilyMono();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'This is the default monospaced font family.',
      style: TextStyle(fontFamily: TTextStyle.fontFamilyMono),
    );
  }
}
