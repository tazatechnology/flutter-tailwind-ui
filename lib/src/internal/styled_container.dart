import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TStyledContainer
// =============================================================================

/// A container with predefined styles.
class TStyledContainer extends StatelessWidget {
  /// Creates a [TStyledContainer].
  const TStyledContainer({
    required this.variant,
    required this.child,
    super.key,
    this.color,
    this.focusColor,
    this.leading,
    this.trailing,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.loading,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
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
    this.onTapLeading,
    this.onTapTrailing,
    this.onLongPress,
    this.onHover,
    this.onFocus,
    this.canRequestFocus,
    this.focusNode,
    this.iconSize,
    this.height,
    this.width,
  });

  /// The variant of the styled container.
  final TStyleVariant variant;

  /// The color to apply to variant styling.
  final Color? color;

  /// The color to apply to the focus indicator ring.
  final Color? focusColor;

  /// The child widget.
  final Widget child;

  /// The a leading widget.
  final Widget? leading;

  /// The a trailing widget.
  final Widget? trailing;

  /// The main axis alignment of the widget content.
  final MainAxisAlignment mainAxisAlignment;

  /// The cross axis alignment of the widget content.
  final CrossAxisAlignment crossAxisAlignment;

  /// The widget to display when the [TWidgetStatesController] is in a loading state.
  final Widget? loading;

  /// Tooltip to display for the entire widget
  final String? tooltip;

  /// Tooltip to display for the leading widget
  final String? tooltipLeading;

  /// Tooltip to display for the trailing widget
  final String? tooltipTrailing;

  /// The fallback text style.
  final TextStyle? baseTextStyle;

  /// The duration of the animation.
  final Duration animationDuration;

  /// The fixed height of the container.
  final WidgetStateProperty<double?>? height;

  /// The fixed width of the container.
  final WidgetStateProperty<double?>? width;

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

  /// The size of the main content icon.
  final WidgetStateProperty<double?>? iconSize;

  /// The controller to manage the states of the widget.
  final TWidgetStatesController? controller;

  /// An action to call when the container is tapped.
  ///
  /// See: [TGestureDetector.onTap]
  final GestureTapCallback? onTap;

  /// An action to call when the leading widget is pressed.
  final GestureTapCallback? onTapLeading;

  /// An action to call when the trailing widget is pressed.
  final GestureTapCallback? onTapTrailing;

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

  /// Returns true if the container has a callback interaction.
  bool get hasCallback => onTap != null || onLongPress != null;

  // ---------------------------------------------------------------------------
  // METHOD: defaultBorderColor
  // ---------------------------------------------------------------------------

  /// Returns the default border color based on the theme.
  static Color defaultBorderColor(BuildContext context) {
    return context.tw.dark ? TColors.gray.shade700 : TColors.gray.shade200;
  }

  // ---------------------------------------------------------------------------
  // METHOD: defaultBackgroundColor
  // ---------------------------------------------------------------------------

  /// Returns the default background color based on the theme.
  static Color defaultBackgroundColor(BuildContext context) {
    return context.tw.dark ? Colors.white10 : TColors.zinc.shade100;
  }

  // ---------------------------------------------------------------------------
  // METHOD: defaultTextColor
  // ---------------------------------------------------------------------------

  /// Returns the default text color based on the theme.
  static Color defaultTextColor(BuildContext context) {
    return context.tw.dark ? Colors.white : Colors.black;
  }

  // ---------------------------------------------------------------------------
  // METHOD: resolvePadding
  // ---------------------------------------------------------------------------

  /// Returns the effective padding of the styled container.
  static EdgeInsets resolvePadding({
    required BuildContext context,
    required Set<WidgetState> states,
    required WidgetStateProperty<EdgeInsetsGeometry?>? padding,
  }) {
    return (padding?.resolve(states) ?? EdgeInsets.zero).resolve(
      Directionality.of(context),
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: resolveColor
  // ---------------------------------------------------------------------------

  /// Resolves the effective color based on the context and the color property.
  static MaterialColor resolveColor({
    required BuildContext context,
    required Color? color,
  }) {
    return (color ?? context.tw.color.primary).toMaterialColor();
  }

  // ---------------------------------------------------------------------------
  // METHOD: resolveBackgroundColor
  // ---------------------------------------------------------------------------

  /// Returns the effective background color of the styled container.
  static Color? resolveBackgroundColor({
    required BuildContext context,
    required Set<WidgetState> states,
    required WidgetStateProperty<Color?>? backgroundColor,
    required TStyleVariant variant,
    required Color? color,
    required bool hasCallback,
  }) {
    final tw = context.tw;
    final effectiveColor = resolveColor(context: context, color: color);

    WidgetStateProperty<Color?> backgroundColorFallback;
    switch (variant) {
      case TStyleVariant.basic:
      case TStyleVariant.outlined:
        backgroundColorFallback = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return Colors.transparent;
          }
          if (states.hovered && hasCallback) {
            if (color == null) {
              return defaultBackgroundColor(context);
            }
            return effectiveColor.withValues(alpha: tw.light ? 0.05 : 0.1);
          }
          return null;
        });
      case TStyleVariant.filled:
        backgroundColorFallback = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return tw.color.disabled;
          }
          if (effectiveColor.isTransparent) {
            return effectiveColor;
          }
          if (states.hovered && hasCallback) {
            return effectiveColor.withValues(alpha: 0.9);
          }
          return effectiveColor;
        });
      case TStyleVariant.soft:
        backgroundColorFallback = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return tw.color.disabled;
          }
          if (states.hovered && hasCallback) {
            return effectiveColor.shade400.withValues(alpha: 0.2);
          }
          return effectiveColor.shade400.withValues(alpha: 0.1);
        });
    }

    return backgroundColor?.resolve(states) ??
        backgroundColorFallback.resolve(states);
  }

  // ---------------------------------------------------------------------------
  // METHOD: resolveBorder
  // ---------------------------------------------------------------------------

  /// Returns the effective border of the styled container.
  static BoxBorder? resolveBorder({
    required BuildContext context,
    required Set<WidgetState> states,
    required WidgetStateProperty<BoxBorder?>? border,
    required WidgetStateProperty<Color?>? backgroundColor,
    required TStyleVariant variant,
    required Color? color,
    required bool hasCallback,
  }) {
    final tw = context.tw;
    final effectiveColor = resolveColor(context: context, color: color);
    final effectiveBackgroundColor = resolveBackgroundColor(
      context: context,
      states: states,
      backgroundColor: backgroundColor,
      variant: variant,
      color: color,
      hasCallback: hasCallback,
    );
    final borderDisabled = WidgetStatePropertyAll(
      Border.all(color: tw.color.disabled),
    );
    WidgetStateProperty<BoxBorder?> borderFallback;
    final noBorder = Border.all(color: Colors.transparent);
    switch (variant) {
      case TStyleVariant.basic:
        borderFallback = WidgetStateProperty.resolveWith((states) {
          if (states.hovered && hasCallback) {
            return noBorder;
          }
          return Border.all(
            color: effectiveBackgroundColor ?? Colors.transparent,
          );
        });
      case TStyleVariant.outlined:
        if (states.disabled) {
          borderFallback = borderDisabled;
        } else if (color == null) {
          borderFallback = WidgetStatePropertyAll(
            Border.all(color: defaultBorderColor(context)),
          );
        } else {
          borderFallback = WidgetStateProperty.resolveWith((states) {
            return Border.all(color: effectiveColor);
          });
        }
      case TStyleVariant.filled:
        if (states.disabled) {
          borderFallback = borderDisabled;
        } else {
          borderFallback = WidgetStatePropertyAll(
            Border.all(color: effectiveColor),
          );
        }
      case TStyleVariant.soft:
        if (states.disabled) {
          borderFallback = borderDisabled;
        } else {
          borderFallback = WidgetStateProperty.resolveWith((states) {
            if (states.hovered && hasCallback) {
              return noBorder;
            }
            return Border.all(
              color: effectiveBackgroundColor ?? Colors.transparent,
            );
          });
        }
    }

    // Resolve the border
    final b = border?.resolve(states) ?? borderFallback.resolve(states);

    // Copy the border and ensure stroke align is defined
    return b?.copyWith(strokeAlign: BorderSide.strokeAlignInside);
  }

  // ---------------------------------------------------------------------------
  // METHOD: resolveBorderRadius
  // ---------------------------------------------------------------------------

  /// Returns the effective border radius of the styled container.
  static BorderRadius? resolveBorderRadius({
    required BuildContext context,
    required Set<WidgetState> states,
    required WidgetStateProperty<BorderRadius?>? borderRadius,
    required TStyleVariant variant,
  }) {
    WidgetStateProperty<BorderRadius?> borderRadiusFallback;
    switch (variant) {
      case TStyleVariant.basic:
      case TStyleVariant.outlined:
      case TStyleVariant.filled:
      case TStyleVariant.soft:
        borderRadiusFallback = const WidgetStatePropertyAll(null);
    }
    return borderRadius?.resolve(states) ??
        borderRadiusFallback.resolve(states);
  }

  // ---------------------------------------------------------------------------
  // METHOD: resolveElevation
  // ---------------------------------------------------------------------------

  /// Returns the effective elevation of the styled container.
  static double? resolveElevation({
    required BuildContext context,
    required Set<WidgetState> states,
    required WidgetStateProperty<double?>? elevation,
    required TStyleVariant variant,
  }) {
    WidgetStateProperty<double?> elevationFallback;
    switch (variant) {
      case TStyleVariant.basic:
      case TStyleVariant.outlined:
        // Basic, link, and outlined containers have no elevation for any state
        return 0;
      case TStyleVariant.filled:
      case TStyleVariant.soft:
        // By default, filled and soft containers should have no elevation
        elevationFallback = const WidgetStatePropertyAll(0);
    }
    return elevation?.resolve(states) ?? elevationFallback.resolve(states);
  }

  // ---------------------------------------------------------------------------
  // METHOD: resolveTextStyle
  // ---------------------------------------------------------------------------

  /// Returns the effective border radius of the styled container.
  static TextStyle? resolveTextStyle({
    required BuildContext context,
    required Set<WidgetState> states,
    required WidgetStateProperty<TextStyle?>? textStyle,
    required TStyleVariant variant,
    required Color? color,
    required bool hasCallback,
  }) {
    final tw = context.tw;
    final effectiveColor = resolveColor(context: context, color: color);

    WidgetStateProperty<TextStyle?> textStyleFallback;
    switch (variant) {
      case TStyleVariant.basic:
        textStyleFallback = WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            color: color == null ? defaultTextColor(context) : effectiveColor,
          );
        });
      case TStyleVariant.outlined:
        textStyleFallback = WidgetStateProperty.resolveWith((states) {
          if (color != null) {
            return TextStyle(color: effectiveColor);
          }
          return TextStyle(color: defaultTextColor(context));
        });
      case TStyleVariant.filled:
        textStyleFallback = WidgetStateProperty.resolveWith((states) {
          if (effectiveColor.isTransparent) {
            return TextStyle(color: defaultTextColor(context));
          }
          return TextStyle(color: effectiveColor.contrastBlackWhite());
        });
      case TStyleVariant.soft:
        textStyleFallback = WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            color: tw.dark ? effectiveColor.shade400 : effectiveColor.shade700,
          );
        });
    }

    final t = textStyle?.resolve(states);
    final tf = textStyleFallback.resolve(states);
    final resolvedTextStyle = t ?? tf;

    return resolvedTextStyle?.copyWith(
      color: states.disabled && t?.color == null
          ? tw.color.disabled
          : resolvedTextStyle.color,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: _wrapAction
  // ---------------------------------------------------------------------------

  Widget _wrapAction({
    required bool isLeading,
    required BuildContext context,
    required Widget child,
    required String? tooltip,
    required GestureTapCallback? callback,
    required EdgeInsets effectivePadding,
    required BorderRadius? effectiveBorderRadius,
    required double textHeight,
    required double widgetHeight,
  }) {
    final hPad = textHeight / 3;
    final effectiveChild = SizedBox.square(dimension: textHeight, child: child);

    final outerPad = EdgeInsets.only(
      left: !isLeading ? hPad : 0,
      right: isLeading ? hPad : 0,
    );

    if (callback == null) {
      return Padding(padding: outerPad, child: effectiveChild);
    }

    final effectiveColor = resolveColor(context: context, color: color);
    Color? hoverColor;
    switch (variant) {
      case TStyleVariant.basic:
        hoverColor = defaultBackgroundColor(context);
      case TStyleVariant.outlined:
        hoverColor = defaultBackgroundColor(context);
      case TStyleVariant.filled:
        hoverColor = effectiveColor.shade400;
      case TStyleVariant.soft:
        hoverColor = effectiveColor.shade400.withValues(alpha: 0.2);
    }

    return Padding(
      padding: outerPad,
      child: TTooltip(
        message: tooltip,
        gap: widgetHeight - textHeight - 1,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: effectiveBorderRadius ?? BorderRadius.zero,
            hoverColor: hoverColor,
            onTap: callback,
            child: effectiveChild,
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller ?? TWidgetStatesController(),
      builder: (context, _) {
        final isLoading = controller?.loading ?? false;
        final isEnabled = !(controller?.disabled ?? false);

        final canRequestFocus = onTap != null && isEnabled;

        return TGestureDetector(
          controller: controller,
          behavior: HitTestBehavior.translucent,
          onTap: isLoading ? null : onTap,
          onLongPress: isLoading ? null : onLongPress,
          onHover: onHover,
          onFocus: onFocus,
          canRequestFocus: canRequestFocus,
          skipTraversal: !canRequestFocus,
          descendantsAreFocusable: false,
          descendantsAreTraversable: false,
          mouseCursor: mouseCursor,
          propagateEnterKey: true,
          builder: (context, states) {
            final tw = context.tw;
            final defaultTextStyle = DefaultTextStyle.of(context).style;

            // Resolve the effective container height and width
            final effectiveHeight = height?.resolve(states);
            final effectiveWidth = width?.resolve(states);
            final effectiveDimension = math.max(
              effectiveHeight ?? 0,
              effectiveWidth ?? 0,
            );

            // Resolve the effective text style
            TextStyle? effectiveTextStyle = resolveTextStyle(
              context: context,
              states: states,
              textStyle: textStyle,
              variant: variant,
              color: color,
              hasCallback: hasCallback,
            );

            // Merge the text style with the base text style
            effectiveTextStyle = defaultTextStyle
                .merge(baseTextStyle)
                .merge(effectiveTextStyle);

            // Resolve the effective padding
            final effectivePadding = resolvePadding(
              context: context,
              states: states,
              padding: padding,
            );

            // Resolve the effective border
            final effectiveBorder = resolveBorder(
              context: context,
              states: states,
              border: border,
              backgroundColor: backgroundColor,
              variant: variant,
              color: color,
              hasCallback: hasCallback,
            );

            // Resolve the effective background color
            final effectiveBackgroundColor = resolveBackgroundColor(
              context: context,
              states: states,
              backgroundColor: backgroundColor,
              variant: variant,
              color: color,
              hasCallback: hasCallback,
            );

            // Resolve the effective elevation
            final effectiveElevation = resolveElevation(
              context: context,
              states: states,
              elevation: elevation,
              variant: variant,
            );

            // Estimate the height of the text
            final textHeight = effectiveTextStyle.estimateHeight(context);

            // Resolve the effective icon size
            final effectiveIconSize = iconSize?.resolve(states);

            // Estimate the height of the content with padding
            final widgetHeight =
                effectiveHeight ??
                textHeight +
                    effectivePadding.vertical +
                    (effectiveBorder?.top.width ?? 0) +
                    (effectiveBorder?.bottom.width ?? 0);

            // Define the icon theme
            final iconTheme = IconTheme.of(context).copyWith(
              // This size will apply to everything except leading/trailing
              size: effectiveIconSize ?? textHeight,
              color: effectiveTextStyle.color,
            );

            // Resolve the effective loading widget
            final progressTheme = context.theme.progressIndicatorTheme.copyWith(
              color: effectiveTextStyle.color,
            );
            Widget effectiveLoading;
            if (loading != null) {
              effectiveLoading = loading!;
            } else {
              effectiveLoading = SizedBox.square(
                dimension: widgetHeight * 0.45,
                child: const CircularProgressIndicator(strokeWidth: 2),
              );
            }

            /// Resolve the effective border radius (may be clamped later)
            BorderRadius? effectiveBorderRadius = resolveBorderRadius(
              context: context,
              states: states,
              borderRadius: borderRadius,
              variant: variant,
            );
            // Clamp border radius to estimated size of the widget to ensure
            // smooth animations and avoid snapping.
            if (effectiveBorderRadius != null) {
              final b = effectiveBorderRadius;
              final rMax = Radius.circular(widgetHeight / 2);
              effectiveBorderRadius = BorderRadius.only(
                topLeft: b.topLeft.clamp(maximum: rMax),
                topRight: b.topRight.clamp(maximum: rMax),
                bottomLeft: b.bottomLeft.clamp(maximum: rMax),
                bottomRight: b.bottomRight.clamp(maximum: rMax),
              );
            }

            // Define the button content
            final List<Widget> content = [];

            if (leading != null) {
              final effectiveLeading = _wrapAction(
                isLeading: true,
                context: context,
                child: leading!,
                tooltip: tooltipLeading,
                callback: onTapLeading,
                effectivePadding: effectivePadding,
                effectiveBorderRadius: effectiveBorderRadius,
                textHeight: textHeight,
                widgetHeight: widgetHeight,
              );
              content.add(
                IconTheme(
                  data: iconTheme.copyWith(size: effectiveTextStyle.fontSize),
                  child: effectiveLeading,
                ),
              );
            }

            content.add(child);

            if (trailing != null) {
              final effectiveTrailing = _wrapAction(
                isLeading: false,
                context: context,
                child: trailing!,
                tooltip: tooltipTrailing,
                callback: onTapTrailing,
                effectivePadding: effectivePadding,
                effectiveBorderRadius: effectiveBorderRadius,
                textHeight: textHeight,
                widgetHeight: widgetHeight,
              );
              content.add(
                IconTheme(
                  data: iconTheme.copyWith(size: effectiveTextStyle.fontSize),
                  child: effectiveTrailing,
                ),
              );
            }

            /// Determine the stack alignment based on the main axis alignment
            Alignment alignment = Alignment.center;
            if (mainAxisAlignment == MainAxisAlignment.start) {
              alignment = Alignment.centerLeft;
            } else if (mainAxisAlignment == MainAxisAlignment.center) {
              alignment = Alignment.center;
            } else if (mainAxisAlignment == MainAxisAlignment.end) {
              alignment = Alignment.centerRight;
            }

            return TFocusBorder(
              focused: states.focused,
              focusColor: focusColor ?? tw.color.focus,
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
                      height: effectiveHeight,
                      width: effectiveWidth,
                      duration: animationDuration,
                      padding: effectivePadding,
                      constraints: BoxConstraints(
                        minHeight: effectiveDimension,
                        minWidth: effectiveDimension,
                      ),
                      decoration: BoxDecoration(
                        color: effectiveBackgroundColor,
                        border: effectiveBorder,
                        borderRadius: effectiveBorderRadius,
                      ),
                      child: IconTheme(
                        data: iconTheme,
                        child: Stack(
                          alignment: alignment,
                          children: [
                            AnimatedOpacity(
                              opacity: isLoading ? 0 : 1,
                              duration: animationDuration,
                              child: Row(
                                crossAxisAlignment: crossAxisAlignment,
                                mainAxisAlignment: mainAxisAlignment,
                                mainAxisSize: MainAxisSize.min,
                                children: content,
                              ),
                            ),
                            if (isLoading)
                              ProgressIndicatorTheme(
                                data: progressTheme,
                                child: effectiveLoading,
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
