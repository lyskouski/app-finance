// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../../../pump_main.dart';
import '../file_runner.dart';

class EnterTextField extends When2WithWorld<String, String, World> {
  @override
  RegExp get pattern => RegExp(r"I enter {string} to {string} text field");

  @override
  Future<void> executeStep(String value, String tooltip) async {
    PumpMain.takeScreenshot(runtimeType.toString());
    final field = find.byWidgetPredicate((widget) {
      return widget is TextField && widget.decoration?.hintText == tooltip;
    });
    expectSync(field, findsOneWidget);
    await FileRunner.tester.ensureVisible(field);
    await FileRunner.tester.tap(field);
    await FileRunner.tester.pump();
    await FileRunner.tester.enterText(field, value);
    await FileRunner.tester.pumpAndSettle(const Duration(seconds: 1));
    PumpMain.takeScreenshot(runtimeType.toString());
  }
}
