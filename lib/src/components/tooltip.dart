import 'package:flutter/material.dart';

// =================================================
// CLASS: TTooltip
// =================================================

/// A Tailwind inspired tooltip widget.
class TTooltip extends StatelessWidget {
  /// Cobnsructs a [TTooltip] widget.
  const TTooltip({
    required this.child,
    this.message,
    this.waitDuration,
    super.key,
  });

  /// The child widget to display the tooltip on.
  final Widget child;

  /// The message to display in the tooltip.
  final String? message;

  /// The duration to wait before showing the tooltip.
  final Duration? waitDuration;

  @override
  Widget build(BuildContext context) {
    // Completely bypass the tooltip
    if (message?.isEmpty ?? true) {
      return child;
    }
    return Tooltip(
      preferBelow: false,
      waitDuration: waitDuration,
      message: message ?? '',
      child: child,
    );
  }
}
