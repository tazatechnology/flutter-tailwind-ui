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
    bool hovered = false,
    bool focused = false,
    bool pressed = false,
    bool dragged = false,
    bool selected = false,
    bool scrolledUnder = false,
    bool disabled = false,
    bool error = false,
    bool loading = false,
  }) : super({
         if (hovered) WidgetState.hovered,
         if (focused) WidgetState.focused,
         if (pressed) WidgetState.pressed,
         if (dragged) WidgetState.dragged,
         if (selected) WidgetState.selected,
         if (scrolledUnder) WidgetState.scrolledUnder,
         if (disabled) WidgetState.disabled,
         if (error) WidgetState.error,
       }) {
    _loading = loading;
  }

  /// Returns true if the controller has been disposed.
  bool get isDisposed => _isDisposed;
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void update(WidgetState state, bool add) {
    if (isDisposed) {
      return;
    }
    super.update(state, add);
  }

  /// Returns true if the state contains a [WidgetState.hovered] state
  bool get hovered => value.contains(WidgetState.hovered);

  /// Sets the hovered state of the widget.
  set hovered(bool value) {
    if (hovered == value) {
      return;
    }
    update(WidgetState.hovered, value);
  }

  /// Returns true if the state contains a [WidgetState.focused] state
  bool get focused => value.contains(WidgetState.focused);

  /// Sets the focused state of the widget.
  set focused(bool value) {
    if (focused == value) {
      return;
    }
    update(WidgetState.focused, value);
  }

  /// Returns true if the state contains a [WidgetState.pressed] state
  bool get pressed => value.contains(WidgetState.pressed);

  /// Sets the pressed state of the widget.
  set pressed(bool value) {
    if (pressed == value) {
      return;
    }
    update(WidgetState.pressed, value);
  }

  /// Returns true if the state contains a [WidgetState.dragged] state
  bool get dragged => value.contains(WidgetState.dragged);

  /// Sets the pressed state of the widget.
  set dragged(bool value) {
    if (dragged == value) {
      return;
    }
    update(WidgetState.dragged, value);
  }

  /// Returns true if the state contains a [WidgetState.scrolledUnder] state
  bool get scrolledUnder => value.contains(WidgetState.scrolledUnder);

  /// Sets the scrolled under state of the widget.
  set scrolledUnder(bool value) {
    if (scrolledUnder == value) {
      return;
    }
    update(WidgetState.scrolledUnder, value);
  }

  /// Returns true if the state contains a [WidgetState.selected] state
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

  /// Returns true if the state does not contain a [WidgetState.disabled] state
  ///
  /// This property may be set by the controller.
  bool get enabled => !disabled;

  /// Sets the enabled state of the widget.
  set enabled(bool value) {
    disabled = !value;
  }

  /// Returns true if the state contains a [WidgetState.error] state
  bool get error => value.contains(WidgetState.error);

  /// Sets the error state of the widget.
  set error(bool value) {
    if (error == value) {
      return;
    }
    update(WidgetState.error, value);
  }

  /// Returns the loading state of the widget.
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
}
