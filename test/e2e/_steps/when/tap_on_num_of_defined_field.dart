// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/design/form/currency_selector.dart';
import 'package:app_finance/design/form/currency_selector_code.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:app_finance/design/form/list_budget_selector.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:flutter_gherkin_wrapper/flutter_gherkin_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../../../screen_capture.dart';

class TapOnNumOfDefinedField extends When2WithWorld<int, String, World> {
  @override
  RegExp get pattern => RegExp(r"I tap on {int} index of {string} fields");

  @override
  Future<void> executeStep(int order, String type) async {
    ScreenCapture.seize(runtimeType.toString());
    Finder? list = switch (type) {
      'ListSelector' => find.byType(ListSelector),
      'ListAccountSelector' => find.byType(ListAccountSelector),
      'ListBudgetSelector' => find.byType(ListBudgetSelector),
      'BaseLineWidget' => find.byType(BaseLineWidget),
      'CurrencySelector' => find.byType(BaseCurrencySelector),
      'CodeCurrencySelector' => find.byType(CodeCurrencySelector),
      'AccountSelector' => find.byType(ListAccountSelector),
      'BudgetSelector' => find.byType(ListBudgetSelector),
      _ => throw Exception('Not defined'),
    };
    expectSync(list, findsWidgets);
    await FileRunner.tester.ensureVisible(list.at(order));
    await FileRunner.tester.tap(list.at(order), warnIfMissed: false);
    await FileRunner.tester.pumpAndSettle(const Duration(milliseconds: 400));
    ScreenCapture.seize(runtimeType.toString());
  }
}
