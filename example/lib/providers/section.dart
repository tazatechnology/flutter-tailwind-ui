import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui_app/layout/header.dart';

/// Track the global key for each section
final sectionKeyProvider = Provider<Map<String, GlobalKey>>((ref) {
  return {};
});

/// Track the current section of the app
final sectionProvider = StateProvider<AppSection?>((ref) {
  return null;
});

String getSectionHeaderName({required String section, required String title}) {
  return '$section  >  $title';
}
