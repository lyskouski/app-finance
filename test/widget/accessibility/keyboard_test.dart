// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../pump_main.dart';
import '../../screen_capture.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    ScreenCapture.enableScreenCapture(false);
  });

  testWidgets('Opened Drawer is manageable from a Keyboard', (WidgetTester tester) async {
    await PumpMain.init(tester);
    await tester.pumpAndSettle();

    await tester.sendKeyDownEvent(LogicalKeyboardKey.shift);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.shift);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    ScreenCapture.seize('AccessibilityDrawerOpen');
    expect(find.text('Home'), findsOneWidget);

    final outer = tester.element(find.text('Goals')).findAncestorWidgetOfExactType<InkWell>();
    final selection = outer?.focusNode?.hasFocus;

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pumpAndSettle();
    ScreenCapture.seize('AccessibilityDrawerNext');

    final outer2 = tester.element(find.text('Goals')).findAncestorWidgetOfExactType<InkWell>();
    expect(outer2?.focusNode?.hasFocus, isNot(equals(selection)));

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
    ScreenCapture.seize('AccessibilityDrawerGoals');
    expect(find.text('Add new Goal'), findsOneWidget);
  });

  testWidgets('Ctrl+N opens Transaction Form', (WidgetTester tester) async {
    await PumpMain.init(tester);
    await tester.pumpAndSettle();

    await tester.sendKeyDownEvent(LogicalKeyboardKey.control);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyN);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.control);
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    ScreenCapture.seize('AccessibilityFormOpen');
    expect(find.text('Create new Transaction'), findsOneWidget);
  });
}
