import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  group('TSelect:', () {
    testWidgets('Height', (WidgetTester tester) async {
      const key = Key('input');
      await tester.pumpWidget(
        const TestMaterialApp(
          child: TSelect(
            key: key,
            items: [1, 2, 3],
          ),
        ),
      );
      final finder = find.byKey(key);
      final Size size = tester.getSize(finder);
      // Account for the foreground decoration
      expect(size.height, equals(kTDefaultInputHeight));
    });
  });
}
