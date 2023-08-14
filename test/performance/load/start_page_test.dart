// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/app_theme.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../e2e/_steps/file_reader.dart';
import '../../e2e/_steps/file_runner.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  _init(WidgetTester tester) async {
    SharedPreferencesMixin.pref = await SharedPreferences.getInstance();
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppData>(
          create: (_) => AppData(),
        ),
        ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme(ThemeMode.system),
        ),
      ],
      child: const MyApp(),
    ));
  }

  testWidgets('Cover Starting Page', (WidgetTester tester) async {
    await binding.traceAction(
      () async {
        await _init(tester);
        final step = await FileReader().getFromString('''
        @start
        Feature: Verify Initial Flow
          Scenario: Applying basic configuration through the start pages
            Given I am firstly opened the app
            Then I can see "Initial Setup" component
            When I tap "Save to Storage (Go Next)" button
            Then I can see "Acknowledge (Go Next)" component
            When I tap "Acknowledge (Go Next)" button
            Then I can see "Create new Account" component
            When I tap on "first" of "ListSelector" field
            And I tap "Bank Account" element
            And I enter "Starting Page Account" to "Enter Account Identifier" text field
            And I enter "1000" to "Set Balance" text field
            And I tap "Create new Account" button
            Then I can see "Create new Budget Category" component
            When I enter "Starting Page Budget" to "Enter Budget Category Name" text field
            When I tap "Create new Budget Category" button
            Then I can see "Accounts, total" component
        ''');
        final runner = FileRunner(tester);
        expectSync(await runner.run(step), true);
      },
      reportKey: 'timeline',
    );
  });
/*
  testWidgets('Create Account', (WidgetTester tester) async {
    await _init(tester);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    final accountHeader = find.text('Accounts, total');
    expect(accountHeader, findsOneWidget);
    await tester.tap(accountHeader);
    await tester.pumpAndSettle();

    final btnAdd = find.text('Add account');
    expect(btnAdd, findsOneWidget);
    await tester.tap(btnAdd);
    await tester.pumpAndSettle();

    await tester.pumpAndSettle(const Duration(seconds: 1));
  });
*/
}
