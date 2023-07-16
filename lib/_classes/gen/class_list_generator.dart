// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

// ignore: depend_on_referenced_packages
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';
// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/constant/value.dart';
import 'package:app_finance/_classes/gen/generate_list_of_classes.dart';
import 'package:app_finance/_classes/gen/wrapper_visitor.dart';
// ignore: depend_on_referenced_packages
import 'package:build/build.dart';
// ignore: depend_on_referenced_packages
import 'package:source_gen/source_gen.dart';
// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/analysis/utilities.dart';
// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:path/path.dart' as path;
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';

Builder classListGenerator(BuilderOptions options) => LibraryBuilder(
      ClassListGenerator(),
      generatedExtension: '.list.dart',
    );

class ClassListGenerator extends Generator {
  Future<String> build(Element node, Iterable<DartObject> annotations) async {
    final imports = StringBuffer();
    final classes = StringBuffer();
    for (final annotation in annotations) {
      final note = annotation.getField('folders');
      final parts =
          node.source?.uri.toString().split(RegExp(r'[\\/]', unicode: true));
      final dir = parts?.sublist(1, parts.length - 1).join('/');
      if (note!.isNull || dir!.isEmpty) {
        continue;
      }
      for (final name in note.toListValue()!) {
        Iterable<File> scope = Directory('$dir/${name.toStringValue()}')
            .listSync(recursive: true)
            .where((entity) => entity is File && entity.path.endsWith('.dart'))
            .cast<File>();
        for (final file in scope) {
          final path = file.path
              .toString()
              .replaceAll('\\', '/')
              .replaceAll('$dir/', '');
          imports.writeln("import '$path';");
          String content = await file.readAsString();
          final regex = RegExp(r'class\s+(\w+)');
          final matches = regex.allMatches(content);
          for (final match in matches) {
            classes.writeln('  ${match.group(1)}(),');
          }
        }
      }
    }
    return '${imports.toString()}\nvar classList = [\n${classes.toString()}\n];';
  }

  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final result = StringBuffer();
    for (final element in library.allElements) {
      final annotations = const TypeChecker.fromRuntime(GenerateListOfClasses)
          .annotationsOf(element);
      if (annotations.isNotEmpty) {
        result.writeln(await build(element, annotations));
      }
    }
    return result.toString();
  }
}
