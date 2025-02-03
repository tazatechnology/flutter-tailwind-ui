import 'dart:async';

import 'package:flutter/foundation.dart';

// =============================================================================
// CLASS: TDebouncer
// =============================================================================

/// A utility class that helps to debounce a function call.
class TDebouncer {
  /// Construct a new [TDebouncer] with the specified [milliseconds].
  TDebouncer({
    this.milliseconds = 500,
  });

  /// The number of milliseconds to wait before executing the callback.
  final int milliseconds;

  /// The internal  timer instance.
  Timer? _timer;

  /// A flag to indicate the first pass.
  ///
  /// Used to execute the callback immediately on the first call.
  bool _firstPass = true;

  // ---------------------------------------------------------------------------
  // METHOD: call
  // ---------------------------------------------------------------------------

  /// Execute the callback
  void call(VoidCallback action) {
    _timer?.cancel();
    if (_firstPass) {
      _firstPass = false;
      action();
    } else {
      _timer = Timer(Duration(milliseconds: milliseconds), action);
    }
  }

  // ------------------------------------------
  // METHOD: dispose
  // ------------------------------------------

  /// Dispose the timer.
  void dispose() {
    _timer?.cancel();
  }
}
