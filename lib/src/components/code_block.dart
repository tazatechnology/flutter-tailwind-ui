import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';

// =============================================================================
// CLASS: TCodeBlock
// =============================================================================

/// A code block widget with copy to clipboard functionality.
class TCodeBlock extends StatefulWidget {
  /// Creates a code block widget.
  const TCodeBlock({
    required this.code,
    this.language = 'dart',
    this.scrollDirection = Axis.vertical,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.theme,
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

  /// The scroll direction of the code block.
  final Axis scrollDirection;

  /// The main axis alignment of the code block.
  final MainAxisAlignment mainAxisAlignment;

  /// The cross axis alignment of the code block.
  final CrossAxisAlignment crossAxisAlignment;

  /// The theme of the code block.
  final TCodeBlockTheme? theme;

  @override
  State<TCodeBlock> createState() => _TCodeBlockState();
}

class _TCodeBlockState extends State<TCodeBlock> {
  final copyStreamController = StreamController<bool>();
  final highlighterService = THighlighter();
  final scrollController = ScrollController();

  // ---------------------------------------------------------------------------
  // METHOD: initState
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    copyStreamController.add(false);
  }

  // ---------------------------------------------------------------------------
  // METHOD: dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    copyStreamController.close();
    scrollController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // METHOD: copy
  // ---------------------------------------------------------------------------

  /// Copy the code to the clipboard and show a temporary visual feedback.
  Future<void> copy(String code) async {
    copyStreamController.add(true);
    await Clipboard.setData(ClipboardData(text: code));
    await Future.delayed(const Duration(milliseconds: 1000), () {
      if (!mounted) {
        return;
      }
      copyStreamController.add(false);
    });
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final tw = context.tw;
    final theme = widget.theme ?? const TCodeBlockTheme();

    final light = theme.brightness == Brightness.light;

    final effectiveBackgroundColor =
        theme.backgroundColor ?? TColors.neutral.shade800;

    final effectiveBorder = theme.border ??
        Border.all(
          width: 0.5,
          color: light
              ? Colors.black.withValues(alpha: 0.1)
              : Colors.white.withValues(alpha: 0.1),
        );

    final effectiveBorderRadius =
        theme.borderRadius ?? TBorderRadius.rounded_lg;

    final effectivePadding = theme.padding ?? TOffset.a20;

    BoxConstraints effectiveConstraints =
        theme.constraints ?? const BoxConstraints();
    if (effectiveConstraints.minWidth == 0) {
      effectiveConstraints =
          effectiveConstraints.copyWith(minWidth: double.infinity);
    }

    final code = widget.code.trim();

    return Padding(
      padding: theme.margin ?? TOffset.zero,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              brightness: theme.brightness,
              textSelectionTheme: TextSelectionThemeData(
                selectionColor:
                    light ? const Color(0xffb6d7ff) : const Color(0xff385479),
              ),
            ),
            child: Container(
              width: effectiveConstraints.minWidth,
              constraints: effectiveConstraints,
              decoration: BoxDecoration(
                color: effectiveBackgroundColor,
                borderRadius: effectiveBorderRadius,
                border: effectiveBorder,
              ),
              child: FutureBuilder(
                future: THighlighter.load(
                  language: widget.language,
                  brightness: theme.brightness,
                ),
                builder: (context, snapshot) {
                  final spans = THighlighter.parse(
                    code: code,
                    language: widget.language,
                    brightness: theme.brightness,
                  );
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: TScrollbar(
                      controller: scrollController,
                      thumbVisibility: WidgetStateProperty.all(true),
                      thickness: WidgetStateProperty.all(TSpace.v6),
                      child: SingleChildScrollView(
                        scrollDirection: widget.scrollDirection,
                        controller: scrollController,
                        padding: effectivePadding,
                        child: Column(
                          mainAxisAlignment: widget.mainAxisAlignment,
                          crossAxisAlignment: widget.crossAxisAlignment,
                          children: [
                            Text.rich(
                              spans,
                              style: context.tw.text.style_sm.copyWith(
                                fontFamily: tw.text.fontFamilyMono,
                                fontSize: theme.fontSize,
                              ),
                            ),
                          ],
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
                      ? Colors.black.withValues(alpha: 0.03)
                      : Colors.white.withValues(alpha: 0.1),
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

// =============================================================================
// CLASS: TCodeBlockTheme
// =============================================================================

/// Theme data for [TCodeBlock] widgets.
class TCodeBlockTheme extends ThemeExtension<TCodeBlockTheme> {
  /// Creates a [TCodeBlockTheme] object.
  const TCodeBlockTheme({
    this.brightness = Brightness.dark,
    this.fontSize,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.constraints,
    this.border,
    this.borderRadius,
  });

  /// The theme brightness of the code block.
  ///
  /// If null, it will use the default brightness of the current theme.
  final Brightness brightness;

  /// The font size of the code block.
  final double? fontSize;

  /// The background color of the code block.
  ///
  /// If null, a pre-defined background color will be used for the given brightness.
  final Color? backgroundColor;

  /// The padding of the code inside block.
  final EdgeInsets? padding;

  /// The margin around the outside of the code block.
  final EdgeInsets? margin;

  /// The constraints of the code block.
  final BoxConstraints? constraints;

  /// The border of the code block.
  final BoxBorder? border;

  /// The border radius of the code block.
  final BorderRadius? borderRadius;

  // ---------------------------------------------------------------------------
  // METHOD: copyWith
  // ---------------------------------------------------------------------------

  @override
  TCodeBlockTheme copyWith({
    Brightness? brightness,
    double? fontSize,
    Color? backgroundColor,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BoxConstraints? constraints,
    BoxBorder? border,
    BorderRadius? borderRadius,
  }) {
    return TCodeBlockTheme(
      brightness: brightness ?? this.brightness,
      fontSize: fontSize ?? this.fontSize,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      constraints: constraints ?? this.constraints,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: merge
  // ---------------------------------------------------------------------------

  /// Merges this [TCodeBlockTheme] with another [TCodeBlockTheme].
  TCodeBlockTheme merge(TCodeBlockTheme? other) {
    if (other == null) {
      return this;
    }
    return copyWith(
      brightness: other.brightness,
      fontSize: other.fontSize,
      backgroundColor: other.backgroundColor,
      padding: other.padding,
      margin: other.margin,
      constraints: other.constraints,
      border: other.border,
      borderRadius: other.borderRadius,
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: lerp
  // ---------------------------------------------------------------------------

  @override
  TCodeBlockTheme lerp(
    TCodeBlockTheme? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }
    return TCodeBlockTheme(
      brightness: other.brightness,
      fontSize: lerpDouble(fontSize, other.fontSize, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      padding: EdgeInsets.lerp(padding, other.padding, t),
      margin: EdgeInsets.lerp(margin, other.margin, t),
      constraints: BoxConstraints.lerp(constraints, other.constraints, t),
      border: BoxBorder.lerp(border, other.border, t),
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t),
    );
  }
}
