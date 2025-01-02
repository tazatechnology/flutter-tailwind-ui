import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TStyledContainerOptions
// =============================================================================

/// Fallback options for the styled container.
class TStyledContainerOptions {
  /// Creates a [TStyledContainerOptions].
  const TStyledContainerOptions({
    this.fillOnHover = true,
    this.height,
  });

  /// Whether to fill the outlined variant on hover.
  ///
  /// Only applicable to the outlined variant containers that are buttons.
  final bool fillOnHover;

  /// A fixed height for the container.
  final double? height;
}

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
    required this.child,
    super.key,
    this.color,
    this.focusColor,
    this.leading,
    this.trailing,
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
    this.options = const TStyledContainerOptions(),
  });

  /// The variant of the styled container.
  final TStyledContainerVariant variant;

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

  /// The widget to display when the [TWidgetController] is in a loading state.
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

  /// The options to apply to the styled container.
  final TStyledContainerOptions options;

  // ---------------------------------------------------------------------------
  // PROPERTIES
  // ---------------------------------------------------------------------------

  /// Returns true if the container has a callback interaction.
  bool get hasCallback => onTap != null || onLongPress != null;

  /// Returns true if the container has a leading widget.
  bool get hasLeading => leading != null;

  /// Returns true if the container has a trailing widget.
  bool get hasTrailing => trailing != null;

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
  // METHOD: _effectiveColor
  // ---------------------------------------------------------------------------

  MaterialColor _effectiveColor(BuildContext context) {
    return (color ?? context.tw.colors.primary).toMaterialColor();
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectivePadding
  // ---------------------------------------------------------------------------

  /// Returns the effective padding of the styled container.
  EdgeInsets _effectivePadding(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    return (padding?.resolve(states) ?? EdgeInsets.zero)
        .resolve(Directionality.of(context));
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
    final effectiveColor = _effectiveColor(context);
    final borderDisabled = WidgetStatePropertyAll(
      Border.all(color: tw.colors.disabled),
    );
    WidgetStateProperty<BoxBorder?> borderFallback;
    switch (variant) {
      case TStyledContainerVariant.basic:
      case TStyledContainerVariant.link:
        borderFallback = const WidgetStatePropertyAll(null);
      case TStyledContainerVariant.outlined:
        if (states.disabled) {
          borderFallback = borderDisabled;
        } else if (color == null) {
          borderFallback = WidgetStatePropertyAll(
            Border.all(color: _defaultBorderColor(context)),
          );
        } else {
          borderFallback = WidgetStateProperty.resolveWith((states) {
            return Border.all(color: effectiveColor);
          });
        }
      case TStyledContainerVariant.filled:
        if (states.disabled) {
          borderFallback = borderDisabled;
        } else {
          borderFallback = WidgetStatePropertyAll(
            Border.all(color: effectiveColor),
          );
        }
      case TStyledContainerVariant.soft:
        if (states.disabled) {
          borderFallback = borderDisabled;
        } else {
          borderFallback = WidgetStateProperty.resolveWith((states) {
            return Border.all(
              color: tw.dark
                  ? effectiveColor.shade400.withValues(alpha: 0.3)
                  : effectiveColor.shade700.withValues(alpha: 0.1),
            );
          });
        }
    }

    // Resolve the border
    final b = border?.resolve(states) ?? borderFallback.resolve(states);

    // Copy the border and ensure stroke align is defined
    const strokeAlign = BorderSide.strokeAlignInside;
    if (b is Border) {
      return Border(
        top: b.top.copyWith(strokeAlign: strokeAlign),
        left: b.left.copyWith(strokeAlign: strokeAlign),
        bottom: b.bottom.copyWith(strokeAlign: strokeAlign),
        right: b.right.copyWith(strokeAlign: strokeAlign),
      );
    } else if (b is BorderDirectional) {
      return BorderDirectional(
        top: b.top.copyWith(strokeAlign: strokeAlign),
        start: b.start.copyWith(strokeAlign: strokeAlign),
        end: b.end.copyWith(strokeAlign: strokeAlign),
        bottom: b.bottom.copyWith(strokeAlign: strokeAlign),
      );
    } else {
      return b;
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveBorderRadius
  // ---------------------------------------------------------------------------

  /// Returns the effective border radius of the styled container.
  BorderRadius? _effectiveBorderRadius(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    WidgetStateProperty<BorderRadius?> borderRadiusFallback;
    switch (variant) {
      case TStyledContainerVariant.basic:
      case TStyledContainerVariant.link:
      case TStyledContainerVariant.outlined:
      case TStyledContainerVariant.filled:
      case TStyledContainerVariant.soft:
        borderRadiusFallback = const WidgetStatePropertyAll(null);
    }
    return borderRadius?.resolve(states) ??
        borderRadiusFallback.resolve(states);
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
    final effectiveColor = _effectiveColor(context);

    WidgetStateProperty<Color?> backgroundColorFallback;
    switch (variant) {
      case TStyledContainerVariant.basic:
        backgroundColorFallback = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return Colors.transparent;
          }
          if (states.hovered && hasCallback) {
            return _defaultBackgroundColor(context);
          }
          return null;
        });
      case TStyledContainerVariant.link:
        backgroundColorFallback = const WidgetStatePropertyAll(null);
      case TStyledContainerVariant.outlined:
        backgroundColorFallback = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return Colors.transparent;
          }
          if (states.hovered && hasCallback) {
            if (color == null) {
              return _defaultBackgroundColor(context);
            } else if (options.fillOnHover) {
              return effectiveColor;
            }
          }
          return null;
        });
      case TStyledContainerVariant.filled:
        backgroundColorFallback = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return tw.colors.disabled;
          }
          if (effectiveColor.isTransparent) {
            return effectiveColor;
          }
          if (states.hovered && hasCallback) {
            return effectiveColor.withValues(alpha: 0.9);
          }
          return effectiveColor;
        });
      case TStyledContainerVariant.soft:
        backgroundColorFallback = WidgetStateProperty.resolveWith((states) {
          if (states.disabled) {
            return tw.colors.disabled;
          }
          if (states.hovered && hasCallback) {
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
        backgroundColorFallback.resolve(states);
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveElevation
  // ---------------------------------------------------------------------------

  /// Returns the effective elevation of the styled container.
  double? _effectiveElevation(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    WidgetStateProperty<double?> elevationFallback;
    switch (variant) {
      case TStyledContainerVariant.basic:
      case TStyledContainerVariant.link:
      case TStyledContainerVariant.outlined:
        // Basic, link, and outlined containers have no elevation for any state
        return 0;
      case TStyledContainerVariant.filled:
      case TStyledContainerVariant.soft:
        // By default, filled and soft containers should have no elevation
        elevationFallback = const WidgetStatePropertyAll(0);
    }
    return elevation?.resolve(states) ?? elevationFallback.resolve(states);
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
    final effectiveColor = _effectiveColor(context);
    if (states.disabled) {
      return TextStyle(color: tw.colors.onDisabled);
    }
    WidgetStateProperty<TextStyle?> textStyleFallback;
    switch (variant) {
      case TStyledContainerVariant.basic:
        textStyleFallback = WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            color: color == null ? _defaultTextColor(context) : effectiveColor,
          );
        });
      case TStyledContainerVariant.link:
        textStyleFallback = WidgetStateProperty.resolveWith((states) {
          final base = TextStyle(color: effectiveColor);
          if (states.hovered && hasCallback) {
            return base.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: effectiveColor,
            );
          }
          return base;
        });
      case TStyledContainerVariant.outlined:
        textStyleFallback = WidgetStateProperty.resolveWith((states) {
          if (states.hovered &&
              color != null &&
              hasCallback &&
              options.fillOnHover) {
            return TextStyle(color: effectiveColor.contrastBlackWhite());
          }
          if (color != null) {
            return TextStyle(color: effectiveColor);
          }
          return TextStyle(color: _defaultTextColor(context));
        });
      case TStyledContainerVariant.filled:
        textStyleFallback = WidgetStateProperty.resolveWith((states) {
          if (effectiveColor.isTransparent) {
            return TextStyle(color: _defaultTextColor(context));
          }
          return TextStyle(color: effectiveColor.contrastBlackWhite());
        });
      case TStyledContainerVariant.soft:
        textStyleFallback = WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            color: tw.dark ? effectiveColor.shade400 : effectiveColor.shade700,
          );
        });
    }
    return textStyle?.resolve(states) ?? textStyleFallback.resolve(states);
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

    final tw = context.tw;
    final effectiveColor = _effectiveColor(context);

    Color? hoverColor;
    switch (variant) {
      case TStyledContainerVariant.basic:
      case TStyledContainerVariant.link:
        hoverColor = Colors.transparent;
      case TStyledContainerVariant.outlined:
        hoverColor = _defaultBackgroundColor(context);
      case TStyledContainerVariant.filled:
        hoverColor = effectiveColor.shade400;
      case TStyledContainerVariant.soft:
        hoverColor = tw.dark
            ? effectiveColor.shade400.withValues(alpha: 0.2)
            : effectiveColor.shade100;
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
  // METHOD: _estimateTextHeight
  // ---------------------------------------------------------------------------

  double _estimateTextHeight(
    BuildContext context,
    TextStyle style,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(text: 'Text', style: style),
      textDirection: Directionality.of(context),
    );
    textPainter.layout();
    return textPainter.size.height;
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

            // Resolve the effective background color
            final effectiveBackgroundColor =
                _effectiveBackgroundColor(context, states);

            // Resolve the effective elevation
            final effectiveElevation = _effectiveElevation(context, states);

            // Resolve the effective border
            final effectiveBorder = _effectiveBorder(context, states);

            // Estimate the height of the text
            final textHeight = _estimateTextHeight(context, effectiveTextStyle);

            // Estimate the height of the content with padding
            final widgetHeight = options.height ??
                textHeight +
                    effectivePadding.vertical +
                    (effectiveBorder?.top.width ?? 0) +
                    (effectiveBorder?.bottom.width ?? 0);

            // Define the icon theme
            final iconTheme = IconTheme.of(context).copyWith(
              // This size will apply to everything except leading/trailing
              size: textHeight,
              color: effectiveTextStyle.color,
            );

            // Resolve the effective border radius
            // Clamp border radius to estimated size of the widget to ensure
            // smooth animations and avoid snapping.
            var br = _effectiveBorderRadius(context, states);
            if (br != null) {
              final rMax = Radius.circular(widgetHeight / 2);
              br = BorderRadius.only(
                topLeft: br.topLeft.clamp(maximum: rMax),
                topRight: br.topRight.clamp(maximum: rMax),
                bottomLeft: br.bottomLeft.clamp(maximum: rMax),
                bottomRight: br.bottomRight.clamp(maximum: rMax),
              );
            }
            final effectiveBorderRadius = br;

            // Define the button content
            final List<Widget> content = [];

            if (hasLeading) {
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

            if (hasTrailing) {
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
                      height: widgetHeight,
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
                                    dimension: textHeight * 0.75,
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
