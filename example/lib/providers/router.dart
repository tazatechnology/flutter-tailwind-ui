// Prefer to use underscore to match filenames
// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui_app/layout/scaffold.dart';
import 'package:flutter_tailwind_ui_app/routes/routes.dart';
import 'package:go_router/go_router.dart';

/// App router provider
final appRouterProvider = Provider<AppRouter>((ref) => AppRouter());

// =============================================================================
// CLASS: AppRouter
// =============================================================================

class AppRouter {
  AppRouter() {
    final componentMap = <String, Widget>{
      AppRouter.badge: const ComponentRouteTBadge(),
      AppRouter.button: const ComponentRouteTButton(),
      AppRouter.icon_button: const ComponentRouteTIconButton(),
      AppRouter.code_block: const ComponentRouteTCodeBlock(),
      AppRouter.radio_list: const ComponentRouteTRadioList(),
      AppRouter.row_column: const ComponentRouteTRowColumn(),
      AppRouter.scrollbar: const ComponentRouteTScrollbar(),
      AppRouter.sized_box: const ComponentRouteTSizedBox(),
      AppRouter.text: const ComponentRouteTText(),
    };

    final routes = [
      /// Getting Started
      GoRoute(
        name: about,
        path: '/',
        builder: (context, state) => const AboutRoute(),
      ),
      GoRoute(
        name: usage,
        path: '/$usage',
        builder: (context, state) => const UsageRoute(),
      ),

      /// Design System
      GoRoute(
        name: colors,
        path: '/$colors',
        builder: (context, state) => const ColorsRoute(),
      ),
      GoRoute(
        name: spacing,
        path: '/$spacing',
        builder: (context, state) => const SpacingRoute(),
      ),
      GoRoute(
        name: typography,
        path: '/$typography',
        builder: (context, state) => const TypographyRoute(),
      ),

      /// Components
      for (final c in componentMap.entries)
        GoRoute(
          name: c.key,
          path: '/${c.key}',
          builder: (context, state) => c.value,
        ),
    ];

    /// Build the outer instance
    router = GoRouter(
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return AppScaffold(child: child);
          },
          routes: routes,
        ),
      ],
      redirect: (context, state) {
        // Redirect to the default route on page not found
        if (state.topRoute == null) {
          return '/';
        }
        return null;
      },
    );
  }
  late final GoRouter router;

  /// Getting Started
  static const String about = 'about';
  static const String usage = 'usage';

  /// Design System
  static const String colors = 'colors';
  static const String spacing = 'spacing';
  static const String typography = 'typography';

  /// Components
  static const String badge = 'badge';
  static const String button = 'button';
  static const String icon_button = 'icon-button';
  static const String code_block = 'code-block';
  static const String radio_list = 'radio-list';
  static const String row_column = 'row-column';
  static const String scrollbar = 'scrollbar';
  static const String sized_box = 'sized-box';
  static const String text = 'text';
}
