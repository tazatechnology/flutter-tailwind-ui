import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =================================================
// CLASS: TCodeBlock
// =================================================

/// A code block widget with copy to clipboard functionality.
class TCodeBlock extends StatefulWidget {
  /// Creates a code block widget.
  const TCodeBlock({
    required this.code,
    this.language = 'dart',
    this.backgroundColor,
    this.brightness,
    this.padding = TOffset.a20,
    this.margin = TOffset.y20,
    this.constraints = const BoxConstraints(minWidth: double.infinity),
    this.scrollDirection = Axis.vertical,
    this.fontSize,
    super.key,
  });

  /// The code to display.
  final String code;

  /// The language of the code.
  ///
  /// This widget supports syntax highlighting for various languages out of the box.
  /// For a complete list see the [THighlighter.languages] documentation.
  ///
  /// Language grammar data is lazily loaded and cached for performance.
  final String language;

  /// The theme brightness of the code block.
  ///
  /// If null, it will use the default brightness of the current theme.
  final Brightness? brightness;

  /// The background color of the code block.
  ///
  /// If null, a pre-defined background color will be used for the given brightness.
  final Color? backgroundColor;

  /// The padding of the code inside block.
  final EdgeInsets padding;

  /// The margin around the outside of the code block.
  final EdgeInsets margin;

  /// The constraints of the code block.
  final BoxConstraints constraints;

  /// The font size of the code block.
  final double? fontSize;

  /// The scroll direction of the code block.
  final Axis scrollDirection;

  @override
  State<TCodeBlock> createState() => _TCodeBlockState();
}

class _TCodeBlockState extends State<TCodeBlock> {
  final copyStreamController = StreamController<bool>();
  final highlighterService = THighlighter();
  final scrollController = ScrollController();

  // -------------------------------------------------
  // METHOD: initState
  // -------------------------------------------------

  @override
  void initState() {
    super.initState();
    copyStreamController.add(false);
  }

  // -------------------------------------------------
  // METHOD: dispose
  // -------------------------------------------------

  @override
  void dispose() {
    copyStreamController.close();
    scrollController.dispose();
    super.dispose();
  }

  // -------------------------------------------------
  // METHOD: copy
  // -------------------------------------------------

  /// Copy the code to the clipboard and show a temporary visual feedback.
  Future<void> copy(String code) async {
    copyStreamController.add(true);
    await Clipboard.setData(ClipboardData(text: code));
    await Future.delayed(const Duration(milliseconds: 1000), () {
      copyStreamController.add(false);
    });
  }

  // -------------------------------------------------
  // METHOD: build
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;

    final light = widget.brightness == null
        ? Theme.of(context).brightness == Brightness.light
        : widget.brightness == Brightness.light;

    final effectiveBrightness = light ? Brightness.light : Brightness.dark;

    final effectiveBackgroundColor = widget.backgroundColor ??
        (light ? const Color(0xFFf6f8fa) : const Color(0xFF1e293b));

    final borderColor = light
        ? effectiveBackgroundColor.withOpacity(0.95)
        : effectiveBackgroundColor.withOpacity(0.85);

    final code = widget.code.trim();

    final effectivePadding = EdgeInsets.only(
      top: widget.padding.top / 2,
      bottom: widget.padding.bottom / 2,
      left: widget.padding.left / 2,
      right: widget.padding.right / 2,
    );

    return Padding(
      padding: widget.margin,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              textSelectionTheme: TextSelectionThemeData(
                selectionColor:
                    light ? const Color(0xFFb6d7ff) : const Color(0xFF385479),
              ),
            ),
            child: Container(
              padding: effectivePadding,
              constraints: widget.constraints,
              decoration: BoxDecoration(
                color: effectiveBackgroundColor,
                borderRadius: TBorderRadius.rounded_xl,
                border: Border.all(color: borderColor),
              ),
              child: FutureBuilder(
                future: THighlighter.load(
                  language: widget.language,
                  brightness: effectiveBrightness,
                ),
                builder: (context, snapshot) {
                  final spans = THighlighter.parse(
                    code: code,
                    language: widget.language,
                    brightness: effectiveBrightness,
                  );
                  return Scrollbar(
                    controller: scrollController,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      scrollDirection: widget.scrollDirection,
                      controller: scrollController,
                      padding: effectivePadding,
                      child: Text.rich(
                        spans,
                        style: tw.text.style_sm.mono.copyWith(
                          fontSize: widget.fontSize,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          StreamBuilder(
            stream: copyStreamController.stream,
            initialData: false,
            builder: (BuildContext context, snapshot) {
              final copied = snapshot.data ?? false;
              return Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  mouseCursor: copied
                      ? SystemMouseCursors.basic
                      : SystemMouseCursors.click,
                  onPressed: () => copy(code),
                  hoverColor: light
                      ? Colors.black.withOpacity(0.03)
                      : Colors.white.withOpacity(0.1),
                  iconSize: copied ? 16 : 14,
                  icon: Icon(
                    copied ? Icons.check : Icons.copy,
                    color: copied
                        ? Colors.green
                        : (light ? Colors.black54 : Colors.white60),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
