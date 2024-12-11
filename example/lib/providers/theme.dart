import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for setting the global theme mode
final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});
