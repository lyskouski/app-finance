// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/widgets/_forms/list_account_selector.dart';
import 'package:app_finance/widgets/_forms/list_budget_selector.dart';
import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:app_finance/widgets/home/base_line_widget.dart';
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
    switch (type) {
      case 'ListSelector':
        list = find.byType(ListSelector);
        break;
      case 'ListAccountSelector':
        list = find.byType(ListAccountSelector);
        break;
      case 'ListBudgetSelector':
        list = find.byType(ListBudgetSelector);
        break;
      case 'BaseLineWidget':
        list = find.byType(BaseLineWidget);
        break;
      default:
        throw Exception('Not defined');
    }
    expect(list, findsWidgets);
    await FileRunner.tester.ensureVisible(list.at(order));
    await FileRunner.tester.tap(list.at(order), warnIfMissed: false);
    await FileRunner.tester.pumpAndSettle();
  }
}
