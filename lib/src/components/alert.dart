import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/internal/styled_container.dart';

// =============================================================================
// CLASS: TAlert
// =============================================================================

/// A Tailwind UI inspired  alert.
class TAlert extends StatelessWidget {
  /// Constructor for [TAlert].
  const TAlert({
    super.key,
    required this.color,
    required this.title,
    this.content,
    this.trailing,
    this.icon,
    this.padding = TOffset.a16,
    this.borderRadius = TBorderRadius.rounded_md,
    this.crossAxisAlignment,
  });

  /// A neutral alert.
  const TAlert.neutral({
    super.key,
    required this.title,
    this.content,
    this.trailing,
    this.color = TColors.neutral,
    this.icon = const Icon(Icons.info),
    this.padding = TOffset.a16,
    this.borderRadius = TBorderRadius.rounded_md,
    this.crossAxisAlignment,
  });

  /// An informational alert.
  const TAlert.info({
    super.key,
    required this.title,
    this.content,
    this.trailing,
    this.color = TColors.blue,
    this.icon = const Icon(Icons.info),
    this.padding = TOffset.a16,
    this.borderRadius = TBorderRadius.rounded_md,
    this.crossAxisAlignment,
  });

  /// A success alert.
  const TAlert.success({
    super.key,
    required this.title,
    this.content,
    this.trailing,
    this.color = TColors.green,
    this.icon = const Icon(Icons.check_circle),
    this.padding = TOffset.a16,
    this.borderRadius = TBorderRadius.rounded_md,
    this.crossAxisAlignment,
  });

  /// A success alert.
  const TAlert.warning({
    super.key,
    required this.title,
    this.content,
    this.trailing,
    this.color = TColors.yellow,
    this.icon = const Icon(Icons.warning),
    this.padding = TOffset.a16,
    this.borderRadius = TBorderRadius.rounded_md,
    this.crossAxisAlignment,
  });

  /// A danger alert.
  const TAlert.danger({
    super.key,
    required this.title,
    this.content,
    this.trailing,
    this.color = TColors.red,
    this.icon = const Icon(Icons.cancel),
    this.padding = TOffset.a16,
    this.borderRadius = TBorderRadius.rounded_md,
    this.crossAxisAlignment,
  });

  /// The color of the alert.
  final Color color;

  /// The leading icon to display at the left of the title.
  final Widget? icon;

  /// The title to display at the top.
  final Widget title;

  /// The content to display below the title.
  final Widget? content;

  /// The trailing widget to the right of the title.
  final Widget? trailing;

  /// The padding of all the content.
  final EdgeInsets padding;

  /// The border radius.
  final BorderRadius borderRadius;

  /// The cross axis alignment of the icon, title, and trailing row
  ///
  /// If null, will be dynamically set based on defined properties
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = TStyledContainer.resolveBackgroundColor(
      context: context,
      states: {},
      backgroundColor: null,
      variant: TStyleVariant.soft,
      color: color,
      hasCallback: false,
    );

    final textStyle = TStyledContainer.resolveTextStyle(
      context: context,
      states: {},
      textStyle: null,
      variant: TStyleVariant.soft,
      color: color,
      hasCallback: false,
    );

    CrossAxisAlignment? effectiveCrossAxisAlignment = crossAxisAlignment;
    if (effectiveCrossAxisAlignment == null) {
      if (trailing != null && content == null) {
        effectiveCrossAxisAlignment = CrossAxisAlignment.center;
      } else {
        effectiveCrossAxisAlignment = CrossAxisAlignment.start;
      }
    }

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: IconTheme(
        data: IconThemeData(
          color: color,
          size: TSpace.v16,
        ),
        child: DefaultTextStyle.merge(
          style: textStyle?.copyWith(
            fontSize: TFontSize.text_sm,
          ),
          child: Row(
            crossAxisAlignment: effectiveCrossAxisAlignment,
            children: [
              if (icon != null)
                Padding(
                  padding: TOffset.r12,
                  child: icon,
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle.merge(
                      style: textStyle?.copyWith(
                        fontWeight: TFontWeight.medium,
                        height: kTextHeightNone,
                      ),
                      child: title,
                    ),
                    if (content != null)
                      Padding(
                        padding: TOffset.t8,
                        child: content,
                      ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
