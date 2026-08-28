// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<BuildContext>()])
import 'focus_controller_test.mocks.dart';

void main() {
  group('FocusController', () {
    group('onEditingComplete', () {
      final testCases = [
        (
          fnCalls: 1,
          editComplete: 0,
          focus: 0,
          value: null,
          result: false,
          action: TextInputAction.done,
        ),
        (
          fnCalls: 10,
          editComplete: 5,
          focus: 6,
          value: null,
          result: true,
          action: TextInputAction.next,
        ),
        (
          fnCalls: 10,
          editComplete: 5,
          focus: 6,
          value: 'test',
          result: false,
          action: TextInputAction.next,
        ),
      ];

      for (var v in testCases) {
        test('$v', () async {
          final controller = FocusController();
          expect(controller.focus, null);
          for (int i = 0; i < v.fnCalls; i++) {
            controller.bind(i, context: MockBuildContext(), value: v.value);
          }
          await Future.delayed(const Duration(seconds: 1));
          controller.onEditingComplete(v.editComplete);
          expect(controller.isFocused(v.focus), v.result);
          expect(controller.getAction(v.focus), v.action);
        });
      }
    });
  });
}
