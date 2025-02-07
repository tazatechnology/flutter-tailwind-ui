import 'package:flutter/material.dart';

// =============================================================================
// EXTENSION: XTailwindAlignment
// =============================================================================

/// Extension on Alignment to provide additional useful properties
extension XTailwindAlignment on Alignment {
  /// The title of the alignment
  String get title {
    switch (this) {
      case Alignment.topLeft:
        return 'Top Left';
      case Alignment.topCenter:
        return 'Top Center';
      case Alignment.topRight:
        return 'Top Right';
      case Alignment.centerLeft:
        return 'Center Left';
      case Alignment.center:
        return 'Center';
      case Alignment.centerRight:
        return 'Center Right';
      case Alignment.bottomLeft:
        return 'Bottom Left';
      case Alignment.bottomCenter:
        return 'Bottom Center';
      case Alignment.bottomRight:
        return 'Bottom Right';
      default:
        return 'Unknown';
    }
  }
}
