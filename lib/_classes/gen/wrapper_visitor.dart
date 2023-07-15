// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';

class WrapperVisitor {
  StringBuffer buffer = StringBuffer();
  ClassElement element;

  WrapperVisitor(this.element);

  void addImports() {
    final mainClass = element.enclosingElement.library;
    addImport(mainClass);
    for (final cls in mainClass.importedLibraries) {
      addImport(cls);
    }
    buffer.writeln('');
  }

  void addImport(LibraryElement className) {
    buffer.writeln('// ignore: unused_import');
    buffer.writeln("import '${className.source.uri}';");
  }

  void addClassDefinition() {
    buffer.writeln('class Wrapper${element.name} extends ${element.name} {');
    final constructor = element.unnamedConstructor;
    if (!constructor!.isDefaultConstructor) {
      final properties = constructor.parameters;
      buffer.writeln('  Wrapper${element.name}({');
      if (properties.isNotEmpty) {
        for (var e in properties) {
          buffer.writeln(
              '    ${e.isRequired ? 'required ' : ''}super.${e.name},');
        }
      }
      buffer.writeln('  });');
    }
  }

  void addMethods() {
    for (final m in element.methods) {
      final args = m.parameters.map((e) => e.name).toList().join(', ');
      final name = 'mock${m.name[0].toUpperCase()}${m.name.substring(1)}';
      buffer.writeln('');
      buffer.writeln('  ${m.returnType} Function()? _${m.name};');
      buffer.writeln('  // ignore: non_constant_identifier_names');
      buffer.writeln('  set $name(${m.returnType} Function() value) {');
      buffer.writeln('    _${m.name} = value;');
      buffer.writeln('  }');
      buffer.writeln('');
      buffer.writeln('  @override');
      buffer.writeln('  $m => (_${m.name} ?? super.${m.name})($args);');
    }
  }

  void finalize() {
    buffer.writeln('}');
  }

  @override
  String toString() {
    addImports();
    addClassDefinition();
    addMethods();
    finalize();
    return buffer.toString();
  }
}
