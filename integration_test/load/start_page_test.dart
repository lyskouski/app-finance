// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test/e2e/_steps/file_reader.dart';
import '../../test/e2e/_steps/file_reporter.dart';
import '../../test/e2e/_steps/file_runner.dart';
import '../../test/pump_main.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Cover Starting Page', (WidgetTester tester) async {
    await binding.traceAction(
      () async {
        final pref = await SharedPreferences.getInstance();
        await pref.clear();
        await PumpMain.init(tester, true);
        final reporter = FileReporter();
        final step = await FileReader().getFromString('''
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
            And I enter "Starting Page Account" to "Enter Account Identifier" text field
            And I enter "1000" to "Set Balance" text field
            And I tap "Create new Account" button
            Then I can see "Create new Budget Category" button
            When I enter "Starting Page Budget" to "Enter Budget Category Name" text field
            And I enter "1000" to "Set Balance" text field
            When I tap "Create new Budget Category" button
            Then I can see "Accounts, total" component
        ''', reporter);
        final runner = FileRunner(tester, reporter);
        final result = await runner.run(step);
        reporter.publish();
        expectSync(result, true);
      },
      reportKey: 'timeline',
    );
  });
}
