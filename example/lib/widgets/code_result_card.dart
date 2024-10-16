import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// CLASS: AppCodeResultCard
// =================================================

class AppCodeResultCard extends StatelessWidget {
  const AppCodeResultCard({
    required this.children,
    super.key,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: TOffset.b20,
      child: ClipRRect(
        borderRadius: TBorderRadius.rounded_lg,
        child: CustomPaint(
          painter: _GridPaperPainter(context),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: TOffset.a20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =================================================
// CLASS: _GridPaperPainter
// =================================================

class _GridPaperPainter extends CustomPainter {
  _GridPaperPainter(this.context);

  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final tw = context.tw;
    final color = context.theme.dividerColor.withOpacity(tw.light ? 0.4 : 0.5);
    const gridSize = 32.0;
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
