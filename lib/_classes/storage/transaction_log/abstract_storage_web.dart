// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/transaction_log/interface_storage.dart';
import 'package:app_finance/_ext/int_ext.dart';

abstract class AbstractStorage implements InterfaceStorage {
  static int increment = 0;

  static Future<String> getSize() async {
    int size = increment * 256;
    return size.toByteSize();
  }

  static void saveRaw(String line) {
    AppPreferences.set('log$increment', line);
    increment++;
  }

  static Stream<String> read() async* {
    increment = 0;
    int attempts = 0;
    do {
      int i = increment + attempts;
      var line = AppPreferences.get('log$i');
      if (line == null) {
        attempts++;
      } else {
        increment += attempts + 1;
        attempts = 0;
      }
      yield line ?? '';
    } while (attempts < 10);
  }

  static void clear() {
    while (increment > 0) {
      AppPreferences.clear('log$increment');
      increment--;
    }
  }
}
