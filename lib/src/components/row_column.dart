import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    switch (axis) {
      case Axis.horizontal:
        return Row(
          spacing: spacing,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: children,
        );
      case Axis.vertical:
        return Column(
          spacing: spacing,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: children,
        );
    }
  }
}
