// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/main.dart';
import 'package:app_finance/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Given Main page When tap on Create Then opened BillAddPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => AppData(),
      child: const MyApp(),
    ));

    const initText = 'Project Initialization';
    final init = find.text(initText);
    expect(init, findsWidgets);
    await tester.tap(init);
    await tester.pumpAndSettle();
    expect(find.text(initText), findsNothing);

    expect(find.text('Budgets, left'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.insert_invitation), findsOneWidget);
    expect(find.byIcon(Icons.money_off), findsOneWidget);
    expect(find.byIcon(Icons.transform), findsOneWidget);
  });
}
