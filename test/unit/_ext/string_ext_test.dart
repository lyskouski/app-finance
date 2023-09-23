// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_ext/string_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringExt', () {
    group('toMap', () {
      final testCases = [
        (input: '', type: double, result: {}),
        (input: {}.toString(), type: double, result: {}),
        (input: {1: 1.2, 2: 0.2}.toString(), type: double, result: {1: 1.2, 2: 0.2}),
        (input: {'a': 'test', 'b': 'tost'}.toString(), type: String, result: {'a': 'test', 'b': 'tost'}),
        // (input: {1: 1.2, 2: null}.toString(), type: null, result: {1: 1.2, 2: null}),
      ];

      for (var v in testCases) {
        test(': $v', () {
          final _ = switch (v.type) {
            double => expect(v.input.toMap<int, double>(), v.result),
            String => expect(v.input.toMap<String, String>(), v.result),
            _ => expect(v.input.toMap<int, double?>(), v.result),
          };
        });
      }
    });

    group('toList', () {
      final testCases = [
        (input: '', type: double, result: []),
        (input: '[]', type: String, result: []),
        (input: [1.2, 0.2].toString(), type: double, result: [1.2, 0.2]),
        (
          input: [
            {'a': 'test', 'b': 'tost'}
          ].toString(),
          type: Map<String, dynamic>,
          result: [
            {'a': 'test', 'b': 'tost'}
          ]
        ),
        (
          input: [
            {'a': 'test', 'b': 'tost'},
            {'a': 123, 'b': 1.2}
          ].toString(),
          type: Map<String, dynamic>,
          result: [
            {'a': 'test', 'b': 'tost'},
            {'a': 123, 'b': 1.2}
          ]
        ),
      ];

      for (var v in testCases) {
        test(': $v', () {
          final _ = switch (v.type) {
            double => expect(v.input.toList<double>(), v.result),
            String => expect(v.input.toList<String>(), v.result),
            _ => expect(v.input.toList<Map<String, dynamic>>(), v.result),
          };
        });
      }
    });
  });
}
