import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

void main() {
  group('TColor:', () {
    late Map<String, Map<String, String>> tailwindColors;

    // Load the JSON file before each test
    setUpAll(() async {
      final File file = File('test/data/colors.json');
      final String response = await file.readAsString();
      final data = Map<String, dynamic>.from(json.decode(response));
      tailwindColors = data.map(
        (key, value) => MapEntry<String, Map<String, String>>(
          key,
          Map<String, String>.from(value),
        ),
      );
    });

    test('Confirm hex codes', () {
      for (final name in tailwindColors.keys) {
        final shades = tailwindColors[name]!;
        final color = TColor.get(name);
        for (final e in shades.entries) {
          final shade = int.parse(e.key);
          final hex = e.value.toUpperCase().replaceFirst('#', '');
          final colorShadeValue = color[shade]
              ?.value
              .toRadixString(16)
              .padLeft(8, '0')
              .toUpperCase();

          expect(
            'FF$hex',
            colorShadeValue,
            reason: 'Mismatch in $name color $shade',
          );
        }
      }
    });

    test('Get by name', () {
      for (final name in tailwindColors.keys) {
        TColor.get(name);
      }
    });

    test('Get by name (invalid)', () {
      expect(() => TColor.get('invalid'), throwsException);
    });
  });
}
