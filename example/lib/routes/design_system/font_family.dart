part of 'design_system.dart';

// =============================================================================
// CLASS: TypographyRouteFontFamily
// =============================================================================

class TypographyRouteFontFamily extends StatelessWidget {
  const TypographyRouteFontFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.designSystem,
        title: 'Font Family',
        description: 'The built-in font families.',
      ),
      children: [
        AppSection(title: 'Font Family'),
        const TText(
          'Having both a serif font (`Geist`) and a monospaced font (`JetBrains Mono`) pre-packaged in your design system is highly beneficial because it provides immediate access to a professional typographic hierarchy. The serif font offers readability and elegance for body text, while the monospaced font is perfect for code snippets and technical content, ensuring clarity and consistency across various elements.',
        ),
        const Text(
          '\nUsers may of course define their own font families for use, but these two fonts are provided automatically and are ready for use right away. This eliminates the need for additional font setup, allowing developers to start building functional UIs right away.\n',
        ),
        const AppPreviewCard(
          title: 'Font Family Example',
          code: _TFontFamilySource.code,
          child: _TFontFamily(),
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
    return const Column(
      children: [
        Text(
          'This is the default serif font family.',
          style: TextStyle(fontFamily: TTextStyle.fontFamily),
        ),
        TSizedBox.y10,
        Text(
          'This is the default monospaced font family.',
          style: TextStyle(fontFamily: TTextStyle.fontFamilyMono),
        ),
      ],
    );
  }
}
