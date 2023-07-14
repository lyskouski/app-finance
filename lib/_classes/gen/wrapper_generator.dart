import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';
// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/constant/value.dart';
// ignore: depend_on_referenced_packages
import 'package:build/build.dart';
// ignore: depend_on_referenced_packages
import 'package:source_gen/source_gen.dart';

Builder wrapperGenerator(BuilderOptions options) => LibraryBuilder(
      WrapperGenerator(),
      generatedExtension: '.wrapper.dart',
    );

class WrapperGenerator extends Generator {
  String build(Iterable<DartObject> annotations) {
    final result = StringBuffer();
    for (final annotation in annotations) {
      final classes = annotation.getField('classes');
      if (classes!.isNull) {
        break;
      }
      for (final name in classes.toListValue()!) {
        final type = name.toTypeValue();
        final classElement = type?.element as ClassElement;
        // Import
        result.writeln(
            "import '${classElement.enclosingElement.library.toString().replaceAll('library ', '')}';");
        result.writeln('');
        // Class definition
        result.writeln(
            'class Wrapper${classElement.name} extends ${classElement.name} {');
        final constructor = classElement.unnamedConstructor;
        final properties = constructor?.parameters;
        // Constructor
        result.writeln('  Wrapper${classElement.name}({');
        if (properties!.isNotEmpty) {
          for (var e in properties) {
            result.writeln(
                '    ${e.isRequired ? 'required ' : ''}super.${e.name},');
          }
        }
        result.writeln('  });');
        // Method(s) Wrapper
        for (final m in classElement.methods) {
          final args = m.parameters.map((e) => e.name).toList().join(', ');
          final name = 'mock${m.name[0].toUpperCase()}${m.name.substring(1)}';
          result.writeln('');
          result.writeln('  ${m.returnType} Function()? _${m.name};');
          result.writeln('  // ignore: non_constant_identifier_names');
          result.writeln('  set $name(${m.returnType} Function() value) {');
          result.writeln('    _${m.name} = value;');
          result.writeln('  }');
          result.writeln('');
          result.writeln('  @override');
          result.writeln('  $m => (_${m.name} ?? super.${m.name})($args);');
        }
        // End class
        result.writeln('}');
      }
    }
    return result.toString();
  }

  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final result = StringBuffer();
    for (final element in library.allElements) {
      final annotations =
          const TypeChecker.fromRuntime(GenerateWithMethodSetters)
              .annotationsOf(element);
      if (annotations.isNotEmpty) {
        result.writeln(build(annotations));
      }
    }
    return result.toString();
  }
}
