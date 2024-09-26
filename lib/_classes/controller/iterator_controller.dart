// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

abstract interface class InterfaceIterator<T extends num, K, M> {
  void reset();
  int get length;
  bool get isFirst;
  bool get isFinished;
  bool get isEmpty;
  M? get next;
  void jumpTo(T key);
  Iterable<M?> loop();
  List<M> chunk(int length);
  List<M> getTill(T boundary);
  List<M> toList();
}

class IteratorController<T extends num, K, M> implements InterfaceIterator<T, K, M> {
  SplayTreeMap<T, K> data;
  T? boundary;
  Function? filter;
  late List<T> keys = data.keys.toList();
  int pointer = 0;
  // ignore: prefer_final_fields
  int _pointer = 0;
  Function transform;

  IteratorController(this.data, {required this.transform, this.boundary, this.filter});

  @override
  int get length => data.length;

  @override
  void reset() => pointer = 0;

  @override
  bool get isEmpty => data.isEmpty;

  @override
  bool get isFirst => _pointer == pointer;

  @override
  bool get isFinished => keys.length == pointer;

  @override
  void jumpTo(T key) {
    final nextKey = data.firstKeyAfter(key);
    pointer = nextKey != null ? keys.indexOf(nextKey) : keys.length - 1;
  }

  @override
  Iterable<M?> loop() sync* {
    while (pointer < keys.length) {
      final index = keys.elementAt(pointer++);
      if (boundary != null && boundary! < index) {
        break;
      }
      M? value = transform(data[index] ?? '');
      if (filter?.call(value) == true) {
        continue;
      }
      yield value;
    }
  }

  @override
  M? get next {
    final iterator = loop().iterator;
    return iterator.moveNext() ? iterator.current as M : null;
  }

  @override
  List<M> chunk(int length) {
    final result = List.generate(length, (_) => next);
    result.removeWhere((e) => e == null);
    return result.cast<M>();
  }

  @override
  List<M> toList() => [...loop()].cast();

  @override
  List<M> getTill(T boundary) {
    final result = <M>[];
    while (!isFinished && boundary > keys[pointer]) {
      final value = next;
      if (boundary <= keys[pointer - 1]) {
        pointer--;
        break;
      }
      if (value == null) {
        break;
      }
      result.add(value);
    }
    return result;
  }
}

class IteratorReverseController<T extends num, K, M> extends IteratorController<T, K, M> {
  IteratorReverseController(super.data, {required super.transform, super.boundary, super.filter}) {
    pointer = data.keys.length - 1;
    _pointer = pointer;
  }

  @override
  bool get isFinished => pointer < 0;

  @override
  void reset() => data.keys.length - 1;

  @override
  void jumpTo(T key) {
    final nextKey = data.lastKeyBefore(key);
    pointer = nextKey != null ? keys.indexOf(nextKey) : 0;
  }

  @override
  Iterable<M?> loop() sync* {
    while (pointer >= 0) {
      final index = keys.elementAt(pointer--);
      if (boundary != null && boundary! > index) {
        break;
      }
      M? value = transform(data[index] ?? '');
      if (filter?.call(value) == true) {
        continue;
      }
      yield value;
    }
  }

  @override
  List<M> getTill(T boundary) {
    final result = <M>[];
    while (!isFinished && boundary < keys[pointer]) {
      final value = next;
      if (boundary >= keys[pointer + 1]) {
        pointer++;
        break;
      }
      if (value == null) {
        break;
      }
      result.add(value);
    }
    return result;
  }
}
