part of 'getting_started.dart';

// =============================================================================
// CLASS: UsageRoute
// =============================================================================

class UsageRoute extends StatelessWidget {
  const UsageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.gettingStarted,
        title: 'Quick Start',
        description: 'Get started quickly with Flutter Tailwind UI',
      ),
      children: const [
        Text('Content'),
      ],
    );
  }
}
