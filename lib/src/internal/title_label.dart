import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TLabelDescriptionWidget
// =============================================================================

/// Add a title and or description to the top of a widget.
class TLabelDescriptionWidget extends StatelessWidget {
  /// Constructor
  const TLabelDescriptionWidget({
    super.key,
    this.label,
    this.description,
  });

  /// The label widget
  final Widget? label;

  /// The description widget
  final Widget? description;

  /// The default padding for the bottom
  static const kPadBottom = TOffset.b10;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: description == null ? kPadBottom : TOffset.b0,
            child: DefaultTextStyle.merge(
              style: TTextStyle.text_sm.copyWith(
                fontWeight: TFontWeight.medium,
                height: kTextHeightNone,
                color: tw.colors.title,
              ),
              child: label!,
            ),
          ),
        if (description != null)
          Padding(
            padding: TOffset.t2 + kPadBottom,
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
