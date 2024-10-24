import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/routes/components/component_route.dart';

// =================================================
// CLASS: ComponentRouteTBadge
// =================================================

class ComponentRouteTBadge extends StatelessWidget {
  const ComponentRouteTBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return ComponentRoute(
      name: 'TBadge',
      description: 'A widget',
      children: [
        TText(
          'The Flutter Tailwind UI $tw',
        ),
        TBadge(
          theme: tw.component.badge.copyWith(
              // radius: TStateProperty(TBorderRadius.rounded_sm, (states) {
              //   if (states.contains(TState.hovered)) {
              //     return TBorderRadius.rounded_lg;
              //   }
              //   return TBorderRadius.rounded_sm;
              // }),
              // padding: TStateProperty(TOffset.a6, (states) {
              //   if (states.contains(TState.hovered)) {
              //     return TOffset.a8;
              //   }
              //   return null;
              // }),
              // backgroundColor: TStateProperty(TColors.indigo, (states) {
              //   if (states.contains(TState.hovered)) {
              //     return TColors.indigo.withOpacity(0.85);
              //   }
              //   return null;
              // }),
              ),
          child: const Text('Dart Docs'),
        ),
        TBadge(
          theme: TBadgeTheme.fromColor(
            color: TColors.sky,
            context: context,
          ),
          child: const Text('TColors.red'),
          onDismiss: () {},
        ),
      ],
    );
  }
}
