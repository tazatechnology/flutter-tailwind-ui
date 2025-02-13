import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TLabelDescription
// =============================================================================

/// Add a label and or description to the top of a widget.
///
/// Used for form field elements.
class TLabelDescription extends StatelessWidget {
  /// Constructor for [TLabelDescription]
  const TLabelDescription({
    super.key,
    this.label,
    this.labelTextStyle,
    this.description,
    this.descriptionTextStyle,
  });

  /// Wrap a widget with a label and or description placeholder
  ///
  /// This is useful to align non-form field elements with form field elements.
  static Widget wrap({
    required Widget child,
    bool label = true,
    bool description = false,
  }) {
    return Column(
      children: [
        TLabelDescription(
          label: label ? const Text('') : null,
          description: description ? const Text('') : null,
        ),
        child,
      ],
    );
  }

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
