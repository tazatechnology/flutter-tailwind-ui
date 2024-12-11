import 'package:flutter/material.dart';

// =============================================================================
// EXTENSION: XTailwindWidgetState
// =============================================================================

/// Extension on [Set]<[WidgetState]> to provide additional useful properties
extension XTailwindWidgetState on Set<WidgetState> {
  /// Returns true if the set contains a [WidgetState.hovered] state
  bool get hovered => contains(WidgetState.hovered);

  /// Returns true if the set contains a [WidgetState.focused] state
  bool get focused => contains(WidgetState.focused);

  /// Returns true if the set contains a [WidgetState.pressed] state
  bool get pressed => contains(WidgetState.pressed);

  /// Returns true if the set contains a [WidgetState.dragged] state
  bool get dragged => contains(WidgetState.dragged);

  /// Returns true if the set contains a [WidgetState.selected] state
  bool get selected => contains(WidgetState.selected);

  /// Returns true if the set contains a [WidgetState.scrolledUnder] state
  bool get scrolledUnder => contains(WidgetState.scrolledUnder);

  /// Returns true if the set contains a [WidgetState.disabled] state
  bool get disabled => contains(WidgetState.disabled);

  /// Returns true if the set contains a [WidgetState.error] state
  bool get error => contains(WidgetState.error);
}
