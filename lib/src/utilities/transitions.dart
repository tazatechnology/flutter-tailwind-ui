import 'package:flutter/material.dart';

// =================================================
// CLASS: TNoPageTransitionsBuilder
// =================================================

/// A [PageTransitionsBuilder] that does not animate page transitions
class TNoPageTransitionsBuilder extends PageTransitionsBuilder {
  /// Constructor for [TNoPageTransitionsBuilder]
  const TNoPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }
}
