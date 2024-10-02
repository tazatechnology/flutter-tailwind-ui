import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// =================================================
// CLASS: TailwindTheme
// =================================================

/// [InheritedWidget] to distribute [TailwindThemeData] to application widget tree
class TailwindTheme extends InheritedWidget {
  const TailwindTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Instance of [TailwindThemeData] provided by [TailwindTheme] [InheritedWidget]
  final TailwindThemeData data;

  /// Returns an instance of [TailwindThemeData] from [TailwindTheme] InheritedWidget
  static TailwindThemeData of(BuildContext context) {
    final tt = context.dependOnInheritedWidgetOfExactType<TailwindTheme>();
    assert(tt != null, 'No TailwindTheme InheritedWidget found in context');
    return tt!.data;
  }

  @override
  bool updateShouldNotify(TailwindTheme oldWidget) => false;
}

// =================================================
// CLASS: TailwindThemeData
// =================================================

class TailwindThemeData {}
