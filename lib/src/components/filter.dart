// Match Tailwind naming conventions for traceability
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TFilter
// =============================================================================

/// Apply a filter to a child widget.
class TFilter extends StatelessWidget {
  const TFilter._({this.child, super.key});

  /// Apply a gaussian blur filter to a widget.
  ///
  /// For consistency, the blur value is limited to a range of 0.0 to 20.0.
  ///
  /// A blur value of 0.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/filter-blur
  factory TFilter.blur({
    Key? key,
    Widget? child,
    double value = 0,
  }) {
    return _BlurFilter(key: key, value: value, child: child);
  }

  /// Apply a brightness filter to a widget.
  ///
  /// For consistency, the brightness value is limited to a range of 0.0 to 2.0.
  ///
  /// A brightness value of 1.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/filter-brightness
  factory TFilter.brightness({
    Widget? child,
    Key? key,
    double value = 1.0,
  }) {
    return _BrightnessFilter(key: key, value: value, child: child);
  }

  /// Apply a contrast filter to a widget.
  ///
  /// For consistency, the contrast value is limited to a range of 0.0 to 2.0.
  ///
  /// A contrast value of 1.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/filter-contrast
  factory TFilter.contrast({
    Key? key,
    Widget? child,
    double value = 1.0,
  }) {
    return _ContrastFilter(key: key, value: value, child: child);
  }

  /// Apply a grayscale filter to a widget.
  ///
  /// For consistency, the grayscale value is limited to a range of 0.0 to 1.0.
  ///
  /// A grayscale value of 0.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/filter-grayscale
  factory TFilter.grayscale({
    Key? key,
    Widget? child,
    double value = 0.0,
  }) {
    return _GrayscaleFilter(key: key, value: value, child: child);
  }

  /// Apply a hue-rotate filter to a widget.
  ///
  /// For consistency, the hue-rotate value is limited to a range of 0 to 360.
  ///
  /// A hue-rotate value of 0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/filter-hue-rotate
  factory TFilter.hueRotate({
    Key? key,
    Widget? child,
    double value = 0.0,
  }) {
    return _HueRotateFilter(key: key, value: value, child: child);
  }

  /// Apply a invert filter to a widget.
  ///
  /// For consistency, the inversion value is limited to a range of 0.0 to 1.0.
  ///
  /// An invert value of 0.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/filter-invert
  factory TFilter.invert({
    Key? key,
    Widget? child,
    double value = 0.0,
  }) {
    return _InvertFilter(key: key, value: value, child: child);
  }

  /// Apply a saturation filter to a widget.
  ///
  /// For consistency, the saturation value is limited to a range of 0.0 to 2.0.
  ///
  /// A saturation value of 1.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/filter-saturate
  factory TFilter.saturate({
    Key? key,
    Widget? child,
    double value = 1.0,
  }) {
    return _SaturateFilter(key: key, value: value, child: child);
  }

  /// Apply a sepia filter to a widget.
  ///
  /// For consistency, the saturation value is limited to a range of 0.0 to 1.0.
  ///
  /// A saturation value of 0.0 will have no effect on the image.
  ///
  /// https://tailwindcss.com/docs/filter-sepia
  factory TFilter.sepia({
    Key? key,
    Widget? child,
    double value = 0.0,
  }) {
    return _SepiaFilter(key: key, value: value, child: child);
  }

  /// The child widget to apply the filter to.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

// =============================================================================
// CLASS: _BlurFilter
// =============================================================================

class _BlurFilter extends TFilter {
  const _BlurFilter({
    required this.value,
    super.child,
    super.key,
  }) : super._();

  final double value;

  @override
  Widget build(BuildContext context) {
    // Apply reasonable limits to the intensity value
    final sigma = value.clamp(TFilterMatrix.blurMin, TFilterMatrix.blurMax);
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: sigma,
        sigmaY: sigma,
        tileMode: TileMode.decal,
      ),
      child: child,
    );
  }
}

// =============================================================================
// CLASS: _BrightnessFilter
// =============================================================================

class _BrightnessFilter extends TFilter {
  const _BrightnessFilter({
    required this.value,
    super.child,
    super.key,
  }) : super._();

  final double value;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(TFilterMatrix.brightness(value)),
      child: child,
    );
  }
}

// =============================================================================
// CLASS: _ContrastFilter
// =============================================================================

class _ContrastFilter extends TFilter {
  const _ContrastFilter({
    required this.value,
    super.child,
    super.key,
  }) : super._();

  final double value;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(TFilterMatrix.contrast(value)),
      child: child,
    );
  }
}

// =============================================================================
// CLASS: _GrayscaleFilter
// =============================================================================

class _GrayscaleFilter extends TFilter {
  const _GrayscaleFilter({
    required this.value,
    super.child,
    super.key,
  }) : super._();

  final double value;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(TFilterMatrix.grayscale(value)),
      child: child,
    );
  }
}

// =============================================================================
// CLASS: _HueRotateFilter
// =============================================================================

class _HueRotateFilter extends TFilter {
  const _HueRotateFilter({
    required this.value,
    super.child,
    super.key,
  }) : super._();

  final double value;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(TFilterMatrix.hueRotate(value)),
      child: child,
    );
  }
}

// =============================================================================
// CLASS: _InvertFilter
// =============================================================================

class _InvertFilter extends TFilter {
  const _InvertFilter({
    required this.value,
    super.child,
    super.key,
  }) : super._();

  final double value;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(TFilterMatrix.invert(value)),
      child: child,
    );
  }
}

// =============================================================================
// CLASS: _SaturateFilter
// =============================================================================

class _SaturateFilter extends TFilter {
  const _SaturateFilter({
    required this.value,
    super.child,
    super.key,
  }) : super._();

  final double value;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(TFilterMatrix.saturate(value)),
      child: child,
    );
  }
}

// =============================================================================
// CLASS: _SepiaFilter
// =============================================================================

class _SepiaFilter extends TFilter {
  const _SepiaFilter({
    required this.value,
    super.child,
    super.key,
  }) : super._();

  final double value;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(TFilterMatrix.sepia(value)),
      child: child,
    );
  }
}
