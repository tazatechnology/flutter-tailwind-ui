import 'package:flutter/material.dart';

// =============================================================================
// CLASS: TWidgetStatesController
// =============================================================================

/// State controller for various library widgets.
///
/// This class extends [WidgetStatesController] and adds additional properties
/// such as [TWidgetStatesController.loading] property to manage a loading state
class TWidgetStatesController extends WidgetStatesController {
  /// Creates a [TWidgetStatesController] instance.
  TWidgetStatesController({
    bool loading = false,
    bool selected = false,
    bool disabled = false,
    bool error = false,
  }) : super({
          if (selected) WidgetState.selected,
          if (disabled) WidgetState.disabled,
          if (error) WidgetState.error,
        }) {
    _loading = loading;
  }

  /// Returns true if the state contains a [WidgetState.hovered] state
  ///
  /// This property is read-only.
  bool get hovered => value.contains(WidgetState.hovered);

  /// Returns true if the state contains a [WidgetState.focused] state
  ///
  /// This property is read-only.
  bool get focused => value.contains(WidgetState.focused);

  /// Returns true if the state contains a [WidgetState.pressed] state
  ///
  /// This property is read-only.
  bool get pressed => value.contains(WidgetState.pressed);

  /// Returns true if the state contains a [WidgetState.dragged] state
  ///
  /// This property is read-only.
  bool get dragged => value.contains(WidgetState.dragged);

  /// Returns true if the state contains a [WidgetState.scrolledUnder] state
  ///
  /// This property is read-only.
  bool get scrolledUnder => value.contains(WidgetState.scrolledUnder);

  /// Returns the loading state of the widget.
  ///
  /// This property may be set by the controller.
  bool get loading => _loading;
  bool _loading = false;

  /// Sets the loading state of the widget.
  set loading(bool value) {
    if (_loading == value) {
      return;
    }
    _loading = value;
    notifyListeners();
  }

  /// Returns true if the state contains a [WidgetState.selected] state
  ///
  /// This property may be set by the controller.
  bool get selected => value.contains(WidgetState.selected);

  /// Sets the selected state of the widget.
  set selected(bool value) {
    if (selected == value) {
      return;
    }
    update(WidgetState.selected, value);
  }

  /// Returns true if the state contains a [WidgetState.disabled] state
  ///
  /// This property may be set by the controller.
  bool get disabled => value.contains(WidgetState.disabled);

  /// Sets the disabled state of the widget.
  set disabled(bool value) {
    if (disabled == value) {
      return;
    }
    update(WidgetState.disabled, value);
  }

  /// Returns true if the state contains a [WidgetState.error] state
  ///
  /// This property may be set by the controller.
  bool get error => value.contains(WidgetState.error);

  /// Sets the error state of the widget.
  set error(bool value) {
    if (error == value) {
      return;
    }
    update(WidgetState.error, value);
  }
}
