import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/scaffold.dart';
import 'package:flutter_tailwind_ui_example/providers/router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

// =================================================
// CLASS: AppNavigation
// =================================================

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final scrollController = ScrollController();

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final isLight = context.isLightTheme;
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      child: ListView(
        padding: TOffset.x24 +
            const EdgeInsets.only(
              top: AppScaffold.toolbarHeight + TSpacingScale.v40,
            ),
        controller: scrollController,
        children: [
          Container(
            height: TSpacingScale.v40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TColors.slate[isLight ? 50 : 800],
              border: Border.all(
                color:
                    isLight ? TColors.slate.shade200 : TColors.slate.shade700,
              ),
              borderRadius: TBorderRadius.rounded_md,
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox.expand(
                  child: Center(
                    child: Text(
                      'Contribute',
                      style: context.text_sm.copyWith(
                        color: TColors.slate.shade400.withOpacity(0.75),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: TOffset.l12,
                  child: FaIcon(
                    FontAwesomeIcons.github,
                    size: 16,
                    color: TColors.slate.shade400,
                  ),
                ),
              ],
            ),
          ),
          const AppNavigationSection(
            title: 'Getting Started',
            items: [
              AppNavigationItem(
                title: 'About',
                route: AppRouter.about,
              ),
              AppNavigationItem(
                title: 'Installation',
                route: AppRouter.installation,
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
        ],
      ),
    );
  }
}

// =================================================
// CLASS: AppNavigationSection
// =================================================

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
    final isLight = context.isLightTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: TOffset.b12 + TOffset.t24,
          child: Text(
            title,
            style: context.text_sm.semibold.copyWith(
              color: TColors.slate[isLight ? 900 : 200],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color:
                    isLight ? TColors.slate.shade100 : TColors.slate.shade800,
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

// =================================================
// CLASS: AppNavigationItem
// =================================================

class AppNavigationItem extends StatefulWidget {
  const AppNavigationItem({
    required this.title,
    required this.route,
    this.isLast = false,
    super.key,
  });
  final String title;
  final String route;
  final bool isLast;
  @override
  State<AppNavigationItem> createState() => _AppNavigationItemState();
}

class _AppNavigationItemState extends State<AppNavigationItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final isLight = context.isLightTheme;
    final isActive = state.topRoute?.name == widget.route;

    final activeColor = isLight ? TColors.sky.shade500 : TColors.sky.shade400;
    final inactiveColor =
        isLight ? TColors.slate.shade700 : TColors.slate.shade400;
    final hoveredBorder =
        isLight ? TColors.slate.shade300 : TColors.slate.shade500;
    return InkWell(
      onTap: () {
        context.goNamed(widget.route);
      },
      onHover: (value) {
        setState(() => isHovered = value);
      },
      child: Container(
        margin: widget.isLast ? TOffset.b0 : TOffset.b8,
        padding: TOffset.y2 + TOffset.x24,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: isActive
                  ? activeColor
                  : (isHovered ? hoveredBorder : Colors.transparent),
            ),
          ),
        ),
        child: Text(
          widget.title,
          style: context.text_sm.copyWith(
            color: isActive ? activeColor : inactiveColor,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
