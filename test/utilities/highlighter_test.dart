import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('THighlighter:', () {
    late Map<String, Map<String, dynamic>> grammarJson;

    const code = '''
/// Comment
# Comment
<!-- Comment -->
final x = 1 + 3;
print(x);
def hello():
  return 'Hello, World!'
void main() {
  print(hello());
}
''';

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
          final result = THighlighter.parse(
            code: code,
            language: language,
            brightness: brightness,
          );
          assert(
            result is TextSpan,
            'Returned span is not a TextSpan for language: $language',
          );
          final span = result as TextSpan;
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
            (resultEmpty as TextSpan).children?.isEmpty ?? false,
            'Expected only no span for empty code: $language',
          );
        }
      });
    }
  });
}
