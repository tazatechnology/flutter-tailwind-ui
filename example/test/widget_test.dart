import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_tailwind_ui_example/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlutterTailwindApp());
  });
}
