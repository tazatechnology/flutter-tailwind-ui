import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TTitleLabelWidget
// =============================================================================

/// Add a title label to a primary widget (e.g. a group of radio buttons)
class TTitleLabelWidget extends StatelessWidget {
  /// Constructor
  const TTitleLabelWidget({
    super.key,
    this.title,
    this.description,
  });

  /// The title widget
  final Widget? title;

  /// The description widget
  final Widget? description;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          DefaultTextStyle.merge(
            style: TTextStyle.text_sm.copyWith(
              fontWeight: TFontWeight.semibold,
              height: kTextHeightNone,
              color: tw.colors.title,
            ),
            child: title!,
          ),
        if (description != null)
          Padding(
            padding: TOffset.t2 + TOffset.b16,
            child: DefaultTextStyle.merge(
              style: TTextStyle.text_sm.copyWith(
                height: kTextHeightNone,
                color: tw.colors.label,
              ),
              child: description!,
            ),
          ),
      ],
    );
  }
}
