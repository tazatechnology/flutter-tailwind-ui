import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

// =============================================================================
// CLASS: THighlighter
// =============================================================================

/// A standalone class responsible for loading and caching highlighter instances.
class THighlighter {
  /// A list of default supported languages for syntax highlighting.
  static const languages = [
    'css',
    'dart',
    'html',
    'javascript',
    'json',
    'python',
    'shell',
    'sql',
    'xml',
    'yaml',
  ];

  /// Map to store cached highlighter instances for different languages and brightness.
  static final Map<String, Highlighter> _highlighters = {};

  /// Map to store cached highlighter theme instances for different brightness levels.
  static final Map<Brightness, HighlighterTheme> _highlighterThemes = {};

  // ---------------------------------------------------------------------------
  // METHOD: clearCache
  // ---------------------------------------------------------------------------

  /// Clear the cached highlighters for all languages.
  static void clearCache() {
    _highlighters.clear();
  }

  // ---------------------------------------------------------------------------
  // METHOD: loadHighlighter
  // ---------------------------------------------------------------------------

  static String _getLanguageKey(String language, Brightness brightness) {
    return '$language-${brightness.name}';
  }

  // ---------------------------------------------------------------------------
  // METHOD: load
  // ---------------------------------------------------------------------------

  /// Load a syntax highlighter for the specified language and brightness.
  static Future<void> load({
    required String language,
    required Brightness brightness,
    Map<String, dynamic>? grammar,
  }) async {
    final languageKey = _getLanguageKey(language, brightness);

    // Check if the highlighter for the specified language is already cached.
    if (_highlighters.containsKey(languageKey)) {
      return;
    }

    // Try to load the grammar JSON for a language.
    var json = '';
    try {
      if (grammar != null) {
        _validateGrammar(grammar);
        json = jsonEncode(grammar);
      } else if (languages.contains(language)) {
        json = await rootBundle.loadString(
          'packages/flutter_tailwind_ui/grammar/$language.json',
        );
      } else {
        throw Exception(
          "Unsupported language: '$language'. Please provide custom grammar data.",
        );
      }
    } catch (e) {
      throw Exception(
        "Error loading grammar for language ('$language'): $e",
      );
    }

    // Initialize the highlighter and cache it.
    try {
      Highlighter.addLanguage(language, json);

      // Load the syntax highlighter theme
      final theme = _highlighterThemes[brightness] ??
          await _loadThemeForBrightness(brightness);

      // Construct and cache the highlighter instance.
      final highlighter = Highlighter(language: language, theme: theme);
      _highlighters[languageKey] = highlighter;
    } catch (e) {
      if (kDebugMode) {
        print("Error constructing highlighter for language ('$language'): $e");
      }
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: parse
  // ---------------------------------------------------------------------------

  /// Parse and return an InlineSpan for the given code using the loaded highlighter.
  static InlineSpan parse({
    required String code,
    required String language,
    required Brightness brightness,
  }) {
    final languageKey = _getLanguageKey(language, brightness);
    final fallbackSpan = TextSpan(text: code);
    try {
      return _highlighters[languageKey]?.highlight(code) ?? fallbackSpan;
    } catch (e) {
      if (kDebugMode) {
        print("Error parsing code for language ('$language'): $e");
      }
      return fallbackSpan;
    }
  }

  /// Validate the grammar JSON data for a language.
  static void _validateGrammar(Map<String, dynamic> data) {
    final requiredKeys = <String>[
      'scopeName',
      'name',
      'patterns',
    ];
    for (final key in requiredKeys) {
      if (!data.containsKey(key)) {
        throw Exception('Missing required key: $key');
      }
    }

    if (data['scopeName'] is! String) {
      throw Exception('Invalid type for "scopeName": expected String');
    }
    if (data['name'] is! String) {
      throw Exception('Invalid type for "name": expected String');
    }
    if (data['patterns'] is! List) {
      throw Exception('Invalid type for "patterns": expected List');
    }

    final patterns = data['patterns'] as List<dynamic>;
    for (final pattern in patterns) {
      if (pattern is! Map) {
        throw Exception('Pattern should be a Map');
      }
      if (!pattern.containsKey('include') &&
          !pattern.containsKey('match') &&
          !(pattern.containsKey('begin') && pattern.containsKey('end'))) {
        throw Exception(
          'Each pattern should contain "include", "match", or both "begin" and "end"',
        );
      }
    }
  }

  // ---------------------------------------------------------------------------
  // METHOD: _loadThemeForBrightness
  // ---------------------------------------------------------------------------

  /// Load and cache the highlighter theme for the given brightness level.
  static Future<HighlighterTheme> _loadThemeForBrightness(
    Brightness brightness,
  ) async {
    final theme = brightness == Brightness.light
        ? await HighlighterTheme.loadLightTheme()
        : await HighlighterTheme.loadDarkTheme();

    _highlighterThemes[brightness] = theme;
    return theme;
  }
}
