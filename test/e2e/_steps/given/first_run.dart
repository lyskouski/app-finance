// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../file_runner.dart';

class FirstRun extends Given with SharedPreferencesMixin {
  @override
  RegExp get pattern => RegExp(r"I am firstly opened the app");

  @override
  Future<void> executeStep() async {
    await FileRunner.tester.pumpAndSettle(const Duration(seconds: 2));
    await FileRunner.tester.pumpAndSettle();
  }
}
