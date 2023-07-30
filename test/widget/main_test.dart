// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/app_theme.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/main.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'main_test.mocks.dart';

void main() {
  testWidgets('Given Main page When tap on Create Then opened BillAddPage',
      (WidgetTester tester) async {
    SharedPreferencesMixin.pref = MockSharedPreferences();
    final appData = AppData();
    appData.isLoading = false;
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppData>(
          create: (_) => appData,
        ),
        ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme(ThemeMode.system),
        ),
      ],
      child: const MyApp(),
    ));

    expect(find.text('Budgets, left'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.insert_invitation), findsOneWidget);
    expect(find.byIcon(Icons.money_off), findsOneWidget);
    expect(find.byIcon(Icons.transform), findsOneWidget);
  });
}
