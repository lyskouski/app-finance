// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/transaction_log/interface_storage.dart';
import 'package:app_finance/_ext/int_ext.dart';
import 'package:idb_shim/idb_browser.dart';

abstract class AbstractStorage implements InterfaceStorage {
  static int increment = 0;
  static const String storeName = 'records';
  static Database? db;

  static Future<void> _initIndexedDB() async {
    IdbFactory? idbFactory = getIdbFactory();
    if (idbFactory == null) {
      return;
    }
    db = await idbFactory.open('fingrom.db', version: 1, onUpgradeNeeded: (VersionChangeEvent event) {
      event.database.createObjectStore(storeName, keyPath: 'id');
    });
  }

  static Future<String> getSize() async {
    int size = increment * 256;
    return size.toByteSize();
  }

  static void saveRaw(String line) {
    if (db != null) {
      var store = db!.transaction(storeName, 'readwrite').objectStore(storeName);
      store.put({'id': 'log$increment', 'line': line});
    } else {
      AppPreferences.set('log$increment', line);
    }
    increment++;
  }

  static Stream<String> readRaw(Function callback) async* {
    int attempts = 0;
    do {
      int i = increment + attempts;
      String? line = await callback(i);
      if (line == null) {
        attempts++;
      } else {
        increment += attempts + 1;
        attempts = 0;
      }
      yield line ?? '';
    } while (attempts < 10);
  }

  static Stream<String> read() async* {
    increment = 0;
    await _initIndexedDB();
    await for (var line in readRaw((i) => AppPreferences.get('log$i'))) {
      yield line;
    }
    if (db != null) {
      var store = db!.transaction(storeName, 'readonly').objectStore(storeName);
      await for (var line in readRaw((i) async => ((await store.getObject('log$i')) as Map?)?['line'])) {
        yield line;
      }
    }
  }

  static void clear() {
    while (increment > 0) {
      AppPreferences.clear('log$increment');
      if (db != null) {
        db!.transaction(storeName, 'readwrite').objectStore(storeName).delete('log$increment');
      }
      increment--;
    }
  }
}
