import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

class TestMaterialApp extends StatelessWidget {
  const TestMaterialApp({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tailwind UI',
      debugShowCheckedModeBanner: false,
      themeAnimationDuration: Duration.zero,
      theme: TailwindTheme.light().themeData,
      darkTheme: TailwindTheme.dark().themeData,
      home: Scaffold(
        body: child,
      ),
    );
  }
}
