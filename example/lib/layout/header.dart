import 'package:flutter/material.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/scroll_view.dart';
import 'package:url_launcher/link.dart';

enum AppSectionType {
  gettingStarted,
  designSystem,
  components,
}

extension AppSectionExtension on AppSectionType {
  String get name {
    switch (this) {
      case AppSectionType.gettingStarted:
        return 'Getting Started';
      case AppSectionType.designSystem:
        return 'Design System';
      case AppSectionType.components:
        return 'Components';
    }
  }
}

// =============================================================================
// CLASS: AppRouteHeader
// =============================================================================

class AppRouteHeader extends StatelessWidget {
  const AppRouteHeader({
    required this.section,
    required this.title,
    required this.description,
    super.key,
    this.titleMono = false,
    this.className,
  });
  final AppSectionType section;
  final String title;
  final String description;
  final bool titleMono;
  final String? className;

  static const baseUrl =
      'https://pub.dev/documentation/flutter_tailwind_ui/latest/flutter_tailwind_ui/';

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

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
        Row(
          children: [
            TText(title, style: titleStyle),
            if (className != null)
              Padding(
                padding: TOffset.l14,
                child: Link(
                  uri: Uri.parse('$baseUrl$className-class.html'),
                  builder: (context, followLink) {
                    return TBadge.soft(
                      tooltip: 'API Docs for ``**$className**``',
                      onPressed: followLink,
                      child: const Text('Dart Docs'),
                    );
                  },
                ),
              ),
          ],
        ),
        TText(
          description,
          style: tw.text.style_lg.extralight,
        ),
        TSizedBox.y16,
      ],
    );
  }
}

// =============================================================================
// CLASS: AppRouteSection
// =============================================================================

class AppRouteSection extends StatefulWidget {
  AppRouteSection({
    required this.title,
    this.children,
    super.key,
  }) {
    // Create a web url friendly fragment from title
    fragment = title
        .toLowerCase()
        .replaceAll(' ', '-')
        .replaceAll(RegExp(r'[^a-z0-9\-]'), '');
    globalKey = GlobalKey(debugLabel: fragment);
  }
  final String title;
  final List<Widget>? children;
  late final GlobalKey globalKey;
  late final String fragment;

  @override
  State<AppRouteSection> createState() => _AppRouteSectionState();
}

class _AppRouteSectionState extends State<AppRouteSection> {
  bool isHovered = false;
  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final target = AppInfo.of(context).target;

    return Padding(
      padding: TOffset.t16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: TOffset.b12,
            child: GestureDetector(
              onTap: () {
                AppScrollView.ensureVisible(section: widget);
              },
              child: MouseRegion(
                onHover: (event) {
                  if (isHovered || target.isMobileWeb) {
                    return;
                  }
                  setState(() => isHovered = true);
                },
                onExit: (event) {
                  if (!isHovered || target.isMobileWeb) {
                    return;
                  }
                  setState(() => isHovered = false);
                },
                child: Stack(
                  alignment: Alignment.centerRight,
                  clipBehavior: Clip.none,
                  children: [
                    DefaultSelectionStyle.merge(
                      mouseCursor: SystemMouseCursors.click,
                      child: Text(
                        key: widget.globalKey,
                        widget.title,
                        style: tw.text.style_lg.bold.copyWith(
                          color: tw.light
                              ? TColors.slate.shade700
                              : TColors.slate.shade200,
                        ),
                      ),
                    ),
                    if (isHovered)
                      const Positioned(
                        right: -TSpace.v32,
                        child: Card(
                          child: Padding(
                            padding: TOffset.a4,
                            child: Icon(
                              Icons.tag,
                              size: 16,
                              color: TColors.sky,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.children != null) ...[
            ...widget.children!,
          ],
        ],
      ),
    );
  }
}
