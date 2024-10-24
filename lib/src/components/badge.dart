import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/components/state.dart';
import 'package:flutter_tailwind_ui/src/constants/text.dart';

// =================================================
// CLASS: TBadge
// =================================================

/// A badge is a small status descriptor for UI elements.
class TBadge extends StatelessWidget {
  /// Creates a [TBadge] widget.
  const TBadge({
    required this.child,
    this.leading,
    this.theme,
    this.onPressed,
    this.onDismiss,
    super.key,
  });

  /// The custom theme override for the badge.
  final Widget child;

  /// The a leading widget for the badge.
  final Widget? leading;

  /// The custom theme override for the badge.
  final TBadgeTheme? theme;

  /// An action to call when the badge is pressed.
  final VoidCallback? onPressed;

  /// An action to call when the badge is dismissed.
  ///
  /// This will add a close button to the badge.
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final theme = this.theme ?? tw.component.badge;

    return TStateConsumer(
      onPressed: onPressed,
      builder: (context, notifier) {
        final border = theme.border.resolveWithFallback(notifier.states);
        final textStyle = theme.textStyle.resolveWithFallback(notifier.states);

        final List<Widget> children = [child];
        if (leading != null) {
          children.insert(0, leading!);
        }
        if (onDismiss != null) {
          children.add(
            Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: TOffset.l4,
                child: InkWell(
                  hoverColor: textStyle.color?.withOpacity(0.1),
                  onTap: onDismiss,
                  child: Icon(
                    Icons.close,
                    size: textStyle.fontSize,
                    color: textStyle.color?.withOpacity(0.75),
                  ),
                ),
              ),
            ),
          );
        }

        return DefaultTextStyle.merge(
          style: DefaultTextStyle.of(context).style.merge(textStyle),
          child: AnimatedContainer(
            duration: theme.animationDuration,
            padding: theme.padding.resolveWithFallback(notifier.states),
            decoration: BoxDecoration(
              color: theme.backgroundColor.resolveWithFallback(notifier.states),
              border: border,
              borderRadius:
                  theme.borderRadius.resolveWithFallback(notifier.states),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
        );
      },
    );
  }
}

// =================================================
// CLASS: TBadgeTheme
// =================================================

/// Theme data for [TBadge] widgets.
class TBadgeTheme extends ThemeExtension<TBadgeTheme> {
  /// Creates a [TBadgeTheme] object.
  TBadgeTheme.raw({
    required this.animationDuration,
    required this.backgroundColor,
    required this.padding,
    required this.border,
    required this.borderRadius,
    required this.textStyle,
  });

  /// Creates a [TBadgeTheme] object.
  TBadgeTheme.light({
    Duration? animationDuration,
    TStateProperty<Color>? backgroundColor,
    TStateProperty<EdgeInsetsGeometry>? padding,
    TStateProperty<BoxBorder>? border,
    TStateProperty<BorderRadius>? borderRadius,
    TStateProperty<TextStyle>? textStyle,
  }) {
    this.animationDuration = animationDuration ?? kThemeAnimationDuration;
    this.backgroundColor =
        backgroundColor ?? TStateProperty(TColors.indigo.shade50);
    this.padding = padding ?? TStateProperty(TOffset.x8 + TOffset.y4);
    this.border = border ??
        TStateProperty(
          Border.all(color: TColors.indigo.shade700.withOpacity(0.1)),
        );
    this.borderRadius =
        borderRadius ?? TStateProperty(TBorderRadius.rounded_full);
    this.textStyle = textStyle ??
        TStateProperty(
          TTextStyle.text_xs.medium.copyWith(color: TColors.indigo.shade700),
        );
  }

  /// Creates a [TBadgeTheme] object.
  TBadgeTheme.dark({
    Duration? animationDuration,
    TStateProperty<Color>? backgroundColor,
    TStateProperty<EdgeInsetsGeometry>? padding,
    TStateProperty<BoxBorder>? border,
    TStateProperty<BorderRadius>? borderRadius,
    TStateProperty<TextStyle>? textStyle,
  }) {
    this.animationDuration = animationDuration ?? kThemeAnimationDuration;
    this.backgroundColor = backgroundColor ??
        TStateProperty(TColors.indigo.shade400.withOpacity(0.1));
    this.padding = padding ?? TStateProperty(TOffset.x8 + TOffset.y4);
    this.border = border ??
        TStateProperty(
          Border.all(color: TColors.indigo.shade400.withOpacity(0.3)),
        );
    this.borderRadius =
        borderRadius ?? TStateProperty(TBorderRadius.rounded_full);
    this.textStyle = textStyle ??
        TStateProperty(
          TTextStyle.text_xs.medium.copyWith(color: TColors.indigo.shade400),
        );
  }

  /// Creates a [TBadgeTheme] object from a [Color].
  factory TBadgeTheme.fromColor({
    required Color color,
    required BuildContext context,
  }) {
    final MaterialColor c;
    if (color is MaterialColor) {
      c = color;
    } else {
      c = color.toMaterialColor();
    }

    return context.tw.light
        ? TBadgeTheme.light(
            backgroundColor: TStateProperty(c.shade50),
            border: TStateProperty(
              Border.all(color: c.shade700.withOpacity(0.1)),
            ),
            textStyle: TStateProperty(
              TTextStyle.text_xs.medium.copyWith(color: c.shade700),
            ),
          )
        : TBadgeTheme.dark(
            backgroundColor: TStateProperty(c.shade400.withOpacity(0.1)),
            border: TStateProperty(
              Border.all(color: c.shade400.withOpacity(0.3)),
            ),
            textStyle: TStateProperty(
              TTextStyle.text_xs.medium.copyWith(color: c.shade400),
            ),
          );
  }

  /// The duration of the badge animation.
  late final Duration animationDuration;

  /// The background color of the badge.
  late final TStateProperty<Color> backgroundColor;

  /// Text
  late final TStateProperty<EdgeInsetsGeometry> padding;

  /// Text
  late final TStateProperty<BoxBorder> border;

  /// Text
  late final TStateProperty<BorderRadius> borderRadius;

  /// Text
  late final TStateProperty<TextStyle> textStyle;

  // -------------------------------------------------
  // METHOD: copyWith
  // -------------------------------------------------

  @override
  TBadgeTheme copyWith({
    Duration? animationDuration,
    TStateProperty<Color>? backgroundColor,
    TStateProperty<EdgeInsets>? padding,
    TStateProperty<BoxBorder>? border,
    TStateProperty<BorderRadius>? borderRadius,
    TStateProperty<TextStyle>? textStyle,
  }) {
    return TBadgeTheme.raw(
      animationDuration: animationDuration ?? this.animationDuration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  // -------------------------------------------------
  // METHOD: lerp
  // -------------------------------------------------

  @override
  TBadgeTheme lerp(
    TBadgeTheme? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }
    return TBadgeTheme.raw(
      animationDuration: other.animationDuration,
      backgroundColor: TStateProperty.lerp(
        backgroundColor,
        other.backgroundColor,
        t,
        lerpColor,
      ),
      padding: TStateProperty.lerp(
        padding,
        other.padding,
        t,
        lerpEdgeInsets,
      ),
      border: TStateProperty.lerp(
        border,
        other.border,
        t,
        lerpBorder,
      ),
      borderRadius: TStateProperty.lerp(
        borderRadius,
        other.borderRadius,
        t,
        lerpBorderRadius,
      ),
      textStyle: TStateProperty.lerp(
        textStyle,
        other.textStyle,
        t,
        lerpTextStyle,
      ),
    );
  }
}
