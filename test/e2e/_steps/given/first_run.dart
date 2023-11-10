// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_gherkin_wrapper/flutter_gherkin_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

class FirstRun extends Given {
  @override
  RegExp get pattern => RegExp(r"I am firstly opened the app");

  @override
  Future<void> executeStep() async {
    Finder init;
    do {
      init = find.text('Project Initialization');
      await FileRunner.tester.pumpAndSettle(const Duration(microseconds: 50));
    } while (init.evaluate().isNotEmpty);
    await FileRunner.tester.pumpAndSettle();
  }
}
