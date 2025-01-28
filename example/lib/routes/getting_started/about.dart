part of 'getting_started.dart';

// =============================================================================
// CLASS: AboutRoute
// =============================================================================

class AboutRoute extends StatelessWidget {
  const AboutRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollView.children(
      header: const AppRouteHeader(
        section: AppRouteType.gettingStarted,
        title: 'About',
        description: 'Philosophy and code principles',
      ),
      children: const [],
    );
  }
}
