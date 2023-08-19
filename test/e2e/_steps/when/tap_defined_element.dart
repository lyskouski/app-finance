// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../file_runner.dart';
import '../screen_capture.dart';

class TapDefinedElement extends When1WithWorld<String, World> {
  @override
  RegExp get pattern => RegExp(r"I tap {string} element");

  @override
  Future<void> executeStep(String name) async {
    ScreenCapture.seize(runtimeType.toString());
    final el = find.text(name);
    expectSync(el, findsOneWidget);
    await FileRunner.tester.ensureVisible(el);
    await FileRunner.tester.tap(el, warnIfMissed: false);
    await FileRunner.tester.pumpAndSettle(const Duration(milliseconds: 400));
    ScreenCapture.seize(runtimeType.toString());
  }
}
