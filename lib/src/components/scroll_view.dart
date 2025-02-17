import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TScrollView
// =============================================================================

/// A feature rich version of [SingleChildScrollView]
///
/// Will automatically pad content to a maximum width
class TScrollView extends StatelessWidget {
  /// Constructor for [TScrollView]
  const TScrollView({
    super.key,
    required this.child,
    this.maxWidth = TScreen.max_6xl,
    this.minPadding,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary,
    this.physics,
    this.controller,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.scrollbarOptions = const TScrollbarOptions(),
  });

  /// The maximum width of the scrollview content
  ///
  /// The remaining space will be filled with padding and ensure that the padded
  /// area is still responsive to scroll events
  final double maxWidth;

  /// The minimum padding to apply to the scrollview content
  ///
  /// If not specified the following defaults are used based on the screen size
  /// at a breakpoint of ([TScreen.screen_sm]):
  ///
  /// - Small screens: [TOffset.a16]
  /// - Large screens: [TOffset.a32]
  final EdgeInsets? minPadding;

  /// The widget that scrolls
  final Widget child;

  /// {@macro flutter.widgets.scroll_view.scrollDirection}
  final Axis scrollDirection;

  /// Whether the scroll view scrolls in the reading direction.
  final bool reverse;

  /// An object that can be used to control the position to which this scroll
  /// view is scrolled.
  ///
  /// Must be null if [primary] is true.
  final ScrollController? controller;

  /// Whether this is the primary scroll view associated with the parent
  final bool? primary;

  /// How the scroll view should respond to user input.
  final ScrollPhysics? physics;

  /// The way that drag start behavior should be handled.
  final DragStartBehavior dragStartBehavior;

  /// The way that the content should be clipped.
  final Clip clipBehavior;

  /// The way that hit tests should be handled.
  final HitTestBehavior hitTestBehavior;

  /// The identifier to save and restore the scroll offset of the scroll view.
  final String? restorationId;

  /// The way that the scroll view should dismiss the keyboard when the user
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  /// The options for the scrollbar
  final TScrollbarOptions scrollbarOptions;

  /// Compute the required padding to center the content for a given maximum width
  static EdgeInsets computePadding({
    required BuildContext context,
    required double maxWidth,
    EdgeInsets? minPadding,
  }) {
    final tw = context.tw;

    /// Responsive padding based on the screen size
    final defaultPadding =
        minPadding ?? (tw.screen.is_sm ? TOffset.a32 : TOffset.a16);

    // Get the size of the current widget
    final renderBox = context.findRenderObject() as RenderBox?;
    final Size size = renderBox?.size ?? Size.zero;

    if (size.width == 0) {
      return defaultPadding;
    }

    /// Set the padding based on the screen size and the maximum width
    /// This is required to ensure padded area of scroll view response to scrolling
    double horizontal = 0;
    if (size.width > maxWidth) {
      horizontal = (size.width - maxWidth) / 2;
    }
    return EdgeInsets.symmetric(
      horizontal:
          horizontal.clamp(defaultPadding.horizontal / 2, double.infinity),
      vertical: defaultPadding.vertical / 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TScrollbar.fromOptions(
      options: scrollbarOptions,
      controller: controller,
      child: SingleChildScrollView(
        padding: computePadding(
          context: context,
          maxWidth: maxWidth,
          minPadding: minPadding,
        ),
        scrollDirection: scrollDirection,
        reverse: reverse,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
        clipBehavior: clipBehavior,
        hitTestBehavior: hitTestBehavior,
        restorationId: restorationId,
        keyboardDismissBehavior: keyboardDismissBehavior,
        child: child,
      ),
    );
  }
}
