import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// ENUM: TStyledContainerVariant
// =============================================================================

/// The variant of the styled container.
enum TStyledContainerVariant {
  /// A basic styled container.
  basic,

  /// A link styled container.
  link,

  /// An outlined styled container.
  outlined,

  /// A filled styled container.
  filled,

  /// A filled styled container with soft colors.
  soft,
}

// =============================================================================
// CLASS: TStyledContainer
// =============================================================================

/// A container with predefined styles.
class TStyledContainer extends StatelessWidget {
  /// Creates a [TStyledContainer].
  const TStyledContainer({
    required this.variant,
    super.key,
    this.child,
    this.color,
    this.leading,
    this.trailing,
    this.tooltip,
    this.fallbackPadding,
    this.fallbackTextStyle,
    this.animationDuration = Duration.zero,
    this.backgroundColor,
    this.padding,
    this.border,
    this.borderRadius,
    this.textStyle,
  });

  /// The variant of the styled container.
  final TStyledContainerVariant variant;

  /// The color to apply to variant styling.
  final Color? color;

  /// The child widget.
  final Widget? child;

  /// The a leading widget.
  final Widget? leading;

  /// The a trailing widget.
  final Widget? trailing;

  /// The a trailing widget for the badge.
  final String? tooltip;

  /// The fallback padding.
  final EdgeInsets? fallbackPadding;

  /// The fallback text style.
  final TextStyle? fallbackTextStyle;

  /// The duration of the animation.
  final Duration animationDuration;

  /// The background color of the container.
  final WidgetStateProperty<Color?>? backgroundColor;

  /// The padding of the container.
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;

  /// The border of the container.
  final WidgetStateProperty<BoxBorder?>? border;

  /// The border radius of the container.
  final WidgetStateProperty<BorderRadius?>? borderRadius;

  /// The text style of the container.
  final WidgetStateProperty<TextStyle?>? textStyle;

  // ---------------------------------------------------------------------------
  // METHOD: _getEffectiveBorder
  // ---------------------------------------------------------------------------

  /// Returns the effective border of the styled container.
  WidgetStateProperty<BoxBorder?> _getEffectiveBorder() {
    if (border != null) {
      return border!;
    }
    switch (variant) {
      case TStyledContainerVariant.basic:
        return WidgetStateProperty.all<BoxBorder?>(null);
      case TStyledContainerVariant.link:
        return WidgetStateProperty.all<BoxBorder?>(null);
      case TStyledContainerVariant.outlined:
        return WidgetStateProperty.all<BoxBorder?>(
          Border.all(color: TColors.orange),
        );
      case TStyledContainerVariant.filled:
        return WidgetStateProperty.all<BoxBorder?>(
          Border.all(color: TColors.fuchsia),
        );
      case TStyledContainerVariant.soft:
        return WidgetStateProperty.all<BoxBorder?>(
          Border.all(color: TColors.sky),
        );
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    /// Define the styles for the styled container
    final effectiveHorizontalOffset = 10.0;
    final effectiveBackgroundColor = color ?? Colors.transparent;
    final effectiveBorderRadius = BorderRadius.zero;

    // Define the button content
    final hasChild = child != null;
    final List<Widget> content = [];
    if (leading != null) {
      content.add(
        Padding(
          padding: EdgeInsets.only(
            right: hasChild ? effectiveHorizontalOffset : 0,
          ),
          child: leading,
        ),
      );
    }
    if (hasChild) {
      content.add(child!);
    }
    if (trailing != null) {
      content.add(
        Padding(
          padding: EdgeInsets.only(
            left: hasChild ? effectiveHorizontalOffset : 0,
          ),
          child: trailing,
        ),
      );
    }

    return TGestureDetector(
      // onTap: widget.onPressed,
      // onHover: widget.onHover,
      behavior: HitTestBehavior.translucent,
      builder: (context, states) {
        final effectiveTextStyle = fallbackTextStyle?.merge(
          textStyle?.resolve(states),
        );

        final effectivePadding = padding?.resolve(states) ?? fallbackPadding;

        final effectiveBorder = _getEffectiveBorder().resolve(states);

        return DefaultTextStyle.merge(
          style: DefaultTextStyle.of(context).style.merge(effectiveTextStyle),
          child: TTooltip(
            message: tooltip,
            child: AnimatedContainer(
              duration: animationDuration,
              padding: effectivePadding,
              decoration: BoxDecoration(
                color: effectiveBackgroundColor,
                border: effectiveBorder,
                borderRadius: effectiveBorderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: content,
              ),
            ),
          ),
        );
      },
    );
  }
}
