// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:flutter/material.dart';

class DataHandler {
  static void deactivate(NavigatorState nav, {required AppData store, String? uuid, InterfaceAppData? data}) {
    assert(uuid != null || data != null);
    final obj = data ?? store.getByUuid(uuid!);
    obj.deactivate();
    store.update(obj.uuid, obj);
    store.restate();
    nav.pop();
  }
}
