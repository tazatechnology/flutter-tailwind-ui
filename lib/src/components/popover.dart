import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TPopoverController
// =============================================================================

/// A controller for the [TPopover] widget.
class TPopoverController {
  Future<void> Function()? _showCallback;
  Future<void> Function()? _hideCallback;
  Future<void> Function()? _toggleCallback;

  /// Called by the widget to register callbacks.
  void _registerCallbacks({
    required Future<void> Function() show,
    required Future<void> Function() hide,
    required Future<void> Function() toggle,
  }) {
    _showCallback = show;
    _hideCallback = hide;
    _toggleCallback = toggle;
  }

  /// Shows the popover overlay.
  Future<void> show() async {
    await _showCallback?.call();
  }

  /// Hides the popover overlay.
  Future<void> hide() async {
    await _hideCallback?.call();
  }

  /// Toggles the popover overlay.
  Future<void> toggle() async {
    await _toggleCallback?.call();
  }

  /// Disposes the popover controller.
  void dispose() {
    _showCallback = null;
    _hideCallback = null;
    _toggleCallback = null;
  }
}
// =============================================================================
// CLASS: TPopover
// =============================================================================

/// A widget that triggers a popover overlay when pressed.
class TPopover extends StatefulWidget {
  /// Creates a [TPopover] widget.
  const TPopover({
    required this.controller,
    required this.content,
    required this.anchor,
    this.width,
    this.height,
    this.borderRadius = TBorderRadius.rounded_md,
    this.borderColor,
    this.fillColor,
    this.alignment = Alignment.bottomRight,
    this.separation = TSpace.v4,
    this.matchAnchorWidth = false,
    this.animationOptions,
    this.closeOnTapOutside = true,
    super.key,
  });

  /// The content of the popover overlay.
  final TPopoverController controller;

  /// Whether the popover overlay should close when tapped outside.
  final bool closeOnTapOutside;

  /// The content of the popover overlay.
  final Widget content;

  /// The anchor widget that triggers the popover overlay when pressed.
  final Widget anchor;

  /// The width of the popover content.
  final double? width;

  /// The height of the popover content.
  final double? height;

  /// The background color of the popover content.
  final Color? fillColor;

  /// The border color of the popover content.
  final Color? borderColor;

  /// The border radius of the popover content.
  final BorderRadius borderRadius;

  /// The alignment of the popover overlay.
  ///
  /// Overlay will be positioned in this location relative to the anchor widget.
  final Alignment alignment;

  /// The separation between the anchor and the popover overlay.
  final double separation;

  /// Whether the popover overlay should match the width of the anchor.
  final bool matchAnchorWidth;

  /// The animation options to apply to the popover overlay.
  ///
  /// If not provided, [TAnimatedOptions.popover] will be used.
  final TAnimatedOptions? animationOptions;

  @override
  State<TPopover> createState() => _TPopoverState();
}

class _TPopoverState extends State<TPopover> {
  final animationController = TAnimatedController();
  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();
  StreamController<bool> contentNotifier = StreamController<bool>();

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    // If a controller was provided, register our callbacks.
    widget.controller._registerCallbacks(
      show: showOverlay,
      hide: removeOverlay,
      toggle: toggleOverlay,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    removeOverlay();
    overlayEntry?.remove();
    overlayEntry?.dispose();
    contentNotifier.close();
    animationController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: didUpdateWidget
  // ---------------------------------------------------------------------------

  @override
  void didUpdateWidget(covariant TPopover oldWidget) {
    contentNotifier.add(true);
    super.didUpdateWidget(oldWidget);
  }

  // ---------------------------------------------------------------------------
  // METHOD: toggleOverlay
  // ---------------------------------------------------------------------------

  Future<void> toggleOverlay() async {
    if (overlayEntry == null) {
      await showOverlay();
    } else {
      await removeOverlay();
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: showOverlay
  // ---------------------------------------------------------------------------

  Future<void> showOverlay() async {
    if (overlayEntry != null) {
      return;
    }
    contentNotifier = StreamController<bool>();
    overlayEntry = createOverlayEntry();
    final overlay = Overlay.of(context, rootOverlay: true);
    overlay.insert(overlayEntry!);
    await animationController.forward();
  }

  // ---------------------------------------------------------------------------
  // METHOD: removeOverlay
  // ---------------------------------------------------------------------------

  Future<void> removeOverlay() async {
    if (overlayEntry == null) {
      return;
    }
    await animationController.reverse()?.whenComplete(() {
      overlayEntry?.remove();
      overlayEntry = null;
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: createOverlayEntry
  // ---------------------------------------------------------------------------

  OverlayEntry createOverlayEntry() {
    final tw = context.tw;
    final renderBox = context.findRenderObject() as RenderBox?;
    final Size size = renderBox?.size ?? Size.zero;

    Alignment targetAnchor = Alignment.center;
    Alignment followerAnchor = Alignment.center;
    Offset offset = Offset.zero;
    final sep = widget.separation;

    if (widget.alignment == Alignment.topLeft) {
      targetAnchor = Alignment.bottomLeft;
      followerAnchor = Alignment.bottomLeft;
      offset = Offset(0, -size.height - sep);
    } else if (widget.alignment == Alignment.topCenter) {
      targetAnchor = Alignment.bottomCenter;
      followerAnchor = Alignment.bottomCenter;
      offset = Offset(0, -size.height - sep);
    } else if (widget.alignment == Alignment.topRight) {
      targetAnchor = Alignment.bottomRight;
      followerAnchor = Alignment.bottomRight;
      offset = Offset(0, -size.height - sep);
    } else if (widget.alignment == Alignment.centerLeft) {
      targetAnchor = Alignment.centerRight;
      followerAnchor = Alignment.centerRight;
      offset = Offset(-size.width - sep, 0);
    } else if (widget.alignment == Alignment.center) {
      targetAnchor = Alignment.center;
      followerAnchor = Alignment.center;
      offset = Offset.zero;
    } else if (widget.alignment == Alignment.centerRight) {
      targetAnchor = Alignment.centerLeft;
      followerAnchor = Alignment.centerLeft;
      offset = Offset(size.width + sep, 0);
    } else if (widget.alignment == Alignment.bottomLeft) {
      targetAnchor = Alignment.topLeft;
      followerAnchor = Alignment.topLeft;
      offset = Offset(0, size.height + sep);
    } else if (widget.alignment == Alignment.bottomCenter) {
      targetAnchor = Alignment.topCenter;
      followerAnchor = Alignment.topCenter;
      offset = Offset(0, size.height + sep);
    } else if (widget.alignment == Alignment.bottomRight) {
      targetAnchor = Alignment.topRight;
      followerAnchor = Alignment.topRight;
      offset = Offset(0, size.height + sep);
    }
    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: widget.closeOnTapOutside ? removeOverlay : null,
          behavior: HitTestBehavior.translucent,
          child: Stack(
            children: [
              Positioned(
                height: widget.height,
                width: widget.width ??
                    (widget.matchAnchorWidth ? size.width : null),
                child: CompositedTransformFollower(
                  link: layerLink,
                  targetAnchor: targetAnchor,
                  followerAnchor: followerAnchor,
                  offset: offset,
                  showWhenUnlinked: false,
                  child: StreamBuilder(
                    stream: contentNotifier.stream,
                    builder: (context, snapshot) {
                      final content = Material(
                        elevation: TElevation.shadow_lg,
                        borderRadius: widget.borderRadius,
                        shadowColor: tw.color.shadow,
                        child: Container(
                          decoration: BoxDecoration(
                            color: widget.fillColor ?? tw.color.background,
                            border: Border.all(
                              color: widget.borderColor ?? tw.color.divider,
                            ),
                            borderRadius: widget.borderRadius,
                          ),
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ClipRRect(
                              borderRadius: widget.borderRadius,
                              child: widget.content,
                            ),
                          ),
                        ),
                      );

                      return TAnimated(
                        options: widget.animationOptions ??
                            TAnimatedOptions.popover(),
                        controller: animationController,
                        child: content,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: TGestureDetector(
        onKeyEvent: (node, event) {
          if (event.isEnterKeyDown ||
              event.isSpaceKeyDown ||
              event.isArrowUpKeyDown ||
              event.isArrowDownKeyDown) {
            widget.controller.toggle();
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        builder: (context, states) => widget.anchor,
      ),
    );
  }
}
