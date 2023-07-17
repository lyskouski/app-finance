// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../file_runner.dart';

class OnDefinedPage extends Given1<String> {
  @override
  RegExp get pattern => RegExp(r"I am on {string} page");

  @override
  Future<void> executeStep(String route) async {
    final ScaffoldState scafState =
        FileRunner.tester.firstState(find.byType(Scaffold));
    scafState.openDrawer();
    await FileRunner.tester.pumpAndSettle();
    expect(find.text(route), findsOneWidget);
    await FileRunner.tester.tap(find.text(route));
    await FileRunner.tester.pumpAndSettle();
  }
}
