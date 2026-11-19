// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/design/form/tags_input.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pump_main.dart';

void main() {
  late ValueNotifier<List<String>> controller;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    AppPreferences.pref = await SharedPreferences.getInstance();
  });

  Future<void> pump(WidgetTester tester) async {
    await PumpMain.initFonts(tester);
    controller = ValueNotifier(['balance', 'limit']);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TagsInput(
          title: 'Keywords',
          tooltip: 'Press Enter',
          controller: controller,
          defaults: const ['balance', 'limit'],
          normalize: (value) => value.trim().toLowerCase(),
        ),
      ),
    ));
  }

  testWidgets('adds tags by Enter and removes them by the icon', (tester) async {
    await pump(tester);
    expect(find.byType(InputChip), findsNWidgets(2));
    expect(find.byIcon(Icons.restart_alt), findsNothing);

    await tester.enterText(find.byType(TextField), ' Remaining ');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    expect(controller.value, ['balance', 'limit', 'remaining']);
    expect(find.text('remaining'), findsOneWidget);
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text, isEmpty);

    // Duplicates are ignored, comma separates tags
    await tester.enterText(find.byType(TextField), 'limit, credit,');
    await tester.pump();
    expect(controller.value, ['balance', 'limit', 'remaining', 'credit']);

    await tester
        .tap(find.descendant(of: find.byKey(const ValueKey('tag_balance')), matching: find.byIcon(Icons.close)));
    await tester.pump();
    expect(controller.value, ['limit', 'remaining', 'credit']);

    await tester.tap(find.byIcon(Icons.restart_alt));
    await tester.pump();
    expect(controller.value, ['balance', 'limit']);
    await tester.pumpAndSettle();
  });
}
