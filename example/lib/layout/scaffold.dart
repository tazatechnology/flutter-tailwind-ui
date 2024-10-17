import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/navigation.dart';
import 'package:flutter_tailwind_ui_example/layout/toolbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    final showSideBar = tw.screen_width >= AppScaffold.sidebarBreakpoint;
    var appBarHeight = AppScaffold.toolbarHeight;
    var appBarXPad = TOffset.x28;
    if (!showSideBar) {
      appBarXPad = TOffset.x20;
      appBarHeight += AppScaffold.toolbarHeight;
    }

    final appBarBorder = Border(
      bottom: BorderSide(
        color: TColors.slate.withOpacity(0.1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: showSideBar
          ? null
          : const Drawer(
              child: AppNavigation(),
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
                    color: tw.light
                        ? TColors.gray.shade200
                        : TColors.gray.shade800,
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
            Image.asset(
              'assets/brand/flutter_tailwind_logo.png',
              height: TSpace.v20,
            ),
            TSizedBox.x8,
            SvgPicture.asset(
              'assets/brand/tailwind_ui.svg',
              semanticsLabel: 'Flutter Tailwind UI',
              height: 20,
              colorFilter: ColorFilter.mode(
                tw.light ? Colors.black : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            if (tw.screen_sm) ...[
              TSizedBox.x14,
              Container(
                height: double.infinity,
                padding: TOffset.x20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: TColors.slate.shade400.withOpacity(0.1),
                  borderRadius: TBorderRadius.rounded_full,
                ),
                child: Text(
                  'v${package.versionWithoutBuild}',
                  style: const TextStyle(
                    height: 0,
                    color: TColors.slate,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: TailwindTheme.fontFamilyMono,
                  ),
                ),
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
