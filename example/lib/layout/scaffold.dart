import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/navigation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final scrollController = ScrollController();

// =================================================
// CLASS: AppScaffold
// =================================================

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();

  /// The height of the toolbar
  static const toolbarHeight = TSpacingScale.v60;

  /// The width of the navigation drawer + scroll x-padding
  static const navigationWidth = TSpacingScale.v256 + TSpacingScale.v48;
}

class _AppScaffoldState extends State<AppScaffold> {
  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppScaffold.toolbarHeight),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: AppScaffold.toolbarHeight,
                padding: TOffset.y16 + TOffset.x32,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
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
                        SvgPicture.asset(
                          'assets/brand/tailwindcss_wordmark.svg',
                          semanticsLabel: 'Tailwind CSS',
                          height: 20,
                        ),
                        Container(
                          height: double.infinity,
                          margin: TOffset.x12,
                          padding: TOffset.x20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: TColors.slate.shade400.withOpacity(0.1),
                            borderRadius: TBorderRadius.rounded_full,
                          ),
                          child: Text(
                            'Flutter',
                            style: TextStyle(
                              height: 0,
                              color: TColors.slate,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Icon(FontAwesomeIcons.github),
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Row(
          children: [
            SizedBox(
              width: AppScaffold.navigationWidth,
              child: AppNavigation(),
            ),
            Expanded(
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                trackVisibility: true,
                interactive: false,
                child: SingleChildScrollView(
                  controller: scrollController,
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
                                'assets/img/background.png',
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
                        child: widget.child,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

        //  Positioned(
        //     top: 0,
        //     left: 527,
        //     right: 0,
        //     child: Image.asset(
        //       'assets/img/background.png',
        //       fit: BoxFit.fitWidth,
        //     ),
        //   ),