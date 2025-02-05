import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  group('TInput:', () {
    testWidgets('Height', (WidgetTester tester) async {
      const key = Key('input');
      await tester.pumpWidget(
        const TestMaterialApp(child: TInput(key: key)),
      );
      final finder = find.byKey(key);
      final Size size = tester.getSize(finder);
      // Account for the border thickness
      expect(size.height, equals(kTDefaultInputHeight - 2));
    });
  });
}
