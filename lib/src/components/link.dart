import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:url_launcher/link.dart';

// =============================================================================
// CLASS: TLink
// =============================================================================

/// A Tailwind UI inspired link button
class TLink extends StatelessWidget {
  /// Constructor for [TLink].
  const TLink({
    super.key,
    required this.child,
    this.onPressed,
    this.onHover,
    this.color,
    this.textStyle,
    this.decorate = true,
    this.tooltip,
  });

  /// Constructor for [TLink] with a URI.
  static Widget uri({
    Key? key,
    required Uri uri,
    required Widget child,
    Color? color,
    WidgetStateProperty<TextStyle?>? textStyle,
    bool decorate = true,
    String? tooltip,
    LinkTarget target = kIsWeb ? LinkTarget.blank : LinkTarget.defaultTarget,
  }) {
    return Link(
      key: key,
      uri: uri,
      target: target,
      builder: (context, followLink) {
        return TLink(
          color: color,
          textStyle: textStyle,
          decorate: decorate,
          tooltip: tooltip,
          onPressed: followLink,
          child: child,
        );
      },
    );
  }

  /// The child widget.
  final Widget child;

  /// The callback that is called when the link is tapped.
  final VoidCallback? onPressed;

  /// The callback that is called when the link is hovered.
  final ValueChanged<bool>? onHover;

  /// The color of the link when hovered.
  final Color? color;

  /// The dynamic text style to apply to the link.
  final WidgetStateProperty<TextStyle?>? textStyle;

  /// Whether to decorate ([TextDecoration.underline]) the link by default.
  final bool decorate;

  /// The tooltip to show when hovered.
  final String? tooltip;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final bool hasCallback = onPressed != null || onHover != null;

    return TGestureDetector(
      onTap: onPressed,
      onHover: onHover,
      mouseCursor: WidgetStatePropertyAll(
        hasCallback ? SystemMouseCursors.click : SystemMouseCursors.basic,
      ),
      builder: (context, states) {
        final decorate = states.hovered && hasCallback;
        final baseTextStyle = textStyle?.resolve(states);
        final color = this.color ?? tw.color.link;

        final style = TextStyle(
          color: decorate ? color : null,
          decorationColor: decorate && this.decorate ? color : null,
          decoration: decorate && this.decorate
              ? TextDecoration.underline
              : null,
        ).merge(baseTextStyle);

        return TTooltip(
          message: tooltip,
          child: IconTheme(
            data: IconTheme.of(context).copyWith(color: style.color),
            child: DefaultTextStyle.merge(
              style: style,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
