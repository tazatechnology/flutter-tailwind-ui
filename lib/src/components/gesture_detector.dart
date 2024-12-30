import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TGestureDetector
// =============================================================================

/// A comprehensive gesture detector with built-in [WidgetState] management.
class TGestureDetector extends StatefulWidget {
  /// Builds a [TGestureDetector] widget.
  const TGestureDetector({
    required this.builder,
    this.controller,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
    this.onTertiaryTapCancel,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.onLongPressDown,
    this.onLongPressCancel,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onSecondaryLongPressDown,
    this.onSecondaryLongPressCancel,
    this.onSecondaryLongPress,
    this.onSecondaryLongPressStart,
    this.onSecondaryLongPressMoveUpdate,
    this.onSecondaryLongPressUp,
    this.onSecondaryLongPressEnd,
    this.onTertiaryLongPressDown,
    this.onTertiaryLongPressCancel,
    this.onTertiaryLongPress,
    this.onTertiaryLongPressStart,
    this.onTertiaryLongPressMoveUpdate,
    this.onTertiaryLongPressUp,
    this.onTertiaryLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.behavior,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
    this.trackpadScrollCausesScale = false,
    this.trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,
    this.supportedDevices,
    this.onKeyEvent,
    this.mouseCursor,
    this.onHover,
    this.onFocus,
    this.canRequestFocus,
    this.focusNode,
    this.skipTraversal,
    this.descendantsAreFocusable,
    this.descendantsAreTraversable,
    super.key,
  });

  /// The builder for the widget.
  final Widget Function(BuildContext context, Set<WidgetState> states) builder;

  /// The controller for the widget states.
  final WidgetStatesController? controller;

  /// A pointer that might cause a tap with a primary button has contacted the
  /// screen at a particular location.
  ///
  /// See: [GestureDetector.onTapDown]
  final GestureTapDownCallback? onTapDown;

  /// A pointer that will trigger a tap with a primary button has stopped
  /// contacting the screen at a particular location.
  ///
  /// See: [GestureDetector.onTapUp]
  final GestureTapUpCallback? onTapUp;

  /// A tap with a primary button has occurred.
  ///
  /// This will also get triggered on a [LogicalKeyboardKey.enter] key event if
  /// the [onKeyEvent] callback is not provided.
  ///
  /// See: [GestureDetector.onTap]
  final GestureTapCallback? onTap;

  /// The pointer that previously triggered [onTapDown] will not end up causing
  /// a tap.
  ///
  /// See: [GestureDetector.onTapCancel]
  final GestureTapCancelCallback? onTapCancel;

  /// A tap with a secondary button has occurred.
  ///
  /// See: [GestureDetector.onSecondaryTap]
  final GestureTapCallback? onSecondaryTap;

  /// A pointer that might cause a tap with a secondary button has contacted the
  /// screen at a particular location.
  ///
  /// See: [GestureDetector.onSecondaryTapDown]
  final GestureTapDownCallback? onSecondaryTapDown;

  /// A pointer that will trigger a tap with a secondary button has stopped
  /// contacting the screen at a particular location.
  ///
  /// See: [GestureDetector.onSecondaryTapUp]
  final GestureTapUpCallback? onSecondaryTapUp;

  /// The pointer that previously triggered [onSecondaryTapDown] will not end up
  /// causing a tap.
  ///
  /// See: [GestureDetector.onSecondaryTapCancel]
  final GestureTapCancelCallback? onSecondaryTapCancel;

  /// A pointer that might cause a tap with a tertiary button has contacted the
  /// screen at a particular location.
  ///
  /// See: [GestureDetector.onTertiaryTapDown]
  final GestureTapDownCallback? onTertiaryTapDown;

  /// A pointer that will trigger a tap with a tertiary button has stopped
  /// contacting the screen at a particular location.
  ///
  /// See: [GestureDetector.onTertiaryTapUp]
  final GestureTapUpCallback? onTertiaryTapUp;

  /// The pointer that previously triggered [onTertiaryTapDown] will not end up
  /// causing a tap.
  ///
  /// See: [GestureDetector.onTertiaryTapCancel]
  final GestureTapCancelCallback? onTertiaryTapCancel;

  /// A pointer that might cause a double tap has contacted the screen at a
  /// particular location.
  ///
  /// See: [GestureDetector.onDoubleTapDown]
  final GestureTapDownCallback? onDoubleTapDown;

  /// The user has tapped the screen with a primary button at the same location
  /// twice in quick succession.
  ///
  /// See: [GestureDetector.onDoubleTap]
  final GestureTapCallback? onDoubleTap;

  /// The pointer that previously triggered [onDoubleTapDown] will not end up
  /// causing a double tap.
  ///
  /// See: [GestureDetector.onDoubleTapCancel]
  final GestureTapCancelCallback? onDoubleTapCancel;

  /// The pointer has contacted the screen with a primary button, which might
  /// be the start of a long-press.
  ///
  /// See: [GestureDetector.onLongPressDown]
  final GestureLongPressDownCallback? onLongPressDown;

  /// A pointer that previously triggered [onLongPressDown] will not end up
  /// causing a long-press.
  ///
  /// See: [GestureDetector.onLongPressCancel]
  final GestureLongPressCancelCallback? onLongPressCancel;

  /// Called when a long press gesture with a primary button has been recognized.
  ///
  /// See: [GestureDetector.onLongPress]
  final GestureLongPressCallback? onLongPress;

  /// Called when a long press gesture with a primary button has been recognized.
  ///
  /// See: [GestureDetector.onLongPressStart]
  final GestureLongPressStartCallback? onLongPressStart;

  /// A pointer has been drag-moved after a long-press with a primary button.
  ///
  /// See: [GestureDetector.onLongPressMoveUpdate]
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;

  /// A pointer that has triggered a long-press with a primary button has
  /// stopped contacting the screen.
  ///
  /// See: [GestureDetector.onLongPressUp]
  final GestureLongPressUpCallback? onLongPressUp;

  /// A pointer that has triggered a long-press with a primary button has
  /// stopped contacting the screen.
  ///
  /// See: [GestureDetector.onLongPressEnd]
  final GestureLongPressEndCallback? onLongPressEnd;

  /// The pointer has contacted the screen with a secondary button, which might
  /// be the start of a long-press.
  ///
  /// See: [GestureDetector.onSecondaryLongPressDown]
  final GestureLongPressDownCallback? onSecondaryLongPressDown;

  /// A pointer that previously triggered [onSecondaryLongPressDown] will not
  /// end up causing a long-press.
  ///
  /// See: [GestureDetector.onSecondaryLongPressCancel]
  final GestureLongPressCancelCallback? onSecondaryLongPressCancel;

  /// Called when a long press gesture with a secondary button has been
  /// recognized.
  ///
  /// See: [GestureDetector.onSecondaryLongPress]
  final GestureLongPressCallback? onSecondaryLongPress;

  /// Called when a long press gesture with a secondary button has been
  /// recognized.
  ///
  /// See: [GestureDetector.onSecondaryLongPressStart]
  final GestureLongPressStartCallback? onSecondaryLongPressStart;

  /// A pointer has been drag-moved after a long press with a secondary button.
  ///
  /// See: [GestureDetector.onSecondaryLongPressMoveUpdate]
  final GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate;

  /// A pointer that has triggered a long-press with a secondary button has
  /// stopped contacting the screen.
  ///
  /// See: [GestureDetector.onSecondaryLongPressUp]
  final GestureLongPressUpCallback? onSecondaryLongPressUp;

  /// A pointer that has triggered a long-press with a secondary button has
  /// stopped contacting the screen.
  ///
  /// See: [GestureDetector.onSecondaryLongPressEnd]
  final GestureLongPressEndCallback? onSecondaryLongPressEnd;

  /// The pointer has contacted the screen with a tertiary button, which might
  /// be the start of a long-press.
  ///
  /// See: [GestureDetector.onTertiaryLongPressDown]
  final GestureLongPressDownCallback? onTertiaryLongPressDown;

  /// A pointer that previously triggered [onTertiaryLongPressDown] will not
  /// end up causing a long-press.
  ///
  /// See: [GestureDetector.onTertiaryLongPressCancel]
  final GestureLongPressCancelCallback? onTertiaryLongPressCancel;

  /// Called when a long press gesture with a tertiary button has been
  /// recognized.
  ///
  /// See: [GestureDetector.onTertiaryLongPress]
  final GestureLongPressCallback? onTertiaryLongPress;

  /// Called when a long press gesture with a tertiary button has been
  /// recognized.
  ///
  /// See: [GestureDetector.onTertiaryLongPressStart]
  final GestureLongPressStartCallback? onTertiaryLongPressStart;

  /// A pointer has been drag-moved after a long press with a tertiary button.
  ///
  /// See: [GestureDetector.onTertiaryLongPressMoveUpdate]
  final GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate;

  /// A pointer that has triggered a long-press with a tertiary button has
  /// stopped contacting the screen.
  ///
  /// See: [GestureDetector.onTertiaryLongPressUp]
  final GestureLongPressUpCallback? onTertiaryLongPressUp;

  /// A pointer that has triggered a long-press with a tertiary button has
  /// stopped contacting the screen.
  ///
  /// See: [GestureDetector.onTertiaryLongPressEnd]
  final GestureLongPressEndCallback? onTertiaryLongPressEnd;

  /// A pointer has contacted the screen with a primary button and might begin
  /// to move vertically.
  ///
  /// See: [GestureDetector.onVerticalDragDown]
  final GestureDragDownCallback? onVerticalDragDown;

  /// A pointer has contacted the screen with a primary button and has begun to
  /// move vertically.
  ///
  /// See: [GestureDetector.onVerticalDragStart]
  final GestureDragStartCallback? onVerticalDragStart;

  /// A pointer that is in contact with the screen with a primary button and
  /// moving vertically has moved in the vertical direction.
  ///
  /// See: [GestureDetector.onVerticalDragUpdate]
  final GestureDragUpdateCallback? onVerticalDragUpdate;

  /// A pointer that was previously in contact with the screen with a primary
  /// button and moving vertically is no longer in contact with the screen and
  /// was moving at a specific velocity when it stopped contacting the screen.
  ///
  /// See: [GestureDetector.onVerticalDragEnd]
  final GestureDragEndCallback? onVerticalDragEnd;

  /// The pointer that previously triggered [onVerticalDragDown] did not
  /// complete.
  ///
  /// See: [GestureDetector.onVerticalDragCancel]
  final GestureDragCancelCallback? onVerticalDragCancel;

  /// A pointer has contacted the screen with a primary button and might begin
  /// to move horizontally.
  ///
  /// See: [GestureDetector.onHorizontalDragDown]
  final GestureDragDownCallback? onHorizontalDragDown;

  /// A pointer has contacted the screen with a primary button and has begun to
  /// move horizontally.
  ///
  /// See: [GestureDetector.onHorizontalDragStart]
  final GestureDragStartCallback? onHorizontalDragStart;

  /// A pointer that is in contact with the screen with a primary button and
  /// moving horizontally has moved in the horizontal direction.
  ///
  /// See: [GestureDetector.onHorizontalDragUpdate]
  final GestureDragUpdateCallback? onHorizontalDragUpdate;

  /// A pointer that was previously in contact with the screen with a primary
  /// button and moving horizontally is no longer in contact with the screen and
  /// was moving at a specific velocity when it stopped contacting the screen.
  ///
  /// See: [GestureDetector.onHorizontalDragEnd]
  final GestureDragEndCallback? onHorizontalDragEnd;

  /// The pointer that previously triggered [onHorizontalDragDown] did not
  /// complete.
  ///
  /// See: [GestureDetector.onHorizontalDragCancel]
  final GestureDragCancelCallback? onHorizontalDragCancel;

  /// A pointer has contacted the screen with a primary button and might begin
  /// to move.
  ///
  /// See: [GestureDetector.onPanDown]
  final GestureDragDownCallback? onPanDown;

  /// A pointer has contacted the screen with a primary button and has begun to
  /// move.
  ///
  /// See: [GestureDetector.onPanStart]
  final GestureDragStartCallback? onPanStart;

  /// A pointer that is in contact with the screen with a primary button and
  /// moving has moved again.
  ///
  /// See: [GestureDetector.onPanUpdate]
  final GestureDragUpdateCallback? onPanUpdate;

  /// A pointer that was previously in contact with the screen with a primary
  /// button and moving is no longer in contact with the screen and was moving
  /// at a specific velocity when it stopped contacting the screen.
  ///
  /// See: [GestureDetector.onPanEnd]
  final GestureDragEndCallback? onPanEnd;

  /// The pointer that previously triggered [onPanDown] did not complete.
  ///
  /// See: [GestureDetector.onPanCancel]
  final GestureDragCancelCallback? onPanCancel;

  /// The pointers in contact with the screen have established a focal point and
  /// initial scale of 1.0.
  ///
  /// See: [GestureDetector.onScaleStart]
  final GestureScaleStartCallback? onScaleStart;

  /// The pointers in contact with the screen have indicated a new focal point
  /// and/or scale.
  ///
  /// See: [GestureDetector.onScaleUpdate]
  final GestureScaleUpdateCallback? onScaleUpdate;

  /// The pointers are no longer in contact with the screen.
  ///
  /// See: [GestureDetector.onScaleEnd]
  final GestureScaleEndCallback? onScaleEnd;

  /// The pointer is in contact with the screen and has pressed with sufficient
  /// force to initiate a force press.
  ///
  /// See: [GestureDetector.onForcePressStart]
  final GestureForcePressStartCallback? onForcePressStart;

  /// The pointer is in contact with the screen and has pressed with the maximum
  /// force.
  ///
  /// See: [GestureDetector.onForcePressPeak]
  final GestureForcePressPeakCallback? onForcePressPeak;

  /// A pointer is in contact with the screen, and is either moving on the
  /// plane of the screen, pressing the screen with varying forces or both
  /// simultaneously.
  ///
  /// See: [GestureDetector.onForcePressUpdate]
  final GestureForcePressUpdateCallback? onForcePressUpdate;

  /// The pointer tracked by [onForcePressStart] is no longer in contact with the screen.
  ///
  /// See: [GestureDetector.onForcePressEnd]
  final GestureForcePressEndCallback? onForcePressEnd;

  /// How this gesture detector should behave during hit testing when deciding
  /// how the hit test propagates to children and whether to consider targets
  /// behind this one.
  ///
  /// See: [GestureDetector.behavior]
  final HitTestBehavior? behavior;

  /// Whether to exclude these gestures from the semantics tree.
  ///
  /// See: [GestureDetector.excludeFromSemantics]
  final bool excludeFromSemantics;

  /// Determines the way that drag start behavior is handled.
  ///
  /// See: [GestureDetector.dragStartBehavior]
  final DragStartBehavior dragStartBehavior;

  /// The kind of devices that are allowed to be recognized.
  ///
  /// See: [GestureDetector.supportedDevices]
  final Set<PointerDeviceKind>? supportedDevices;

  /// Whether scrolling up/down on a trackpad should cause scaling instead of panning.
  ///
  /// See: [GestureDetector.trackpadScrollCausesScale]
  final bool trackpadScrollCausesScale;

  /// A factor to control the direction and magnitude of scale when converting trackpad scrolling.
  ///
  /// See: [GestureDetector.trackpadScrollToScaleFactor]
  final Offset trackpadScrollToScaleFactor;

  /// Called when a key event is dispatched to this widget.
  ///
  /// See: [Focus.onKeyEvent]
  final FocusOnKeyEventCallback? onKeyEvent;

  /// Stateful mouse cursor property.
  ///
  /// When not provided, or when the value is `null`, the cursor will fallback to
  /// [SystemMouseCursors.basic] if [onTap] is not provided, or [SystemMouseCursors.click]
  /// if [onTap] is provided.
  final WidgetStateProperty<MouseCursor?>? mouseCursor;

  /// Called when a pointer enters or exits the response area.
  ///
  /// See: [MouseRegion.onEnter] and [MouseRegion.onExit]
  final ValueChanged<bool>? onHover;

  /// Called with true if this widget's node gains focus, and false if it loses focus.
  ///
  /// See: [Focus.onFocusChange]
  final ValueChanged<bool>? onFocus;

  /// Whether this widget can request focus.
  ///
  /// If not specified, default will be determined based on the presence of an
  /// [onTap] callback. If [onTap] is provided, the value will be `true`.
  ///
  /// See: [Focus.canRequestFocus]
  final bool? canRequestFocus;

  /// The focus node that should be used for this widget.
  final FocusNode? focusNode;

  /// Whether the widget should be skipped during the focus traversal.
  ///
  /// See: [Focus.skipTraversal]
  final bool? skipTraversal;

  /// Whether the descendants of this widget are focusable.
  ///
  /// See: [Focus.descendantsAreFocusable]
  final bool? descendantsAreFocusable;

  /// Whether the descendants of this widget are traversable.
  ///
  /// See: [Focus.descendantsAreTraversable]
  final bool? descendantsAreTraversable;

  @override
  State<TGestureDetector> createState() => _TGestureDetectorState();
}

class _TGestureDetectorState extends State<TGestureDetector> {
  late final controller = widget.controller ?? WidgetStatesController();

  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    MouseCursor mouseCursorFallback = SystemMouseCursors.basic;
    if (controller.disabled) {
      mouseCursorFallback = SystemMouseCursors.forbidden;
    } else if (widget.onTap != null) {
      mouseCursorFallback = SystemMouseCursors.click;
    }

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final child = widget.builder(context, controller.value);
        final mouseCursor = widget.mouseCursor?.resolve(controller.value) ??
            mouseCursorFallback;

        final content = DefaultSelectionStyle.merge(
          mouseCursor: mouseCursor,
          child: Focus(
            canRequestFocus: widget.canRequestFocus ?? widget.onTap != null,
            focusNode: widget.focusNode,
            skipTraversal: widget.skipTraversal,
            descendantsAreFocusable: widget.descendantsAreFocusable,
            descendantsAreTraversable: widget.descendantsAreTraversable,
            onFocusChange: (value) {
              widget.onFocus?.call(value);
              controller.update(WidgetState.focused, value);
            },
            onKeyEvent: (node, event) {
              if (widget.onKeyEvent != null) {
                return widget.onKeyEvent!.call(node, event);
              }
              // Propagate enter key events to the onTap callback
              if (event.logicalKey == LogicalKeyboardKey.enter) {
                widget.onTap?.call();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },
            child: MouseRegion(
              cursor: mouseCursor,
              child: child,
              onEnter: (event) {
                widget.onHover?.call(true);
                controller.update(WidgetState.hovered, true);
              },
              onExit: (event) {
                widget.onHover?.call(false);
                controller.update(WidgetState.hovered, false);
              },
            ),
          ),
        );

        if (controller.disabled) {
          return content;
        }

        return GestureDetector(
          onTap: widget.onTap,
          onTapDown: (details) {
            widget.onTapDown?.call(details);
            controller.update(WidgetState.pressed, true);
          },
          onTapUp: (details) {
            widget.onTapUp?.call(details);
            controller.update(WidgetState.pressed, false);
          },
          onTapCancel: () {
            widget.onTapCancel?.call();
            controller.update(WidgetState.pressed, false);
          },
          onDoubleTap: widget.onDoubleTap,
          onDoubleTapDown: widget.onDoubleTapDown,
          onDoubleTapCancel: widget.onDoubleTapCancel,
          onLongPress: widget.onLongPress,
          onLongPressDown: widget.onLongPressDown,
          onLongPressMoveUpdate: widget.onLongPressMoveUpdate,
          onLongPressUp: widget.onLongPressUp,
          onLongPressStart: (details) {
            widget.onLongPressStart?.call(details);
            controller.update(WidgetState.dragged, true);
          },
          onLongPressEnd: (details) {
            widget.onLongPressEnd?.call(details);
            controller.update(WidgetState.dragged, false);
          },
          onLongPressCancel: () {
            widget.onLongPressCancel?.call();
            controller.update(WidgetState.dragged, false);
          },
          onSecondaryTap: widget.onSecondaryTap,
          onSecondaryTapUp: widget.onSecondaryTapUp,
          onSecondaryTapDown: widget.onSecondaryTapDown,
          onSecondaryTapCancel: widget.onSecondaryTapCancel,
          onSecondaryLongPress: widget.onSecondaryLongPress,
          onSecondaryLongPressStart: widget.onSecondaryLongPressStart,
          onSecondaryLongPressMoveUpdate: widget.onSecondaryLongPressMoveUpdate,
          onSecondaryLongPressUp: widget.onSecondaryLongPressUp,
          onSecondaryLongPressEnd: widget.onSecondaryLongPressEnd,
          onSecondaryLongPressDown: widget.onSecondaryLongPressDown,
          onSecondaryLongPressCancel: widget.onSecondaryLongPressCancel,
          onTertiaryTapDown: widget.onTertiaryTapDown,
          onTertiaryTapUp: widget.onTertiaryTapUp,
          onTertiaryTapCancel: widget.onTertiaryTapCancel,
          onTertiaryLongPressDown: widget.onTertiaryLongPressDown,
          onTertiaryLongPressCancel: widget.onTertiaryLongPressCancel,
          onTertiaryLongPress: widget.onTertiaryLongPress,
          onTertiaryLongPressStart: widget.onTertiaryLongPressStart,
          onTertiaryLongPressMoveUpdate: widget.onTertiaryLongPressMoveUpdate,
          onTertiaryLongPressUp: widget.onTertiaryLongPressUp,
          onTertiaryLongPressEnd: widget.onTertiaryLongPressEnd,
          onVerticalDragDown: widget.onVerticalDragDown,
          onVerticalDragStart: widget.onVerticalDragStart,
          onVerticalDragUpdate: widget.onVerticalDragUpdate,
          onVerticalDragEnd: widget.onVerticalDragEnd,
          onVerticalDragCancel: widget.onVerticalDragCancel,
          onHorizontalDragDown: widget.onHorizontalDragDown,
          onHorizontalDragStart: widget.onHorizontalDragStart,
          onHorizontalDragUpdate: widget.onHorizontalDragUpdate,
          onHorizontalDragEnd: widget.onHorizontalDragEnd,
          onHorizontalDragCancel: widget.onHorizontalDragCancel,
          onPanDown: widget.onPanDown,
          onPanStart: widget.onPanStart,
          onPanUpdate: widget.onPanUpdate,
          onPanEnd: widget.onPanEnd,
          onPanCancel: widget.onPanCancel,
          onScaleStart: widget.onScaleStart,
          onScaleUpdate: widget.onScaleUpdate,
          onScaleEnd: widget.onScaleEnd,
          onForcePressStart: widget.onForcePressStart,
          onForcePressPeak: widget.onForcePressPeak,
          onForcePressUpdate: widget.onForcePressUpdate,
          onForcePressEnd: widget.onForcePressEnd,
          child: content,
        );
      },
    );
  }
}
