import 'package:flutter/material.dart';

// =============================================================================
// CLASS: TAnimatedController
// =============================================================================

/// A controller for [TAnimated] widgets.
///
/// Call [forward] or [reverse] on this controller to trigger animations
class TAnimatedController {
  AnimationController? _controller;

  /// Called by [TAnimated] to pass its internally created [AnimationController].
  // ignore: use_setters_to_change_properties
  void _attach(AnimationController controller) {
    _controller = controller;
  }

  /// Triggers a forward animation.
  TickerFuture? forward() {
    return _controller?.forward();
  }

  /// Triggers a reverse animation.
  TickerFuture? reverse() {
    return _controller?.reverse();
  }

  /// Stop any running animation and set the current value.
  void stop({bool canceled = true}) {
    _controller!.stop(canceled: canceled);
  }

  /// Disposes the controller.
  void dispose() {
    _controller?.dispose();
  }
}

// =============================================================================
// CLASS: TAnimation
// =============================================================================

/// The animation options for [TAnimated].
class TAnimatedOptions {
  /// Constructor for [TAnimatedOptions].
  const TAnimatedOptions({
    this.animateOnMount = true,
    this.duration = kThemeAnimationDuration,
    this.curveIn = Curves.easeOut,
    this.curveOut = Curves.easeIn,
    this.opacity,
    this.position,
    this.positionTextDirection = TextDirection.ltr,
    this.scale,
    this.scaleAlignment = Alignment.center,
    this.scaleFilterQuality,
    this.turns,
    this.turnsAlignment = Alignment.center,
    this.turnsFilterQuality,
  });

  /// No animation.
  const TAnimatedOptions.none() : this(duration: Duration.zero);

  /// A Tailwind inspired popover animation.
  ///
  /// Used for tooltips, generic popovers, etc.
  factory TAnimatedOptions.popover() {
    return TAnimatedOptions(
      duration: const Duration(milliseconds: 100),
      opacity: Tween<double>(begin: 0, end: 1),
      scale: Tween<double>(begin: 0.95, end: 1),
    );
  }

  /// A Tailwind inspired dropdown animation.
  ///
  /// Used for select dropdowns, modals, etc.
  factory TAnimatedOptions.dropdown() {
    return TAnimatedOptions(
      duration: const Duration(milliseconds: 100),
      position: Tween<Offset>(begin: const Offset(0, -0.05), end: Offset.zero),
      opacity: Tween<double>(begin: 0, end: 1),
    );
  }

  /// Whether to animate the widget when it is mounted.
  final bool animateOnMount;

  /// The duration of the animation.
  final Duration duration;

  /// The curve of the animation when entering.
  final Curve curveIn;

  /// The curve of the animation when exiting.
  final Curve curveOut;

  /// Apply a fade animation using [FadeTransition].
  final Tween<double>? opacity;

  /// Apply a slide animation using [SlideTransition].
  final Tween<Offset>? position;

  /// The text direction to use for the [SlideTransition].
  final TextDirection? positionTextDirection;

  /// Apply a scale animation using [ScaleTransition].
  final Tween<double>? scale;

  /// The alignment to use for the [ScaleTransition].
  final Alignment scaleAlignment;

  /// The filter quality to use for the [ScaleTransition].
  final FilterQuality? scaleFilterQuality;

  /// Apply a rotation animation using [RotationTransition].
  final Tween<double>? turns;

  /// The alignment to use for the [RotationTransition].
  final Alignment turnsAlignment;

  /// The filter quality to use for the [RotationTransition].
  final FilterQuality? turnsFilterQuality;
}

// =============================================================================
// CLASS: TAnimated
// =============================================================================

/// Apply an animation to a widget.
class TAnimated extends StatefulWidget {
  /// Constructor for [TAnimated].
  const TAnimated({
    super.key,
    required this.child,
    this.controller,
    this.options,
  });

  /// The child widget to animate.
  final Widget child;

  /// The controller to use for the animation.
  final TAnimatedController? controller;

  /// The options for the animation.
  final TAnimatedOptions? options;

  @override
  State<TAnimated> createState() => _TAnimatedState();
}

class _TAnimatedState extends State<TAnimated>
    with SingleTickerProviderStateMixin {
  late final controller = widget.controller ?? TAnimatedController();
  late final AnimationController animationController;
  late final CurvedAnimation animationCurve;
  late final TAnimatedOptions options =
      widget.options ?? const TAnimatedOptions();

  late final CurvedAnimation curvedAnimation;
  late final Animation<double>? opacity;
  late final Animation<Offset>? position;
  late final Animation<double>? scale;
  late final Animation<double>? turns;

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: options.duration);
    controller._attach(animationController);
    curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: options.curveIn,
      reverseCurve: options.curveOut,
    );
    opacity = options.opacity?.animate(curvedAnimation);
    position = options.position?.animate(curvedAnimation);
    scale = options.scale?.animate(curvedAnimation);
    turns = options.turns?.animate(curvedAnimation);

    if (options.animateOnMount) {
      animationController.forward();
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    /// Wrap the child in any animation option that is not null.
    Widget child = widget.child;

    if (opacity != null) {
      child = FadeTransition(
        opacity: opacity!,
        child: child,
      );
    }
    if (scale != null) {
      child = ScaleTransition(
        scale: scale!,
        alignment: options.scaleAlignment,
        filterQuality: options.scaleFilterQuality,
        child: child,
      );
    }

    if (position != null) {
      child = SlideTransition(
        position: position!,
        textDirection: options.positionTextDirection,
        child: child,
      );
    }

    if (turns != null) {
      child = RotationTransition(
        turns: turns!,
        alignment: options.turnsAlignment,
        filterQuality: options.turnsFilterQuality,
        child: child,
      );
    }

    return child;
  }
}
