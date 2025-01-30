// Match Tailwind naming conventions for traceability
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/src/utilities/filter_matrix.dart';

// =============================================================================
// CLASS: TBackdropFilter
// =============================================================================

/// Apply a filter to a child widget.
class TBackdropFilter extends StatelessWidget {
  const TBackdropFilter._({
    required this.filter,
    this.child,
    this.background,
    super.key,
  });

  /// Apply a backdrop gaussian blur filter to a widget.
  ///
  /// For consistency, the blur value is limited to a range of 0.0 to 20.0.
  ///
  /// A blur value of 0.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/backdrop-filter-blur
  factory TBackdropFilter.blur({
    Key? key,
    Widget? background,
    Widget? child,
    double value = 0,
  }) {
    final sigma = value.clamp(TFilterMatrix.blurMin, TFilterMatrix.blurMax);
    return TBackdropFilter._(
      key: key,
      filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      background: background,
      child: child,
    );
  }

  /// Apply a backdrop brightness filter to a widget.
  ///
  /// For consistency, the brightness value is limited to a range of 0.0 to 2.0.
  ///
  /// A brightness value of 1.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/backdrop-filter-brightness
  factory TBackdropFilter.brightness({
    Key? key,
    Widget? background,
    Widget? child,
    double value = 1.0,
  }) {
    return TBackdropFilter._(
      key: key,
      filter: ColorFilter.matrix(TFilterMatrix.brightness(value)),
      background: background,
      child: child,
    );
  }

  /// Apply a backdrop contrast filter to a widget.
  ///
  /// For consistency, the contrast value is limited to a range of 0.0 to 2.0.
  ///
  /// A contrast value of 1.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/backdrop-filter-brightness
  factory TBackdropFilter.contrast({
    Key? key,
    Widget? background,
    Widget? child,
    double value = 1.0,
  }) {
    return TBackdropFilter._(
      key: key,
      filter: ColorFilter.matrix(TFilterMatrix.contrast(value)),
      background: background,
      child: child,
    );
  }

  /// Apply a backdrop grayscale filter to a widget.
  ///
  /// For consistency, the grayscale value is limited to a range of 0.0 to 1.0.
  ///
  /// A grayscale value of 0.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/backdrop-filter-grayscale
  factory TBackdropFilter.grayscale({
    Key? key,
    Widget? background,
    Widget? child,
    double value = 1.0,
  }) {
    return TBackdropFilter._(
      key: key,
      filter: ColorFilter.matrix(TFilterMatrix.grayscale(value)),
      background: background,
      child: child,
    );
  }

  /// Apply a backdrop hue-rotate filter to a widget.
  ///
  /// For consistency, the hue-rotate value is limited to a range of 0 to 360.
  ///
  /// A hue-rotate value of 0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/backdrop-filter-hue-rotate
  factory TBackdropFilter.hueRotate({
    Key? key,
    Widget? background,
    Widget? child,
    double value = 0.0,
  }) {
    return TBackdropFilter._(
      key: key,
      filter: ColorFilter.matrix(TFilterMatrix.hueRotate(value)),
      background: background,
      child: child,
    );
  }

  /// Apply a backdrop invert filter to a widget.
  ///
  /// For consistency, the inversion value is limited to a range of 0.0 to 1.0.
  ///
  /// An invert value of 0.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/backdrop-filter-invert
  factory TBackdropFilter.invert({
    Key? key,
    Widget? background,
    Widget? child,
    double value = 0.0,
  }) {
    return TBackdropFilter._(
      key: key,
      filter: ColorFilter.matrix(TFilterMatrix.invert(value)),
      background: background,
      child: child,
    );
  }

  /// Apply a backdrop saturation filter to a widget.
  ///
  /// For consistency, the saturation value is limited to a range of 0.0 to 2.0.
  ///
  /// A saturation value of 1.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/backdrop-filter-saturate
  factory TBackdropFilter.saturate({
    Key? key,
    Widget? background,
    Widget? child,
    double value = 1.0,
  }) {
    return TBackdropFilter._(
      key: key,
      filter: ColorFilter.matrix(TFilterMatrix.saturate(value)),
      background: background,
      child: child,
    );
  }

  /// Apply a backdrop sepia filter to a widget.
  ///
  /// For consistency, the saturation value is limited to a range of 0.0 to 1.0.
  ///
  /// A saturation value of 0.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/backdrop-filter-sepia
  factory TBackdropFilter.sepia({
    Key? key,
    Widget? background,
    Widget? child,
    double value = 0.0,
  }) {
    return TBackdropFilter._(
      key: key,
      filter: ColorFilter.matrix(TFilterMatrix.sepia(value)),
      background: background,
      child: child,
    );
  }

  /// The background widget to apply the filter to.
  final Widget? background;

  /// The child widget (foreground), which is rendered on top of the filter.
  final Widget? child;

  /// The filter to apply.
  final ImageFilter filter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        background ?? const SizedBox.shrink(),
        ClipRect(
          child: BackdropFilter(
            filter: filter,
            child: child ?? const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
