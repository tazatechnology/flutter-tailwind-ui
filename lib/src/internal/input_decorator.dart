import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TInputBorderWrapper
// =============================================================================

/// A wrapper widget that paints a border around its child.
class TInputBorderWrapper extends StatelessWidget {
  /// Creates a [TInputBorderWrapper] widget.
  const TInputBorderWrapper({
    required this.child,
    super.key,
    this.enabled = true,
    this.padding = EdgeInsets.zero,
    this.constraints,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.mouseCursor,
    this.canRequestFocus = true,
    this.onTap,
    this.onKeyEvent,
  });

  /// The child widget
  final Widget child;

  /// Whether the widget is enabled
  final bool enabled;

  /// The padding around the child
  final EdgeInsets padding;

  /// The constraints for the container
  final BoxConstraints? constraints;

  /// The fill color for the input field.
  final WidgetStateProperty<Color?>? fillColor;

  /// The stateful border color for the input field.
  final WidgetStateProperty<Color?>? borderColor;

  /// The stateful border color for the input field.
  final WidgetStateProperty<BorderRadius?>? borderRadius;

  /// The mouse cursor for the widget
  final WidgetStateProperty<MouseCursor?>? mouseCursor;

  /// Whether the widget can request focus
  final bool canRequestFocus;

  /// The callback when the widget is tapped
  final GestureTapCallback? onTap;

  /// The callback when the widget receives a key event
  final FocusOnKeyEventCallback? onKeyEvent;

  // ---------------------------------------------------------------------------
  // METHOD: resolveInputBorder
  // ---------------------------------------------------------------------------

  /// Resolve the input border based on the current context and states.
  static WidgetStateProperty<InputBorder?> resolveInputBorder({
    required BuildContext context,
    WidgetStateProperty<Color?>? borderColor,
    WidgetStateProperty<BorderRadius?>? borderRadius,
  }) {
    return WidgetStateProperty.resolveWith<InputBorder?>((states) {
      final inputTheme = context.theme.inputDecorationTheme;
      InputBorder? border;
      if (states.focused) {
        border = inputTheme.focusedBorder?.copyWith(
          borderSide: inputTheme.focusedBorder?.borderSide.copyWith(
            color:
                borderColor?.resolve({WidgetState.focused}) ??
                inputTheme.focusedBorder?.borderSide.color,
          ),
        );
      } else if (states.error) {
        border = inputTheme.errorBorder?.copyWith(
          borderSide: inputTheme.errorBorder?.borderSide.copyWith(
            color:
                borderColor?.resolve({WidgetState.focused}) ??
                inputTheme.errorBorder?.borderSide.color,
          ),
        );
      } else if (states.disabled) {
        border = inputTheme.disabledBorder?.copyWith(
          borderSide: inputTheme.disabledBorder?.borderSide.copyWith(
            color:
                borderColor?.resolve({WidgetState.focused}) ??
                inputTheme.disabledBorder?.borderSide.color,
          ),
        );
      } else {
        border = inputTheme.enabledBorder?.copyWith(
          borderSide: inputTheme.enabledBorder?.borderSide.copyWith(
            color:
                borderColor?.resolve({WidgetState.focused}) ??
                inputTheme.enabledBorder?.borderSide.color,
          ),
        );
      }

      if (border is OutlineInputBorder) {
        border = border.copyWith(
          borderRadius: borderRadius?.resolve(states),
        );
      }

      return border;
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return TGestureDetector(
      onTap: onTap,
      onKeyEvent: onKeyEvent,
      canRequestFocus: canRequestFocus,
      mouseCursor: mouseCursor,
      builder: (context, statesData) {
        // Create a copy of the states and modify as needed
        final states = Set<WidgetState>.from(statesData);
        if (!enabled) {
          states.add(WidgetState.disabled);
        }

        final effectiveBorder =
            resolveInputBorder(
              context: context,
              borderColor: borderColor,
              borderRadius: borderRadius,
            ).resolve(states) ??
            const OutlineInputBorder();

        return CustomPaint(
          foregroundPainter: _InputBorderPainter(effectiveBorder),
          child: Container(
            constraints: constraints,
            alignment: Alignment.centerLeft,
            padding: padding,
            decoration: BoxDecoration(
              color: fillColor?.resolve(states) ?? context.tw.color.background,
              borderRadius: borderRadius?.resolve(states),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

class _InputBorderPainter extends CustomPainter {
  _InputBorderPainter(this.inputBorder);

  final InputBorder inputBorder;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    if (inputBorder is OutlineInputBorder) {
      final OutlineInputBorder outlineBorder =
          inputBorder as OutlineInputBorder;
      // Resolve the border radius using the ambient TextDirection.
      final RRect rrect = outlineBorder.borderRadius
          .resolve(TextDirection.ltr)
          .toRRect(rect);
      // For simplicity, we pass null and zero values for gap parameters.
      outlineBorder.paint(canvas, rrect.outerRect);
    } else {
      // For other types of InputBorder, just call its paint method.
      inputBorder.paint(canvas, rect.deflate(0));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
