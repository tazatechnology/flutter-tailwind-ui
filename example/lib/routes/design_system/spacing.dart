import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/header.dart';
import 'package:flutter_tailwind_ui_example/layout/scroll_view.dart';
import 'package:flutter_tailwind_ui_example/widgets/value_table.dart';

// =================================================
// CLASS: SpacingRoute
// =================================================

class SpacingRoute extends StatelessWidget {
  const SpacingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    var scale = 0.0;
    if (tw.screen.is_md) {
      scale = 1;
    } else if (tw.screen.is_xs) {
      scale = 0.6;
    } else {
      scale = 0.4;
    }

    // Build the table items
    final items = <AppValueTableItem>[];
    for (var ii = 0; ii < TSpace.values.length; ii++) {
      final name = TSpace.values.keys.elementAt(ii);
      final value = TSpace.values.values.elementAt(ii);
      final item = AppValueTableItem(
        name: 'TSpace.$name',
        value: value.toInt().toString(),
        widget: Flexible(
          child: Container(
            color: TColors.cyan.shade400,
            height: TSpace.v16,
            width: value * scale,
          ),
        ),
      );
      items.add(item);
    }

    return AppScrollView.children(
      header: const AppSectionHeader(
        section: 'Design System',
        title: 'Spacing Scale',
      ),
      children: [
        const TText(
          'The Flutter Tailwind UI spacing scale is a predefined set of values that helps developers consistently apply margin, padding, width, height, and other spacing-related properties in a design system.\n\nThese values range from `0px` to `384px` and can be accessed as static values from the `TSpace` class. The values scale exponentially and this ensures consistent, scalable, and flexible spacing throughout your designs, enhancing both visual harmony and maintainability.',
        ),
        AppValueTable(
          height: null,
          header: const [Text('Name'), Text('Value')],
          nameWidth: TSpace.v112,
          valueWidth: TSpace.v72,
          items: items,
        ),
      ],
    );
  }
}
