// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_ext/tags_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TagsExt', () {
    final testCases = [
      (tags: <String>[], query: <String>[], result: true),
      (tags: ['food', 'trip'], query: <String>[], result: true),
      (tags: <String>[], query: ['food'], result: false),
      (tags: ['food', 'trip'], query: ['food'], result: true),
      (tags: ['Food', 'trip'], query: ['fOOD', 'TRIP'], result: true),
      (tags: ['food'], query: ['food', 'trip'], result: false),
    ];

    for (final v in testCases) {
      test('hasTags: $v', () => expect(v.tags.hasTags(v.query), v.result));
    }
  });
}
