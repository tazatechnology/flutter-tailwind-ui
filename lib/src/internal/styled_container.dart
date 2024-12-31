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
    this.focusColor,
    this.leading,
    this.trailing,
    this.loading,
    this.tooltip,
    this.baseTextStyle,
    this.animationDuration = Duration.zero,
    this.backgroundColor,
    this.elevation,
    this.padding,
    this.border,
    this.borderRadius,
    this.textStyle,
    this.mouseCursor,
    this.controller,
    this.onTap,
    this.onLongPress,
    this.onHover,
    this.onFocus,
    this.canRequestFocus,
    this.focusNode,
  });

  /// The variant of the styled container.
  final TStyledContainerVariant variant;

  /// The color to apply to variant styling.
  final Color? color;

  /// The color to apply to the focus indicator ring.
  final Color? focusColor;

  /// The child widget.
  final Widget? child;

  /// The a leading widget.
  final Widget? leading;

  /// The a trailing widget.
  final Widget? trailing;

  /// The widget to display when the [TWidgetController] is in a loading state.
  final Widget? loading;

  /// The a trailing widget for the badge.
  final String? tooltip;

  /// The fallback text style.
  final TextStyle? baseTextStyle;

  /// The duration of the animation.
  final Duration animationDuration;

  /// The background color of the container.
  final WidgetStateProperty<Color?>? backgroundColor;

  /// The elevation of the container.
  final WidgetStateProperty<double?>? elevation;

  /// The padding of the container.
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;

  /// The border of the container.
  final WidgetStateProperty<BoxBorder?>? border;

  /// The border radius of the container.
  final WidgetStateProperty<BorderRadius?>? borderRadius;

  /// The text style of the container.
  final WidgetStateProperty<TextStyle?>? textStyle;

  /// The mouse cursor to apply on pointer events.
  final WidgetStateProperty<MouseCursor?>? mouseCursor;

  /// The controller to manage the states of the widget.
  final TWidgetController? controller;

  /// An action to call when the container is tapped.
  ///
  /// See: [TGestureDetector.onTap]
  final GestureTapCallback? onTap;

  /// Called when a long press gesture with a primary button has been recognized.
  ///
  /// See: [TGestureDetector.onLongPress]
  final GestureLongPressCallback? onLongPress;

  /// Called when a pointer enters or exits the response area.
  ///
  /// See: [TGestureDetector.onHover]
  final ValueChanged<bool>? onHover;

  /// Called with true if this widget's node gains focus, and false if it loses focus.
  ///
  /// See: [TGestureDetector.onFocus]
  final ValueChanged<bool>? onFocus;

  /// Whether this widget can request focus.
  ///
  /// See: [TGestureDetector.canRequestFocus]
  final bool? canRequestFocus;

  /// The focus node that should be used for this widget.
  ///
  /// See: [TGestureDetector.focusNode]
  final FocusNode? focusNode;

  // ---------------------------------------------------------------------------
  // METHOD: _defaultBorderColor
  // ---------------------------------------------------------------------------

  Color _defaultBorderColor(BuildContext context) {
    return context.tw.dark ? TColors.gray.shade700 : TColors.gray.shade200;
  }

  // ---------------------------------------------------------------------------
  // METHOD: _defaultBackgroundColor
  // ---------------------------------------------------------------------------

  Color _defaultBackgroundColor(BuildContext context) {
    return context.tw.dark ? Colors.white10 : TColors.zinc.shade100;
  }

  // ---------------------------------------------------------------------------
  // METHOD: _defaultTextColor
  // ---------------------------------------------------------------------------

  Color _defaultTextColor(BuildContext context) {
    return context.tw.dark ? Colors.white : Colors.black;
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectivePadding
  // ---------------------------------------------------------------------------

  /// Returns the effective padding of the styled container.
  EdgeInsetsGeometry _effectivePadding(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    return padding?.resolve(states) ?? EdgeInsets.zero;
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveBorder
  // ---------------------------------------------------------------------------

  /// Returns the effective border of the styled container.
  BoxBorder? _effectiveBorder(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    final tw = context.tw;
    final effectiveColor = (color ?? tw.colors.primary).toMaterialColor();
    final borderDisabled = WidgetStatePropertyAll(
      Border.all(color: tw.colors.disabled),
    );
    WidgetStateProperty<BoxBorder?> borderStyled;
    switch (variant) {
      case TStyledContainerVariant.basic:
      case TStyledContainerVariant.link:
        borderStyled = const WidgetStatePropertyAll(null);
      case TStyledContainerVariant.outlined:
        if (states.disabled) {
          borderStyled = borderDisabled;
        } else if (color == null) {
          borderStyled = WidgetStatePropertyAll(
            Border.all(color: _defaultBorderColor(context)),
          );
        } else {
          borderStyled = WidgetStateProperty.resolveWith((states) {
            return Border.all(color: effectiveColor);
          });
        }
      case TStyledContainerVariant.filled:
        if (states.disabled) {
          borderStyled = borderDisabled;
        } else {
          borderStyled = WidgetStatePropertyAll(
            Border.all(color: effectiveColor),
          );
        }
      case TStyledContainerVariant.soft:
        if (states.disabled) {
          borderStyled = borderDisabled;
        } else {
          borderStyled = WidgetStateProperty.resolveWith((states) {
            return Border.all(
              color: tw.dark
                  ? effectiveColor.shade400.withValues(alpha: 0.3)
                  : effectiveColor.shade700.withValues(alpha: 0.1),
            );
          });
        }
    }
    return border?.resolve(states) ?? borderStyled.resolve(states);
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveBorderRadius
  // ---------------------------------------------------------------------------

  /// Returns the effective border radius of the styled container.
  BorderRadius? _effectiveBorderRadius(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    WidgetStateProperty<BorderRadius?> borderRadiusStyled;
    switch (variant) {
      case TStyledContainerVariant.basic:
      case TStyledContainerVariant.link:
      case TStyledContainerVariant.outlined:
      case TStyledContainerVariant.filled:
      case TStyledContainerVariant.soft:
        borderRadiusStyled = const WidgetStatePropertyAll(null);
    }
    return borderRadius?.resolve(states) ?? borderRadiusStyled.resolve(states);
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveBackgroundColor
  // ---------------------------------------------------------------------------

  /// Returns the effective background color of the styled container.
  Color? _effectiveBackgroundColor(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    final tw = context.tw;
    final effectiveColor = (color ?? tw.colors.primary).toMaterialColor();

    WidgetStateProperty<Color?> backgroundColorStyled;
    switch (variant) {
      case TStyledContainerVariant.basic:
        backgroundColorStyled = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return Colors.transparent;
          }
          if (states.hovered) {
            return _defaultBackgroundColor(context);
          }
          return null;
        });
      case TStyledContainerVariant.link:
        backgroundColorStyled = const WidgetStatePropertyAll(null);
      case TStyledContainerVariant.outlined:
        backgroundColorStyled = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return Colors.transparent;
          }
          if (states.hovered) {
            return color == null
                ? _defaultBackgroundColor(context)
                : effectiveColor;
          }
          return null;
        });
      case TStyledContainerVariant.filled:
        backgroundColorStyled = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return tw.colors.disabled;
          }
          if (effectiveColor.isTransparent) {
            return effectiveColor;
          }
          if (states.hovered) {
            return effectiveColor.withValues(alpha: 0.9);
          }
          return effectiveColor;
        });
      case TStyledContainerVariant.soft:
        backgroundColorStyled = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return tw.colors.disabled;
          }
          if (states.hovered) {
            return tw.dark
                ? effectiveColor.shade400.withValues(alpha: 0.2)
                : effectiveColor.shade100;
          }
          return tw.dark
              ? effectiveColor.shade400.withValues(alpha: 0.1)
              : effectiveColor.shade50;
        });
    }

    return backgroundColor?.resolve(states) ??
        backgroundColorStyled.resolve(states);
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveElevation
  // ---------------------------------------------------------------------------

  /// Returns the effective elevation of the styled container.
  double? _effectiveElevation(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    WidgetStateProperty<double?> elevationStyled;
    switch (variant) {
      case TStyledContainerVariant.basic:
      case TStyledContainerVariant.link:
      case TStyledContainerVariant.outlined:
        // Basic, link, and outlined containers have no elevation for any state
        return 0;
      case TStyledContainerVariant.filled:
      case TStyledContainerVariant.soft:
        // By default, filled and soft containers should have no elevation
        elevationStyled = const WidgetStatePropertyAll(0);
    }
    return elevation?.resolve(states) ?? elevationStyled.resolve(states);
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveTextStyle
  // ---------------------------------------------------------------------------

  /// Returns the effective border radius of the styled container.
  TextStyle? _effectiveTextStyle(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    final tw = context.tw;
    final effectiveColor = (color ?? tw.colors.primary).toMaterialColor();
    if (states.disabled) {
      return TextStyle(color: tw.colors.onDisabled);
    }
    WidgetStateProperty<TextStyle?> textStyleStyled;
    switch (variant) {
      case TStyledContainerVariant.basic:
        textStyleStyled = WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            color: color == null ? _defaultTextColor(context) : effectiveColor,
          );
        });
      case TStyledContainerVariant.link:
        textStyleStyled = WidgetStateProperty.resolveWith((states) {
          final base = TextStyle(color: effectiveColor);
          if (states.hovered) {
            return base.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: effectiveColor,
            );
          }
          return base;
        });
      case TStyledContainerVariant.outlined:
        textStyleStyled = WidgetStateProperty.resolveWith((states) {
          if (states.hovered && color != null) {
            return TextStyle(color: effectiveColor.contrastBlackWhite());
          }
          if (color != null) {
            return TextStyle(color: effectiveColor);
          }
          return TextStyle(color: _defaultTextColor(context));
        });
      case TStyledContainerVariant.filled:
        textStyleStyled = WidgetStateProperty.resolveWith((states) {
          if (effectiveColor.isTransparent) {
            return TextStyle(color: _defaultTextColor(context));
          }
          return TextStyle(color: effectiveColor.contrastBlackWhite());
        });
      case TStyledContainerVariant.soft:
        textStyleStyled = WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            color: tw.dark ? effectiveColor.shade400 : effectiveColor.shade700,
          );
        });
    }
    return textStyle?.resolve(states) ?? textStyleStyled.resolve(states);
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller ?? TWidgetController(),
      builder: (context, _) {
        final isLoading = controller?.loading ?? false;

        return TGestureDetector(
          controller: controller,
          behavior: HitTestBehavior.translucent,
          onTap: isLoading ? null : onTap,
          onLongPress: isLoading ? null : onLongPress,
          onHover: onHover,
          onFocus: onFocus,
          descendantsAreFocusable: false,
          mouseCursor: mouseCursor,
          builder: (context, states) {
            final tw = context.tw;

            // Resolve the effective text style
            final effectiveTextStyle = DefaultTextStyle.of(context)
                .style
                .merge(baseTextStyle)
                .merge(_effectiveTextStyle(context, states));

            // Resolve the effective padding
            final effectivePadding = _effectivePadding(context, states);
            final effectiveHorizontalOffset =
                (effectivePadding.horizontal / 4).clamp(6, 12).toDouble();

            // Resolve the effective background color
            final effectiveBackgroundColor =
                _effectiveBackgroundColor(context, states);

            // Resolve the effective elevation
            final effectiveElevation = _effectiveElevation(context, states);

            // Resolve the effective border
            final effectiveBorder = _effectiveBorder(context, states);

            // Estimate the height of the content as a function of the font size
            final estimatedHeight = effectiveTextStyle.fontSize
                    ?.multiply(effectiveTextStyle.height) ??
                TFontSize.text_md * (TTextStyle.text_md.height ?? 1.5);

            // Estimate the height of the content with padding
            final estimatedHeightWithPad =
                estimatedHeight + effectivePadding.vertical / 2;

            // Define the icon theme
            final iconTheme = IconTheme.of(context).copyWith(
              // This size will apply to everything except leading/trailing
              size: estimatedHeight,
              color: effectiveTextStyle.color,
            );

            // Resolve the effective border radius
            // Clamp border radius to estimated size of the widget to ensure
            // smooth animations and avoid snapping.
            var br = _effectiveBorderRadius(context, states);
            if (br != null) {
              final rMax = Radius.circular(estimatedHeightWithPad);
              br = BorderRadius.only(
                topLeft: br.topLeft.clamp(maximum: rMax),
                topRight: br.topRight.clamp(maximum: rMax),
                bottomLeft: br.bottomLeft.clamp(maximum: rMax),
                bottomRight: br.bottomRight.clamp(maximum: rMax),
              );
            }
            final effectiveBorderRadius = br;

            // Define the button content
            final hasChild = child != null;
            final List<Widget> content = [];
            if (leading != null) {
              content.add(
                Padding(
                  padding: EdgeInsets.only(
                    right: hasChild ? effectiveHorizontalOffset : 0,
                  ),
                  // Should be smaller than the effective content height
                  child: IconTheme(
                    data: iconTheme.copyWith(size: effectiveTextStyle.fontSize),
                    child: leading!,
                  ),
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
                  // Should be smaller than the effective content height
                  child: IconTheme(
                    data: iconTheme.copyWith(size: effectiveTextStyle.fontSize),
                    child: trailing!,
                  ),
                ),
              );
            }

            return TFocusBorder(
              focused: states.focused,
              focusColor: focusColor ?? tw.colors.focus,
              borderRadius: effectiveBorderRadius,
              child: DefaultTextStyle.merge(
                style: effectiveTextStyle,
                child: TTooltip(
                  message: tooltip,
                  child: AnimatedPhysicalModel(
                    duration: animationDuration,
                    shadowColor: Colors.black,
                    color: Colors.transparent,
                    borderRadius: effectiveBorderRadius,
                    elevation: effectiveElevation ?? 0,
                    child: AnimatedContainer(
                      duration: animationDuration,
                      padding: effectivePadding,
                      decoration: BoxDecoration(
                        color: effectiveBackgroundColor,
                        border: effectiveBorder,
                        borderRadius: effectiveBorderRadius,
                      ),
                      child: IconTheme(
                        data: iconTheme,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedOpacity(
                              opacity: isLoading ? 0 : 1,
                              duration: animationDuration,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: content,
                              ),
                            ),
                            if (isLoading)
                              loading ??
                                  SizedBox.square(
                                    dimension: estimatedHeight * 0.75,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      color: effectiveTextStyle.color,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
