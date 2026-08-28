// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_gherkin_wrapper/flutter_gherkin_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../../../screen_capture.dart';

class CanSeeDefinedComponent extends Then1WithWorld<String, World> {
  @override
  RegExp get pattern => RegExp(r"I can see {string} component");

  @override
  Future<void> executeStep(String name) async {
    ScreenCapture.seize(runtimeType.toString());
    final btn = find.text(name);
    // Try to scroll to the element if it's not visible
    try {
      await FileRunner.tester.scrollUntilVisible(
        btn,
        500.0,
        scrollable: find.byType(Scrollable).first,
      );
    } catch (e) {
      // ... ignore
    }
    expectSync(btn, findsWidgets);
  }
}
