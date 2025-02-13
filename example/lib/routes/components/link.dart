part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTLink
// =============================================================================

class ComponentRouteTLink extends StatelessWidget {
  const ComponentRouteTLink({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TLink',
      description: 'A link button',
      children: [
        AppSection(
          title: 'Link Types',
          children: [
            AppPreviewCard(
              title: 'Generic',
              description: 'Create a callback to any operation.',
              code: _TLinkGenericSource.code,
              child: _TLinkGeneric(),
            ),
            AppPreviewCard(
              title: 'URI',
              description:
                  'Specify a URI to navigate to. These links are recognized by the browser as proper hyperlinks.',
              code: _TLinkURISource.code,
              child: _TLinkURI(),
            ),
          ],
        ),
        AppSection(
          title: 'Styling Link Button',
          children: [
            AppPreviewCard(
              title: 'Basic hover color',
              code: _TLinkColorsSource.code,
              child: _TLinkColors(),
            ),
            AppPreviewCard(
              title: 'No decoration',
              code: _TLinkNoDecorationSource.code,
              child: _TLinkNoDecoration(),
            ),
            AppPreviewCard(
              title: 'Stateful text tyle',
              code: _TLinkTextStyleSource.code,
              child: _TLinkTextStyle(),
            ),
          ],
        ),
        AppSection(
          title: 'Custom Content',
          children: [
            AppPreviewCard(
              title: 'Add custom content',
              code: _TLinkContentSource.code,
              child: _TLinkContent(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TLinkGeneric
// =============================================================================

@GenerateSource()
class _TLinkGeneric extends StatelessWidget {
  const _TLinkGeneric();

  @override
  Widget build(BuildContext context) {
    return TLink(
      child: const Text('Link'),
      onPressed: () {},
    );
  }
}

// =============================================================================
// CLASS: _TLinkURI
// =============================================================================

@GenerateSource()
class _TLinkURI extends StatelessWidget {
  const _TLinkURI();

  @override
  Widget build(BuildContext context) {
    return TLink.uri(
      uri: Uri.parse('https://fluttertailwind.com'),
      child: const Text('Link'),
    );
  }
}

// =============================================================================
// CLASS: _TLinkColors
// =============================================================================

@GenerateSource()
class _TLinkColors extends StatelessWidget {
  const _TLinkColors();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TSpace.v24,
      runSpacing: TSpace.v8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final color in PREVIEW_COLORS)
          TLink(
            color: color,
            onPressed: () {},
            child: const Text('Link'),
          ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TLinkNoDecoration
// =============================================================================

@GenerateSource()
class _TLinkNoDecoration extends StatelessWidget {
  const _TLinkNoDecoration();

  @override
  Widget build(BuildContext context) {
    return TLink(
      decorate: false,
      onPressed: () {},
      child: const Text('Link'),
    );
  }
}

// =============================================================================
// CLASS: _TLinkTextStyle
// =============================================================================

@GenerateSource()
class _TLinkTextStyle extends StatelessWidget {
  const _TLinkTextStyle();

  @override
  Widget build(BuildContext context) {
    return TLink(
      textStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
        if (states.hovered) {
          return const TextStyle(
            color: TColors.blue,
            decorationColor: TColors.red,
            decorationStyle: TextDecorationStyle.dashed,
            fontWeight: TFontWeight.semibold,
            decoration: TextDecoration.overline,
          );
        }
        return null;
      }),
      onPressed: () {},
      child: const Text('Link'),
    );
  }
}

// =============================================================================
// CLASS: _TLinkContent
// =============================================================================

@GenerateSource()
class _TLinkContent extends StatelessWidget {
  const _TLinkContent();

  @override
  Widget build(BuildContext context) {
    return TLink(
      onPressed: () {},
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: TOffset.r6,
            child: Icon(Icons.link, size: TSpace.v16),
          ),
          Text('Link'),
        ],
      ),
    );
  }
}
