import 'package:markdown/markdown.dart' as md;

// =============================================================================
// CLASS: CustomTagSyntax
// =============================================================================

/// Custom inline syntax to parse custom tags
class CustomTagSyntax extends md.InlineSyntax {
  /// Creates a new custom tag syntax.
  CustomTagSyntax() : super(r'<(\w+)>(.*?)</\1>');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final String tagName = match[1]!;
    final String content = match[2]!;

    // Create an element with the custom tag name and children
    // Try to use the constructor that takes children
    try {
      final md.Element element = md.Element(tagName, [md.Text(content)]);
      parser.addNode(element);
    } on Exception catch (_) {
      // If that fails, let's try a different approach
      // Fallback: just add the text content directly
      parser.addNode(md.Text(content));
      return true;
    }
    return true;
  }
}
