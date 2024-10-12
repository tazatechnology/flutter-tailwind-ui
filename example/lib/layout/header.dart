import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// CLASS: AppSectionHeader
// =================================================

class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({
    required this.section,
    required this.title,
    super.key,
    this.description,
  });
  final String section;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: TOffset.b10,
          child: Text(
            section,
            style: tw.text_sm.semibold.copyWith(
              color: TColors.sky[tw.light ? 500 : 400],
            ),
          ),
        ),
        Text(
          title,
          style: tw.text_3xl.extrabold.tracking_tight.copyWith(
            color: TColors.slate[tw.light ? 900 : 200],
          ),
        ),
        if (description != null)
          Padding(
            padding: TOffset.t10,
            child: Text(
              description!,
              style: tw.text_lg.copyWith(
                color: TColors.slate.shade700,
              ),
            ),
          ),
        TSizedBox.y32,
      ],
    );
  }
}

// =================================================
// CLASS: AppSubSectionHeader
// =================================================

class AppSubSectionHeader extends StatelessWidget {
  const AppSubSectionHeader({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    return Padding(
      padding: TOffset.b10,
      child: Text(
        title,
        style: tw.text_lg.bold,
      ),
    );
  }
}
