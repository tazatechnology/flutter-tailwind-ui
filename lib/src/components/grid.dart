import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TGrid
// =============================================================================

/// A simple grid layout widget that arranges its children in a grid format
class TGrid extends StatelessWidget {
  /// Construct a [TGrid] widget.
  const TGrid({
    super.key,
    this.spacing = 0,
    this.runSpacing = 0,
    this.columns = 1,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    required this.children,
  });

  /// The spacing between grid items (horizontally)
  final double spacing;

  /// The spacing between grid items (vertically)
  final double runSpacing;

  /// The number of columns in the grid.
  final int columns;

  /// The list of child widgets to be displayed in the grid.
  final List<Widget> children;

  /// The alignment of the children on the cross axis.
  final WrapCrossAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewPortWidth = constraints.maxWidth - spacing * (columns - 1);
        return Wrap(
          spacing: spacing,
          runSpacing: runSpacing,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            for (final x in children)
              TSizedBox.x(size: viewPortWidth / columns, child: x),
          ],
        );
      },
    );
  }
}
