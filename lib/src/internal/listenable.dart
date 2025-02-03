import 'package:flutter/foundation.dart';

// =============================================================================
// CLASS: TMergedListenable
// =============================================================================

/// A Listenable that proxies a list of other Listenables.
class TMergedListenable extends Listenable {
  /// Create a [TMergedListenable] from a list of Listenables.
  TMergedListenable(this.listenables);

  /// The list of Listenables to proxy.
  final List<Listenable> listenables;

  @override
  void addListener(VoidCallback listener) {
    for (final listenable in listenables) {
      listenable.addListener(listener);
    }
  }

  @override
  void removeListener(VoidCallback listener) {
    for (final listenable in listenables) {
      listenable.removeListener(listener);
    }
  }
}
