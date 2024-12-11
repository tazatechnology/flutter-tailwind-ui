import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// ENUM: TButtonVariant
// =============================================================================

/// The variant of the button.
enum TButtonVariant {
  /// A basic button.
  basic,

  /// A filled button.
  filled,

  /// An outlined button.
  outlined,

  /// A link button.
  link,
}

// =============================================================================
// ENUM: TButtonSize
// =============================================================================

/// The size of the button.
enum TButtonSize {
  /// An extra-small button.
  xs,

  /// A small button.
  sm,

  /// A medium button.
  md,

  /// A large button.
  lg,

  /// An extra-large button.
  xl,
}

/// Extension on [TButtonSize] to provide useful methods
extension XTButtonSize on TButtonSize {
  /// The padding associated with the given [TButtonSize].
  EdgeInsets get padding {
    switch (this) {
      case TButtonSize.xs:
      case TButtonSize.sm:
        return TOffset.x8 + TOffset.y4;
      case TButtonSize.md:
        return TOffset.x10 + TOffset.y6;
      case TButtonSize.lg:
        return TOffset.x12 + TOffset.y8;
      case TButtonSize.xl:
        return TOffset.x14 + TOffset.y10;
    }
  }

  /// The font size associated with the given [TButtonSize].
  double get fontSize {
    switch (this) {
      case TButtonSize.xs:
        return TFontSize.text_xs;
      case TButtonSize.sm:
      case TButtonSize.md:
      case TButtonSize.lg:
      case TButtonSize.xl:
        return TFontSize.text_sm;
    }
  }

  /// The border radius associated with the given [TButtonSize].
  BorderRadius get borerRadius {
    switch (this) {
      case TButtonSize.xs:
      case TButtonSize.sm:
        return TBorderRadius.rounded;
      case TButtonSize.md:
      case TButtonSize.lg:
      case TButtonSize.xl:
        return TBorderRadius.rounded_md;
    }
  }
}

// =============================================================================
// CLASS: TButton
// =============================================================================

/// A button is a clickable element that triggers an action.
class TButton extends StatefulWidget {
  /// Creates a basic [TButton] button ([TButtonVariant.basic]).
  const TButton({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.onPressed,
    this.onHover,
    this.tooltip,
  })  : variant = TButtonVariant.basic,
        color = null;

  /// Creates a filled [TButton] button ([TButtonVariant.filled]).
  const TButton.filled({
    super.key,
    this.color,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TButtonVariant.filled;

  /// Creates an outlined [TButton] button ([TButtonVariant.outlined]).
  const TButton.outlined({
    super.key,
    this.color,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TButtonVariant.outlined;

  /// Creates a link [TButton] button ([TButtonVariant.link]).
  const TButton.link({
    super.key,
    this.color,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : variant = TButtonVariant.link;

  /// Creates a raw [TButton] button.
  const TButton.raw({
    required this.variant,
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.theme,
    this.size = TButtonSize.md,
    this.onPressed,
    this.onHover,
    this.tooltip,
  }) : color = null;

  /// The variant of the button.
  final TButtonVariant variant;

  /// The color to use for button styling.
  final Color? color;

  /// The custom theme override for the button.
  final Widget? child;

  /// The a leading widget for the badge.
  final Widget? leading;

  /// The a trailing widget for the badge.
  final Widget? trailing;

  /// The custom theme override for the button.
  final TButtonTheme? theme;

  /// The custom theme override for the button.
  final TButtonSize size;

  /// An action to call when the button is pressed.
  final VoidCallback? onPressed;

  /// Called when a pointer enters or exits the response area.
  final ValueChanged<bool>? onHover;

  /// The tooltip to display when hovering over the button.
  final String? tooltip;

  @override
  State<TButton> createState() => _TButtonState();
}

class _TButtonState extends State<TButton> {
  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: getTheme
  // ---------------------------------------------------------------------------

  /// Resolve the theme based on variant and user provided values
  TButtonTheme getTheme() {
    final tw = context.tw;

    final textColorFallback = tw.dark ? Colors.white : Colors.black;

    /// Define a fallback theme
    TButtonTheme theme = TButtonTheme(
      borderRadius: WidgetStateProperty.all(widget.size.borerRadius),
      textStyle: WidgetStateProperty.resolveWith((states) {
        return TextStyle(color: textColorFallback);
      }),
    );

    switch (widget.variant) {
      case TButtonVariant.basic:
        theme = theme.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.hovered) {
              return tw.dark ? TColors.zinc.shade800 : TColors.zinc.shade100;
            }
            return null;
          }),
        );
      case TButtonVariant.filled:
        final color = (widget.color ?? tw.colors.primary).toMaterialColor();
        final backgroundColor = tw.dark ? color.shade700 : color;
        theme = theme.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (color.isTransparent) {
              return Colors.transparent;
            }
            return backgroundColor.withOpacity(states.hovered ? 0.9 : 1);
          }),
          textStyle: WidgetStateProperty.resolveWith((states) {
            if (color.isTransparent) {
              return TextStyle(color: textColorFallback);
            }
            return TextStyle(color: color.contrastBlackWhite());
          }),
        );
      case TButtonVariant.outlined:
        if (widget.color == null) {
          theme = theme.copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.hovered) {
                return tw.dark ? TColors.gray.shade800 : TColors.gray.shade100;
              }
              return null;
            }),
            border: WidgetStateProperty.all(
              Border.all(
                color: tw.dark ? TColors.gray.shade700 : TColors.gray.shade200,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            textStyle: WidgetStateProperty.resolveWith((states) {
              return TextStyle(color: textColorFallback);
            }),
          );
        } else {
          final color = widget.color!.toMaterialColor();
          final backgroundColor = tw.dark ? color.shade700 : color;
          theme = theme.copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              return states.hovered ? backgroundColor : null;
            }),
            border: WidgetStateProperty.all(Border.all(color: backgroundColor)),
            textStyle: WidgetStateProperty.resolveWith((states) {
              if (states.hovered) {
                return TextStyle(color: backgroundColor.contrastBlackWhite());
              }
              return TextStyle(
                color: widget.color == null ? textColorFallback : color,
              );
            }),
          );
        }
      case TButtonVariant.link:
        final textStyle = TextStyle(
          color: widget.color,
          decorationColor: widget.color,
          decorationStyle: TextDecorationStyle.solid,
        );
        theme = theme.copyWith(
          textStyle: WidgetStateProperty.resolveWith((states) {
            if (states.hovered) {
              return textStyle.underline;
            }
            return textStyle;
          }),
        );
    }

    /// Override the fallback theme (via merge) with the user provided theme
    return theme.merge(widget.theme);
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final theme = getTheme();

    return TGestureDetector(
      onTap: widget.onPressed,
      onHover: widget.onHover,
      behavior: HitTestBehavior.translucent,
      builder: (context, states) {
        final resolvedTextStyle = theme.textStyle?.resolve(states);
        final effectiveTextStyle = TextStyle(
          fontSize: widget.size.fontSize,
        ).medium.merge(resolvedTextStyle);

        final effectiveBorder = theme.border?.resolve(states);

        final effectiveBorderRadius = theme.borderRadius?.resolve(states);

        final effectivePadding =
            theme.padding?.resolve(states) ?? widget.size.padding;
        final effectiveHorizontalOffset = (effectivePadding.horizontal) / 2;

        final effectiveBackgroundColor = theme.backgroundColor?.resolve(states);

        // Define the button content
        final hasChild = widget.child != null;
        final List<Widget> content = [];
        if (widget.leading != null) {
          content.add(
            Padding(
              padding: EdgeInsets.only(
                right: hasChild ? effectiveHorizontalOffset : 0,
              ),
              child: widget.leading,
            ),
          );
        }
        if (hasChild) {
          content.add(widget.child!);
        }
        if (widget.trailing != null) {
          content.add(
            Padding(
              padding: EdgeInsets.only(
                left: hasChild ? effectiveHorizontalOffset : 0,
              ),
              child: widget.trailing,
            ),
          );
        }

        // Build the button
        return DefaultTextStyle.merge(
          style: DefaultTextStyle.of(context).style.merge(effectiveTextStyle),
          child: TTooltip(
            message: widget.tooltip,
            child: AnimatedContainer(
              duration: theme.animationDuration,
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

// =============================================================================
// CLASS: TButtonTheme
// =============================================================================

/// Theme data for [TButton] widgets.
class TButtonTheme extends ThemeExtension<TButtonTheme> {
  /// Creates a [TButtonTheme] object.
  const TButtonTheme({
    this.animationDuration = Duration.zero,
    this.backgroundColor,
    this.padding,
    this.border,
    this.borderRadius,
    this.textStyle,
  });

  /// The duration of the badge animation.
  final Duration animationDuration;

  /// The background color of the badge.
  final WidgetStateProperty<Color?>? backgroundColor;

  /// Text
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;

  /// Text
  final WidgetStateProperty<BoxBorder?>? border;

  /// Text
  final WidgetStateProperty<BorderRadius?>? borderRadius;

  /// Text
  final WidgetStateProperty<TextStyle?>? textStyle;

  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  @override
  TButtonTheme copyWith({
    Duration? animationDuration,
    WidgetStateProperty<Color?>? backgroundColor,
    WidgetStateProperty<EdgeInsetsGeometry?>? padding,
    WidgetStateProperty<BoxBorder?>? border,
    WidgetStateProperty<BorderRadius?>? borderRadius,
    WidgetStateProperty<TextStyle?>? textStyle,
  }) {
    return TButtonTheme(
      animationDuration: animationDuration ?? this.animationDuration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: merge
  // ---------------------------------------------------------------------------

  /// Merges this [TButtonTheme] with another [TButtonTheme].
  TButtonTheme merge(TButtonTheme? other) {
    if (other == null) {
      return this;
    }
    return copyWith(
      animationDuration: other.animationDuration,
      backgroundColor: other.backgroundColor,
      padding: other.padding,
      border: other.border,
      borderRadius: other.borderRadius,
      textStyle: other.textStyle,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: lerp
  // ---------------------------------------------------------------------------

  @override
  TButtonTheme lerp(
    TButtonTheme? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }

    return TButtonTheme(
      animationDuration: other.animationDuration,
      backgroundColor: WidgetStateProperty.lerp<Color?>(
        backgroundColor,
        other.backgroundColor,
        t,
        Color.lerp,
      ),
      padding: WidgetStateProperty.lerp<EdgeInsetsGeometry?>(
        padding,
        other.padding,
        t,
        EdgeInsetsGeometry.lerp,
      ),
      border: WidgetStateProperty.lerp<BoxBorder?>(
        border,
        other.border,
        t,
        BoxBorder.lerp,
      ),
      borderRadius: WidgetStateProperty.lerp<BorderRadius?>(
        borderRadius,
        other.borderRadius,
        t,
        BorderRadius.lerp,
      ),
      textStyle: WidgetStateProperty.lerp<TextStyle?>(
        textStyle,
        other.textStyle,
        t,
        TextStyle.lerp,
      ),
    );
  }
}
