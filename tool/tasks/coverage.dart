// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:grinder/grinder.dart';
import 'package:path/path.dart' as path;
import '../_classes/dir.dart' as dir;
import '../_classes/coverage_badge.dart' as badge;

fullCoverage() {
  TaskArgs args = context.invocation.arguments;
  String target = args.getOption('path') ?? '/_classes';
  String type = args.getOption('type') ?? 'unit';
  final content = StringBuffer();
  content.writeln("// AUTOGENERATED BY `dart run grinder full-coverage`");
  content.writeln('// ignore_for_file: unused_import');
  final rootFolder = Directory('${Directory.current.path}/lib$target');
  List<String> files = dir.scanDirectory(rootFolder);
  for (var file in files) {
    content.writeln("import 'package:app_finance$target$file';");
  }
  content.writeln("void main() {}");
  File(path.join(Directory.current.path, 'test/$type/_coverage_test.g.dart')).writeAsStringSync(content.toString());
}

coverageBadge() {
  TaskArgs args = context.invocation.arguments;
  String path = (args.getOption('path') ?? '').split('/').last;
  final lineCoverage = badge.calculateLineCoverage(File('coverage/lcov.info'));
  badge.generateBadge('${Directory.current.path}/coverage', lineCoverage, path);
}
