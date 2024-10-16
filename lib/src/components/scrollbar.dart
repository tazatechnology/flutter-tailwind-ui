import 'package:flutter/material.dart';

// =================================================
// CLASS: TScrollbar
// =================================================

/// Extended functionality for adding/removing scrollbars from a scrollable widget
class TScrollbar extends StatelessWidget {
  /// Default constructor
  const TScrollbar({
    required this.child,
    this.visible,
    this.trackVisibility,
    this.thumbColor,
    this.trackColor,
    this.trackBorderColor,
    this.thickness,
    this.radius,
    this.interactive,
    this.notificationPredicate,
    this.scrollbarOrientation,
    super.key,
  });

  /// The scrollable widget
  final Widget child;

  /// Whether the scrollbar is visible
  ///
  /// Set to `true` to always show the scrollbar
  /// Set to `false` to always hide the scrollbar
  /// Set to `null` to use the default behavior (show when scrolling)
  final bool? visible;

  /// The track visibility of the scrollbar.
  final bool? trackVisibility;

  /// The color of the scrollbar thumb.
  final Color? thumbColor;

  /// The color of the scrollbar track.
  final Color? trackColor;

  /// The color of the scrollbar track border.
  final Color? trackBorderColor;

  /// The thickness of the scrollbar in the cross axis of the scrollable.
  final double? thickness;

  /// The [Radius] of the scrollbar thumb's rounded rectangle corners.
  final Radius? radius;

  /// If true, the scrollbar will be interactive, allowing the user to drag the scrollbar thumb.
  final bool? interactive;

  /// A predicate for [ScrollNotification], used to customize widgets that
  /// listen to notifications from their children.
  final ScrollNotificationPredicate? notificationPredicate;

  /// An orientation along either the horizontal or vertical [Axis].
  final ScrollbarOrientation? scrollbarOrientation;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: (visible ?? true) != false
          ? _ShowScrollbar(
              thumbVisibility: visible,
              trackVisibility: trackVisibility,
              thumbColor: thumbColor,
              trackColor: trackColor,
              trackBorderColor: trackBorderColor,
              thickness: thickness,
              radius: radius,
              interactive: interactive,
              notificationPredicate: notificationPredicate,
              scrollbarOrientation: scrollbarOrientation,
            )
          : _HideScrollbar(),
      child: child,
    );
  }
}

// =================================================
// CLASS: _HideScrollbar
// =================================================

/// Custom scroll behavior to always hide the scrollbar
class _HideScrollbar extends ScrollBehavior {
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

/// Custom scroll behavior to always show the scrollbar
class _ShowScrollbar extends ScrollBehavior {
  /// Default constructor
  const _ShowScrollbar({
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
  });
  final bool? thumbVisibility;
  final bool? trackVisibility;
  final Color? thumbColor;
  final Color? trackColor;
  final Color? trackBorderColor;
  final double? thickness;
  final Radius? radius;
  final bool? interactive;
  final ScrollNotificationPredicate? notificationPredicate;
  final ScrollbarOrientation? scrollbarOrientation;

  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(thumbColor),
          trackColor: WidgetStateProperty.all(trackColor),
          trackBorderColor: WidgetStateProperty.all(trackBorderColor),
        ),
      ),
      child: Scrollbar(
        thumbVisibility: thumbVisibility,
        controller: details.controller,
        trackVisibility: trackVisibility,
        thickness: thickness,
        radius: radius,
        interactive: interactive,
        notificationPredicate: notificationPredicate,
        scrollbarOrientation: scrollbarOrientation,
        child: child,
      ),
    );
  }
}
