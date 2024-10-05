import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui_example/routes/home.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_tailwind_ui_example/layout/scaffold.dart';

/// Router provider
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        // Shell route that wraps all routes
        ShellRoute(
          builder: (context, state, child) {
            return AppScaffold(child: child);
          },
          // Routes
          routes: [
            // Home Route
            GoRoute(
              path: '/',
              builder: (context, state) => HomeRoute(),
            ),
          ],
        ),
      ],
    );
  },
);
