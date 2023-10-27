// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

abstract interface class InterfaceIterator<T, K> {
  void reset();
  K? get next;
  void jumpTo(T key);
  Iterable<K?> loop();
  List<K> chunk(int length);
}

class IteratorController<T, K> implements InterfaceIterator<T, K> {
  SplayTreeMap<T, K> data;
  late List<T> keys = data.keys.toList();
  int pointer = 0;

  IteratorController(this.data);

  @override
  void reset() => pointer = 0;

  @override
  void jumpTo(T key) {
    final nextKey = data.firstKeyAfter(key);
    pointer = nextKey != null ? keys.indexOf(nextKey) : keys.length - 1;
  }

  @override
  Iterable<K?> loop() sync* {
    while (pointer < keys.length) {
      final index = keys.elementAt(pointer++);
      yield data[index];
    }
  }

  @override
  K? get next {
    final iterator = loop().iterator;
    return iterator.moveNext() ? iterator.current as K : null;
  }

  @override
  List<K> chunk(int length) {
    final result = List.generate(length, (_) => next);
    result.removeWhere((e) => e == null);
    return result.cast<K>();
  }
}

class IteratorReverseController<T, K> extends IteratorController<T, K> {
  IteratorReverseController(super.data) {
    pointer = data.keys.length - 1;
  }

  @override
  void reset() => data.keys.length - 1;

  @override
  void jumpTo(T key) {
    final nextKey = data.lastKeyBefore(key);
    pointer = nextKey != null ? keys.indexOf(nextKey) : 0;
  }

  @override
  Iterable<K?> loop() sync* {
    while (pointer >= 0) {
      final index = keys.elementAt(pointer--);
      yield data[index];
    }
  }
}
