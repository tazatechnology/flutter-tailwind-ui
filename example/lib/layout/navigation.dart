import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/header.dart';
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

    // Navigation sections
    final sections = {
      'Getting Started': {
        'About': AppRouter.about,
        'Quick Start': AppRouter.usage,
      },
      'Design System': {
        'Colors': AppRouter.colors,
        'Spacing': AppRouter.spacing,
        'Border Radius': AppRouter.border_radius,
      },
      'Typography': {
        'Font Family': AppRouter.font_family,
        'Font Size': AppRouter.font_size,
        'Font Weight': AppRouter.font_weight,
        'Letter Spacing': AppRouter.letter_spacing,
      },
      'Text': {
        '``TText``': AppRouter.text,
      },
      'Badges & Buttons': {
        '``TBadge``': AppRouter.badge,
        '``TButton``': AppRouter.button,
        '``TIconButton``': AppRouter.icon_button,
        '``TSplitButton``': AppRouter.split_button,
      },
      'Controls': {
        '``TRadio``': AppRouter.radio,
        '``TCheckbox``': AppRouter.checkbox,
        '``TSwitch``': AppRouter.switch_control,
      },
      'Form Components': {
        '``TInput``': AppRouter.input,
        '``TSelect``': AppRouter.select,
        '``TSlider``': AppRouter.slider,
        '``TRadioGroup``': AppRouter.radio_group,
        '``TCheckboxTile``': AppRouter.checkbox_tile,
        '``TCheckboxGroup``': AppRouter.checkbox_group,
        '``TSwitchTile``': AppRouter.switch_tile,
        '``TSwitchGroup``': AppRouter.switch_group,
      },
      'Form': {
        '``TFormField``': AppRouter.form_field,
        '``TForm``': AppRouter.form,
      },
      'Layout': {
        '``TCard``': AppRouter.card,
        '``TDialog``': AppRouter.dialog,
        '``TExpand``': AppRouter.expand,
        '``TRowColumn``': AppRouter.row_column,
        '``TPopover``': AppRouter.popover,
        '``TSizedBox``': AppRouter.sized_box,
      },
      'Filters': {
        '``TFilter``': AppRouter.filter,
        '``TBackdropFilter``': AppRouter.backdrop_filter,
      },
      'Other': {
        '``TAlert``': AppRouter.alert,
        '``TCodeBlock``': AppRouter.code_block,
      },
    };

    return ExcludeFocus(
      child: TScrollbar(
        thumbVisibility: const WidgetStatePropertyAll(true),
        trackVisibility: const WidgetStatePropertyAll(true),
        thickness: const WidgetStatePropertyAll(TSpace.v8),
        crossAxisMargin: 3,
        child: ListView(
          padding: TOffset.l24 + TOffset.r10 + topPadding + TOffset.b24,
          controller: scrollController,
          children: [
            for (final entry in sections.entries) ...[
              AppNavigationSection(
                title: entry.key,
                items: [
                  for (final item in entry.value.entries)
                    AppNavigationItem(
                      section: entry.key,
                      title: item.key,
                      route: item.value,
                    ),
                ],
              ),
            ],
          ],
        ),
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
          child: SelectableText(
            title.toUpperCase(),
            style: TTextStyle.text_xs.copyWith(
              fontWeight: TFontWeight.medium,
              letterSpacing: TLetterSpacing.widest,
              fontFamily: TTextStyle.fontFamilyMono,
              color: tw.light ? TColors.gray : TColors.gray.shade400,
            ),
          ),
        ),
        IntrinsicHeight(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: tw.light
                          ? TColors.gray.shade200
                          : TColors.gray.shade800,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: items,
              ),
            ],
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
    required this.section,
    required this.title,
    required this.route,
    super.key,
  });
  final String section;
  final String title;
  final String route;
  @override
  ConsumerState<AppNavigationItem> createState() => _AppNavigationItemState();
}

class _AppNavigationItemState extends ConsumerState<AppNavigationItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    final isComponent = widget.title.startsWith('`');

    final state = GoRouterState.of(context);
    final isActive = state.topRoute?.name == widget.route;
    final showSideBar = tw.screen.width >= AppScaffold.sidebarBreakpoint;

    final activeColor = tw.light ? TColors.sky : TColors.sky;
    final inactiveColor =
        tw.light ? TColors.gray.shade600 : TColors.gray.shade300;
    final hoveredBorder = activeColor.withValues(alpha: 0.25);

    Color badgeColor = Colors.transparent;
    if (isComponent) {
      badgeColor = tw.light ? TColors.gray.shade100 : TColors.gray.shade800;
    }
    return Container(
      padding: TOffset.x16,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: isActive
                ? activeColor
                : (isHovered ? hoveredBorder : Colors.transparent),
          ),
        ),
      ),
      child: TBadge.filled(
        color: badgeColor,
        baseTextStyle: isComponent ? TTextStyle.text_xs : TTextStyle.text_sm,
        size: TWidgetSize.sm,
        theme: TStyleTheme(
          textStyle: WidgetStateTextStyle.resolveWith((states) {
            return TextStyle(
              color: isActive ? activeColor : inactiveColor,
              fontWeight: isActive || (states.hovered && isComponent)
                  ? TFontWeight.semibold
                  : TFontWeight.normal,
              fontFamily: isComponent ? TTextStyle.fontFamilyMono : null,
            );
          }),
          borderRadius: const WidgetStatePropertyAll(TBorderRadius.rounded_md),
        ),
        onPressed: () {
          if (!showSideBar) {
            Scaffold.of(context).closeDrawer();
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Placeholder section on initial navigation
            ref.read(sectionProvider.notifier).state = AppSectionAnchor(
              title: getSectionHeaderName(
                section: widget.section,
                title: widget.title,
              ),
            );
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
