import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_example/layout/scroll_view.dart';

// =================================================
// CLASS: AppValueTable
// =================================================

class AppValueTable extends ConsumerStatefulWidget {
  const AppValueTable({
    required this.data,
    this.height = TSpacingScale.v320,
    this.itemHeight = TSpacingScale.v40,
    super.key,
  });
  final Map<String, String> data;
  final double? height;
  final double itemHeight;
  @override
  ConsumerState<AppValueTable> createState() => _AppValueTableState();
}

class _AppValueTableState extends ConsumerState<AppValueTable> {
  final scrollController = ScrollController();

  // -------------------------------------------------
  // METHOD: dispose
  // -------------------------------------------------

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final headerStyle = tw.text_sm.semibold.copyWith(
      color: tw.light ? TColors.slate.shade700 : TColors.slate.shade200,
    );

    return Container(
      margin: TOffset.y24,
      height: widget.height,
      child: Column(
        children: [
          Container(
            padding: TOffset.y4,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color:
                      tw.light ? TColors.gray.shade200 : TColors.gray.shade700,
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: TSpacingScale.v240,
                  child: Text(
                    widget.data.keys.first,
                    style: headerStyle,
                  ),
                ),
                Text(
                  widget.data.values.first,
                  style: headerStyle,
                ),
              ],
            ),
          ),
          Expanded(
            child: MouseRegion(
              onEnter: (event) {
                // Prevent outer scroll view from scrolling
                ref.read(outerScrollPhysicsProvider.notifier).state =
                    const NeverScrollableScrollPhysics();
              },
              onExit: (event) {
                // Allow outer scroll view to scroll
                ref.read(outerScrollPhysicsProvider.notifier).state =
                    const ClampingScrollPhysics();
              },
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: TScrollbar(
                  visible: true,
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    controller: scrollController,
                    itemCount: widget.data.length - 1,
                    cacheExtent: (widget.height ??
                            (widget.itemHeight * widget.data.length)) /
                        2,
                    itemBuilder: (context, index) {
                      final name = widget.data.keys.elementAt(index + 1);
                      final value = widget.data.values.elementAt(index + 1);
                      return SizedBox(
                        height: widget.itemHeight,
                        child: Row(
                          children: [
                            SizedBox(
                              width: TSpacingScale.v240,
                              child: Text(
                                name,
                                style: tw.text_xs.mono.copyWith(
                                  color: TColors.sky[tw.light ? 500 : 300],
                                ),
                              ),
                            ),
                            Text(
                              value,
                              style: tw.text_xs.mono,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0,
                        color: tw.light
                            ? TColors.gray.shade100
                            : TColors.gray.shade800,
                      );
                    },
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
