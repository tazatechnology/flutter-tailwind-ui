import 'dart:convert';
import 'dart:io';

import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TColor:', () {
    late Map<String, Map<String, String>> tailwindColors;

    // Load the JSON file before each test
    setUpAll(() async {
      final file = File('test/data/colors.json');
      final response = await file.readAsString();
      final data = Map<String, dynamic>.from(
        jsonDecode(response) as Map<String, dynamic>,
      );
      tailwindColors = data.map(
        (key, value) => MapEntry<String, Map<String, String>>(
          key,
          Map<String, String>.from(value as Map<dynamic, dynamic>),
        ),
      );
    });

    test('Confirm hex codes', () {
      for (final name in tailwindColors.keys) {
        final shades = tailwindColors[name]!;
        final color = TColors.get(name);
        for (final e in shades.entries) {
          final shade = int.parse(e.key);
          final hex = e.value.replaceFirst('#', '');
          final colorShadeValue = color[shade]?.toHex();
          // Add alpha channel to hex code and compare to the expected value
          expect(
            '#ff$hex',
            colorShadeValue,
            reason: 'Mismatch in $name color $shade',
          );
        }
      }
    });

    test('Get by name', () {
      tailwindColors.keys.forEach(TColors.get);
    });

    test('Get by name (invalid)', () {
      expect(() => TColors.get('invalid'), throwsException);
    });
  });
}
