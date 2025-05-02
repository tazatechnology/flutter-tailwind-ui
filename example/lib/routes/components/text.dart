part of 'components.dart';

// =============================================================================
// CLASS: ComponentRouteTText
// =============================================================================

class ComponentRouteTText extends StatelessWidget {
  const ComponentRouteTText({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentRoute(
      name: 'TText',
      description:
          'Inline rich Markdown text with extendable regex based styling',
      children: [
        AppSection(
          title: 'Default Formatters',
          children: [
            Text(
              'The following formatters are built-in and available for use without any additional configuration:',
            ),
            TSizedBox.y14,
            AppValueTable(
              header: [Text('Syntax'), Text('Style')],
              valueTextStyle: TTextStyle.text_sm,
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
          children: [
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
          children: [
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
      'These are all bold: **text**, __text__, <strong>text</strong>.',
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
      'These are all italic: *text*, _text_, <em>text</em>.',
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
      'These are all code: `text`, <code>text</code>.',
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
    return const TText('This **`text`** is bold code.');
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
    return const TText('This **[text](https://pub.dev)** is a bold link');
  }
}
