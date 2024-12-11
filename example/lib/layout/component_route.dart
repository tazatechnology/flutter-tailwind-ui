import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui_app/layout/header.dart';
import 'package:flutter_tailwind_ui_app/layout/scroll_view.dart';

// =============================================================================
// CLASS: ComponentRoute
// =============================================================================

class ComponentRoute extends StatelessWidget {
  const ComponentRoute({
    required this.name,
    required this.description,
    this.children = const [],
    this.slivers = const [],
    super.key,
  });
  final String name;
  final String description;
  final List<Widget> children;
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    final header = AppRouteHeader(
      section: AppSectionType.components,
      titleMono: true,
      title: name,
      className: name,
      description: description,
    );
    if (slivers.isNotEmpty) {
      return AppScrollView.slivers(
        header: header,
        slivers: children,
      );
    } else {
      return AppScrollView.children(
        header: header,
        children: children,
      );
    }
  }
}
