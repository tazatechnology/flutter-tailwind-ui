import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('THighlighter:', () {
    late Map<String, Map<String, dynamic>> grammarJson;

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

    // Load the JSON file before each test
    setUpAll(() async {
      grammarJson = {};
      for (final language in THighlighter.languages) {
        final file = File('grammar/$language.json');
        final response = await file.readAsString();
        final data = Map<String, dynamic>.from(
          jsonDecode(response) as Map<String, dynamic>,
        );
        grammarJson[language] = data;
      }
    });

    test('Ensure JSON valid', () async {
      for (final language in THighlighter.languages) {
        final grammar = grammarJson[language];
        for (final brightness in Brightness.values) {
          await THighlighter.load(
            language: language,
            brightness: brightness,
            grammar: grammar,
          );
        }
      }
    });

    test('Verify default loading', () async {
      for (final language in THighlighter.languages) {
        for (final brightness in Brightness.values) {
          await THighlighter.load(
            language: language,
            brightness: brightness,
          );
        }
      }
    });

    test('Test bad language', () async {
      expect(
        () async {
          await THighlighter.load(
            language: 'bad_language',
            brightness: Brightness.light,
          );
        },
        throwsA(isA<Exception>()),
      );
    });

    for (final language in THighlighter.languages) {
      test('Syntax parsing: $language', () async {
        for (final brightness in Brightness.values) {
          await THighlighter.load(
            language: language,
            brightness: brightness,
          );
          // Parse dummy code
          final span = THighlighter.parse(
            code: codeSamples[language]!,
            language: language,
            brightness: brightness,
          );
          final children = span.children?.length ?? 0;
          assert(
            children > 0,
            'Expected children in TextSpan for language: $language',
          );
          // Parse empty code
          final resultEmpty = THighlighter.parse(
            code: '',
            language: language,
            brightness: brightness,
          );
          assert(
            resultEmpty.children?.isEmpty ?? false,
            'Expected only no span for empty code: $language',
          );
        }
      });
    }
  });
}
