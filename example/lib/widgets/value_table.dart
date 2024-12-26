import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui_app/layout/scroll_view.dart';

// =============================================================================
// CLASS: AppValueTable
// =============================================================================

class AppValueTable extends ConsumerStatefulWidget {
  const AppValueTable({
    required this.header,
    required this.items,
    this.height = TSpace.v320,
    this.itemHeight = TSpace.v40,
    this.nameWidth = TSpace.v208,
    this.valueWidth = TSpace.v112,
    this.nameAlignment = Alignment.centerLeft,
    this.valueAlignment = Alignment.centerLeft,
    super.key,
  });

  /// The header of the table.
  final List<Widget> header;

  /// The items of the table.
  final List<AppValueTableItem> items;

  /// The height of the table, set to null to fix the height to the content.
  final double? height;

  /// The height of each item in the table.
  final double itemHeight;

  /// The width of the name column.
  final double? nameWidth;

  /// The width of the value column.
  final double? valueWidth;

  /// The alignment of the name column.
  final Alignment nameAlignment;

  /// The alignment of the value column.
  final Alignment valueAlignment;

  @override
  ConsumerState<AppValueTable> createState() => _AppValueTableState();
}

class _AppValueTableState extends ConsumerState<AppValueTable> {
  final scrollController = ScrollController();

  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    double effectiveHeight =
        widget.height ?? (widget.itemHeight * widget.items.length);
    if (widget.header.isNotEmpty) {
      effectiveHeight += widget.itemHeight;
    }

    return SizedBox(
      height: effectiveHeight,
      child: Column(
        children: [
          Container(
            padding: TOffset.y4,
            height: widget.header.isNotEmpty ? widget.itemHeight : 0,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color:
                      tw.light ? TColors.gray.shade200 : TColors.gray.shade700,
                ),
              ),
            ),
            child: DefaultTextStyle(
              style: tw.text.style_sm.semibold.copyWith(
                color:
                    tw.light ? TColors.slate.shade700 : TColors.slate.shade200,
              ),
              child: Row(
                children: [
                  if (widget.header.elementAtOrNull(0) != null)
                    Container(
                      alignment: widget.nameAlignment,
                      width: widget.nameWidth,
                      child: widget.header.elementAt(0),
                    ),
                  if (widget.header.elementAtOrNull(1) != null)
                    Container(
                      alignment: widget.valueAlignment,
                      width: widget.valueWidth,
                      child: widget.header.elementAt(1),
                    ),
                  if (widget.header.elementAtOrNull(2) != null)
                    Expanded(
                      child: widget.header.elementAt(2),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MouseRegion(
              onEnter: (event) {
                if (widget.height == null) {
                  return;
                }
                // Prevent outer scroll view from scrolling
                ref.read(outerScrollPhysicsProvider.notifier).state =
                    const NeverScrollableScrollPhysics();
              },
              onExit: (event) {
                if (widget.height == null) {
                  return;
                }
                // Allow outer scroll view to scroll
                ref.read(outerScrollPhysicsProvider.notifier).state =
                    const ClampingScrollPhysics();
              },
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Scrollbar(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    itemCount: widget.items.length,
                    cacheExtent: (widget.height ??
                            (widget.itemHeight * widget.items.length)) /
                        2,
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      return SizedBox(
                        height: widget.itemHeight,
                        child: Row(
                          children: [
                            Container(
                              width: widget.nameWidth,
                              alignment: widget.nameAlignment,
                              child: Text(
                                item.name,
                                style: tw.text.style_xs.copyWith(
                                  fontFamily: tw.text.fontFamilyMono,
                                  color: TColors.sky[tw.light ? 500 : 300],
                                ),
                              ),
                            ),
                            if (item.value != null)
                              Container(
                                alignment: widget.valueAlignment,
                                width: widget.valueWidth,
                                child: Text(
                                  item.value!,
                                  style: tw.text.style_xs.mono(context),
                                ),
                              ),
                            if (item.widget != null) item.widget!,
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

// =============================================================================
// CLASS: AppValueTableItem
// =============================================================================

class AppValueTableItem {
  AppValueTableItem({
    required this.name,
    this.value,
    this.widget,
  });
  final String name;
  final String? value;
  final Widget? widget;
}
