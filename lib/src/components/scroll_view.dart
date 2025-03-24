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
    this.fillHeight = true,
    this.padding,
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

  /// Whether the scrollview should fill the height of the screen
  ///
  /// Will set the minimum height to the height of the screen
  final bool fillHeight;

  /// The padding to apply to the scrollview content
  final EdgeInsets? padding;

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

  @override
  Widget build(BuildContext context) {
    /// Account for the keyboard when it is shown\
    /// Parent Scaffold must have `resizeToAvoidBottomInset: false`
    final bottomInset = EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
    );

    return TScrollbar.fromOptions(
      options: scrollbarOptions,
      controller: controller,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double minHeight =
              constraints.hasBoundedHeight ? constraints.maxHeight : 0;
          return SingleChildScrollView(
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
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth,
                      minHeight: fillHeight ? minHeight : 0,
                    ),
                    child: AnimatedPadding(
                      duration: kThemeAnimationDuration,
                      curve: Curves.easeOut,
                      padding: (padding ?? TOffset.zero) + bottomInset,
                      child: child,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
