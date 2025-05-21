// Match the tag name for better traceability.
// ignore_for_file: camel_case_types
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tailwind_ui/flutter_tailwind_ui.dart';
import 'package:flutter_tailwind_ui/src/markdown/markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/link.dart';

// =============================================================================
// CLASS: TText
// =============================================================================

/// A widget that renders text with markdown rich formatting.
///
/// Compliance is based on the [GitHub flavored Markdown] standard.
///
/// [GitHub flavored Markdown]: https://github.github.com/gfm/
class TText extends Text {
  /// Creates a [TText] widget.
  ///
  /// The [data] parameter must not be null.
  const TText(
    super.data, {
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
    super.key,
  });

  // ---------------------------------------------------------------------------
  // METHOD: toHtml
  // ---------------------------------------------------------------------------

  /// Converts the given string of Markdown to HTML.
  String toHtml() {
    return md.markdownToHtml(
      data ?? '',
      extensionSet: md.ExtensionSet(
        md.ExtensionSet.gitHubWeb.blockSyntaxes,
        <md.InlineSyntax>[
          md.EmojiSyntax(),
          ...md.ExtensionSet.gitHubWeb.inlineSyntaxes,
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // METHOD: build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    if (this.data == null || this.data!.isEmpty) {
      return const SizedBox.shrink();
    }
    final data = this.data!;

    final tw = context.tw;
    final style = DefaultTextStyle.of(context).style.merge(this.style);
    final light = tw.light;

    return MarkdownBody(
      data: '$data\n[$kEnd](#)',
      styleSheet: MarkdownStyleSheet.fromTheme(context.theme).copyWith(
        p: style.copyWith(color: style.color ?? tw.color.body),
        a: style.copyWith(color: tw.color.link),
        h1: style.copyWith(
          fontSize: style.fontSize?.add(6),
          fontWeight: TFontWeight.semibold,
          color: tw.color.title,
        ),
        h2: style.copyWith(
          fontSize: style.fontSize?.add(4),
          fontWeight: TFontWeight.semibold,
          color: tw.color.title,
        ),
        h3: style.copyWith(
          fontSize: style.fontSize?.add(2),
          fontWeight: TFontWeight.semibold,
          color: tw.color.title,
        ),
        h4: style.copyWith(
          fontWeight: TFontWeight.semibold,
          color: tw.color.title,
        ),
        h5: style.copyWith(
          fontSize: style.fontSize?.subtract(2),
          fontWeight: TFontWeight.semibold,
          color: tw.color.title,
        ),
        h6: style.copyWith(
          fontSize: style.fontSize?.subtract(4),
          fontWeight: TFontWeight.semibold,
          color: tw.color.body,
        ),
        blockquoteDecoration: BoxDecoration(
          // Match the GitHub style for block quotes
          border: Border(
            left: BorderSide(
              color: light ? const Color(0xffd1d9e0) : const Color(0xff59636e),
              width: 3.5,
            ),
          ),
          color: Colors.transparent,
        ),
        blockquotePadding: TOffset.l16,
        blockquote: style.copyWith(color: tw.color.label),
        listBulletPadding: TOffset.zero,
        listBullet: const TextStyle(height: kTextHeightNone),
      ),
      bulletBuilder: (params) {
        final firstPad = params.index == 0 ? TOffset.t12 : TOffset.t0;
        if (params.style == BulletStyle.unorderedList) {
          return Builder(
            builder: (context) {
              final tw = context.tw;
              return Padding(
                padding: TOffset.x8 + firstPad,
                child: Icon(
                  Icons.circle,
                  size: 6,
                  color: style.color ?? tw.color.body,
                ),
              );
            },
          );
        } else {
          return Padding(
            padding: TOffset.l8 + firstPad,
            child: Text(
              '${params.index + 1}.',
              style: style,
            ),
          );
        }
      },
      extensionSet: md.ExtensionSet(
        md.ExtensionSet.gitHubWeb.blockSyntaxes,
        <md.InlineSyntax>[
          md.EmojiSyntax(),
          ...md.ExtensionSet.gitHubWeb.inlineSyntaxes,
        ],
      ),
      builders: {
        'a': _aBuilder(),
        'code': _codeBuilder(),
        'pre': _preBlockBuilder(),
      },
    );
  }
}

// =============================================================================
// CLASS: _aBuilder
// =============================================================================

class _aBuilder extends MarkdownElementBuilder {
  @override
  bool isBlockElement() => false;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    final href = element.attributes['href'];

    final style = preferredStyle?.merge(parentStyle?.copyWithout(color: true));
    final uri = href != null ? Uri.parse(href) : null;
    String? tooltipUri;
    if (uri != null) {
      if (uri.hasScheme) {
        tooltipUri = '${uri.scheme}://${uri.host}${uri.path}';
      } else {
        tooltipUri = '${uri.host}${uri.path}';
      }
    }
    return Link(
      uri: uri,
      target: kIsWeb ? LinkTarget.blank : LinkTarget.defaultTarget,
      builder: (context, followLink) {
        return TLink(
          onPressed: followLink,
          tooltip: tooltipUri,
          child: Text(
            element.textContent,
            style: style?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: style.color,
            ),
          ),
        );
      },
    );
  }
}

// =============================================================================
// CLASS: _preBlockBuilder
// =============================================================================

class _preBlockBuilder extends MarkdownElementBuilder {
  @override
  bool isBlockElement() => true;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    final child = element.children?.firstOrNull as md.Element?;
    String language = '';
    if (child != null) {
      if (child.attributes.containsKey('class')) {
        language = child.attributes['class']?.replaceAll('language-', '') ?? '';
      }
    }

    return TCodeBlock(
      code: element.textContent,
      language: language.trim(),
      theme: TCodeBlockTheme(
        fontSize: TFontSize.text_xs,
        brightness: context.tw.brightness,
      ),
    );
  }
}

// =============================================================================
// CLASS: _codeBuilder
// =============================================================================

class _codeBuilder extends MarkdownElementBuilder {
  @override
  bool isBlockElement() => false;

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    // Match the GitHub style for inline code
    final backgroundColor = context.tw.light
        ? const Color(0xfff5f5f5)
        : const Color(0xff333333);
    return Container(
      padding: TOffset.x4 + TOffset.y2,
      decoration: BoxDecoration(
        borderRadius: TBorderRadius.rounded_sm,
        color: backgroundColor,
      ),
      child: Text(
        element.textContent,
        style: TextStyle(
          fontSize: parentStyle?.fontSize?.subtract(2),
          fontFamily: TTextStyle.fontFamilyMono,
          height: kTextHeightNone,
        ),
      ),
    );
  }
}
