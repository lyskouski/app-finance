// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_ext/int_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IntExt', () {
    test('toIcon', () {
      expect(984284.toIcon(), Icons.currency_exchange);
    });
  });
}
