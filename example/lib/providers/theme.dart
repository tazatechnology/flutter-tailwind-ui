import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

/// Provider for setting the global theme mode
final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});

/// Light theme provider
final themeLightProvider = StateProvider<ThemeData>((ref) {
  return TailwindTheme.light().data;
});

/// Dark theme provider
final themDarkProvider = StateProvider<ThemeData>((ref) {
  return TailwindTheme.dark().data;
});
