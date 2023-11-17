// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:grinder/grinder.dart';
import '../_classes/dir.dart' as coverage;

mock() {
  Process.runSync('dart', [
    'run',
    'build_runner',
    'clean',
  ]);
  ProcessResult build = Process.runSync('dart', [
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs',
  ]);
  if (build.exitCode > 0) {
    fail(build.stderr);
  }
  fixMock();
}

fixMock() {
  final rootFolder = Directory('${Directory.current.path}/test');
  List<String> files = coverage.scanDirectory(rootFolder, '*.*.dart').map((path) => 'test$path').toList();

  Process.runSync('dart', ['format', '-l', '120', ...files]);
}
