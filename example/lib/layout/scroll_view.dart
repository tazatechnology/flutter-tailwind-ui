import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/header.dart';
import 'package:flutter_tailwind_ui_app/layout/scaffold.dart';
import 'package:flutter_tailwind_ui_app/providers/section.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart' as html;

/// Allows nested children to enable/disable outer scroll physics
final outerScrollPhysicsProvider = StateProvider<ScrollPhysics>((ref) {
  return const ClampingScrollPhysics();
});

// =============================================================================
// CLASS: AppScrollView
// =============================================================================

class AppScrollView extends ConsumerStatefulWidget {
  /// Default constructor
  const AppScrollView._({
    required this.slivers,
    required this.header,
  });

  /// Factory constructor for non-sliver content
  factory AppScrollView.children({
    required AppRouteHeader? header,
    required List<Widget> children,
  }) {
    return AppScrollView._(
      header: header,
      slivers: children.map((child) {
        // The Align widget prevents the child from stretching to full width
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

  /// The header to place at the top of te scroll view
  final AppRouteHeader? header;

  /// The sliver children of the scroll view
  final List<Widget> slivers;

  // ---------------------------------------------------------------------------
  // METHOD: ensureVisible
  // ---------------------------------------------------------------------------

  /// Scroll an [AppSectionAnchor] element into view without a [ScrollController]
  static Future<void> ensureVisible({
    required AppSectionAnchor section,
    Duration duration = kThemeAnimationDuration,
    Curve curve = Curves.easeInOut,
  }) async {
    if (section.key is! GlobalKey) {
      return;
    }
    final context = (section.key! as GlobalKey).currentContext;
    if (context == null) {
      return;
    }

    final renderObject = context.findRenderObject();
    if (renderObject == null) {
      return;
    }

    final sectionPosition = renderObject.getTransformTo(null).getTranslation();

    // Extract the scroll state
    final scrollable = Scrollable.of(context);
    final position = scrollable.position;

    // Get the app bar height offset
    final tw = context.tw;
    final appBarHeight = AppScaffold.toolbarHeight * (tw.screen.is_lg ? 1 : 2);

    // Update the browser URL to add the section fragment
    AppScrollView.updateUrlFragment(context, section.fragment);

    await position.animateTo(
      position.pixels + sectionPosition.y - appBarHeight,
      duration: duration,
      curve: curve,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: updateUrlFragment
  // ---------------------------------------------------------------------------

  /// Updates the URL fragment
  static void updateUrlFragment(BuildContext context, String? fragment) {
    if (!kIsWeb) {
      return;
    }
    final uri = GoRouterState.of(context).uri;
    if (fragment == null) {
      html.window.history.pushState(null, '', uri.path);
    } else {
      html.window.history.pushState(null, '', '${uri.path}?loc=$fragment');
    }
  }

  @override
  ConsumerState<AppScrollView> createState() => _AppScrollViewState();
}

class _AppScrollViewState extends ConsumerState<AppScrollView> {
  final scrollController = ScrollController();
  final scrollThreshold = 200.0;
  bool showScrollButton = false;
  String? loc;

  List<AppSectionAnchor> sections = [];

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      discoverSections(context);
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: didChangeDependencies
  // ---------------------------------------------------------------------------

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uri = GoRouterState.of(context).uri;
    loc = uri.queryParameters['loc'];
  }

  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: didUpdateWidget
  // ---------------------------------------------------------------------------

  @override
  void didUpdateWidget(AppScrollView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        discoverSections(context);
      });
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: discoverSections
  // ---------------------------------------------------------------------------

  void discoverSections(BuildContext context) {
    // Clear the sections list on each rebuild
    sections.clear();

    // Recursive function to traverse the widget tree
    void traverse(Element element) {
      final widget = element.widget;
      // Look for SectionWidgets with GlobalKeys
      if (widget is AppSectionAnchor && widget.key is GlobalKey) {
        sections.add(widget);
      }
      // Recursively visit child elements
      element.visitChildElements(traverse);
    }

    // Start traversal from the root context
    context.visitChildElements(traverse);

    AppSectionAnchor? locSection;

    if (sections.isNotEmpty) {
      // Scroll to the section if the URL fragment is set
      // This would happen on page load when the URL contains a fragment
      if (loc != null && loc!.isNotEmpty) {
        locSection = sections.firstWhereOrNull(
          (s) => s.fragment == loc,
        );
      }

      if (locSection != null) {
        unawaited(
          Future.microtask(() async {
            await AppScrollView.ensureVisible(section: locSection!);
          }),
        );
      }
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: scrollListener
  // ---------------------------------------------------------------------------

  void scrollListener() {
    // Determine the toolbar height trigger
    double toolbarHeight = AppScaffold.toolbarHeight;
    if (!context.tw.screen.is_lg) {
      toolbarHeight = toolbarHeight * 2;
    }

    // Check with section is currently in view
    AppSectionAnchor? newCurrentSection;
    final Map<AppSectionAnchor, double> sectionOffsets = {};
    for (final section in sections) {
      final context = (section.key! as GlobalKey).currentContext;
      if (context == null) {
        continue;
      }
      final renderObject = context.findRenderObject();
      if (renderObject == null) {
        continue;
      }
      final sectionPosition = renderObject
          .getTransformTo(null)
          .getTranslation();

      sectionOffsets[section] = sectionPosition.y;
    }

    // Compare all the section y-offset locations
    // When the section is within the toolbar height, update the current section
    for (final k in sectionOffsets.keys.toList().reversed) {
      final offset = sectionOffsets[k]!;
      if (offset < toolbarHeight * 2) {
        newCurrentSection = k;
        break;
      }
    }

    // Always reset the current section when at the top of the page
    final currentSectionNotifier = ref.read(sectionProvider.notifier);
    if (scrollController.offset == 0) {
      currentSectionNotifier.state = null;
    } else {
      // Update the current section
      if (ref.read(sectionProvider) != newCurrentSection &&
          newCurrentSection != null) {
        currentSectionNotifier.state = newCurrentSection;
      }
    }

    // Check if the scroll position is beyond the threshold
    if (scrollController.offset >= scrollThreshold) {
      if (!showScrollButton) {
        setState(() {
          showScrollButton = true;
        });
      }
    } else {
      if (showScrollButton) {
        setState(() {
          showScrollButton = false;
        });
      }
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: scrollToTop
  // ---------------------------------------------------------------------------

  Future<void> scrollToTop() async {
    if (kIsWeb) {
      AppScrollView.updateUrlFragment(context, null);
    }
    await scrollController.animateTo(
      0,
      duration: kTabScrollDuration,
      curve: Curves.easeInOut,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: scrollToSection
  // ---------------------------------------------------------------------------

  Future<void> scrollToSection(AppSectionAnchor section) async {
    loc = null;
    await Future.microtask(() {
      if (mounted) {
        unawaited(AppScrollView.ensureVisible(section: section));
      }
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    double toolbarHeight = AppScaffold.toolbarHeight;
    if (tw.screen.width < AppScaffold.sidebarBreakpoint) {
      toolbarHeight = AppScaffold.toolbarHeight * 2;
    }
    final physics = ref.watch(outerScrollPhysicsProvider);
    const yPad = TOffset.y16;
    EdgeInsets xPad = tw.screen.is_lg ? TOffset.x40 + TOffset.x24 : TOffset.x24;

    // Add artificial padding to limit the width of the content
    final effectiveContentWidth = tw.screen.width - AppScaffold.navigationWidth;
    if (effectiveContentWidth > AppScaffold.sidebarBreakpoint) {
      final right = effectiveContentWidth - AppScaffold.sidebarBreakpoint;
      xPad += EdgeInsets.only(right: right);
    }

    final lineColor = tw.light
        ? TColors.gray.shade100
        : const Color(0xff202630);
    final diagonalPattern = CustomPaint(
      painter: DiagonalStripesPainter(lineColor: lineColor),
      child: Container(
        width: TSpace.v40,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: lineColor),
            left: BorderSide(color: lineColor),
          ),
        ),
      ),
    );

    return PrimaryScrollController(
      controller: scrollController,
      child: Stack(
        children: [
          if (tw.screen.is_lg)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                diagonalPattern,
                diagonalPattern,
              ],
            ),
          SelectionArea(
            child: CustomScrollView(
              physics: physics,
              primary: true,
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
                // Also offers padding for the keyboard when displayed
                const SliverPadding(
                  padding: EdgeInsets.only(top: TSpace.v288),
                ),
              ],
            ),
          ),
          ExcludeFocus(
            child: Positioned(
              bottom: 20,
              right: 20,
              child: AnimatedOpacity(
                duration: kThemeAnimationDuration,
                curve: Curves.easeInOut,
                opacity: showScrollButton ? 1 : 0,
                child: showScrollButton
                    ? FloatingActionButton.small(
                        key: const Key('scroll-to-top'),
                        elevation: 0,
                        hoverElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        disabledElevation: 0,
                        backgroundColor: TColors.indigo.withValues(alpha: 0.85),
                        onPressed: scrollToTop,
                        child: const Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// CLASS: DiagonalStripesPainter
// =============================================================================

class DiagonalStripesPainter extends CustomPainter {
  DiagonalStripesPainter({
    required this.lineColor,
  });

  final Color lineColor;
  static const lineWidth = 1.0;
  static const gap = 10;
  static const double totalWidth = lineWidth + gap;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth;

    final double diagonalLength = (size.width + size.height) * 1.414; // sqrt(2)
    final count = (diagonalLength / totalWidth).ceil();

    // The painter should be a fixed width
    canvas.clipRect(Rect.fromLTWH(0, 0, TSpace.v40, size.height));

    for (int i = -count; i < count; i++) {
      final double offset = i * totalWidth;
      canvas.drawLine(
        Offset(offset, 0),
        Offset(offset + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
