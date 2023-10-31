// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../e2e/_steps/screen_capture.dart';
import '../../pump_main.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    ScreenCapture.enableScreenCapture(false);
  });

  testWidgets('Semantics of Headers', (WidgetTester tester) async {
    await PumpMain.init(tester);

    final widget = find.descendant(
      of: find.byType(TapWidget),
      matching: find.text('Accounts, total'),
    );
    final semantics = tester.getSemantics(widget);
    expect(semantics.attributedHint.string, "Open Accounts\nButton");
    ScreenCapture.seize('AccessibilitySemantics');

    final owner = tester.binding.pipelineOwner.semanticsOwner;
    owner!.performAction(semantics.id, SemanticsAction.didGainAccessibilityFocus);
    ScreenCapture.seize('AccessibilitySemanticsFocus');

    owner.performAction(semantics.id, SemanticsAction.tap);
    await tester.pumpAndSettle();
    ScreenCapture.seize('AccessibilitySemanticsTap');
    expect(find.text('Add Account'), findsOneWidget);
  });
}
