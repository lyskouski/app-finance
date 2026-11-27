// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

extension TagsExt on Iterable<String> {
  bool hasTags(Iterable<String> query) {
    if (query.isEmpty) return true;
    final scope = map((e) => e.toLowerCase()).toSet();
    return query.every((e) => scope.contains(e.toLowerCase()));
  }
}
