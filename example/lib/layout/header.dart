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
    final isLight = context.isLightTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: TOffset.b10,
          child: Text(
            section,
            style: context.text_sm.semibold.copyWith(
              color: TColors.sky[isLight ? 500 : 400],
            ),
          ),
        ),
        Text(
          title,
          style: context.text_3xl.extrabold.tracking_tight.copyWith(
            color: TColors.slate[isLight ? 900 : 200],
          ),
        ),
        if (description != null)
          Padding(
            padding: TOffset.t10,
            child: Text(
              description!,
              style: context.text_lg.copyWith(
                color: TColors.slate.shade700,
              ),
            ),
          ),
        TSizedBox.y32,
      ],
    );
  }
}
