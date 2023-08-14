// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/app_theme.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/main.dart';
import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        await tester.pumpAndSettle(const Duration(seconds: 2));

        final btnNext = find.text('Save to Storage (Go Next)');
        await tester.tap(btnNext);
        await tester.pumpAndSettle();

        final ackNext = find.text('Acknowledge (Go Next)');
        expect(ackNext, findsOneWidget);
        await tester.tap(ackNext);
        await tester.pumpAndSettle();

        await tester.tap(find.byType(ListSelector).first);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Bank Account'), warnIfMissed: false);
        await tester.pumpAndSettle();
        final accountField = find.byWidgetPredicate((widget) {
          return widget is TextField && widget.decoration?.hintText == 'Enter Account Identifier';
        });
        await tester.tap(accountField);
        await tester.pump();
        await tester.enterText(accountField, 'Starting Page Account');
        await tester.pumpAndSettle();
        expect(find.text('Starting Page Account'), findsOneWidget);
        final amountField = find.byWidgetPredicate((widget) {
          return widget is TextField && widget.decoration?.hintText == 'Set Balance';
        });
        await tester.ensureVisible(amountField);
        await tester.tap(amountField);
        await tester.pump();
        await tester.enterText(amountField, '1000');
        await tester.pumpAndSettle();
        expect(find.text('1000'), findsOneWidget);
        await tester.tap(find.text('Create new Account'));
        await tester.pumpAndSettle();

        final budgetTitle = find.byType(TextField).first;
        await tester.tap(budgetTitle);
        await tester.pump();
        await tester.enterText(budgetTitle, 'Starting Page Budget');
        await tester.pumpAndSettle();
        await tester.tap(find.text('Create new Budget Category'));
        await tester.pumpAndSettle();

        final accountHeader = find.text('Accounts, total');
        expect(accountHeader, findsOneWidget);
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
