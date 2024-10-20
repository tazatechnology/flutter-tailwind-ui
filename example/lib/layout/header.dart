import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

enum AppSection {
  gettingStarted,
  designSystem,
  components,
}

extension AppSectionExtension on AppSection {
  String get name {
    switch (this) {
      case AppSection.gettingStarted:
        return 'Getting Started';
      case AppSection.designSystem:
        return 'Design System';
      case AppSection.components:
        return 'Components';
    }
  }
}

// =================================================
// CLASS: AppRouteHeader
// =================================================

class AppRouteHeader extends StatelessWidget {
  const AppRouteHeader({
    required this.section,
    required this.title,
    required this.description,
    super.key,
    this.titleMono = false,
  });
  final AppSection section;
  final String title;
  final String description;
  final bool titleMono;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    TextStyle titleStyle;
    if (!tw.screen.is_sm) {
      titleStyle = tw.text.style_2xl;
    } else {
      titleStyle = tw.text.style_3xl;
    }
    titleStyle = titleStyle.extrabold.tracking_tight.copyWith(
      color: tw.colors.title,
      fontFamily: titleMono ? tw.text.fontFamilyMono : tw.text.fontFamily,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.name,
          style: tw.text.style_sm.semibold.copyWith(
            color: TColors.sky[tw.light ? 500 : 400],
          ),
        ),
        TText(title, style: titleStyle),
        TText(
          description,
          style: tw.text.style_lg.extralight,
        ),
        TSizedBox.y28,
      ],
    );
  }
}

// =================================================
// CLASS: AppRouteSectionHeader
// =================================================

class AppRouteSectionHeader extends StatelessWidget {
  const AppRouteSectionHeader({
    required this.title,
    this.padding = TOffset.t0,
    super.key,
  });
  final String title;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return Padding(
      padding: padding + TOffset.b16,
      child: Text(
        title,
        style: tw.text.style_lg.bold.copyWith(
          color: tw.light ? TColors.slate.shade700 : TColors.slate.shade200,
        ),
      ),
    );
  }
}
