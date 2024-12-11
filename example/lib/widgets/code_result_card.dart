import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: AppCodeResultCard
// =============================================================================

class AppCodeResultCard extends StatelessWidget {
  const AppCodeResultCard({
    required this.child,
    this.margin = TOffset.y0,
    this.alignment = Alignment.center,
    this.constraints = const BoxConstraints(minHeight: minHeight),
    super.key,
  });

  static const minHeight = _GridPaperPainter.gridSize * 5.0;

  final Widget child;
  final EdgeInsets margin;
  final Alignment alignment;
  final BoxConstraints? constraints;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      constraints: constraints,
      width: double.infinity,
      child: Card(
        child: ClipRRect(
          borderRadius: TBorderRadius.rounded_lg,
          child: CustomPaint(
            painter: _GridPaperPainter(context),
            child: Container(
              padding: TOffset.a20,
              alignment: alignment,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// CLASS: _GridPaperPainter
// =============================================================================

class _GridPaperPainter extends CustomPainter {
  _GridPaperPainter(this.context);
  final BuildContext context;
  static const gridSize = 22;

  @override
  void paint(Canvas canvas, Size size) {
    final tw = context.tw;
    final color = context.theme.dividerColor.withOpacity(tw.light ? 0.4 : 0.25);
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.75;

    // Draw vertical lines
    for (var x = 0.0; x <= size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (var y = 0.0; y <= size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
