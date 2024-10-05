import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

import 'package:flutter_tailwind_ui_example/providers/router.dart';

void main() {
  runApp(
    ProviderScope(
      child: const FlutterTailwindApp(),
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
    final router = ref.read(routerProvider);

    final tw = TailwindTheme();

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: tw.light(),
      darkTheme: tw.dark(),
      routerConfig: router,
    );
  }
}
