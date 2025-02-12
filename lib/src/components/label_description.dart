import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TLabelDescription
// =============================================================================

/// Add a label and or description to the top of a widget.
///
/// Used for form field elements.
class TLabelDescription extends StatelessWidget {
  /// Constructor
  const TLabelDescription({
    super.key,
    this.label,
    this.labelTextStyle,
    this.description,
    this.descriptionTextStyle,
  });

  /// The label widget
  final Widget? label;

  /// The label text style
  final TextStyle? labelTextStyle;

  /// The description widget
  final Widget? description;

  /// The description text style
  final TextStyle? descriptionTextStyle;

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
              style: TTextStyle.text_sm
                  .copyWith(
                    fontWeight: TFontWeight.medium,
                    height: kTextHeightNone,
                    color: tw.color.title,
                  )
                  .merge(labelTextStyle),
              child: label!,
            ),
          ),
        if (description != null)
          Padding(
            padding: TOffset.t2 + kPadBottom,
            child: DefaultTextStyle.merge(
              style: TTextStyle.text_sm
                  .copyWith(
                    height: kTextHeightNone,
                    color: tw.color.label,
                  )
                  .merge(descriptionTextStyle),
              child: description!,
            ),
          ),
      ],
    );
  }
}
