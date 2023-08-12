// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';
// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/constant/value.dart';
import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:app_finance/_classes/gen/wrapper_visitor.dart';
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
      if (classes == null || classes.isNull) {
        continue;
      }
      for (final name in classes.toListValue()!) {
        final type = name.toTypeValue();
        final classElement = type?.element as ClassElement;
        final visitor = WrapperVisitor(classElement);
        result.writeln(visitor.toString());
      }
    }
    return result.toString();
  }

  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final result = StringBuffer();
    for (final element in library.allElements) {
      final annotations = const TypeChecker.fromRuntime(GenerateWithMethodSetters).annotationsOf(element);
      if (annotations.isNotEmpty) {
        result.writeln(build(annotations));
      }
    }
    return result.toString();
  }
}
