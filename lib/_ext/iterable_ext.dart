// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/controller/iterator_controller.dart';

extension TreeExt<T, K> on SplayTreeMap<T, K> {
  InterfaceIterator<T, K> toStream(bool inverse) =>
      inverse ? IteratorReverseController<T, K>(this) : IteratorController<T, K>(this);
}
