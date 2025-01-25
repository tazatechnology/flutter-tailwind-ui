part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTText
// =============================================================================

class ComponentRouteTText extends StatelessWidget {
  const ComponentRouteTText({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TText',
      description:
          'Rich text with basic markdown formatting and extendable styling',
      children: [
        AppSection(
          title: 'Default Formatters',
          children: const [
            Text(
              'The following formatters are built-in and available for use without any additional configuration:',
            ),
            TSizedBox.y14,
            AppValueTable(
              header: [Text('Syntax'), Text('Style')],
              items: [
                AppValueTableItem(
                  name: '**text**',
                  widget: TText('**Bold Text**'),
                ),
                AppValueTableItem(
                  name: '__text__',
                  widget: TText('__Bold Text__'),
                ),
                AppValueTableItem(
                  name: '*text*',
                  widget: TText('*Italic Text*'),
                ),
                AppValueTableItem(
                  name: '_text_',
                  widget: TText('_Italic Text_'),
                ),
                AppValueTableItem(
                  name: '``_text_``',
                  widget: TText('``Monospace Text``'),
                ),
                AppValueTableItem(
                  name: '`_text_`',
                  widget: TText('`Highlighted Code`'),
                ),
                AppValueTableItem(
                  name: '[text](url)',
                  widget: TText('[Link to URL](https://pub.dev)'),
                ),
              ],
            ),
          ],
        ),
        AppSection(
          title: 'Inline Text Styling',
          children: const [
            AppPreviewCard(
              title: 'Bold',
              code: _TTextBoldSource.code,
              child: _TTextBold(),
            ),
            AppPreviewCard(
              title: 'Italic',
              code: _TTextItalicSource.code,
              child: _TTextItalic(),
            ),
            AppPreviewCard(
              title: 'Monospace',
              code: _TTextMonospaceSource.code,
              child: _TTextMonospace(),
            ),
            AppPreviewCard(
              title: 'Code',
              code: _TTextCodeSource.code,
              child: _TTextCode(),
            ),
            AppPreviewCard(
              title: 'Link',
              code: _TTextLinkSource.code,
              child: _TTextLink(),
            ),
          ],
        ),
        AppSection(
          title: 'Combining Inline Text Styles',
          children: const [
            AppPreviewCard(
              title: 'Bold and Italic',
              code: _TTextBoldItalicSource.code,
              child: _TTextBoldItalic(),
            ),
            AppPreviewCard(
              title: 'Formatted Code',
              code: _TTextFormattedCodeSource.code,
              child: _TTextFormattedCode(),
            ),
            AppPreviewCard(
              title: 'Formatted Link',
              code: _TTextFormattedLinkSource.code,
              child: _TTextFormattedLink(),
            ),
          ],
        ),
        AppSection(
          title: 'Custom Styles',
          children: const [
            AppPreviewCard(
              title: 'Using Text Style',
              code: _TTextCustomStyleSource.code,
              child: _TTextCustomStyle(),
            ),
            AppPreviewCard(
              title: 'Using a Builder',
              code: _TTextCustomStyleBuilderSource.code,
              child: _TTextCustomStyleBuilder(),
            ),
            AppPreviewCard(
              title: 'Using a Builder (Advanced)',
              code: _TTextCustomStyleBuilderAdvancedSource.code,
              child: _TTextCustomStyleBuilderAdvanced(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TTextBold
// =============================================================================

@GenerateSource()
class _TTextBold extends StatelessWidget {
  const _TTextBold();

  @override
  Widget build(BuildContext context) {
    return const TText(
      'This **text** and this __text__ is bold.',
    );
  }
}

// =============================================================================
// CLASS: _TTextItalic
// =============================================================================

@GenerateSource()
class _TTextItalic extends StatelessWidget {
  const _TTextItalic();

  @override
  Widget build(BuildContext context) {
    return const TText(
      'This *text* and this _text_ is italic.',
    );
  }
}

// =============================================================================
// CLASS: _TTextMonospace
// =============================================================================

@GenerateSource()
class _TTextMonospace extends StatelessWidget {
  const _TTextMonospace();

  @override
  Widget build(BuildContext context) {
    return const TText(
      'This ``text`` is monospaced.',
    );
  }
}

// =============================================================================
// CLASS: _TTextCode
// =============================================================================

@GenerateSource()
class _TTextCode extends StatelessWidget {
  const _TTextCode();

  @override
  Widget build(BuildContext context) {
    return const TText(
      'This `text` is highlighted code.',
    );
  }
}

// =============================================================================
// CLASS: _TTextLink
// =============================================================================

@GenerateSource()
class _TTextLink extends StatelessWidget {
  const _TTextLink();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TText(
          'This is a [link](https://pub.dev/packages/flutter_tailwind_ui) to the pub.dev page this project.',
        ),
        TText(
          'This is a [link](/font-family) to an internal route of this app.',
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TTextBoldItalic
// =============================================================================

@GenerateSource()
class _TTextBoldItalic extends StatelessWidget {
  const _TTextBoldItalic();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TText(
          'This _**text**_ is bold and italic - order does not matter.',
        ),
        TText(
          'This **_text_** is bold and italic - order does not matter.',
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TTextFormattedCode
// =============================================================================

@GenerateSource()
class _TTextFormattedCode extends StatelessWidget {
  const _TTextFormattedCode();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TText(
          'This **`text`** is bold code - order does not matter.',
        ),
        TText(
          'This `**text**` is bold code - order does not matter.',
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TTextFormattedLink
// =============================================================================

@GenerateSource()
class _TTextFormattedLink extends StatelessWidget {
  const _TTextFormattedLink();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TText(
          'This **[text](https://pub.dev)** is a bold link - order does not matter.',
        ),
        TText(
          'This [**text**](https://pub.dev) is a bold link - order does not matter.',
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TTextCustomStyle
// =============================================================================

@GenerateSource()
class _TTextCustomStyle extends StatelessWidget {
  const _TTextCustomStyle();

  @override
  Widget build(BuildContext context) {
    return TText(
      'This a custom formatter to create <red>colored</red> text',
      formatters: [
        TRichFormatter(
          regex: RegExp(r'<red>(.*?)<\/red>'),
          style: const TextStyle(color: TColors.red),
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TTextCustomStyleBuilder
// =============================================================================

@GenerateSource()
class _TTextCustomStyleBuilder extends StatelessWidget {
  const _TTextCustomStyleBuilder();

  @override
  Widget build(BuildContext context) {
    return TText(
      'This a custom formatter to create <red>colored</red> text',
      formatters: [
        TRichFormatter(
          regex: RegExp(r'<red>(.*?)<\/red>'),
          builder: (match) => TextSpan(
            text: match.textMatch,
            style: const TextStyle(color: TColors.red),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TTextCustomStyleBuilderAdvanced
// =============================================================================

@GenerateSource()
class _TTextCustomStyleBuilderAdvanced extends StatelessWidget {
  const _TTextCustomStyleBuilderAdvanced();

  @override
  Widget build(BuildContext context) {
    return TText(
      'This a custom formatter to add an inline <my-button>action</my-button> span',
      formatters: [
        TRichFormatter(
          regex: RegExp(r'<my-button>(.*?)<\/my-button>'),
          builder: (match) {
            return WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TButton.outlined(
                size: TWidgetSize.xs,
                tooltip: 'Click me!',
                child: Text(
                  match.textMatch,
                  style: match.context.tw.text.style_sm.copyWith(
                    fontWeight: TFontWeight.normal,
                  ),
                ),
                onPressed: () {},
              ),
            );
          },
        ),
      ],
    );
  }
}
