// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:async';
import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/transaction_log/abstract_storage_web.dart'
    if (dart.library.io) 'package:app_finance/_classes/storage/transaction_log/abstract_storage.dart';
import 'package:app_finance/_classes/storage/transaction_log/interface_storage.dart';
import 'package:app_finance/_ext/data_ext.dart';

class TransactionLog extends AbstractStorage implements InterfaceStorage {
  static int amount = 0;

  static Future<String> getSize() => AbstractStorage.getSize();

  static void clear() => AbstractStorage.clear();

  static Stream<String> read() => AbstractStorage.read();

  static void saveRaw(String line) => AbstractStorage.saveRaw(line);

  static void save(dynamic content) {
    String line = content.toString();
    if (EncryptionHandler.doEncrypt()) {
      line = EncryptionHandler.encrypt(line);
    }
    saveRaw(line);
    amount++;
  }

  static void init(AppData store, String type, Map<String, dynamic> data) {
    final obj = type.toDataObject(data, store);
    if (obj != null) {
      store.update(obj.uuid ?? '', obj, true);
    }
  }

  static Future<bool> load(AppData store) async {
    bool isEncrypted = EncryptionHandler.doEncrypt();
    bool isOK = true;
    amount = 0;
    await for (var line in read()) {
      isOK &= add(store, line, isEncrypted);
      amount++;
    }
    return isOK;
  }

  static bool add(AppData store, String line, bool isEncrypted, [bool onlyNew = false]) {
    bool isOK = true;
    if (line == '') {
      return isOK;
    }
    try {
      if (isEncrypted) {
        line = EncryptionHandler.decrypt(line);
      }
      var obj = json.decode(line);
      // FIXME: hash is not always the same for Web
      if ( // EncryptionHandler.getHash(obj['data']) == obj['type']['hash'] &&
          (!onlyNew || store.getByUuid(obj['data']['uuid']) == null)) {
        init(store, obj['type']['name'], obj['data']);
      } else {
        // Corrupted data... skip
      }
      // ignore: unused_catch_stack
    } catch (e, stackTrace) {
      // print([e, stackTrace]);
      isOK = false;
    }
    return isOK;
  }
}
