// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../../../pump_main.dart';
import '../file_runner.dart';

class TapOnNumOfDefinedElement extends When2WithWorld<int, String, World> {
  @override
  RegExp get pattern => RegExp(r"I tap on {int} index of {string} element");

  @override
  Future<void> executeStep(int index, String name) async {
    PumpMain.takeScreenshot(runtimeType.toString());
    final el = find.text(name).at(index);
    expectSync(el, findsOneWidget);
    await FileRunner.tester.ensureVisible(el);
    await FileRunner.tester.tap(el, warnIfMissed: false);
    await FileRunner.tester.pumpAndSettle(const Duration(milliseconds: 400));
    PumpMain.takeScreenshot(runtimeType.toString());
  }
}
