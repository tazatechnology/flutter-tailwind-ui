import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  group('TSelect:', () {
    testWidgets('Height', (tester) async {
      for (final size in TInputSize.values) {
        final key = Key('select-$size');
        await tester.pumpWidget(
          TestMaterialApp(
            child: TSelect(
              key: key,
              size: size,
              items: const [1, 2, 3],
            ),
          ),
        );
        final finder = find.byKey(key);
        final Size widgetSize = tester.getSize(finder);
        expect(widgetSize.height, equals(size.height));
      }
    });
  });
}
