// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/account_recalculation.dart';
import 'package:app_finance/data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Account Recalculation:getDelta', () {
    late AccountRecalculation mock;

    setUp(() {
      final accountMock = AccountAppData(
        uuid: '1',
        title: 'test',
        type: AppAccountType.account.toString(),
      );
      mock = AccountRecalculation(
        initial: accountMock.clone(),
        change: accountMock.clone(),
      );
    });

    final testCases = [
      [false, 5.0, false, 1.0, -4.0],
      [false, 1.0, false, 5.0, 4.0],
      [true, 2.0, false, 3.0, 3.0],
      [false, 2.0, true, 3.0, -2.0],
    ];

    testCases.forEach((v) {
      test(
          'initial(hidden[${v[0]}], details[${v[1]}]), change(hidden[${v[2]}], details[${v[3]}]) => ${v[4]}',
          () {
        mock.initial!.hidden = v[0] as bool;
        mock.initial!.details = v[1] as double;
        mock.change.hidden = v[2] as bool;
        mock.change.details = v[3] as double;
        expect(mock.getDelta(), v[4]);
      });
    });

    test('initial(null), change(hidden[false], details[2.0]) => 2.0', () {
      mock.initial = null;
      mock.change.hidden = false;
      mock.change.details = 2.0;
      expect(mock.getDelta(), 2.0);
    });
  });
}
