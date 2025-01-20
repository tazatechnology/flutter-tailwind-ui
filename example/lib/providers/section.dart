import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui_app/layout/header.dart';

/// Track the current section of the app
final sectionProvider = StateProvider<AppSection?>((ref) {
  return null;
});
