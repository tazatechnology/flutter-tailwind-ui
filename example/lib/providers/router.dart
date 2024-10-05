import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui_example/routes/routes.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_tailwind_ui_example/layout/scaffold.dart';

/// App router provider
final appRouterProvider = Provider<AppRouter>((ref) => AppRouter());

// =================================================
// CLASS: AppRouter
// =================================================

class AppRouter {
  static const String home = 'home';
  static const String colors = 'colors';
  static const String spacing = 'spacing';
  static const String typography = 'typography';

  AppRouter() {
    router = GoRouter(
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return AppScaffold(child: child);
          },
          routes: [
            GoRoute(
              name: home,
              path: '/',
              pageBuilder: (context, state) {
                return _buildPage(state: state, child: HomeRoute());
              },
            ),
            GoRoute(
              name: colors,
              path: '/$colors',
              pageBuilder: (context, state) {
                return _buildPage(state: state, child: ColorsRoute());
              },
            ),
            GoRoute(
              name: spacing,
              path: '/$spacing',
              pageBuilder: (context, state) {
                return _buildPage(state: state, child: SpacingRoute());
              },
            ),
            GoRoute(
              name: typography,
              path: '/$typography',
              pageBuilder: (context, state) {
                return _buildPage(state: state, child: TypographyRoute());
              },
            ),
          ],
        ),
      ],
    );
  }

  /// GoRouter instance
  late final GoRouter router;

  /// Helper function to build a page with any page transition animation/delay
  NoTransitionPage _buildPage({
    required GoRouterState state,
    required Widget child,
    String? restorationId,
    Object? arguments,
  }) {
    return NoTransitionPage(
      name: state.name,
      restorationId: restorationId,
      arguments: arguments,
      child: child,
    );
  }
}
