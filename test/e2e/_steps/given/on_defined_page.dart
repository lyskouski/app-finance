// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_gherkin_wrapper/flutter_gherkin_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../../../screen_capture.dart';

class OnDefinedPage extends Given1<String> {
  @override
  RegExp get pattern => RegExp(r"I am on {string} page");

  @override
  Future<void> executeStep(String route) async {
    // TBD: check flow (unexpected currency selector "force to action")
    try {
      final btn = find.byTooltip('Return Back');
      expectSync(btn, findsOneWidget);
      await FileRunner.tester.ensureVisible(btn);
      await FileRunner.tester.tap(btn, warnIfMissed: false);
      await FileRunner.tester.pumpAndSettle();
    } catch (_) {
      // skip
    }
    ScreenCapture.seize(runtimeType.toString());
    final ScaffoldState scafState = FileRunner.tester.firstState(find.byType(Scaffold).at(0));
    scafState.openDrawer();
    await FileRunner.tester.pumpAndSettle();
    final header = find.text(route);
    ScreenCapture.seize(runtimeType.toString());
    expectSync(header, findsOneWidget);
    await FileRunner.tester.tap(header);
    await FileRunner.tester.pumpAndSettle();
    ScreenCapture.seize(runtimeType.toString());
  }
}
