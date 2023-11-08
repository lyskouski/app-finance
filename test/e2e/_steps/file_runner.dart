// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';

import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/src/gherkin/runnables/feature_file.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/src/feature_file_runner.dart';

import 'executable_step_iterator.dart';
import 'file_reader.dart';

class FileRunner {
  late FeatureFile featureFile;
  late FeatureFileRunner runner;
  static late WidgetTester tester;

  FileRunner(WidgetTester tester, [ProgressReporter? reporter]) {
    // ignore: prefer_initializing_formals
    FileRunner.tester = tester;
    runner = FeatureFileRunner(
      FlutterTestConfiguration()..defaultTimeout = const Duration(minutes: 5),
      TagExpressionEvaluator(),
      ExecutableStepIterator().aggregate(),
      reporter ?? ProgressReporter(),
      AggregatedHook(),
    );
  }

  Future<void> init(File file) async {
    featureFile = await FileReader().get(file);
  }

  Future<bool> run([FeatureFile? feature]) async {
    return await runner.run(feature ?? featureFile);
  }
}
