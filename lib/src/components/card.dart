import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TCard
// =============================================================================

/// A Tailwind UI inspired card.
class TCard extends StatelessWidget {
  /// Initialize the card.
  const TCard({
    super.key,
    this.child,
    this.color,
    this.border,
    this.borderRadius = TBorderRadius.rounded_lg,
    this.elevation = TElevation.shadow_sm,
    this.padding,
    this.header,
    this.headerBorder,
  });

  /// The child widget to display inside the card.
  final Widget? child;

  /// The background color of the card.
  final Color? color;

  /// The border side of the card.
  final BorderSide? border;

  /// The border side of the card.
  final BorderRadiusGeometry borderRadius;

  /// The elevation of the card.
  final double elevation;

  /// The content padding of the card.
  ///
  /// Dynamic based on screen size with a cutoff at [TScreen.screen_sm]
  final EdgeInsets? padding;

  /// The heading widget to display inside the card.
  final Widget? header;

  /// The border side of the card heading.
  final BorderSide? headerBorder;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final cardTheme = context.theme.cardTheme;
    final defaultBorder = BorderSide(color: tw.colors.divider);
    final effectivePadding = tw.screen.is_sm ? TOffset.a24 : TOffset.a16;

    // Account for the padding of the header
    EdgeInsets contentPadding = effectivePadding;
    if (header != null && headerBorder?.width == 0) {
      contentPadding = contentPadding.copyWith(
        top: effectivePadding.top / 2,
      );
    }

    return CardTheme(
      data: cardTheme.copyWith(
        color: color,
        surfaceTintColor: Colors.transparent,
        shadowColor: tw.colors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: border ?? defaultBorder,
        ),
        elevation: elevation,
        margin: EdgeInsets.zero,
      ),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (header != null)
              Container(
                padding: effectivePadding,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: headerBorder ?? defaultBorder,
                  ),
                ),
                child: DefaultTextStyle.merge(
                  style: const TextStyle(fontWeight: TFontWeight.semibold),
                  child: header!,
                ),
              ),
            if (child != null)
              MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                removeTop: true,
                child: Padding(
                  padding: contentPadding,
                  child: child,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
