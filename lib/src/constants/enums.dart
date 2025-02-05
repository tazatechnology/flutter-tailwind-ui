import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// ENUM: TWidgetSize
// =============================================================================

/// A size enumeration used by badges and buttons variants.
enum TWidgetSize {
  /// An extra-small widget.
  xs,

  /// A small widget.
  sm,

  /// A medium widget.
  md,

  /// A large widget.
  lg,

  /// An extra-large widget.
  xl,
}

/// Extension for the [TWidgetSize] enum
extension XTailwindWidgetSize on TWidgetSize {
  /// The title of the widget size
  String get title {
    switch (this) {
      case TWidgetSize.xs:
        return 'Extra Small';
      case TWidgetSize.sm:
        return 'Small';
      case TWidgetSize.md:
        return 'Medium';
      case TWidgetSize.lg:
        return 'Large';
      case TWidgetSize.xl:
        return 'Extra Large';
    }
  }
}

// =============================================================================
// ENUM: TInputSize
// =============================================================================

/// A size enumeration used but by input fields and select menus.
enum TInputSize {
  /// A small widget.
  sm,

  /// A medium widget.
  md,

  /// A large widget.
  lg,
}

/// Extension for the [TInputSize] enum
extension XTailwindInputSize on TInputSize {
  /// The title of the input size
  String get title {
    switch (this) {
      case TInputSize.sm:
        return 'Small';
      case TInputSize.md:
        return 'Medium';
      case TInputSize.lg:
        return 'Large';
    }
  }

  /// The fixed height for the given input size.
  ///
  /// This will match the respective [TWidgetSize] heights for a button.
  double get height {
    switch (this) {
      case TInputSize.sm:
        return TButton.getDefaultHeight(TWidgetSize.sm);
      case TInputSize.md:
        return TButton.getDefaultHeight(TWidgetSize.md);
      case TInputSize.lg:
        return TButton.getDefaultHeight(TWidgetSize.lg);
    }
  }

  /// Default text style for the given input size
  ///
  /// This will match the respective [TWidgetSize] heights for a button.
  TextStyle get textStyle {
    TextStyle style;
    switch (this) {
      case TInputSize.sm:
        style = TButton.getDefaultTextStyle(TWidgetSize.sm);
      case TInputSize.md:
        style = TButton.getDefaultTextStyle(TWidgetSize.md);
      case TInputSize.lg:
        style = TButton.getDefaultTextStyle(TWidgetSize.lg);
    }
    return style.copyWith(fontWeight: TFontWeight.normal);
  }
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
extension XTailwindStyleVariant on TStyleVariant {
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
extension XTailwindControlAffinity on TControlAffinity {
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
extension XTailwindSelectionGroupVariant on TSelectionGroupVariant {
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
        return TSpace.v16;
      case TSelectionGroupVariant.card:
        return TSpace.v12;
      case TSelectionGroupVariant.panel:
        return TSpace.v0;
    }
  }
}
