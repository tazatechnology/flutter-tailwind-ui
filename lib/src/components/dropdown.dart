import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TDropdownController
// =============================================================================

/// A controller for the [TDropdown] widget.
class TDropdownController {
  VoidCallback? _showCallback;
  VoidCallback? _hideCallback;
  VoidCallback? _toggleCallback;

  /// Called by the widget to register callbacks.
  void _registerCallbacks({
    required VoidCallback show,
    required VoidCallback hide,
    required VoidCallback toggle,
  }) {
    _showCallback = show;
    _hideCallback = hide;
    _toggleCallback = toggle;
  }

  /// Shows the dropdown menu.
  void show() {
    _showCallback?.call();
  }

  /// Hides the dropdown menu.
  void hide() {
    _hideCallback?.call();
  }

  /// Toggles the dropdown menu.
  void toggle() {
    _toggleCallback?.call();
  }
}
// =============================================================================
// CLASS: TDropdown
// =============================================================================

/// A widget that triggers a dropdown overlay when pressed.
class TDropdown extends StatefulWidget {
  /// Creates a [TDropdown] widget.
  const TDropdown({
    required this.controller,
    required this.content,
    required this.anchor,
    this.width,
    this.height,
    this.borderRadius = TBorderRadius.rounded_md,
    this.alignment = Alignment.bottomRight,
    this.separation = TSpace.v4,
    this.matchAnchorWidth = false,
    super.key,
  });

  /// The content of the dropdown menu.
  final TDropdownController controller;

  /// The content of the dropdown overlay.
  final Widget content;

  /// The anchor widget that triggers the dropdown overlay when pressed.
  final Widget anchor;

  /// The width of the dropdown content.
  final double? width;

  /// The height of the dropdown content.
  final double? height;

  /// The border radius of the dropdown content.
  final BorderRadius borderRadius;

  /// The alignment of the dropdown overlay.
  ///
  /// The overlay will be positioned in this location relative to the anchor widget.
  final Alignment alignment;

  /// The separation between the anchor and the dropdown menu.
  final double separation;

  /// Whether the dropdown overlay should match the width of the anchor.
  final bool matchAnchorWidth;

  @override
  State<TDropdown> createState() => _TDropdownState();
}

class _TDropdownState extends State<TDropdown> {
  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();

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
    overlayEntry?.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: toggleOverlay
  // ---------------------------------------------------------------------------

  void toggleOverlay() {
    if (overlayEntry == null) {
      showOverlay();
    } else {
      removeOverlay();
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: showOverlay
  // ---------------------------------------------------------------------------

  void showOverlay() {
    overlayEntry = createOverlayEntry();
    Overlay.of(context).insert(overlayEntry!);
  }

  // ---------------------------------------------------------------------------
  // METHOD: removeOverlay
  // ---------------------------------------------------------------------------

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
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
          onTap: removeOverlay,
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
                  child: Material(
                    elevation: TElevation.elevation_lg,
                    borderRadius: widget.borderRadius,
                    shadowColor: tw.colors.shadow,
                    child: Container(
                      decoration: BoxDecoration(
                        color: tw.colors.background,
                        border: Border.all(color: tw.colors.divider),
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
