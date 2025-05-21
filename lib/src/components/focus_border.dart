import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TFocusBorder
// =============================================================================

/// Add a focus border to a widget.
class TFocusBorder extends StatelessWidget {
  /// Constructor.
  const TFocusBorder({
    required this.child,
    this.focused = false,
    this.focusColor,
    this.borderRadius,
    this.width = 1.5,
    super.key,
  });

  /// The widget to add the focus border to.
  final Widget child;

  /// Whether the focus border is visible.
  final bool focused;

  /// The color of the focus border.
  final Color? focusColor;

  /// The border radius of the focus border.
  final BorderRadius? borderRadius;

  /// The width of the focus border.
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      fit: StackFit.passthrough,
      children: [
        if (focused)
          Positioned.fill(
            child: CustomPaint(
              painter: _RingPainter(
                color: focusColor,
                borderRadius: borderRadius,
                width: width,
              ),
            ),
          ),
        child,
      ],
    );
  }
}

// =============================================================================
// CLASS: _RingPainter
// =============================================================================

class _RingPainter extends CustomPainter {
  _RingPainter({
    this.color,
    this.borderRadius,
    this.width,
  });

  final Color? color;
  final BorderRadius? borderRadius;
  final double? width;

  @override
  void paint(Canvas canvas, Size size) {
    final effectiveWidth = width ?? 1.5;
    final paint = Paint()
      ..color = color ?? TColors.indigo
      ..style = PaintingStyle.stroke
      ..strokeWidth = effectiveWidth;

    final offset = -(effectiveWidth - 0.5);
    final borderOffset = Radius.circular(offset);

    // This will paint outside the bounds of the widget
    // Without sufficient padding, the border will be clipped
    // Although more appealing, this needs more work than just using a Stack
    // const offset = 3.0;
    // const borderOffset = Radius.circular(offset);

    final rect = Rect.fromLTWH(
      -offset,
      -offset,
      size.width + offset * 2,
      size.height + offset * 2,
    );
    if (borderRadius == null) {
      canvas.drawRect(rect, paint);
    } else {
      final br = borderRadius!;
      final brOffset =
          br.add(
                BorderRadius.only(
                  topLeft: (br.topLeft.x > 0 && br.topLeft.y > 0)
                      ? borderOffset
                      : Radius.zero,
                  topRight: (br.topRight.x > 0 && br.topRight.y > 0)
                      ? borderOffset
                      : Radius.zero,
                  bottomRight: (br.bottomRight.x > 0 && br.bottomRight.y > 0)
                      ? borderOffset
                      : Radius.zero,
                  bottomLeft: (br.bottomLeft.x > 0 && br.bottomLeft.y > 0)
                      ? borderOffset
                      : Radius.zero,
                ),
              )
              as BorderRadius;

      canvas.drawRRect(brOffset.toRRect(rect), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
