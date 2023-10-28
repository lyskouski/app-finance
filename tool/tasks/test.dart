// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:grinder/grinder.dart';
import 'coverage.dart';

test() {
  TaskArgs args = context.invocation.arguments;
  ProcessResult test = Process.runSync(
      'flutter',
      ['test', args.getFlag('coverage') ? '--coverage' : '', args.getOption('path') ?? '']
          .where((e) => e != '')
          .toList(),
      runInShell: true);
  String testResult = "\n${test.stdout}".replaceAll(RegExp(r'(?<=:\s).*\.dart: '), '');
  if (test.exitCode > 0) {
    fail(testResult);
  }
  log(testResult);
  if (args.getFlag('coverage')) {
    coverageBadge();
  }
}
