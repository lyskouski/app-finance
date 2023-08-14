// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FocusController', () {
    setUp(() {
      FocusController.dispose();
      FocusController.getController(FocusController);
    });

    group('onEditingComplete', () {
      final testCases = [
        (
          fnCalls: 1,
          resultCursor: 0,
          editComplete: 0,
          focus: -1,
          checkFocus: 0,
          value: null,
          result: true,
          isLast: true,
        ),
        (
          fnCalls: 10,
          resultCursor: 9,
          editComplete: 5,
          focus: 6,
          checkFocus: 6,
          value: null,
          result: true,
          isLast: false,
        ),
        (
          fnCalls: 10,
          resultCursor: 9,
          editComplete: 5,
          focus: 6,
          checkFocus: 6,
          value: 'test',
          result: false,
          isLast: false,
        ),
      ];

      for (var v in testCases) {
        test('$v', () {
          expect(FocusController.current, FocusController.DEFAULT);
          for (int i = 0; i < v.fnCalls; i++) {
            FocusController.getFocusNode();
          }
          expect(FocusController.current, v.resultCursor);
          FocusController.onEditingComplete(v.editComplete);
          expect(FocusController.focus, v.focus);
          expect(FocusController.isFocused(v.checkFocus, v.value), v.result);
          expect(FocusController.isLast(), v.isLast);
        });
      }
    });
  });
}
