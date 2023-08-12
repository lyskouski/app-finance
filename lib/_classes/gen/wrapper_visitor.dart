// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';

class WrapperVisitor {
  StringBuffer buffer = StringBuffer();
  ClassElement element;
  String? singleton;

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
    buffer.writeln('// ignore: unused_import, unnecessary_import, depend_on_referenced_packages');
    String path = className.source.uri.toString();
    if (path.contains('asset:')) {
      path = className.source.uri.pathSegments.last;
    }
    buffer.writeln("import '$path';");
  }

  void addClassDefinition() {
    final constructor = element.unnamedConstructor;
    if (constructor == null) {
      buffer.writeln('class Wrapper${element.name} implements ${element.name} {');
      buffer.writeln('  static ${element.name}? wrap${element.name};');
      singleton = element.name;
      return;
    }
    buffer.writeln('class Wrapper${element.name} extends ${element.name} {');
    if (!constructor.isDefaultConstructor) {
      final properties = constructor.parameters;
      buffer.writeln('  Wrapper${element.name}({');
      if (properties.isNotEmpty) {
        for (var e in properties) {
          buffer.writeln('    ${e.isRequired ? 'required ' : ''}super.${e.name},');
        }
      }
      buffer.writeln('  });');
    }
  }

  void addMethods() {
    for (final m in element.methods) {
      if (m.name[0] == '_') {
        continue;
      }
      final args = m.parameters.map((e) => e.isNamed ? '${e.name}: ${e.name}' : e.name).toList().join(', ');
      final typedArgs = m.parameters
          .map((e) {
            String arg = '${e.type} ${e.name}';
            if (e.isNamed) {
              arg = '{$arg}';
            } else if (e.isOptional) {
              arg = '[$arg]';
            }
            return arg;
          })
          .toList()
          .join(', ');
      String static = m.isStatic ? 'static ' : '';
      final name = 'mock${m.name[0].toUpperCase()}${m.name.substring(1)}';
      buffer.writeln('');
      buffer.writeln('  $static${m.returnType} Function($typedArgs)? _${m.name};');
      buffer.writeln('  // ignore: non_constant_identifier_names');
      buffer.writeln('  ${static}set $name(${m.returnType} Function($typedArgs) value) {');
      buffer.writeln('    _${m.name} = value;');
      buffer.writeln('  }');
      buffer.writeln('');
      if (singleton != null) {
        buffer.writeln('  $static$m => _${m.name} != null ? '
            '_${m.name}!($args) : ${m.isStatic ? singleton : 'wrap$singleton!'}.${m.name}($args);');
      } else {
        buffer.writeln('  @override');
        buffer.writeln('  $static$m => (_${m.name} ?? ${m.isStatic ? element.name : 'super'}.${m.name})($args);');
      }
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
