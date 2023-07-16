// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/src/gherkin/parser.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/src/gherkin/runnables/feature_file.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/src/feature_file_runner.dart';

import 'executable_step_iterator.dart';

class FileRunner {
  File file;
  final language = LanguageService();
  final parser = GherkinParser();
  final featureFile = FeatureFile(RunnableDebugInformation.EMPTY());
  late FeatureFileRunner runner;

  FileRunner(this.file) {
    language.initialise();
    runner = FeatureFileRunner(
      FlutterTestConfiguration(),
      TagExpressionEvaluator(),
      ExecutableStepIterator().aggregate(),
      ProgressReporter(),
      AggregatedHook(),
    );
  }

  Future<void> init() async {
    final parserResult = await parser.parseFeatureFile(
      file.readAsStringSync(),
      '',
      ProgressReporter(),
      language,
    );
    for (final feature in parserResult.features) {
      featureFile.addChild(feature);
    }
  }

  void run() {
    runner.run(featureFile);
  }
}
