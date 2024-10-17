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

  /// Returns the name of the control affinity
  String get name {
    switch (this) {
      case TControlAffinity.leading:
        return 'Leading';
      case TControlAffinity.trailing:
        return 'Trailing';
    }
  }
}
