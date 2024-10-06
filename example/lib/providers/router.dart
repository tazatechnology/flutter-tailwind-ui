import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui_example/layout/scaffold.dart';
import 'package:flutter_tailwind_ui_example/routes/routes.dart';
import 'package:go_router/go_router.dart';

/// App router provider
final appRouterProvider = Provider<AppRouter>((ref) => AppRouter());

// =================================================
// CLASS: AppRouter
// =================================================

class AppRouter {
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
                return _buildPage(state: state, child: const HomeRoute());
              },
            ),
            GoRoute(
              name: colors,
              path: '/$colors',
              pageBuilder: (context, state) {
                return _buildPage(state: state, child: const ColorsRoute());
              },
            ),
            GoRoute(
              name: spacing,
              path: '/$spacing',
              pageBuilder: (context, state) {
                return _buildPage(state: state, child: const SpacingRoute());
              },
            ),
            GoRoute(
              name: typography,
              path: '/$typography',
              pageBuilder: (context, state) {
                return _buildPage(state: state, child: const TypographyRoute());
              },
            ),
          ],
        ),
      ],
    );
  }
  static const String home = 'home';
  static const String colors = 'colors';
  static const String spacing = 'spacing';
  static const String typography = 'typography';

  /// GoRouter instance
  late final GoRouter router;

  /// Helper function to build a page with any page transition animation/delay
  NoTransitionPage<T> _buildPage<T>({
    required GoRouterState state,
    required Widget child,
    String? restorationId,
    Object? arguments,
  }) {
    return NoTransitionPage<T>(
      name: state.name,
      restorationId: restorationId,
      arguments: arguments,
      child: child,
    );
  }
}
