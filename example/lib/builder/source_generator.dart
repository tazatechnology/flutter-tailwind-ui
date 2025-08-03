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
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final buildMethodOnly = annotation.read('buildMethodOnly').boolValue;
    final className = element.displayName;

    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'GenerateSource can only be applied to classes.',
        element: element,
      );
    }

    final elementIndex = element.nameOffset + element.nameLength;

    // Search for the existence of "State<" and its index
    final stateIndex = element.source.contents.data.indexOf(
      'extends State<$className>',
    );
    final bool isStatefulWidget = stateIndex != -1;

    // Get the source range for the annotated class
    final sourceRange = element.source.contents.data.substring(
      element.nameOffset - 'class '.length, // Include the 'class' keyword
      elementIndex +
          element.source.contents.data
              .substring(elementIndex)
              .indexOf(
                RegExp(r'(^|\n)\}(?=\n|$)'),
                isStatefulWidget ? stateIndex - elementIndex : 0,
              ) +
          2,
    );

    String source;
    if (buildMethodOnly) {
      final buildMethod = element.methods.firstWhere(
        (method) => method.displayName == 'build',
        orElse: () => throw InvalidGenerationSourceError(
          'No build method found in class $className',
          element: element,
        ),
      );

      // Get the source of the build method
      // Remove the first line/last to exclude the method declaration
      final methodSource = getMethodSource(buildMethod);
      source = methodSource.substring(methodSource.indexOf('\n') + 1);
      source = source.substring(0, source.lastIndexOf('\n'));
      source = dedent(source);

      // Exclude the return statement to just get the returned widget
      if (source.startsWith('return') && source.endsWith(';')) {
        source = source.substring('return'.length).trim();
        source = source.substring(0, source.length - 1).trim();
      }
    } else {
      source = sourceRange;
    }

    return '''
/// Source code for [$className]
class ${className}Source {
  static const String code = r"""
$source
""";
}
''';
  }

  // ---------------------------------------------------------------------------
  // METHOD: getMethodSource
  // ---------------------------------------------------------------------------

  String getMethodSource(MethodElement methodElement) {
    // Get the source of the containing file
    final source = methodElement.source.contents.data;

    // Get the offset information
    final offset = methodElement.nameOffset;
    final length = methodElement.nameLength;
    if (offset < 0 || length < 0) return '';

    // Find the method's opening bracket
    final openBracketOffset = source.indexOf('{', offset);
    if (openBracketOffset == -1) return '';

    // Track brackets to find the matching closing bracket
    int bracketCount = 1;
    int currentPos = openBracketOffset + 1;

    while (bracketCount > 0 && currentPos < source.length) {
      if (source[currentPos] == '{') {
        bracketCount++;
      } else if (source[currentPos] == '}') {
        bracketCount--;
      }
      currentPos++;
    }

    if (bracketCount != 0) return '';

    // Find the start of the method declaration by looking backwards for a newline
    int startOffset = offset;
    while (startOffset > 0 && source[startOffset - 1] != '\n') {
      startOffset--;
    }

    return source.substring(startOffset, currentPos).trim();
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

class SourceBuilder implements Builder {
  @override
  final buildExtensions = const {
    '.dart': ['.g.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) return;

    final library = await buildStep.inputLibrary;
    const annotations = TypeChecker.fromRuntime(GenerateSource);

    final generatedCode = StringBuffer();

    for (final annotatedElement in library.topLevelElements) {
      if (annotations.hasAnnotationOf(annotatedElement)) {
        final generator = SourceGenerator();
        final annotation = annotations.firstAnnotationOf(annotatedElement);
        final generated = generator.generateForAnnotatedElement(
          annotatedElement,
          ConstantReader(annotation),
          buildStep,
        );
        generatedCode.writeln(generated);
      }
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
