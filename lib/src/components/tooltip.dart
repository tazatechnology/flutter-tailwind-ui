import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// CLASS: TTooltip
// =================================================

/// A Tailwind inspired tooltip widget.
class TTooltip extends StatelessWidget {
  /// Constructs a [TTooltip] widget.
  const TTooltip({
    required this.child,
    this.message,
    this.waitDuration,
    this.textStyle,
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

  /// Convert message to rich text formatting using [TRichParser].
  final bool rich;

  @override
  Widget build(BuildContext context) {
    // Completely bypass the tooltip if there is no message.
    if (message?.isEmpty ?? true) {
      return child;
    }

    String? effectiveMessage;
    InlineSpan? effectiveRichMessage;

    final textStyle = const TextStyle()
        .merge(
          context.theme.tooltipTheme.textStyle?.copyWithout(
            removeColor: true,
          ),
        )
        .merge(this.textStyle);

    if (rich) {
      effectiveRichMessage = TRichParser().parse(
        context: context,
        text: message!,
        style: textStyle,
      );
    } else {
      effectiveMessage = message;
    }

    return Tooltip(
      preferBelow: false,
      textStyle: rich ? null : textStyle,
      waitDuration: waitDuration,
      message: effectiveMessage,
      richMessage: effectiveRichMessage,
      child: child,
    );
  }
}
