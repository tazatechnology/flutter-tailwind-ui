import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/navigation.dart';
import 'package:flutter_tailwind_ui_example/layout/toolbar.dart';

// =================================================
// CLASS: AppScaffold
// =================================================

class AppScaffold extends ConsumerStatefulWidget {
  const AppScaffold({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  ConsumerState<AppScaffold> createState() => _AppScaffoldState();

  /// The height of the toolbar
  static const toolbarHeight = TSpacingScale.v60;

  /// The width of the navigation drawer + scroll x-padding
  static const navigationWidth = TSpacingScale.v256 + TSpacingScale.v48;
}

class _AppScaffoldState extends ConsumerState<AppScaffold> {
  final scrollController = ScrollController();

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final package = AppInfo.of(context).package;
    final isLightTheme = context.isLightTheme;
    final screenSize = context.screenSize;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppScaffold.toolbarHeight),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: AppScaffold.toolbarHeight,
              padding: TOffset.y16 + TOffset.x28,
              decoration: BoxDecoration(
                color: isLightTheme
                    ? Colors.white.withOpacity(0.6)
                    : Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: TColors.slate.withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FlutterLogo(),
                      TSizedBox.x14,
                      SvgPicture.asset(
                        'assets/brand/tailwind_ui.svg',
                        semanticsLabel: 'Tailwind UI (Flutter)',
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          isLightTheme ? TColors.black : TColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
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
                          style: TextStyle(
                            height: 0,
                            color: TColors.slate,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            fontFamily: TailwindTheme.fontFamilyMono,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppToolbar(),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: context.theme.scrollbarTheme.trackBorderColor
                          ?.resolve({}) ??
                      TColors.transparent,
                  width: 1,
                ),
              ),
            ),
            width: AppScaffold.navigationWidth,
            child: AppNavigation(),
          ),
          Expanded(
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              trackVisibility: true,
              child: SingleChildScrollView(
                padding: TOffset.x32,
                controller: scrollController,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: screenSize.width,
                    minHeight: screenSize.height,
                  ),
                  child: Stack(
                    children: [
                      // The hard coded values come from inspecting the image
                      // on the tailwind documentation website
                      Positioned(
                        top: 0,
                        left: AppScaffold.navigationWidth,
                        right: 0,
                        child: SizedBox(
                          height: 500,
                          child: Center(
                            child: OverflowBox(
                              maxWidth: 1148.0,
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                isLightTheme
                                    ? 'assets/img/background.png'
                                    : 'assets/img/background_dark.png',
                                width: 1148.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppScaffold.toolbarHeight + TSpacingScale.v40,
                        ),
                        child: SelectionArea(
                          child: widget.child,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
