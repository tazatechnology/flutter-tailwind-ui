import 'package:flutter/material.dart';

// =================================================
// CLASS: TStateNotifier
// =================================================

/// An observer object for listening to the [TState] of a widget.
class TStateNotifier with ChangeNotifier {
  /// The current state of the widget.
  Set<TState> get states => _states;
  final Set<TState> _states = {};

  /// Returns true if the widget is hovered.
  bool get isHovered => states.contains(TState.hovered);

  /// Returns true if the widget is focused.
  bool get isFocused => states.contains(TState.focused);

  /// Returns true if the widget is pressed.
  bool get isPressed => states.contains(TState.pressed);

  /// Returns true if the widget is dragged.
  bool get isDragged => states.contains(TState.dragged);

  /// Returns true if the widget is selected.
  bool get isSelected => states.contains(TState.selected);

  /// Returns true if the widget is disabled.
  bool get isDisabled => states.contains(TState.disabled);

  // ignore: avoid_positional_boolean_parameters
  void _update(TState state, bool active) {
    if (active) {
      states.add(state);
    } else {
      states.remove(state);
    }
    notifyListeners();
  }
}

// =================================================
// CLASS: TStateConsumer
// =================================================

/// A consumer widget that listens to the [TState] of a widget.
class TStateConsumer extends StatelessWidget {
  /// Builds a [TStateConsumer] widget.
  const TStateConsumer({
    required this.builder,
    this.onPressed,
    super.key,
  });

  /// The child widget.
  final Widget Function(BuildContext context, TStateNotifier notifier) builder;

  /// An onPressed callback.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final notifier = TStateNotifier();
    return ListenableBuilder(
      listenable: notifier,
      builder: (context, _) {
        return DefaultSelectionStyle.merge(
          mouseCursor: onPressed != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          child: GestureDetector(
            onTap: onPressed,
            onTapDown: (details) {
              notifier._update(TState.pressed, true);
            },
            onTapUp: (details) {
              notifier._update(TState.pressed, false);
            },
            onTapCancel: () {
              notifier._update(TState.pressed, false);
            },
            onLongPressStart: (_) {
              notifier._update(TState.dragged, true);
            },
            onLongPressEnd: (_) {
              notifier._update(TState.dragged, false);
            },
            child: FocusableActionDetector(
              descendantsAreFocusable: false,
              descendantsAreTraversable: false,
              onShowHoverHighlight: (value) {
                notifier._update(TState.hovered, value);
              },
              onShowFocusHighlight: (value) {
                notifier._update(TState.focused, value);
              },
              child: builder(context, notifier),
            ),
          ),
        );
      },
    );
  }
}

// =================================================
// CLASS: TState
// =================================================

/// The state of a widget.
enum TState {
  /// The state when the user drags their mouse cursor over the given widget.
  hovered,

  /// The state when the user navigates with the keyboard to a given widget.
  focused,

  /// The state when the user is actively pressing down on the given widget.
  pressed,

  /// The state when this widget is being dragged from one place to another by
  dragged,

  /// The state when this item has been selected.
  selected,

  /// The state when this widget is disabled and cannot be interacted with.
  disabled,
}

// =================================================
// CLASS: TStateProperty
// =================================================

/// A state.
class TStateProperty<T> {
  /// Creates a state.
  TStateProperty(
    this.value, [
    this.resolver,
  ]);

  /// The fallback value for the state.
  final T value;

  /// The resolver for the state.
  final T? Function(Set<TState> states)? resolver;

  /// Resolves the state, if no match, may return null.
  T? resolve(Set<TState> states) {
    return resolver?.call(states);
  }

  /// Resolves the state with a fallback to the default [value] if resolve returns null.
  T resolveWithFallback(Set<TState> states) {
    return resolver?.call(states) ?? value;
  }

  /// Linearly interpolate between two [TStateProperty]s.
  ///
  /// Use as `TStateProperty.lerp(a, b, t, lerpFunction).resolve(states)`.
  static TStateProperty<T> lerp<T>(
    TStateProperty<T> a,
    TStateProperty<T> b,
    double t,
    T Function(T, T, double) lerpFunction,
  ) {
    final value = lerpFunction(a.value, b.value, t);
    return _TStatePropertyLerp<T>(value, null, a, b, t, lerpFunction);
  }
}

/// A state that linearly interpolates between two states of a property.
class _TStatePropertyLerp<T> extends TStateProperty<T> {
  _TStatePropertyLerp(
    super.value,
    super.resolver,
    this.a,
    this.b,
    this.t,
    this.lerpFunction,
  );

  final TStateProperty<T> a;
  final TStateProperty<T> b;
  final double t;
  final T Function(T, T, double) lerpFunction;

  @override
  T? resolve(Set<TState> states) {
    final T? resolvedA = a.resolve(states);
    final T? resolvedB = b.resolve(states);
    if (resolvedA == null && resolvedB == null) {
      return null;
    } else if (resolvedA == null) {
      return resolvedB;
    } else if (resolvedB == null) {
      return resolvedA;
    }
    return lerpFunction(resolvedA, resolvedB, t);
  }

  @override
  T resolveWithFallback(Set<TState> states) {
    final T resolvedA = a.resolveWithFallback(states);
    final T resolvedB = b.resolveWithFallback(states);
    return lerpFunction(resolvedA, resolvedB, t);
  }
}
