// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';

mixin StorageMixin {
  late AppData _state;

  dynamic setState(AppData state) {
    _state = state;
    return this;
  }

  AppData getState() => _state;
}
