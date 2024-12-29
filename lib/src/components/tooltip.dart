import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TTooltip
// =============================================================================

/// A Tailwind inspired tooltip widget.
class TTooltip extends StatefulWidget {
  /// Constructs a [TTooltip] widget.
  const TTooltip({
    required this.child,
    this.message,
    this.waitDuration,
    this.textStyle,
    this.gap = 4,
    this.preferBelow = false,
    this.rich = true,
    super.key,
  });

  /// The child widget to display the tooltip on.
  final Widget child;

  /// The message to display in the tooltip.
  final String? message;

  /// The duration to wait before showing the tooltip.
  final Duration? waitDuration;

  /// The [TextStyle] to apply to the tooltip
  final TextStyle? textStyle;

  /// The gap between the child widget and the tooltip.
  final double gap;

  /// Whether to prefer showing the tooltip below the child widget.
  final bool preferBelow;

  /// Convert message to rich text formatting using [TRichParser].
  final bool rich;

  @override
  State<TTooltip> createState() => _TTooltipState();
}

class _TTooltipState extends State<TTooltip> {
  final GlobalKey childKey = GlobalKey();
  double childHeight = 0;

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          childKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        setState(() {
          childHeight = renderBox.size.height;
        });
      }
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    // Completely bypass the tooltip if there is no message.
    if (widget.message?.isEmpty ?? true) {
      return widget.child;
    }

    String? effectiveMessage;
    InlineSpan? effectiveRichMessage;
    final tooltipTheme = TooltipTheme.of(context);

    final textStyle = tooltipTheme.textStyle
        ?.copyWithout(removeColor: true)
        .merge(widget.textStyle);

    if (widget.rich) {
      effectiveRichMessage = TRichParser().parse(
        context: context,
        text: widget.message!,
        style: textStyle,
      );
    } else {
      effectiveMessage = widget.message;
    }

    return Tooltip(
      preferBelow: widget.preferBelow,
      textStyle: widget.rich ? null : textStyle,
      waitDuration: widget.waitDuration,
      message: effectiveMessage,
      richMessage: effectiveRichMessage,
      verticalOffset: childHeight / 2 + widget.gap,
      child: KeyedSubtree(
        key: childKey,
        child: widget.child,
      ),
    );
  }
}
