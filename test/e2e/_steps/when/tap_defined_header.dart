// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../file_runner.dart';
import '../screen_capture.dart';

class TapDefinedHeader extends When1WithWorld<String, World> {
  @override
  RegExp get pattern => RegExp(r"I tap {string} header");

  @override
  Future<void> executeStep(String name) async {
    ScreenCapture.seize(runtimeType.toString());
    final header = find.text(name);
    expectSync(header, findsOneWidget);
    await FileRunner.tester.ensureVisible(header);
    await FileRunner.tester.tap(header);
    await FileRunner.tester.pumpAndSettle(const Duration(milliseconds: 400));
    ScreenCapture.seize(runtimeType.toString());
  }
}
