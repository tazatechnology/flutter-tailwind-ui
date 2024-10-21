import 'dart:math' show pi;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/navigation.dart';
import 'package:flutter_tailwind_ui_app/layout/toolbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

// =================================================
// CLASS: AppScaffold
// =================================================

class AppScaffold extends ConsumerStatefulWidget {
  const AppScaffold({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  ConsumerState<AppScaffold> createState() => _AppScaffoldState();

  /// The height of the toolbar
  static const toolbarHeight = TSpace.v60;

  /// The width of the navigation drawer + scroll x-padding
  static const navigationWidth = TSpace.v256 + TSpace.v48;

  /// The breakpoint at which the sidebar is shown
  static const sidebarBreakpoint = TScreen.screen_lg;
}

class _AppScaffoldState extends ConsumerState<AppScaffold> {
  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    final showSideBar = tw.screen.width >= AppScaffold.sidebarBreakpoint;
    double appBarHeight = AppScaffold.toolbarHeight;
    EdgeInsets appBarXPad = TOffset.x28;
    if (!showSideBar) {
      appBarXPad = TOffset.x20;
      appBarHeight += AppScaffold.toolbarHeight;
    }

    final appBarBorder = Border(
      bottom: BorderSide(color: tw.colors.divider),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: showSideBar
          ? null
          : Drawer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: TOffset.x16,
                    height: AppScaffold.toolbarHeight,
                    child: const _FlutterTailwindLogo(),
                  ),
                  const Expanded(child: AppNavigation()),
                ],
              ),
            ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: appBarHeight,
              decoration: BoxDecoration(
                color: tw.light
                    ? Colors.white.withOpacity(0.65)
                    : context.theme.scaffoldBackgroundColor.withOpacity(0.75),
                border: appBarBorder,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: AppScaffold.toolbarHeight,
                      padding: TOffset.y16 + appBarXPad,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: showSideBar ? null : appBarBorder,
                      ),
                      child: const _ScaffoldHeader(),
                    ),
                  ),
                  if (!showSideBar)
                    Expanded(
                      child: Container(
                        height: AppScaffold.toolbarHeight,
                        padding: TOffset.y16 + appBarXPad,
                        width: double.infinity,
                        child: const _ScaffoldMobileNavigation(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          if (showSideBar)
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: tw.colors.divider,
                    width: 0.5,
                  ),
                ),
              ),
              width: AppScaffold.navigationWidth,
              child: const AppNavigation(),
            ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}

// =================================================
// CLASS: _ScaffoldHeader
// =================================================

class _ScaffoldHeader extends StatelessWidget {
  const _ScaffoldHeader();

  @override
  Widget build(BuildContext context) {
    final package = AppInfo.of(context).package;
    final tw = context.tw;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const _FlutterTailwindLogo(),
            if (tw.screen.is_sm) ...[
              TSizedBox.x14,
              Link(
                uri: Uri.parse('https://pub.dev/packages/flutter_tailwind_ui'),
                target: LinkTarget.blank,
                builder: (context, followLink) {
                  return InkWell(
                    onTap: followLink,
                    child: Tooltip(
                      message: 'View on pub.dev',
                      child: Container(
                        height: double.infinity,
                        padding: TOffset.x20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColors.slate.shade400.withOpacity(0.1),
                          borderRadius: TBorderRadius.rounded_full,
                        ),
                        child: Text(
                          'v${package.versionWithoutBuild}',
                          style: tw.text.style_xs.mono(context),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
        const AppToolbar(),
      ],
    );
  }
}

// =================================================
// CLASS: _ScaffoldMobileNavigation
// =================================================

class _ScaffoldMobileNavigation extends StatelessWidget {
  const _ScaffoldMobileNavigation();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: Scaffold.of(context).openDrawer,
          child: const FaIcon(FontAwesomeIcons.bars, size: 20),
        ),
      ],
    );
  }
}

// =================================================
// CLASS: _FlutterTailwindLogo
// =================================================

class _FlutterTailwindLogo extends StatelessWidget {
  const _FlutterTailwindLogo();

  @override
  Widget build(BuildContext context) {
    const overlap = 19.5;
    final tw = context.tw;
    return Padding(
      padding: const EdgeInsets.only(left: overlap),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Transform.translate(
            offset: const Offset(-overlap, -3),
            child: Transform.flip(
              flipX: true,
              child: Transform.rotate(
                angle: 45 * pi / 180,
                child: const FlutterLogo(size: 22),
              ),
            ),
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.centerRight,
              widthFactor: 0.92,
              child: SvgPicture.asset(
                'assets/brand/tailwind_ui.svg',
                semanticsLabel: 'Flutter Tailwind UI',
                height: 20,
                colorFilter: ColorFilter.mode(
                  tw.light ? Colors.black : Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
