part of 'components.dart';

const cssCodeExample = '''
body {
  color: black;
}
''';

const dartCodeExample = """
void main() {
  print('Hello, World!');
}
""";

const goCodeExample = '''
package main

import "fmt"

func main() {
  fmt.Println("Hello, World!")
}
''';

const htmlCodeExample = '''
<!DOCTYPE html>
<html>
  <body>
    <p>Hello, World!</p>
  </body>
</html>
''';

const javaCodeExample = '''
public class Main {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
''';

const javascriptCodeExample = '''
console.log("Hello, World!");
''';

const jsonCodeExample = '''
{
  "message": "Hello, World!"
}
''';

const kotlinCodeExample = '''
fun main() {
  println("Hello, World!")
}
''';

const pythonCodeExample = '''
print("Hello, World!")
''';

const rustCodeExample = '''
fn main() {
    println!("Hello, World!");
}
''';

const shellCodeExample = '''
echo "Hello, World!"
''';

const sqlCodeExample = """
SELECT 'Hello, World!';
""";

const swiftCodeExample = '''
import Swift
print("Hello, World!")
''';

const tomlCodeExample = '''
message = "Hello, World!"
''';

const typescriptCodeExample = '''
console.log("Hello, World!");
''';

const xmlCodeExample = '''
<message>Hello, World!</message>
''';

const yamlCodeExample = '''
message: "Hello, World!"
''';

/// Map of language → code sample
const Map<String, String> codeSamples = {
  'css': cssCodeExample,
  'dart': dartCodeExample,
  'go': goCodeExample,
  'html': htmlCodeExample,
  'java': javaCodeExample,
  'javascript': javascriptCodeExample,
  'json': jsonCodeExample,
  'kotlin': kotlinCodeExample,
  'python': pythonCodeExample,
  'rust': rustCodeExample,
  'shell': shellCodeExample,
  'sql': sqlCodeExample,
  'swift': swiftCodeExample,
  'toml': tomlCodeExample,
  'typescript': typescriptCodeExample,
  'xml': xmlCodeExample,
  'yaml': yamlCodeExample,
};

final List<String> languagesFormatted = THighlighter.languages
    .map((e) => '`$e`')
    .toList();

// =============================================================================
// CLASS: ComponentRouteTCodeBlock
// =============================================================================

class ComponentRouteTCodeBlock extends StatelessWidget {
  const ComponentRouteTCodeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentRoute(
      name: 'TCodeBlock',
      description: 'A widget for displaying code blocks.',
      children: [
        const AppSection(
          title: 'Basic Usage',
          children: [
            AppPreviewCard(
              title: 'Automatic `brightness` based on system.',
              description:
                  'Try it by toggling the application brightness in the upper right hand corner.',
              code: _TCodeBlockBasicSource.code,
              child: _TCodeBlockBasic(),
            ),
            AppPreviewCard(
              title: 'Hard code `brightness` to specific value',
              description:
                  'When you want a specific brightness value regardless of the system setting.',
              code: _TCodeBlockBrightnessSource.code,
              child: _TCodeBlockBrightness(),
            ),
            AppPreviewCard(
              title: 'Customize',
              description:
                  'Customize the appearance and behavior of the code block.',
              code: _TCodeBlockThemingSource.code,
              child: _TCodeBlockTheming(),
            ),
          ],
        ),
        AppSection(
          title: 'Supported Languages',
          children: [
            AppPreviewCard(
              title: 'Built in languages',
              description:
                  'By default, the following languages are supported: ${languagesFormatted.join(', ')} .',
              code: _TCodeBlockLanguagesSource.code,
              child: const _TCodeBlockLanguages(),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: _TCodeBlockBasic
// =============================================================================

@GenerateSource()
class _TCodeBlockBasic extends StatelessWidget {
  const _TCodeBlockBasic();

  @override
  Widget build(BuildContext context) {
    return const TCodeBlock(
      code: dartCodeExample,
    );
  }
}

// =============================================================================
// CLASS: _TCodeBlockBrightness
// =============================================================================

@GenerateSource()
class _TCodeBlockBrightness extends StatelessWidget {
  const _TCodeBlockBrightness();

  @override
  Widget build(BuildContext context) {
    return const TCodeBlock(
      code: dartCodeExample,
      theme: TCodeBlockTheme(
        brightness: Brightness.dark,
      ),
    );
  }
}

// =============================================================================
// CLASS: _TCodeBlockTheming
// =============================================================================

@GenerateSource()
class _TCodeBlockTheming extends StatelessWidget {
  const _TCodeBlockTheming();

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return TCodeBlock(
      code: dartCodeExample,
      showCopyButton: false,
      crossAxisAlignment: CrossAxisAlignment.center,
      theme: TCodeBlockTheme(
        fontSize: 12,
        margin: TOffset.a0,
        padding: TOffset.a24,
        backgroundColor: tw.light ? TColors.white80 : TColors.black80,
        border: Border.all(color: tw.light ? TColors.black20 : TColors.white30),
        borderRadius: TBorderRadius.rounded_none,
      ),
    );
  }
}

// =============================================================================
// CLASS: _TCodeBlockLanguages
// =============================================================================

@GenerateSource(buildMethodOnly: false)
class _TCodeBlockLanguages extends StatefulWidget {
  const _TCodeBlockLanguages();

  @override
  State<_TCodeBlockLanguages> createState() => __TCodeBlockLanguagesState();
}

class __TCodeBlockLanguagesState extends State<_TCodeBlockLanguages> {
  String selectedLanguage = 'dart';

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: TSpace.v16,
      children: [
        TSelect(
          initialValue: selectedLanguage,
          items: THighlighter.languages,
          itemBuilder: (item) => TText(
            item,
            style: const TextStyle(
              fontFamily: TTextStyle.fontFamilyMono,
            ),
          ),
          onChanged: (value) {
            if (value != null) {
              setState(() => selectedLanguage = value);
            }
          },
        ),
        TCodeBlock(
          language: selectedLanguage,
          code: codeSamples[selectedLanguage] ?? 'No code sample available.',
        ),
      ],
    );
  }
}
