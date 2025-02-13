import 'package:flutter/material.dart';

// =============================================================================
// CLASS: TExpand
// =============================================================================

/// A widget to expand content along an axis.
class TExpand extends StatelessWidget {
  /// Constructor for a horizontal expand.
  const TExpand.width({
    super.key,
    this.child,
    this.alignment = Alignment.center,
  }) : _axis = Axis.horizontal;

  /// Constructor for a vertical expand.
  const TExpand.height({
    super.key,
    this.child,
    this.alignment = Alignment.center,
  }) : _axis = Axis.vertical;

  /// Constructor for expanding along an axes.
  const TExpand.axis({
    super.key,
    this.child,
    this.alignment = Alignment.center,
    required Axis? axis,
  }) : _axis = axis;

  /// The axis to expand along.
  final Axis? _axis;

  /// The child widget to expand.
  final Widget? child;

  /// The alignment of the child.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    if (_axis == null) {
      return child ?? const SizedBox.shrink();
    }
    return FractionallySizedBox(
      alignment: alignment,
      widthFactor: _axis == Axis.horizontal ? 1 : null,
      heightFactor: _axis == Axis.vertical ? 1 : null,
      child: child,
    );
  }
}
