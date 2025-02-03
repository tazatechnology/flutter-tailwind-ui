import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/scroll_view.dart';
import 'package:flutter_tailwind_ui_app/providers/section.dart';
import 'package:go_router/go_router.dart';
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
          child: TRowColumn(
            crossAxisAlignment: tw.screen.is_xs
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            axis: tw.screen.is_xs ? Axis.horizontal : Axis.vertical,
            children: [
              Padding(
                padding:
                    TOffset.r14 + (tw.screen.is_xs ? TOffset.b0 : TOffset.b10),
                child: TText(title, style: titleStyle),
              ),
              Row(
                spacing: TSpace.v12,
                children: [
                  if (className != null)
                    Link(
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
                  if (reference != null) ReferenceBadge(reference: reference!),
                ],
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

class AppSection extends ConsumerWidget {
  AppSection({
    required this.title,
    this.description,
    this.trailing,
    this.children,
    super.key,
  }) {
    fragment = _getFragment(title);
  }

  final String title;
  final String? description;
  late final String fragment;
  final Widget? trailing;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Register the global key for this section and retrieve
    // All keys for sections are stored through the app lifecycle
    final keyLabel = '${GoRouterState.of(context).uri}#$fragment';
    final globalKey = ref
        .read(sectionKeyProvider)
        .putIfAbsent(keyLabel, () => GlobalKey(debugLabel: keyLabel));

    final tw = context.tw;
    return Column(
      key: globalKey,
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
                        Opacity(
                          opacity: states.hovered ? 1 : 0,
                          child: const Padding(
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
        if (description != null && description!.isNotEmpty)
          TText(
            description!,
          ),
        if (children != null) ...children!,
      ],
    );
  }
}

// =============================================================================
// CLASS: ReferenceBadge
// =============================================================================

class ReferenceBadge extends StatelessWidget {
  const ReferenceBadge({
    required this.reference,
    this.tooltip = 'Tailwind reference',
    this.text = 'Reference',
    super.key,
  });
  final String reference;
  final String tooltip;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Link(
      target: LinkTarget.blank,
      uri: Uri.parse(reference),
      builder: (context, followLink) {
        return TBadge.soft(
          color: TColors.indigo,
          tooltip: tooltip,
          onPressed: followLink,
          child: Text(text),
        );
      },
    );
  }
}
