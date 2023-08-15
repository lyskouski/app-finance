// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../file_runner.dart';

class TapOnNuOfDefinedField extends When2WithWorld<int, String, World> {
  @override
  RegExp get pattern => RegExp(r"I tap on {int} index of {string} fields");

  @override
  Future<void> executeStep(int order, String type) async {
    Finder? list;
    if (type == 'ListSelector') {
      list = find.byType(ListSelector);
    }
    expect(list, findsWidgets);
    await FileRunner.tester.ensureVisible(list!.at(order));
    await FileRunner.tester.tap(list.at(order));
    await FileRunner.tester.pumpAndSettle();
  }
}
