// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

extension MapExt on String {
  T _asType<T>(value) {
    return switch (T) {
      int => int.tryParse(value) as T,
      double => double.tryParse(value) as T,
      String => value.toString() as T,
      _ => null as T,
    };
  }

  Map<T, K> toMap<T, K>() {
    final data = length > 0 ? substring(1, length - 1).split(',') : [];
    final Map<T, K> result = {};
    for (final pair in data) {
      final parts = pair.split(':');
      if (parts.length != 2 || parts[0] == null) {
        continue;
      }
      final key = _asType<T>(parts[0].trim());
      result[key] = _asType<K>(parts[1].trim());
    }
    return result;
  }
}
