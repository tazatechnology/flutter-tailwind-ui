import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TCard
// =============================================================================

/// A Tailwind UI inspired card.
class TCard extends StatelessWidget {
  /// Initialize the card.
  const TCard({
    super.key,
    this.child,
    this.color,
    this.shape,
    this.elevation,
    this.padding,
  });

  /// The child widget to display inside the card.
  final Widget? child;

  /// The border side of the card.
  final Color? color;

  /// The border side of the card.
  final ShapeBorder? shape;

  /// The elevation of the card.
  final double? elevation;

  /// The inner padding of the card.
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final cardTheme = context.theme.cardTheme;

    return CardTheme(
      data: cardTheme.copyWith(
        color: color,
        shape: shape,
        elevation: elevation,
        margin: EdgeInsets.zero,
      ),
      child: Card(
        child: Padding(
          padding: padding ?? TOffset.a16,
          child: child,
        ),
      ),
    );
  }
}
