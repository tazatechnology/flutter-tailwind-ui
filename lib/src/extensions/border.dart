import 'package:flutter/material.dart';

// =============================================================================
// EXTENSION: BoxBorder
// =============================================================================

/// Extension on [double] to provide useful methods
extension XTailwindBoxBorder on BoxBorder {
  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  /// Copy a [BoxBorder] with new properties to all sides
  ///
  /// This method will properly handle [Border] and [BorderDirectional] objects
  /// since [BoxBorder] does not have a `copyWith` method.
  BoxBorder copyWith({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final b = this;
    if (b is Border) {
      return Border(
        top: b.top.copyWith(
          color: color,
          width: width,
          style: style,
          strokeAlign: strokeAlign,
        ),
        left: b.left.copyWith(
          color: color,
          width: width,
          style: style,
          strokeAlign: strokeAlign,
        ),
        bottom: b.bottom.copyWith(
          color: color,
          width: width,
          style: style,
          strokeAlign: strokeAlign,
        ),
        right: b.right.copyWith(
          color: color,
          width: width,
          style: style,
          strokeAlign: strokeAlign,
        ),
      );
    } else if (b is BorderDirectional) {
      return BorderDirectional(
        top: b.top.copyWith(
          color: color,
          width: width,
          style: style,
          strokeAlign: strokeAlign,
        ),
        start: b.start.copyWith(
          color: color,
          width: width,
          style: style,
          strokeAlign: strokeAlign,
        ),
        end: b.end.copyWith(
          color: color,
          width: width,
          style: style,
          strokeAlign: strokeAlign,
        ),
        bottom: b.bottom.copyWith(
          color: color,
          width: width,
          style: style,
          strokeAlign: strokeAlign,
        ),
      );
    } else {
      return b;
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: copyWithSides
  // ---------------------------------------------------------------------------

  /// Copy a [BoxBorder] with new sides
  BoxBorder copyWithSides({
    BorderSide? top,
    BorderSide? left,
    BorderSide? bottom,
    BorderSide? right,
  }) {
    final b = this;
    if (b is Border) {
      return Border(
        top: top ?? b.top,
        left: left ?? b.left,
        bottom: bottom ?? b.bottom,
        right: right ?? b.right,
      );
    } else if (b is BorderDirectional) {
      return BorderDirectional(
        top: top ?? b.top,
        start: left ?? b.start,
        end: right ?? b.end,
        bottom: bottom ?? b.bottom,
      );
    } else {
      return b;
    }
  }
}

// =============================================================================
// EXTENSION: Border
// =============================================================================

/// Extension on [double] to provide useful methods
extension XTailwindBorder on Border {
  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  /// Copy a [Border] with new sides
  Border copyWith({
    BorderSide? top,
    BorderSide? left,
    BorderSide? bottom,
    BorderSide? right,
  }) {
    return Border(
      top: top ?? this.top,
      left: left ?? this.top,
      bottom: bottom ?? this.top,
      right: right ?? this.top,
    );
  }
}

// =============================================================================
// EXTENSION: BorderDirectional
// =============================================================================

/// Extension on [double] to provide useful methods
extension XTailwindBorderDirectional on BorderDirectional {
  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  /// Copy a [BorderDirectional] with new sides
  BorderDirectional copyWith({
    BorderSide? top,
    BorderSide? start,
    BorderSide? end,
    BorderSide? bottom,
  }) {
    return BorderDirectional(
      top: top ?? this.top,
      start: start ?? this.start,
      end: end ?? this.end,
      bottom: bottom ?? this.bottom,
    );
  }
}
