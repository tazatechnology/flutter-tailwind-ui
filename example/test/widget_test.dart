import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Pump Application', (WidgetTester tester) async {
    await tester.pumpWidget(
      Container(),
    );
  });
}
