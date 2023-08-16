// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../file_runner.dart';

class TapDefinedButton extends When1WithWorld<String, World> {
  @override
  RegExp get pattern => RegExp(r"I tap {string} button");

  @override
  Future<void> executeStep(String name) async {
    final btn = find.byTooltip(name);
    await FileRunner.tester.ensureVisible(btn);
    expect(btn, findsOneWidget);
    await FileRunner.tester.tap(btn);
    await FileRunner.tester.pumpAndSettle(const Duration(milliseconds: 400));
  }
}
