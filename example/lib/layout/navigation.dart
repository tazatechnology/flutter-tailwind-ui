import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/scaffold.dart';
import 'package:flutter_tailwind_ui_app/providers/router.dart';
import 'package:flutter_tailwind_ui_app/providers/section.dart';
import 'package:go_router/go_router.dart';

// =============================================================================
// CLASS: AppNavigation
// =============================================================================

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final scrollController = ScrollController();

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final showSideBar = tw.screen.width >= AppScaffold.sidebarBreakpoint;

    EdgeInsets topPadding = TOffset.t0;
    if (showSideBar) {
      topPadding = const EdgeInsets.only(
        top: AppScaffold.toolbarHeight + TSpace.v8,
      );
    }

    // Design system sections
    final designSystemSections = {
      'Colors': {
        'Colors': AppRouter.colors,
      },
      'Spacing': {
        'Spacing': AppRouter.spacing,
      },
      'Border Radius': {
        'Border Radius': AppRouter.border_radius,
      },
      'Typography': {
        'Font Family': AppRouter.font_family,
        'Font Size': AppRouter.font_size,
        'Font Weight': AppRouter.font_weight,
        'Letter Spacing': AppRouter.letter_spacing,
        'Line Height': AppRouter.line_height,
      },
    };

    // Component sections
    final componentSections = {
      'Text': {
        'TText': AppRouter.text,
      },
      'Badges & Buttons': {
        'TBadge': AppRouter.badge,
        'TButton': AppRouter.button,
        'TIconButton': AppRouter.icon_button,
        'TSplitButton': AppRouter.split_button,
      },
      'Selection Controls & Groups': {
        'TRadio': AppRouter.radio,
        'TRadioGroup': AppRouter.radio_group,
        'TCheckbox': AppRouter.checkbox,
        'TCheckboxGroup': AppRouter.checkbox_group,
      },
      'Layout': {
        'TCard': AppRouter.card,
        'TRowColumn': AppRouter.row_column,
        'TSizedBox': AppRouter.sized_box,
      },
      'Other': {
        'TCodeBlock': AppRouter.code_block,
      },
    };

    return ExcludeFocus(
      child: ListView(
        padding: TOffset.x24 + topPadding + TOffset.b24,
        controller: scrollController,
        children: [
          const AppNavigationSection(
            title: 'Getting Started',
            items: [
              AppNavigationItem(
                title: 'About',
                route: AppRouter.about,
              ),
              AppNavigationItem(
                title: 'Quick Start',
                route: AppRouter.usage,
                isLast: true,
              ),
            ],
          ),
          AppNavigationSection(
            title: 'Design System',
            items: [
              for (final entry in designSystemSections.entries) ...[
                if (entry.value.entries.length > 1)
                  AppNavigationSubtitle(
                    title: entry.key,
                    padding: TOffset.x16 +
                        (entry.key == designSystemSections.keys.first
                            ? TOffset.b8
                            : TOffset.y8),
                  ),
                for (final item in entry.value.entries)
                  AppNavigationItem(
                    title: item.key,
                    route: item.value,
                  ),
              ],
            ],
          ),
          AppNavigationSection(
            title: 'Components',
            items: [
              for (final entry in componentSections.entries) ...[
                AppNavigationSubtitle(
                  title: entry.key,
                  padding: TOffset.x16 +
                      (entry.key == componentSections.keys.first
                          ? TOffset.b8
                          : TOffset.y8),
                ),
                for (final component in entry.value.entries)
                  AppNavigationItem(
                    title: component.key,
                    route: component.value,
                    isComponent: true,
                  ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// CLASS: AppNavigationSection
// =============================================================================

class AppNavigationSection extends StatelessWidget {
  const AppNavigationSection({
    required this.title,
    required this.items,
    super.key,
  });
  final String title;
  final List<Widget> items;
  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: TOffset.b12 + TOffset.t24,
          child: Text(
            title,
            style: tw.text.style_sm.copyWith(
              fontWeight: TFontWeight.semibold,
              color: TColors.slate[tw.light ? 900 : 200],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color:
                    tw.light ? TColors.slate.shade100 : TColors.slate.shade800,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// CLASS: AppNavigationItem
// =============================================================================

class AppNavigationItem extends ConsumerStatefulWidget {
  const AppNavigationItem({
    required this.title,
    required this.route,
    this.isLast = false,
    this.isComponent = false,
    super.key,
  });
  final String title;
  final String route;
  final bool isLast;
  final bool isComponent;
  @override
  ConsumerState<AppNavigationItem> createState() => _AppNavigationItemState();
}

class _AppNavigationItemState extends ConsumerState<AppNavigationItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    final state = GoRouterState.of(context);
    final isActive = state.topRoute?.name == widget.route;
    final showSideBar = tw.screen.width >= AppScaffold.sidebarBreakpoint;

    final activeColor = tw.light ? TColors.sky.shade500 : TColors.sky.shade400;
    final inactiveColor =
        tw.light ? TColors.slate.shade700 : TColors.slate.shade400;
    final hoveredBorder =
        tw.light ? TColors.slate.shade300 : TColors.slate.shade500;

    Color badgeColor = Colors.transparent;
    if (widget.isComponent) {
      badgeColor = tw.light ? TColors.gray.shade100 : TColors.gray.shade800;
    }
    return Container(
      margin: widget.isLast ? TOffset.b0 : TOffset.b2,
      padding: TOffset.x16 + (widget.isComponent ? TOffset.y4 : TOffset.y2),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: isActive
                ? activeColor
                : (isHovered ? hoveredBorder : Colors.transparent),
            width: 1.25,
          ),
        ),
      ),
      child: TBadge.filled(
        color: badgeColor,
        baseTextStyle: widget.isComponent ? tw.text.style_xs : tw.text.style_sm,
        size: TWidgetSize.sm,
        theme: TStyleTheme(
          textStyle: WidgetStateTextStyle.resolveWith((states) {
            return TextStyle(
              color: isActive ? activeColor : inactiveColor,
              fontWeight: isActive || (states.hovered && widget.isComponent)
                  ? FontWeight.w600
                  : FontWeight.normal,
              fontFamily: widget.isComponent ? tw.text.fontFamilyMono : null,
            );
          }),
          borderRadius: const WidgetStatePropertyAll(TBorderRadius.rounded_md),
        ),
        onPressed: () {
          if (!showSideBar) {
            Scaffold.of(context).closeDrawer();
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(sectionProvider.notifier).state = null;
          });
          context.goNamed(widget.route);
        },
        onHover: (value) {
          setState(() => isHovered = value);
        },
        child: TText(widget.title),
      ),
    );
  }
}

// =============================================================================
// CLASS: AppNavigationSubtitle
// =============================================================================

class AppNavigationSubtitle extends StatelessWidget {
  const AppNavigationSubtitle({
    required this.title,
    required this.padding,
    super.key,
  });
  final String title;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    return Padding(
      padding: padding,
      child: SelectableText(
        title,
        style: tw.text.style_xs.copyWith(
          color: TColors.slate.shade400,
          letterSpacing: TLetterSpacing.wider,
        ),
      ),
    );
  }
}
