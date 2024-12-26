import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/scaffold.dart';
import 'package:flutter_tailwind_ui_app/providers/router.dart';
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

    // Component routes
    final componentRoutes = {
      'TBadge': AppRouter.badge,
      'TButton': AppRouter.button,
      'TCodeBlock': AppRouter.code_block,
      'TRadioList': AppRouter.radio_list,
      'TRowColumn': AppRouter.row_column,
      'TScrollbar': AppRouter.scrollbar,
      'TSizedBox': AppRouter.sized_box,
      'TText': AppRouter.text,
    };

    return ExcludeFocus(
      child: ListView(
        padding: TOffset.x24 + topPadding,
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
          const AppNavigationSection(
            title: 'Design System',
            items: [
              AppNavigationItem(
                title: 'Colors',
                route: AppRouter.colors,
              ),
              AppNavigationItem(
                title: 'Spacing',
                route: AppRouter.spacing,
              ),
              AppNavigationItem(
                title: 'Typography',
                route: AppRouter.typography,
                isLast: true,
              ),
            ],
          ),
          AppNavigationSection(
            title: 'Components',
            items: [
              for (final entry in componentRoutes.entries)
                AppNavigationItem(
                  title: entry.key,
                  route: entry.value,
                  isComponent: true,
                ),
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
  final List<AppNavigationItem> items;
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
            style: tw.text.style_sm.semibold.copyWith(
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

class AppNavigationItem extends StatefulWidget {
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
  State<AppNavigationItem> createState() => _AppNavigationItemState();
}

class _AppNavigationItemState extends State<AppNavigationItem> {
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
      margin: widget.isLast ? TOffset.b0 : TOffset.b4,
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
        theme: TBadgeTheme(
          padding: WidgetStatePropertyAll(
            widget.isComponent ? TOffset.x4 + TOffset.y2 : TOffset.y0,
          ),
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
