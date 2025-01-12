import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/providers/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

// =============================================================================
// CLASS: AppToolbar
// =============================================================================

class AppToolbar extends StatelessWidget {
  const AppToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final light = context.tw.light;
    return Row(
      spacing: TSpace.v14,
      children: [
        Link(
          uri: Uri.parse(
            'https://pub.dev/documentation/flutter_tailwind_ui/latest',
          ),
          target: LinkTarget.blank,
          builder: (context, followLink) {
            return TIconButton(
              tooltip: 'API Reference',
              icon: SvgPicture.asset(
                'assets/img/dart.svg',
                semanticsLabel: 'Tailwind UI (Flutter)',
                height: TSpace.v20,
              ),
              onPressed: followLink,
            );
          },
        ),
        const ThemeToggleButton(),
        Link(
          uri: Uri.parse(
            'https://github.com/tazatechnology/flutter-tailwind-ui',
          ),
          target: LinkTarget.blank,
          builder: (context, followLink) {
            return TIconButton(
              color: light ? TColors.slate : TColors.slate.shade400,
              tooltip: 'GitHub Repository',
              icon: const Icon(FontAwesomeIcons.github, size: TSpace.v20),
              onPressed: followLink,
            );
          },
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: ThemeToggleButton
// =============================================================================

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final light = context.tw.light;
    return TIconButton(
      color: light ? TColors.slate : TColors.slate.shade400,
      tooltip: 'Toggle Theme',
      onPressed: () {
        final notifier = ref.read(themeModeProvider.notifier);
        if (light) {
          notifier.state = ThemeMode.dark;
        } else {
          notifier.state = ThemeMode.light;
        }
      },
      icon: AnimatedSwitcher(
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
          size: TSpace.v20,
        ),
      ),
    );
  }
}
