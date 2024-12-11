import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TScrollbar
// =============================================================================

/// Extended functionality for adding/removing scrollbars from a scrollable widget
class TScrollbar extends StatelessWidget {
  /// Default constructor
  const TScrollbar({
    required this.child,
    this.controller,
    this.thumbVisibility,
    this.trackVisibility,
    this.thumbColor,
    this.trackColor,
    this.trackBorderColor,
    this.thickness,
    this.radius,
    this.interactive,
    this.notificationPredicate,
    this.scrollbarOrientation,
    this.mainAxisMargin = TSpace.v4,
    this.crossAxisMargin = TSpace.v4,
    this.minThumbLength,
    super.key,
  });

  /// The scrollable widget
  final Widget child;

  /// The controller for the scrollable widget
  final ScrollController? controller;

  /// Whether the scrollbar is visible
  ///
  /// Set to `true` to always show the scrollbar
  /// Set to `false` to always hide the scrollbar
  /// Set to `null` to use the default behavior (show when scrolling)
  final WidgetStateProperty<bool?>? thumbVisibility;

  /// The track visibility of the scrollbar.
  final WidgetStateProperty<bool?>? trackVisibility;

  /// The color of the scrollbar thumb.
  final WidgetStateProperty<Color?>? thumbColor;

  /// The color of the scrollbar track.
  final WidgetStateProperty<Color?>? trackColor;

  /// The color of the scrollbar track border.
  final WidgetStateProperty<Color?>? trackBorderColor;

  /// The thickness of the scrollbar in the cross axis of the scrollable.
  final WidgetStateProperty<double?>? thickness;

  /// The [Radius] of the scrollbar thumb's rounded rectangle corners.
  final Radius? radius;

  /// If true, the scrollbar will be interactive, allowing the user to drag the scrollbar thumb.
  final bool? interactive;

  /// A predicate for [ScrollNotification], used to customize widgets that
  /// listen to notifications from their children.
  final ScrollNotificationPredicate? notificationPredicate;

  /// An orientation along either the horizontal or vertical [Axis].
  final ScrollbarOrientation? scrollbarOrientation;

  /// The distance from the scrollbar's start and end to the edge of the viewport
  /// in logical pixels.
  final double? mainAxisMargin;

  /// The distance from the scrollbar's side to the nearest edge in logical pixels.
  final double? crossAxisMargin;

  /// The minimum length of the scrollbar thumb.
  final double? minThumbLength;

  @override
  Widget build(BuildContext context) {
    final visible = (thumbVisibility ?? true) != false;
    return ScrollConfiguration(
      behavior: visible
          ? _ShowScrollbarBehavior(
              thumbVisibility: thumbVisibility,
              trackVisibility: trackVisibility,
              thumbColor: thumbColor,
              trackColor: trackColor,
              trackBorderColor: trackBorderColor,
              thickness: thickness,
              radius: radius,
              interactive: interactive,
              notificationPredicate: notificationPredicate,
              scrollbarOrientation: scrollbarOrientation,
              mainAxisMargin: mainAxisMargin,
              crossAxisMargin: crossAxisMargin,
              minThumbLength: minThumbLength,
            )
          : _HideScrollbarBehavior(),
      child: child,
    );
  }
}

// =============================================================================
// CLASS: _HideScrollbarBehavior
// =============================================================================

/// Custom scroll behavior to always hide the scrollbar
class _HideScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

// =============================================================================
// CLASS: _ShowScrollbarBehavior
// =============================================================================

/// Custom scroll behavior to always show the scrollbar
class _ShowScrollbarBehavior extends ScrollBehavior {
  /// Default constructor
  const _ShowScrollbarBehavior({
    this.thumbVisibility,
    this.trackVisibility,
    this.thumbColor,
    this.trackColor,
    this.trackBorderColor,
    this.thickness,
    this.radius,
    this.interactive,
    this.notificationPredicate,
    this.scrollbarOrientation,
    this.mainAxisMargin,
    this.crossAxisMargin,
    this.minThumbLength,
  });
  final WidgetStateProperty<bool?>? thumbVisibility;
  final WidgetStateProperty<bool?>? trackVisibility;
  final WidgetStateProperty<Color?>? thumbColor;
  final WidgetStateProperty<Color?>? trackColor;
  final WidgetStateProperty<Color?>? trackBorderColor;
  final WidgetStateProperty<double?>? thickness;
  final Radius? radius;
  final bool? interactive;
  final ScrollNotificationPredicate? notificationPredicate;
  final ScrollbarOrientation? scrollbarOrientation;
  final double? mainAxisMargin;
  final double? crossAxisMargin;
  final double? minThumbLength;

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    final theme = Theme.of(context);
    return Theme(
      data: theme.copyWith(
        scrollbarTheme: theme.scrollbarTheme.copyWith(
          thumbVisibility: thumbVisibility,
          thickness: thickness,
          trackVisibility: trackVisibility,
          interactive: interactive,
          radius: radius,
          thumbColor: thumbColor,
          trackColor: trackColor,
          trackBorderColor: trackBorderColor,
          crossAxisMargin: crossAxisMargin,
          mainAxisMargin: mainAxisMargin,
          minThumbLength: minThumbLength,
        ),
      ),
      child: Scrollbar(
        controller: details.controller,
        notificationPredicate: notificationPredicate,
        scrollbarOrientation: scrollbarOrientation,
        child: child,
      ),
    );
  }
}
