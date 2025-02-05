import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  group('TBadge:', () {
    testWidgets('Height', (WidgetTester tester) async {
      for (final size in TWidgetSize.values) {
        final key = Key('badge-$size');
        await tester.pumpWidget(
          TestMaterialApp(
            child: TBadge(
              key: key,
              size: size,
              child: const Text('Button'),
            ),
          ),
        );
        final finder = find.byKey(key);
        final Size widgetSize = tester.getSize(finder);
        expect(widgetSize.height, equals(TBadge.getDefaultHeight(size)));
      }
    });
  });
}
