import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

/// A custom widget that arranges its children either in a [Column] or [Row]
/// based on the [axis] property.
///
/// This widget takes a list of children and lays them out horizontally if
/// [axis] is [Axis.horizontal] or vertically if [axis] is [Axis.vertical].
///
/// The [TRowColumn] widget makes it easy to switch between horizontal and
/// vertical layouts without changing the entire widget tree structure.
class TRowColumn extends StatelessWidget {
  /// Creates a [TRowColumn] widget.
  ///
  /// The [axis] parameter must not be null.
  /// The [children] parameter must not be null and must not contain null widgets.
  const TRowColumn({
    required this.axis,
    required this.children,
    super.key,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.spacing = 0.0,
    this.separated = false,
  });

  /// The axis in which to arrange the children.
  ///
  /// If [axis] is [Axis.horizontal], the children will be arranged in a [Row].
  /// If [axis] is [Axis.vertical], the children will be arranged in a [Column].
  final Axis axis;

  /// The list of widgets to display as children.
  ///
  /// Must not be null and must not contain null widgets.
  final List<Widget> children;

  /// How the children should be placed along the main axis.
  ///
  /// This is passed directly to the [Row.mainAxisAlignment] or
  /// [Column.mainAxisAlignment] properties.
  final MainAxisAlignment? mainAxisAlignment;

  /// How the children should be placed along the cross axis.
  ///
  /// This is passed directly to the [Row.crossAxisAlignment] or
  /// [Column.crossAxisAlignment] properties.
  final CrossAxisAlignment? crossAxisAlignment;

  /// The amount of space to place between each child.
  final double spacing;

  /// Whether to add a separator element between each child.
  final bool separated;

  @override
  Widget build(BuildContext context) {
    final spacedChildren = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      spacedChildren.add(
        Flexible(
          child: Container(
            padding: EdgeInsets.only(
              right: axis == Axis.horizontal && i < children.length - 1
                  ? spacing
                  : 0.0,
            ),
            decoration: BoxDecoration(
              border: separated &&
                      axis == Axis.horizontal &&
                      i < children.length - 1
                  ? Border(
                      right: BorderSide(
                        color: context.theme.dividerColor,
                        width: context.theme.dividerTheme.thickness ?? 1,
                      ),
                    )
                  : null,
            ),
            child: children[i],
          ),
        ),
      );
      if (i < children.length - 1) {
        if (separated && axis == Axis.vertical) {
          spacedChildren.add(Divider(height: spacing));
        } else {
          spacedChildren.add(
            SizedBox(
              width: axis == Axis.horizontal ? spacing : 0.0,
              height: axis == Axis.vertical ? spacing : 0.0,
            ),
          );
        }
      }
    }

    switch (axis) {
      case Axis.horizontal:
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: spacedChildren,
        );
      case Axis.vertical:
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: spacedChildren,
        );
    }
  }
}
