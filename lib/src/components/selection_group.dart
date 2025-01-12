import 'package:flutter_tailwind_ui/src/constants/space.dart';

// =============================================================================
// ENUM: TSelectionGroupVariant
// =============================================================================

/// The variant of a selection group.
enum TSelectionGroupVariant {
  /// Basic list
  basic,

  /// Separated list
  separated,

  /// Place items in separated cards
  card,

  /// Place items in a panel
  panel,
}

/// Extension for the [TSelectionGroupVariant] enum
extension XTailwindTSelectionGroupVariant on TSelectionGroupVariant {
  /// Return the name of the variant
  String get title {
    final n = toString().split('.').last;
    return n[0].toUpperCase() + n.substring(1);
  }

  /// The default spacing between items for the variant
  double get spacing {
    switch (this) {
      case TSelectionGroupVariant.basic:
      case TSelectionGroupVariant.separated:
        return TSpace.v20;
      case TSelectionGroupVariant.card:
        return TSpace.v12;
      case TSelectionGroupVariant.panel:
        return TSpace.v0;
    }
  }
}
