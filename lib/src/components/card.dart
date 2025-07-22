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
    this.padding = TOffset.a16,
    this.header,
    this.headerColor,
    this.headerBorder,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.expanded = false,
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
  final EdgeInsets? padding;

  /// The heading widget to display inside the card.
  final Widget? header;

  /// The color of the card header.
  final Color? headerColor;

  /// The border side of the card heading.
  final BorderSide? headerBorder;

  //// The cross axis alignment of the card content.
  final CrossAxisAlignment crossAxisAlignment;

  /// The main axis alignment of the card content.
  final MainAxisAlignment mainAxisAlignment;

  /// Whether the child should be expanded to fill the available space.
  ///
  /// Useful for scrollable card content since the header/content are rendered
  /// within a Column and depending on the use case, expansion may be desired.
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final cardTheme = context.theme.cardTheme;
    final defaultBorder = BorderSide(color: tw.color.divider);

    EdgeInsets effectivePadding = padding ?? TOffset.a16;
    if (header != null && headerBorder?.width == 0) {
      // Account for the padding of the header
      effectivePadding = effectivePadding.copyWith(
        top: effectivePadding.top / 2,
      );
    }

    Widget? effectiveChild;
    if (child != null) {
      effectiveChild = MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Padding(padding: effectivePadding, child: child),
      );
    }

    return CardTheme(
      data: cardTheme.copyWith(
        color: color,
        surfaceTintColor: Colors.transparent,
        shadowColor: tw.color.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: border ?? defaultBorder,
        ),
        elevation: elevation,
        margin: EdgeInsets.zero,
      ),
      child: Card(
        child: header == null
            ? effectiveChild
            : Column(
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  if (header != null)
                    Container(
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                      ),
                      padding: effectivePadding,
                      decoration: BoxDecoration(
                        color: headerColor,
                        border: Border(bottom: headerBorder ?? defaultBorder),
                      ),
                      child: DefaultTextStyle.merge(
                        style: TextStyle(
                          color:
                              headerColor?.contrastBlackWhite() ??
                              tw.color.title,
                          fontWeight: TFontWeight.semibold,
                        ),
                        child: header!,
                      ),
                    ),
                  if (effectiveChild != null)
                    Expanded(flex: expanded ? 1 : 0, child: effectiveChild),
                ],
              ),
      ),
    );
  }
}
