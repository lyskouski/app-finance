// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/controller/iterator_controller.dart';

extension TreeExt<T extends num, K> on SplayTreeMap<T, K> {
  InterfaceIterator<T, K, M> toStream<M>(bool inverse, {required Function transform, T? boundary, Function? filter}) =>
      inverse
          ? IteratorReverseController<T, K, M>(this, transform: transform, boundary: boundary, filter: filter)
          : IteratorController<T, K, M>(this, transform: transform, boundary: boundary, filter: filter);
}
