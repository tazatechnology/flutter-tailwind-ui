import 'package:flutter_tailwind_ui/src/constants/space.dart';

// =============================================================================
// ENUM: TWidgetSize
// =============================================================================

/// A size enumeration used but badges and buttons variants.
enum TWidgetSize {
  /// An extra-small button.
  xs,

  /// A small button.
  sm,

  /// A medium button.
  md,

  /// A large button.
  lg,

  /// An extra-large button.
  xl,
}

// =============================================================================
// ENUM: TStyleVariant
// =============================================================================

/// The variant of the styled container.
enum TStyleVariant {
  /// A basic styled container.
  basic,

  /// An outlined styled container.
  outlined,

  /// A filled styled container.
  filled,

  /// A filled styled container with soft colors.
  soft,
}

/// Extension for the [TStyleVariant] enum
extension XTailwindTStyleVariant on TStyleVariant {
  /// Return the name of the variant
  String get title {
    final n = toString().split('.').last;
    return n[0].toUpperCase() + n.substring(1);
  }
}

// =============================================================================
// ENUM: TControlAffinity
// =============================================================================

/// Enum for the control affinity (position) of a control element
///
/// This applies to radios, checkboxes, and switches
enum TControlAffinity {
  /// The control is placed before the label
  leading,

  /// The control is placed after the label
  trailing,
}

/// Extension for the [TControlAffinity] enum
extension XTailwindTControlAffinity on TControlAffinity {
  /// Returns whether the control is leading
  bool get isLeading => this == TControlAffinity.leading;

  /// Returns whether the control is trailing
  bool get isTrailing => this == TControlAffinity.trailing;

  /// Return the name of the variant
  String get title {
    final n = toString().split('.').last;
    return n[0].toUpperCase() + n.substring(1);
  }
}

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
