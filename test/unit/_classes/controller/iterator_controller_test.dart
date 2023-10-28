// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final input = SplayTreeMap<int, String>()..addAll({1: 'A', 2: 'B', 3: 'C', 4: 'E', 5: 'F', 6: 'G'});

  group('IteratorController', () {
    test('chunk', () {
      final obj = IteratorController<int, String, String>(input, transform: (v) => v);
      expect(obj.next, 'A');
      expect(obj.chunk(2), ['B', 'C']);
      expect(obj.chunk(10), ['E', 'F', 'G']);
    });

    test('jumpTo', () {
      final obj = IteratorController<int, String, String>(input, transform: (v) => v);
      obj.jumpTo(3);
      expect(obj.next, 'E');
      expect(obj.isFinished, false);
      expect(obj.chunk(10), ['F', 'G']);
      expect(obj.isFinished, true);
    });

    test('(filter)', () {
      final obj = IteratorController<int, String, String>(input, transform: (v) => v, filter: (v) => v == 'B');
      expect(obj.next, 'A');
      expect(obj.chunk(2), ['C', 'E']);
      expect(obj.chunk(10), ['F', 'G']);
    });

    test('(boundary)', () {
      final obj = IteratorController<int, String, String>(input, transform: (v) => v, boundary: 2);
      expect(obj.next, 'A');
      expect(obj.chunk(2), ['B']);
      expect(obj.chunk(10), []);
    });
  });

  group('IteratorReverseController', () {
    test('chunk', () {
      final obj = IteratorReverseController<int, String, String>(input, transform: (v) => v);
      expect(obj.next, 'G');
      expect(obj.chunk(2), ['F', 'E']);
      expect(obj.chunk(10), ['C', 'B', 'A']);
    });

    test('jumpTo', () {
      final obj = IteratorReverseController<int, String, String>(input, transform: (v) => v);
      obj.jumpTo(3);
      expect(obj.next, 'B');
      expect(obj.isFinished, false);
      expect(obj.chunk(10), ['A']);
      expect(obj.isFinished, true);
    });

    test('(boundary)', () {
      final obj = IteratorReverseController<int, String, String>(input, transform: (v) => v, boundary: 4);
      expect(obj.next, 'G');
      expect(obj.chunk(3), ['F', 'E']);
    });
  });
}
