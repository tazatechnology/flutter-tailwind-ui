import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/header.dart';
import 'package:flutter_tailwind_ui_app/layout/scaffold.dart';

/// Allows nested children to enable/disable outer scroll physics
final outerScrollPhysicsProvider = StateProvider<ScrollPhysics>((ref) {
  return const BouncingScrollPhysics();
});

// =================================================
// CLASS: AppScrollView
// =================================================

class AppScrollView extends ConsumerStatefulWidget {
  /// Factory constructor for non-sliver content
  factory AppScrollView.children({
    required AppRouteHeader? header,
    required List<Widget> children,
  }) {
    return AppScrollView._(
      header: header,
      slivers: children.map((child) {
        return SliverToBoxAdapter(
          child: Align(
            alignment: Alignment.centerLeft,
            child: child,
          ),
        );
      }).toList(),
    );
  }

  /// Factory constructor for sliver content
  factory AppScrollView.slivers({
    required AppRouteHeader? header,
    required List<Widget> slivers,
  }) {
    return AppScrollView._(
      header: header,
      slivers: slivers,
    );
  }

  /// Default constructor
  const AppScrollView._({
    required this.slivers,
    required this.header,
  });
  final List<Widget> slivers;
  final AppRouteHeader? header;

  @override
  ConsumerState<AppScrollView> createState() => _AppScrollViewState();
}

class _AppScrollViewState extends ConsumerState<AppScrollView> {
  final scrollController = ScrollController();

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    double toolbarHeight = AppScaffold.toolbarHeight;
    if (tw.screen.width < AppScaffold.sidebarBreakpoint) {
      toolbarHeight = AppScaffold.toolbarHeight * 2;
    }
    final physics = ref.watch(outerScrollPhysicsProvider);
    const yPad = TOffset.y16;
    final xPad = tw.screen.is_sm ? TOffset.x32 : TOffset.x16;
    return Stack(
      children: [
        _AppBackground(controller: scrollController),
        SelectionArea(
          child: CustomScrollView(
            physics: physics,
            controller: scrollController,
            slivers: [
              // Top padding for the toolbar and additional padding
              SliverPadding(
                padding: EdgeInsets.only(top: toolbarHeight) + yPad,
              ),
              if (widget.header != null) ...[
                SliverPadding(
                  padding: xPad,
                  sliver: SliverToBoxAdapter(child: widget.header),
                ),
              ],
              ...widget.slivers.map((sliver) {
                // Common horizontal padding for the content
                return SliverPadding(padding: xPad, sliver: sliver);
              }),
              // Extra bottom padding for last content in scroll view
              const SliverPadding(
                padding: EdgeInsets.only(top: TSpace.v64),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// =================================================
// CLASS: _AppBackground
// =================================================

class _AppBackground extends StatefulWidget {
  const _AppBackground({
    required this.controller,
  });
  final ScrollController controller;
  static const double height = 500;
  @override
  State<_AppBackground> createState() => _AppBackgroundState();
}

class _AppBackgroundState extends State<_AppBackground> {
  bool attached = false;

  // -------------------------------------------------
  // METHOD: initState
  // -------------------------------------------------

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        attached = true;
      });
    });
    widget.controller.addListener(offsetListener);
    super.initState();
  }

  // -------------------------------------------------
  // METHOD: offsetListener
  // -------------------------------------------------

  void offsetListener() {
    // Only conditionally update widget
    // Once background is scrolled away, no need to rebuild
    if (attached &&
        widget.controller.offset < _AppBackground.height &&
        widget.controller.offset > 0) {
      setState(() {});
    }
  }

  // -------------------------------------------------
  // METHOD: dispose
  // -------------------------------------------------

  @override
  void dispose() {
    widget.controller.removeListener(offsetListener);
    super.dispose();
  }

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    double offset = 0;
    if (attached) {
      offset = widget.controller.offset;
    }

    return Positioned(
      top: offset == 0 ? 0 : -offset,
      left: AppScaffold.navigationWidth,
      right: 0,
      child: SizedBox(
        height: _AppBackground.height,
        child: Center(
          child: OverflowBox(
            maxWidth: TScreen.max_w_6xl,
            alignment: Alignment.topCenter,
            child: Image.asset(
              tw.light
                  ? 'assets/img/background.png'
                  : 'assets/img/background_dark.png',
              width: TScreen.max_w_6xl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
