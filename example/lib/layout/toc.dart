import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/header.dart';
import 'package:flutter_tailwind_ui_app/layout/scroll_view.dart';

// =============================================================================
// CLASS: AppRouteContents
// =============================================================================

class AppRouteContents extends StatelessWidget {
  const AppRouteContents({
    required this.scrollController,
    required this.sections,
    super.key,
  });
  final ScrollController scrollController;
  final List<AppRouteSection> sections;

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final accent = tw.colors.label.withOpacity(0.5);
    return Material(
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Page Contents',
            style: tw.text.style_sm.semibold,
          ),
          TSizedBox.y8,
          for (final section in sections)
            InkWell(
              child: Padding(
                padding: TOffset.y6 + TOffset.l12,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: tw.light ? TColors.sky : TColors.sky.shade400,
                    ),
                    Text(
                      section.title,
                      style: tw.text.style_sm,
                    ),
                  ],
                ),
              ),
              onTap: () {
                AppScrollView.ensureVisible(section: section);
              },
            ),
          Padding(
            padding: TOffset.t16,
            child: Divider(height: 0, color: accent, thickness: 0.3),
          ),
        ],
      ),
    );
  }
}
