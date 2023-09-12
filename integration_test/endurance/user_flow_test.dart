// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:math';

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test/e2e/_steps/file_reader.dart';
import '../../test/e2e/_steps/file_reporter.dart';
import '../../test/e2e/_steps/file_runner.dart';
import '../../test/pump_main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> cleanUp() async {
    AppPreferences.pref = await SharedPreferences.getInstance();
    await AppPreferences.pref.clear();
    final path = await getApplicationDocumentsDirectory();
    var file = File('${path.absolute.path}/.terCAD/app-finance.log');
    if (!file.existsSync()) {
      file = File('${Directory.systemTemp.absolute.path}/.terCAD/app-finance.log');
    }
    await file.delete();
  }

  Future<void> run(WidgetTester tester, String scenario) async {
    final reporter = FileReporter();
    final step = await FileReader().getFromString(scenario, reporter);
    final runner = FileRunner(tester, reporter);
    final result = await runner.run(step);
    if (!result) {
      reporter.publish();
    }
    expectSync(result, true);
  }

  Future<void> firstRun(WidgetTester tester) async {
    await run(tester, '''
      @start
      Feature: Verify Initial Flow
        Scenario: Applying basic configuration through the start pages
          Given I am firstly opened the app
          Then I can see "Initial Setup" component
          When I tap "Save to Storage (Go Next)" button
          Then I can see "Acknowledge (Go Next)" button
          When I tap "Acknowledge (Go Next)" button
          Then I can see "Create new Account" button
          When I tap on 0 index of "ListSelector" fields
          And I tap "Bank Account" element
          And I enter "Init Account" to "Enter Account Identifier" text field
          And I enter "10000" to "Set Balance" text field
          And I tap "Create new Account" button
          Then I can see "Create new Budget Category" button
          When I enter "Init Budget" to "Enter Budget Category Name" text field
          And I enter "1000" to "Set Balance" text field
          When I tap "Create new Budget Category" button
          Then I can see "Accounts, total" component
      ''');
  }

  Future<void> createAccount(WidgetTester tester, int counter) async {
    await run(tester, '''
      @start
      Feature: Account
        Scenario: Create new Account
          Given Opened Account Form
          When I tap on 0 index of "ListSelector" fields
          And I tap "Bank Account" element
          And I enter "Account #$counter" to "Enter Account Identifier" text field
          And I enter "10000" to "Set Balance" text field
          And I tap "Create new Account" button
      ''');
  }

  Future<void> createBudget(WidgetTester tester, int counter) async {
    await run(tester, '''
      @start
      Feature: Budget
        Scenario: Create new Budget
          Given Opened Budget Form
          When I enter "Budget #$counter" to "Enter Budget Category Name" text field
          And I enter "1000" to "Set Balance" text field
          And I tap "Create new Budget Category" button
      ''');
  }

  Future<void> createBill(WidgetTester tester, int counter) async {
    await run(tester, '''
      @start
      Feature: Bill
        Scenario: Create new Bill
          Given I am on "Home" page
          When I tap "Add Bill, Income or Transfer" button
          And I tap on 0 index of "ListAccountSelector" fields
          And I tap on 0 index of "BaseLineWidget" fields
          And I tap on 0 index of "ListBudgetSelector" fields
          And I tap on 0 index of "BaseLineWidget" fields
          And I enter "10" to "Set Amount" text field
          And I enter "Bill #$counter" to "Set Expense Details" text field
          And I tap "Add new Bill" button
      ''');
  }

  testWidgets('Imitate User Activities', (WidgetTester tester) async {
    final startTime = DateTime.now();
    await cleanUp();
    await PumpMain.init(tester, true);
    await firstRun(tester);
    Duration duration;
    int idx = 0;
    final random = Random();
    do {
      if (random.nextDouble() <= 0.05) await createAccount(tester, idx);
      await FileRunner.tester.pumpAndSettle(const Duration(seconds: 5));
      if (random.nextDouble() <= 0.10) await createBudget(tester, idx);
      await FileRunner.tester.pumpAndSettle(const Duration(seconds: 5));
      if (random.nextDouble() <= 0.90) await createBill(tester, idx);
      await FileRunner.tester.pumpAndSettle(const Duration(seconds: 5));
      final endTime = DateTime.now();
      duration = endTime.difference(startTime);
      idx++;
    } while (duration.inMinutes < 15);
  }, timeout: const Timeout(Duration(hours: 9)));
}
