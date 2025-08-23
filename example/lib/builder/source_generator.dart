// Packages are only defined in local development
// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:flutter_tailwind_ui_app/builder/annotation.dart';
import 'package:source_gen/source_gen.dart';

// =============================================================================
// CLASS: SourceGenerator
// =============================================================================

class SourceGenerator extends GeneratorForAnnotation<GenerateSource> {
  // ---------------------------------------------------------------------------
  // METHOD: generateForAnnotatedElement
  // ---------------------------------------------------------------------------

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final buildMethodOnly = annotation.read('buildMethodOnly').boolValue;
    final className = element.displayName;

    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'GenerateSource can only be applied to classes.',
        element: element,
      );
    }

    // Get the source file content from the part file that contains this class
    final inputDir = buildStep.inputId.path.substring(
      0,
      buildStep.inputId.path.lastIndexOf('/'),
    );

    // Extract the component name from the class name
    // e.g., _TAlertNeutral -> alert, _TTextBold -> text
    String componentName = '';
    if (className.startsWith('_T')) {
      final withoutPrefix = className.substring(2); // Remove '_T'

      // Convert camelCase to snake_case and find the component name
      final buffer = StringBuffer();
      for (int i = 0; i < withoutPrefix.length; i++) {
        final char = withoutPrefix[i];
        if (char == char.toUpperCase() && i > 0) {
          // This is an uppercase letter, check if we should add underscore
          final prevChar = withoutPrefix[i - 1];
          if (prevChar != prevChar.toUpperCase()) {
            // Previous char was lowercase, add underscore
            buffer.write('_');
          }
        }
        buffer.write(char.toLowerCase());
      }

      final snakeCase = buffer.toString();

      // Find the component name by looking for common patterns
      // Split by underscore and take the first part(s) that make sense
      final parts = snakeCase.split('_');
      if (parts.length >= 2) {
        // Try different combinations
        final possibleNames = [
          '${parts[0]}_${parts[1]}', // e.g., backdrop_filter
          parts[0], // e.g., alert
        ];

        for (final name in possibleNames) {
          final testAssetId = AssetId(
            buildStep.inputId.package,
            '$inputDir/$name.dart',
          );
          try {
            await buildStep.readAsString(testAssetId);
            componentName = name;
            break;
          } on Exception {
            // Continue to next possibility
          }
        }
      } else {
        componentName = parts[0];
      }
    }

    // Read the part file that contains this class
    final partAssetId = AssetId(
      buildStep.inputId.package,
      '$inputDir/$componentName.dart',
    );

    String sourceContent;
    try {
      sourceContent = await buildStep.readAsString(partAssetId);
    } on Exception {
      // Fallback to reading from the main file
      sourceContent = await buildStep.readAsString(buildStep.inputId);
    }

    // Find the class declaration start
    final classKeywordIndex = sourceContent.indexOf('class $className');

    if (classKeywordIndex == -1) {
      throw InvalidGenerationSourceError(
        'Could not find class declaration for $className',
        element: element,
      );
    }

    // Search for the existence of "State<" and its index
    final stateIndex = sourceContent.indexOf(
      'extends State<$className>',
    );
    final bool isStatefulWidget = stateIndex != -1;

    // Get the source range for the annotated class
    // Find the end of the class by looking for the closing brace
    final classStart = classKeywordIndex;
    final classEnd = findClassEnd(
      sourceContent,
      classStart,
      isStatefulWidget ? stateIndex : -1,
    );

    final extractedSource = sourceContent.substring(
      classStart,
      classEnd < sourceContent.length ? classEnd : sourceContent.length,
    );

    String classSource;
    if (buildMethodOnly) {
      final buildMethod = element.methods.firstWhere(
        (method) => method.displayName == 'build',
        orElse: () => throw InvalidGenerationSourceError(
          'No build method found in class $className',
          element: element,
        ),
      );

      // Get the source of the build method from the extracted class source
      final methodSource = getMethodSource(buildMethod, extractedSource);
      classSource = methodSource.substring(methodSource.indexOf('\n') + 1);
      classSource = classSource.substring(0, classSource.lastIndexOf('\n'));
      classSource = dedent(classSource);

      // Exclude the return statement to just get the returned widget
      if (classSource.startsWith('return') && classSource.endsWith(';')) {
        classSource = classSource.substring('return'.length).trim();
        classSource = classSource.substring(0, classSource.length - 1).trim();
      }
    } else {
      // For buildMethodOnly: false, we want the entire class
      // If this is a stateful widget, we need to include the state class as well
      if (isStatefulWidget) {
        // Find the state class that corresponds to this widget
        // There are two naming patterns:
        // 1. _TButtonLoading -> _TButtonLoadingState
        // 2. _TCodeBlockLanguages -> __TCodeBlockLanguagesState (double underscore)
        String stateClassName = '${className}State';
        int stateClassIndex = sourceContent.indexOf('class $stateClassName');

        // If not found with single underscore pattern, try double underscore pattern
        if (stateClassIndex == -1) {
          stateClassName = '_${className}State';
          stateClassIndex = sourceContent.indexOf('class $stateClassName');
        }

        if (stateClassIndex != -1) {
          // Find the end of the state class
          final stateClassEnd = findClassEnd(
            sourceContent,
            stateClassIndex,
            -1, // Not a state class itself
          );

          // Extract everything from the start of the main class to the end of the state class
          classSource = sourceContent.substring(
            classStart,
            stateClassEnd < sourceContent.length
                ? stateClassEnd
                : sourceContent.length,
          );
        } else {
          // State class not found, just use the main class
          classSource = extractedSource;
        }
      } else {
        // Not a stateful widget, just use the main class
        classSource = extractedSource;
      }
    }

    return '''
/// Source code for [$className]
class ${className}Source {
  static const String code = r"""
$classSource
""";
}
''';
  }

  // ---------------------------------------------------------------------------
  // METHOD: findClassEnd
  // ---------------------------------------------------------------------------

  int findClassEnd(String sourceContent, int classStart, int stateIndex) {
    // Find the opening brace of the class body
    // The class declaration might span multiple lines, so we need to find the actual opening brace
    int openBraceIndex = -1;
    int currentPos = classStart;

    // Look for the opening brace, handling multi-line class declarations
    while (currentPos < sourceContent.length) {
      final char = sourceContent[currentPos];
      if (char == '{') {
        openBraceIndex = currentPos;
        break;
      }
      currentPos++;
    }

    if (openBraceIndex == -1) {
      return sourceContent.length;
    }

    // Now count brackets from the opening brace
    int bracketCount = 1;
    currentPos = openBraceIndex + 1;

    while (bracketCount > 0 && currentPos < sourceContent.length) {
      final char = sourceContent[currentPos];

      if (char == '{') {
        bracketCount++;
      } else if (char == '}') {
        bracketCount--;
      }

      currentPos++;
    }

    if (bracketCount != 0) {
      // If we can't find the matching brace, return a reasonable end point
      return sourceContent.length;
    }

    // Return the position after the closing brace
    return currentPos;
  }

  // ---------------------------------------------------------------------------
  // METHOD: getMethodSource
  // ---------------------------------------------------------------------------

  String getMethodSource(MethodElement methodElement, String sourceContent) {
    // Find the method in the source content
    final methodName = methodElement.displayName;
    final methodIndex = sourceContent.indexOf('$methodName(');
    if (methodIndex == -1) return '';

    // Find the method's opening bracket
    final openBracketOffset = sourceContent.indexOf('{', methodIndex);
    if (openBracketOffset == -1) return '';

    // Track brackets to find the matching closing bracket
    int bracketCount = 1;
    int currentPos = openBracketOffset + 1;

    while (bracketCount > 0 && currentPos < sourceContent.length) {
      if (sourceContent[currentPos] == '{') {
        bracketCount++;
      } else if (sourceContent[currentPos] == '}') {
        bracketCount--;
      }
      currentPos++;
    }

    if (bracketCount != 0) return '';

    // Find the start of the method declaration by looking backwards for a newline
    int startOffset = methodIndex;
    while (startOffset > 0 && sourceContent[startOffset - 1] != '\n') {
      startOffset--;
    }

    return sourceContent.substring(startOffset, currentPos).trim();
  }

  // ---------------------------------------------------------------------------
  // METHOD: dedent
  // ---------------------------------------------------------------------------

  String dedent(String code, {int spacesToRemove = 4}) {
    // Split into lines and remove first empty line if it exists
    final lines = code.split('\n');
    if (lines.first.trim().isEmpty) {
      lines.removeAt(0);
    }

    // Process each line
    final dedentedLines = lines.map((line) {
      // Count leading spaces
      final leadingSpaces = line.indexOf(RegExp(r'[^\s]'));
      if (leadingSpaces == -1) return line; // Empty line

      // Remove specified number of spaces, but don't go negative
      final spacesToTrim = leadingSpaces < spacesToRemove
          ? leadingSpaces
          : spacesToRemove;
      return line.substring(spacesToTrim);
    }).toList();

    // Join lines back together
    return dedentedLines.join('\n');
  }
}

// =============================================================================
// CLASS: SourceBuilder
// =============================================================================

class SourceBuilder extends Builder {
  @override
  final buildExtensions = const {
    '.dart': ['.g.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) return;

    final library = await buildStep.inputLibrary;
    final generator = SourceGenerator();
    final generatedCode = StringBuffer();

    // Use the modern approach with LibraryReader
    final libraryReader = LibraryReader(library);

    for (final annotatedElement in libraryReader.annotatedWith(
      const TypeChecker.typeNamed(
        GenerateSource,
        inPackage: 'flutter_tailwind_ui_app',
      ),
    )) {
      final generated = await generator.generateForAnnotatedElement(
        annotatedElement.element,
        annotatedElement.annotation,
        buildStep,
      );
      generatedCode.writeln(generated);
    }

    if (generatedCode.isNotEmpty) {
      final partFileId = buildStep.inputId.changeExtension('.g.dart');
      await buildStep.writeAsString(partFileId, '''
// Generated code - do not modify by hand
// ignore_for_file: unnecessary_raw_strings, prefer_single_quotes

part of '${buildStep.inputId.pathSegments.last}';

${generatedCode.toString().trim()}
''');
    }
  }
}

Builder sourceBuilder(BuilderOptions options) => SourceBuilder();
