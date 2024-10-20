// ignore_for_file: constant_identifier_names
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui_app/layout/scaffold.dart';
import 'package:flutter_tailwind_ui_app/routes/routes.dart';
import 'package:go_router/go_router.dart';

/// App router provider
final appRouterProvider = Provider<AppRouter>((ref) => AppRouter());

// =================================================
// CLASS: AppRouter
// =================================================

class AppRouter {
  AppRouter() {
    final routes = [
      // -------------------------------------------------
      // Getting Started
      // -------------------------------------------------
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
      // -------------------------------------------------
      // Design System
      // -------------------------------------------------
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
      // -------------------------------------------------
      // Components
      // -------------------------------------------------
      GoRoute(
        name: code_block,
        path: '/$code_block',
        builder: (context, state) => const ComponentRouteTCodeBlock(),
      ),
      GoRoute(
        name: radio_list,
        path: '/$radio_list',
        builder: (context, state) => const ComponentRouteTRadioList(),
      ),
      GoRoute(
        name: row_column,
        path: '/$row_column',
        builder: (context, state) => const ComponentRouteTRowColumn(),
      ),
      GoRoute(
        name: scrollbar,
        path: '/$scrollbar',
        builder: (context, state) => const ComponentRouteTScrollbar(),
      ),
      GoRoute(
        name: sized_box,
        path: '/$sized_box',
        builder: (context, state) => const ComponentRouteTSizedBox(),
      ),
      GoRoute(
        name: text,
        path: '/$text',
        builder: (context, state) => const ComponentRouteTText(),
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
    );
  }
  late final GoRouter router;

  // Getting Started
  static const String about = 'about';
  static const String usage = 'usage';
  // Design System
  static const String colors = 'colors';
  static const String spacing = 'spacing';
  static const String typography = 'typography';
  // Components
  static const String code_block = 'code-block';
  static const String radio_list = 'radio-list';
  static const String row_column = 'row-column';
  static const String scrollbar = 'scrollbar';
  static const String sized_box = 'sized-box';
  static const String text = 'text';
}
