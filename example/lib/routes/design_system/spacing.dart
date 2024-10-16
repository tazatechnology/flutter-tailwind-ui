import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/header.dart';
import 'package:flutter_tailwind_ui_example/layout/scroll_view.dart';

// =================================================
// CLASS: SpacingRoute
// =================================================

class SpacingRoute extends StatelessWidget {
  const SpacingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    var scale = 0.75;
    if (tw.screen_md) {
      scale = 1;
    }
    return AppScrollView.slivers(
      header: const AppSectionHeader(
        section: 'Design System',
        title: 'Spacing Scale',
      ),
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: TOffset.b32,
            child: TText(
              'The Flutter Tailwind UI spacing scale is a predefined set of values that helps developers consistently apply margin, padding, width, height, and other spacing-related properties in a design system.\n\nThese values range from `0px` to `384px` and can be accessed as static values from the `TSpacingScale` class. The values scale exponentially and this ensures consistent, scalable, and flexible spacing throughout your designs, enhancing both visual harmony and maintainability.',
            ),
          ),
        ),
        SliverList.separated(
          itemCount: TSpacingScale.values.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Row(
                children: [
                  SizedBox(
                    width: TSpacingScale.v160,
                    child: Text(
                      'Name',
                      style: tw.text_sm.semibold,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: TSpacingScale.v60,
                    child: Text(
                      'Value',
                      style: tw.text_sm.semibold,
                    ),
                  ),
                ],
              );
            }
            final name = TSpacingScale.values.keys.elementAt(index - 1);
            final value = TSpacingScale.values.values.elementAt(index - 1);
            return SpacingValueWidget(
              name: name,
              value: value,
              scale: scale,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(height: TSpacingScale.v14);
          },
        ),
      ],
    );
  }
}

// =================================================
// CLASS: SpacingValueWidget
// =================================================

class SpacingValueWidget extends StatelessWidget {
  const SpacingValueWidget({
    required this.name,
    required this.value,
    required this.scale,
    super.key,
  });
  final String name;
  final double value;
  final double scale;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    return Row(
      children: [
        SizedBox(
          width: TSpacingScale.v160,
          child: TText(
            '`TSpacingScale.$name`',
            style: tw.text_sm,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: TSpacingScale.v60,
          child: TText(
            '`${value.toInt()}`',
            style: tw.text_sm.mono,
          ),
        ),
        Flexible(
          child: Container(
            color: TColors.cyan.shade400,
            height: TSpacingScale.v16,
            width: value * scale,
          ),
        ),
      ],
    );
  }
}
