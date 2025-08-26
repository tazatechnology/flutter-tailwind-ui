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
      description: 'Inline rich Markdown text with extendable styling',
      children: [
        AppSection(
          title: 'Inline Text Styling',
          description:
              'There are several ways to style text inline using Markdown syntax.',
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
          description:
              'You can combine multiple inline text styles together easily.',
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
          title: 'Overriding Base Style Sheet',
          description:
              'You can override the base style sheet for specific components.',
          children: [
            AppPreviewCard(
              title: 'Custom Link Styling',
              code: _TTextLinkStyleOverrideSource.code,
              child: _TTextLinkStyleOverride(),
            ),
          ],
        ),
        AppSection(
          title: 'Markdown Gallery',
          description: 'Here samples of all the support Markdown syntax.',
          children: [
            AppPreviewCard(
              title: 'Sections',
              code: _TTextMarkdownSectionsSource.code,
              child: _TTextMarkdownSections(),
            ),
            AppPreviewCard(
              title: 'Ordered List',
              code: _TTextOrderedListSource.code,
              child: _TTextOrderedList(),
            ),
            AppPreviewCard(
              title: 'Unordered List',
              code: _TTextUnorderedListSource.code,
              child: _TTextUnorderedList(),
            ),
            AppPreviewCard(
              title: 'Code Block',
              code: _TTextCodeBlockSource.code,
              child: _TTextCodeBlock(),
            ),
            AppPreviewCard(
              title: 'Quote',
              code: _TTextQuoteSource.code,
              child: _TTextQuote(),
            ),
            AppPreviewCard(
              title: 'Table',
              code: _TTextTableSource.code,
              child: _TTextTable(),
            ),
          ],
        ),
        AppSection(
          title: 'Custom Builders',
          description: 'You may extend `TText` with custom tags/builders',
          children: [
            AppPreviewCard(
              title: 'Defining a custom builder',
              code: _TTextCustomBuildersSource.code,
              child: _TTextCustomBuilders(),
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

// =============================================================================
// CLASS: _TTextLinkStyleOverride
// =============================================================================

@GenerateSource()
class _TTextLinkStyleOverride extends StatelessWidget {
  const _TTextLinkStyleOverride();

  @override
  Widget build(BuildContext context) {
    return TText(
      'This [text](https://pub.dev) with custom styling',
      styleSheet: MarkdownStyleSheet(
        a: const TextStyle(
          color: TColors.red,
          decoration: TextDecoration.overline,
          decorationColor: Colors.green,
        ),
      ),
    );
  }
}

// =============================================================================
// CLASS: _TTextMarkdownSections
// =============================================================================

@GenerateSource()
class _TTextMarkdownSections extends StatelessWidget {
  const _TTextMarkdownSections();

  @override
  Widget build(BuildContext context) {
    return const TText('''
# Heading 1

text

## Heading 2

text

### Heading 3

text

#### Heading 4

text

##### Heading 5

text

###### Heading 6

text
''');
  }
}

// =============================================================================
// CLASS: _TTextOrderedList
// =============================================================================

@GenerateSource()
class _TTextOrderedList extends StatelessWidget {
  const _TTextOrderedList();

  @override
  Widget build(BuildContext context) {
    return const TText('''
1. List item 1
2. List item 2
3. List item 3
''');
  }
}

// =============================================================================
// CLASS: _TTextUnorderedList
// =============================================================================

@GenerateSource()
class _TTextUnorderedList extends StatelessWidget {
  const _TTextUnorderedList();

  @override
  Widget build(BuildContext context) {
    return const TText('''
- List item 1
- List item 2
- List item 3
''');
  }
}

// =============================================================================
// CLASS: _TTextCodeBlock
// =============================================================================

@GenerateSource()
class _TTextCodeBlock extends StatelessWidget {
  const _TTextCodeBlock();

  @override
  Widget build(BuildContext context) {
    return const TText('''
```shell
def hello_world():
    print("Hello, World!")
```
''');
  }
}

// =============================================================================
// CLASS: _TTextQuote
// =============================================================================

@GenerateSource()
class _TTextQuote extends StatelessWidget {
  const _TTextQuote();

  @override
  Widget build(BuildContext context) {
    return const TText('> To be or not to be...');
  }
}

// =============================================================================
// CLASS: _TTextTable
// =============================================================================

@GenerateSource()
class _TTextTable extends StatelessWidget {
  const _TTextTable();

  @override
  Widget build(BuildContext context) {
    return const TText('''
| Header 1 | Header 2 | Header 3 |
| :------- | :------: | -------: |
| Left     | Centered |   Right  |
| `Data A` | `Data B` | `Data C` |
| 123      |   456    |     789  |
''');
  }
}

// =============================================================================
// CLASS: _TTextCustomBuilders
// =============================================================================

@GenerateSource()
class _TTextCustomBuilders extends StatelessWidget {
  const _TTextCustomBuilders();

  @override
  Widget build(BuildContext context) {
    return TText(
      '''
This is an example of a <tag1>custom tag and builder</tag1>. You can define as many <tag2>custom builders</tag2> as you need. You can even pass back any widget: <widget></widget>
''',
      customBuilders: {
        'tag1': (context, element, textStyle) {
          return WidgetSpan(
            child: Text(
              element.textContent,
              style: textStyle.copyWith(
                color: Colors.red,
                fontWeight: TFontWeight.medium,
              ),
            ),
          );
        },
        'tag2': (context, element, textStyle) {
          return WidgetSpan(
            child: Text(
              element.textContent,
              style: textStyle.copyWith(
                color: Colors.blue,
                fontStyle: FontStyle.italic,
              ),
            ),
          );
        },
        'widget': (context, element, textStyle) {
          return WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: TColors.lime,
                borderRadius: TBorderRadius.rounded_sm,
              ),
              child: const TIcon(Icons.add, color: TColors.white, size: 12),
            ),
          );
        },
      },
    );
  }
}
