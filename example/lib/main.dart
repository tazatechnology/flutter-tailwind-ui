import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/providers/router.dart';
import 'package:flutter_tailwind_ui_app/providers/theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  // Initialize the Flutter app
  WidgetsFlutterBinding.ensureInitialized();

  // Will remove the "#" from website URLs
  if (kIsWeb) {
    usePathUrlStrategy();
  }

  // Desktop only window management
  if (!kIsWeb) {
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      // Generally the smallest window sizes to design for in modern UIs
      minimumSize: Size(360, 540),
    );
    await windowManager.waitUntilReadyToShow(windowOptions);
  }

  runApp(
    /// AppInfo to easily access package and device information
    /// See: https://pub.dev/packages/flutter_app_info
    AppInfo(
      data: await AppInfoData.get(),
      child: const ProviderScope(
        child: FlutterTailwindApp(),
      ),
    ),
  );
}

// =============================================================================
// CLASS: FlutterTailwindApp
// =============================================================================

class FlutterTailwindApp extends ConsumerWidget {
  const FlutterTailwindApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Tailwind UI',
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeModeProvider),
      themeAnimationDuration: Duration.zero,
      theme: TailwindTheme.light().data,
      darkTheme: TailwindTheme.dark().data,
      routerConfig: ref.read(appRouterProvider).router,
    );
  }
}
