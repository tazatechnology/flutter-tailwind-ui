import 'package:recase/recase.dart';

// =============================================================================
// EXTENSION: String
// =============================================================================

/// Extension on [String] to provide useful methods
extension XTailwindString on String {
  /// Converts a string to title case
  String get titleCase => ReCase(this).titleCase;

  /// Converts a string to camel case
  String get camelCase => ReCase(this).camelCase;

  /// Converts a string to kebab case
  String get snakeCase => ReCase(this).snakeCase;

  /// Converts a string to header case
  String get headerCase => ReCase(this).headerCase;

  /// Converts a string to constant case
  String get constantCase => ReCase(this).constantCase;

  /// Converts a string to param case
  String get paramCase => ReCase(this).paramCase;

  /// Converts a string to pascal case
  String get pascalCase => ReCase(this).pascalCase;

  /// Converts a string to dot case
  String get dotCase => ReCase(this).dotCase;

  /// Converts a string to path case
  String get pathCase => ReCase(this).pathCase;

  /// Converts a string to sentence case
  String get sentenceCase => ReCase(this).sentenceCase;
}
