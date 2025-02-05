import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  group('TInput:', () {
    testWidgets('Height', (WidgetTester tester) async {
      for (final size in TInputSize.values) {
        final key = Key('input-$size');
        await tester.pumpWidget(
          TestMaterialApp(
            child: TInput(
              key: key,
              size: size,
            ),
          ),
        );
        final finder = find.byKey(key);
        final Size widgetSize = tester.getSize(finder);
        // Account for the border thickness due to how inputs are rendered in Flutter
        expect(widgetSize.height, equals(size.height - 2));
      }
    });
  });
}
