import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/providers/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// =================================================
// CLASS: AppToolbar
// =================================================

class AppToolbar extends StatelessWidget {
  const AppToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: tw.screen.is_sm ? TSpace.v20 : TSpace.v14,
      children: [
        InkWell(
          child: SvgPicture.asset(
            'assets/img/dart.svg',
            semanticsLabel: 'Tailwind UI (Flutter)',
            height: TSpace.v20,
          ),
          onTap: () {},
        ),
        const ThemeToggleButton(),
        InkWell(
          child: const Icon(
            FontAwesomeIcons.github,
            size: TSpace.v20,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

// =================================================
// CLASS: ThemeToggleButton
// =================================================

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final light = context.tw.light;

    return InkWell(
      onTap: () {
        final notifier = ref.read(themeModeProvider.notifier);
        if (light) {
          notifier.state = ThemeMode.dark;
        } else {
          notifier.state = ThemeMode.light;
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 375),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationTransition(
            turns: child.key == const ValueKey('sun')
                ? Tween<double>(begin: 0, end: 0.25).animate(animation)
                : Tween<double>(begin: 0, end: -0.1).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: Icon(
          light ? Icons.light_mode : Icons.nightlight,
          key: ValueKey(light ? 'sun' : 'moon'),
          size: 24,
        ),
      ),
    );
  }
}
