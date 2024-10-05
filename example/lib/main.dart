import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tailwind_ui_example/providers/router.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_tailwind_ui_example/providers/theme.dart';

void main() async {
  runApp(
    /// AppInfo to easily access package and device information
    /// See: https://pub.dev/packages/flutter_app_info
    AppInfo(
      data: await AppInfoData.get(),
      child: ProviderScope(
        child: const FlutterTailwindApp(),
      ),
    ),
  );
}

// =================================================
// CLASS: FlutterTailwindApp
// =================================================

class FlutterTailwindApp extends ConsumerWidget {
  const FlutterTailwindApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Tailwind UI',
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeModeProvider),
      theme: ref.watch(themeLightProvider),
      darkTheme: ref.watch(themDarkProvider),
      routerConfig: ref.read(appRouterProvider).router,
    );
  }
}
