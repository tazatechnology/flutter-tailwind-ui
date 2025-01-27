import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/scroll_view.dart';
import 'package:url_launcher/link.dart';

// =============================================================================
// ENUM: AppRouteType
// =============================================================================

enum AppRouteType {
  gettingStarted,
  designSystem,
  typography,
  components,
}

extension XAppRouteType on AppRouteType {
  String get name {
    switch (this) {
      case AppRouteType.gettingStarted:
        return 'Getting Started';
      case AppRouteType.designSystem:
        return 'Design System';
      case AppRouteType.typography:
        return 'Typography';
      case AppRouteType.components:
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
    this.reference,
  });
  final AppRouteType section;
  final String title;
  final String description;
  final bool titleMono;
  final String? className;
  final String? reference;

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
      titleStyle = TTextStyle.text_2xl;
    } else {
      titleStyle = TTextStyle.text_3xl;
    }
    titleStyle = titleStyle.copyWith(
      color: tw.colors.title,
      fontFamily: titleMono ? TTextStyle.fontFamilyMono : TTextStyle.fontFamily,
      fontWeight: TFontWeight.medium,
      letterSpacing: TLetterSpacing.tight,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section.name.toUpperCase(),
          style: TTextStyle.text_xs.copyWith(
            fontWeight: TFontWeight.medium,
            letterSpacing: TLetterSpacing.widest,
            color: tw.light ? TColors.gray.shade600 : TColors.gray.shade400,
          ),
        ),
        Padding(
          padding: TOffset.t12,
          child: Row(
            children: [
              TText(title, style: titleStyle),
              if (className != null)
                Padding(
                  padding: TOffset.l14,
                  child: Link(
                    target: LinkTarget.blank,
                    uri: Uri.parse('$baseUrl$className-class.html'),
                    builder: (context, followLink) {
                      return TBadge.soft(
                        color: TColors.sky,
                        tooltip: 'API Docs for ``**$className**``',
                        onPressed: followLink,
                        child: const Text('Dart Docs'),
                      );
                    },
                  ),
                ),
              if (reference != null)
                Padding(
                  padding: TOffset.l14,
                  child: Link(
                    target: LinkTarget.blank,
                    uri: Uri.parse(reference!),
                    builder: (context, followLink) {
                      return TBadge.soft(
                        color: TColors.indigo,
                        tooltip: 'Tailwind reference',
                        onPressed: followLink,
                        child: const Text('Reference'),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: TOffset.y24,
          child: TText(
            description,
            style: TTextStyle.text_lg.copyWith(
              fontWeight: TFontWeight.extralight,
              color: tw.light ? TColors.gray.shade700 : TColors.gray.shade400,
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: AppSection
// =============================================================================

String _getFragment(String title) {
  return title
      .toLowerCase()
      .replaceAll(' ', '-')
      .replaceAll(RegExp(r'[^a-z0-9\-]'), '');
}

class AppSection extends StatelessWidget {
  AppSection({
    required this.title,
    this.description,
    this.trailing,
    this.children,
  }) : super(key: GlobalKey(debugLabel: _getFragment(title))) {
    fragment = _getFragment(title);
  }

  final String title;
  final String? description;
  late final String fragment;
  final Widget? trailing;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: TOffset.y16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TGestureDetector(
                  onTap: () {
                    AppScrollView.ensureVisible(section: this);
                  },
                  builder: (context, states) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: TText(
                            title,
                            style: TTextStyle.text_lg.copyWith(
                              fontWeight: TFontWeight.semibold,
                              decoration: states.focused
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              decorationColor: tw.colors.focus,
                            ),
                          ),
                        ),
                        if (states.hovered)
                          const Padding(
                            padding: TOffset.l4,
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
                    );
                  },
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
        if (description != null && description!.isNotEmpty) TText(description!),
        if (children != null) ...children!,
      ],
    );
  }
}
