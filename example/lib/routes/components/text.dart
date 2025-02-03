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
      description: 'Inline rich text with extendable regex based styling',
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
                  name: '<strong>text</strong>',
                  widget: TText('<strong>Bold Text</strong>'),
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
                  name: '<em>text</em>',
                  widget: TText('<em>Italic Text</em>'),
                ),
                AppValueTableItem(
                  name: '<u>text</u>',
                  widget: TText('<u>Underlined Text</u>'),
                ),
                AppValueTableItem(
                  name: '<ins>text</ins>',
                  widget: TText('<ins>Underlined Text</ins>'),
                ),
                AppValueTableItem(
                  name: '``_text_``',
                  widget: TText('``Monospace Text``'),
                ),
                AppValueTableItem(
                  name: '<mono>text</mono>',
                  widget: TText('<mono>Monospace Text</mono>'),
                ),
                AppValueTableItem(
                  name: '`_text_`',
                  widget: TText('`Highlighted Code`'),
                ),
                AppValueTableItem(
                  name: '<code>text</code>',
                  widget: TText('<code>Highlighted Code</code>'),
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
              title: 'Underline',
              code: _TTextUnderlineSource.code,
              child: _TTextUnderline(),
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
        AppSection(
          title: 'Custom Styles',
          children: [
            AppPreviewCard(
              title: 'Using Text Style',
              description:
                  'The easiest way to customize the format of the span is to use the `style` argument.',
              code: _TTextCustomStyleSource.code,
              child: _TTextCustomStyle(),
            ),
            AppPreviewCard(
              title: 'Using a Builder',
              description:
                  'For greater control, you can use the `builder` argument to create a custom `InlineSpan`. The `builder` can create complex spans that are more than just styled text.',
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
// CLASS: _TTextUnderline
// =============================================================================

@GenerateSource()
class _TTextUnderline extends StatelessWidget {
  const _TTextUnderline();

  @override
  Widget build(BuildContext context) {
    return const TText(
      'These are all underlined: <u>text</u>, <ins>text</ins>.',
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
      'These are all monospace: ``text``, <mono>text</mono>.',
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
    return const Column(
      children: [
        TText(
          'This **`text`** is bold code - order <u>does</u> matter here.',
        ),
        TText(
          'This `**text**` is bold code - order <u>does</u> matter here.',
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
          regex: [RegExp(r'<red>(.*?)<\/red>')],
          style: const TextStyle(color: TColors.red),
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
          regex: [RegExp(r'<my-button>(.*?)<\/my-button>')],
          builder: (match) {
            return WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TButton.outlined(
                size: TWidgetSize.xs,
                selectableText: true,
                tooltip: 'Click Me',
                theme: TStyleTheme(
                  animationDuration: const Duration(milliseconds: 100),
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  borderRadius: WidgetStateProperty.resolveWith((states) {
                    if (states.hovered) {
                      return TBorderRadius.rounded_full;
                    } else {
                      return TBorderRadius.rounded_md;
                    }
                  }),
                  textStyle: WidgetStateProperty.all(
                    const TextStyle(color: TColors.sky),
                  ),
                ),
                child: Text(match.textMatch),
                onPressed: () {},
              ),
            );
          },
        ),
      ],
    );
  }
}
