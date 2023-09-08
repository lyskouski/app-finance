// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LaunchMock extends Mock {
  void call(int? index);
}

void main() {
  group('DelayedCall', () {
    test('run', () async {
      int valid = 10;
      int msDelay = 1;
      final mock = LaunchMock();
      when(mock(any)).thenReturn(null);
      final runner = DelayedCall(msDelay);
      for (int i = 0; i <= valid; i++) {
        runner.run(() => mock(i));
      }
      await Future.delayed(Duration(milliseconds: msDelay + 1));
      for (int i = 0; i < valid; i++) {
        verifyNever(mock(i));
      }
      verify(mock(10)).called(1);
    });

    test('cancel', () {
      int valid = 10;
      final runner = DelayedCall(1000);
      final mock = LaunchMock();
      runner.run(() => mock(valid));
      runner.cancel();
      verify(mock(valid)).called(1);
    });
  });
}
