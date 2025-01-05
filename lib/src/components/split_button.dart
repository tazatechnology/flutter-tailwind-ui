import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/styled_container.dart';

// =============================================================================
// CLASS: TSplitButton
// =============================================================================

/// A highly customizable button
class TSplitButton extends StatelessWidget {
  /// Creates a basic [TSplitButton] button ([TStyleVariant.basic]).
  const TSplitButton({
    required this.child,
    super.key,
    this.color,
    this.theme,
    this.size = TWidgetSize.md,
    this.leading,
    this.trailing,
    this.controller,
    this.controllerLeading,
    this.controllerTrailing,
    this.loading,
    this.loadingLeading,
    this.loadingTrailing,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
    this.onPressed,
    this.onPressedLeading,
    this.onPressedTrailing,
    this.onHover,
    this.onHoverLeading,
    this.onHoverTrailing,
  }) : variant = TStyleVariant.basic;

  /// Creates an outlined [TSplitButton] button ([TStyleVariant.outlined]).
  const TSplitButton.outlined({
    required this.child,
    super.key,
    this.color,
    this.theme,
    this.size = TWidgetSize.md,
    this.leading,
    this.trailing,
    this.controller,
    this.controllerLeading,
    this.controllerTrailing,
    this.loading,
    this.loadingLeading,
    this.loadingTrailing,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
    this.onPressed,
    this.onPressedLeading,
    this.onPressedTrailing,
    this.onHover,
    this.onHoverLeading,
    this.onHoverTrailing,
  }) : variant = TStyleVariant.outlined;

  /// Creates a filled [TSplitButton] button ([TStyleVariant.filled]).
  const TSplitButton.filled({
    required this.child,
    super.key,
    this.color,
    this.theme,
    this.size = TWidgetSize.md,
    this.leading,
    this.trailing,
    this.controller,
    this.controllerLeading,
    this.controllerTrailing,
    this.loading,
    this.loadingLeading,
    this.loadingTrailing,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
    this.onPressed,
    this.onPressedLeading,
    this.onPressedTrailing,
    this.onHover,
    this.onHoverLeading,
    this.onHoverTrailing,
  }) : variant = TStyleVariant.filled;

  /// Creates a soft [TSplitButton] button ([TStyleVariant.soft]).
  const TSplitButton.soft({
    required this.child,
    super.key,
    this.color,
    this.theme,
    this.size = TWidgetSize.md,
    this.leading,
    this.trailing,
    this.controller,
    this.controllerLeading,
    this.controllerTrailing,
    this.loading,
    this.loadingLeading,
    this.loadingTrailing,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
    this.onPressed,
    this.onPressedLeading,
    this.onPressedTrailing,
    this.onHover,
    this.onHoverLeading,
    this.onHoverTrailing,
  }) : variant = TStyleVariant.soft;

  /// Creates a raw [TSplitButton] button.
  const TSplitButton.raw({
    required this.child,
    required this.variant,
    super.key,
    this.color,
    this.theme,
    this.size = TWidgetSize.md,
    this.leading,
    this.trailing,
    this.controller,
    this.controllerLeading,
    this.controllerTrailing,
    this.loading,
    this.loadingLeading,
    this.loadingTrailing,
    this.tooltip,
    this.tooltipLeading,
    this.tooltipTrailing,
    this.onPressed,
    this.onPressedLeading,
    this.onPressedTrailing,
    this.onHover,
    this.onHoverLeading,
    this.onHoverTrailing,
  });

  /// The variant of the button.
  final TStyleVariant variant;

  /// The custom theme override for the badge.
  final Widget child;

  /// The a leading widget for the badge.
  final Widget? leading;

  /// The a leading widget for the badge.
  final Widget? trailing;

  /// The custom theme override for the button.
  final TStyleTheme? theme;

  /// The custom theme override for the button.
  final TWidgetSize size;

  /// The color to use for button styling.
  final Color? color;

  /// The controller for the child widget.
  final TWidgetController? controller;

  /// The controller for the leading widget.
  final TWidgetController? controllerLeading;

  /// The controller for the trailing widget.
  final TWidgetController? controllerTrailing;

  /// The widget to display when the child widget is in a loading state.
  final Widget? loading;

  /// The widget to display when the leading widget is in a loading state.
  final Widget? loadingLeading;

  /// The widget to display when the trailing widget is in a loading state.
  final Widget? loadingTrailing;

  /// The tooltip to display when hovering over the button.
  ///
  /// Rendered using the [TTooltip] widget and supports rich text formatting.
  final String? tooltip;

  /// The tooltip to display when hovering over the leading widget.
  ///
  /// Rendered using the [TTooltip] widget and supports rich text formatting.
  final String? tooltipLeading;

  /// The tooltip to display when hovering over the trailing widget.
  ///
  /// Rendered using the [TTooltip] widget and supports rich text formatting.
  final String? tooltipTrailing;

  /// An action to call when the button child is pressed.
  final GestureTapCallback? onPressed;

  /// An action to call when the button leading widget is pressed.
  final GestureTapCallback? onPressedLeading;

  /// An action to call when the button trailing widget is pressed.
  final GestureTapCallback? onPressedTrailing;

  /// Called when a pointer enters or exits the child area.
  final ValueChanged<bool>? onHover;

  /// Called when a pointer enters or exits the leading area.
  final ValueChanged<bool>? onHoverLeading;

  /// Called when a pointer enters or exits the trailing area.
  final ValueChanged<bool>? onHoverTrailing;

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveBorderRadius
  // ---------------------------------------------------------------------------

  BorderRadius? _effectiveBorderRadius(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    final defaultBorderRadius = TButton.getDefaultBorderRadius(size);
    return TStyledContainer.resolveBorderRadius(
      context: context,
      states: states,
      borderRadius:
          theme?.borderRadius ?? WidgetStatePropertyAll(defaultBorderRadius),
      variant: variant,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveBorder
  // ---------------------------------------------------------------------------

  BoxBorder? _effectiveBorder(
    BuildContext context,
    Set<WidgetState> states, [
    bool hasCallback = true,
  ]) {
    return TStyledContainer.resolveBorder(
      context: context,
      states: states,
      border: theme?.border,
      backgroundColor: theme?.backgroundColor,
      variant: variant,
      color: color,
      hasCallback: hasCallback,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveTextStyle
  // ---------------------------------------------------------------------------

  TextStyle? _effectiveTextStyle(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    return TStyledContainer.resolveTextStyle(
      context: context,
      states: states,
      textStyle: theme?.textStyle,
      variant: variant,
      color: color,
      hasCallback: true,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: _effectiveBackgroundColor
  // ---------------------------------------------------------------------------

  Color? _effectiveBackgroundColor(
    BuildContext context,
    Set<WidgetState> states,
  ) {
    return TStyledContainer.resolveBackgroundColor(
      context: context,
      states: states,
      backgroundColor: theme?.backgroundColor,
      variant: variant,
      color: color,
      hasCallback: true,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final baseTheme = theme ?? const TStyleTheme();

    final textStyle = _effectiveTextStyle(context, {});
    final b = _effectiveBorder(context, {});
    final backgroundColor = _effectiveBackgroundColor(context, {});

    Color? dividerColor;
    final dividerAlpha = tw.light ? 0.15 : 0.25;
    switch (variant) {
      case TStyleVariant.basic:
        dividerColor = null;
      case TStyleVariant.outlined:
        dividerColor = b?.top.color;
      case TStyleVariant.filled:
        dividerColor = textStyle?.color?.withValues(alpha: dividerAlpha);
      case TStyleVariant.soft:
        dividerColor = textStyle?.color?.withValues(alpha: dividerAlpha);
    }

    // Only show the divider if a color is provided.
    final divider = dividerColor == null
        ? null
        : Container(
            color: backgroundColor,
            child: VerticalDivider(
              color: dividerColor,
              thickness: 1,
              width: 1,
            ),
          );

    /// The theme for the leading widget.
    final themeLeading = baseTheme.copyWith(
      border: WidgetStateProperty.resolveWith((states) {
        final b = _effectiveBorder(context, states, onPressedLeading != null);
        return b?.copyWithSides(right: BorderSide.none);
      }),
      borderRadius: WidgetStateProperty.resolveWith((states) {
        final br = _effectiveBorderRadius(context, states);
        return BorderRadius.only(
          topLeft: br?.topLeft ?? Radius.zero,
          bottomLeft: br?.bottomLeft ?? Radius.zero,
        );
      }),
    );

    /// The theme for the child widget.
    final themeChild = baseTheme.copyWith(
      border: WidgetStateProperty.resolveWith((states) {
        final b = _effectiveBorder(context, states, onPressed != null);
        return b?.copyWithSides(
          left: leading != null ? BorderSide.none : null,
          right: trailing != null ? BorderSide.none : null,
        );
      }),
      borderRadius: WidgetStateProperty.resolveWith((states) {
        final br = _effectiveBorderRadius(context, states);
        if (leading != null && trailing != null) {
          return BorderRadius.zero;
        } else if (leading != null) {
          return BorderRadius.only(
            topRight: br?.topRight ?? Radius.zero,
            bottomRight: br?.bottomRight ?? Radius.zero,
          );
        } else if (trailing != null) {
          return BorderRadius.only(
            topLeft: br?.topLeft ?? Radius.zero,
            bottomLeft: br?.bottomLeft ?? Radius.zero,
          );
        }
        return br;
      }),
    );

    /// The theme for the trailing widget.
    final themeTrailing = baseTheme.copyWith(
      border: WidgetStateProperty.resolveWith((states) {
        final b = _effectiveBorder(context, states, onPressedTrailing != null);
        return b?.copyWithSides(left: BorderSide.none);
      }),
      borderRadius: WidgetStateProperty.resolveWith((states) {
        final br = _effectiveBorderRadius(context, states);
        return BorderRadius.only(
          topRight: br?.topRight ?? Radius.zero,
          bottomRight: br?.bottomRight ?? Radius.zero,
        );
      }),
    );

    /// Define a custom icon size resolved for leading and trailing widgets.
    /// Default to only be the font size (instead of the full text height).
    final iconSize = WidgetStateProperty.resolveWith((states) {
      return themeLeading.textStyle?.resolve(states)?.fontSize ??
          TButton.getDefaultTextStyle(size).fontSize;
    });

    return SizedBox(
      height: TButton.getDefaultHeight(size),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            TIconButton.raw(
              size: size,
              variant: variant,
              theme: themeLeading.copyWith(iconSize: iconSize),
              color: color,
              loading: loadingLeading,
              tooltip: tooltipLeading,
              onPressed: onPressedLeading,
              onHover: onHoverLeading,
              controller: controllerLeading,
              icon: leading!,
            ),
            if (divider != null) divider,
          ],
          TButton.raw(
            size: size,
            variant: variant,
            theme: themeChild,
            color: color,
            loading: loading,
            tooltip: tooltip,
            onPressed: onPressed,
            onHover: onHover,
            controller: controller,
            child: child,
          ),
          if (trailing != null) ...[
            if (divider != null) divider,
            TIconButton.raw(
              size: size,
              variant: variant,
              theme: themeTrailing.copyWith(iconSize: iconSize),
              color: color,
              loading: loadingTrailing,
              tooltip: tooltipTrailing,
              onPressed: onPressedTrailing,
              onHover: onHoverTrailing,
              controller: controllerTrailing,
              icon: trailing!,
            ),
          ],
        ],
      ),
    );
  }
}
