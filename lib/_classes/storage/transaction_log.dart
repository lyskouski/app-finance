// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TransactionLog {
  static int increment = 0;

  static bool _isLocked = false;

  static File? _logFile;

  static Future<File> _get(Directory path) async {
    File file = File('${path.absolute.path}/.terCAD/app-finance.log');
    if (!file.existsSync()) {
      file.createSync(recursive: true);
      file.writeAsString("\n", mode: FileMode.append);
    }
    return file;
  }

  static Future<File> get logFle async {
    if (_logFile != null) {
      return Future.value(_logFile);
    }
    File? file;
    try {
      final dir = await getApplicationDocumentsDirectory();
      file = await _get(dir);
    } catch (e) {
      file = await _get(Directory.systemTemp);
    }
    return _logFile = file;
  }

  static String _formatBytes(int bytes) {
    const sizes = ['B', 'KB', 'MB', 'GB', 'TB'];
    if (bytes == 0) return '0 B';
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${sizes[i]}';
  }

  static Future<String> getSize() async {
    int? size;
    if (kIsWeb) {
      size = increment * 256;
    } else {
      size = (await logFle).lengthSync();
    }
    return _formatBytes(size);
  }

  static void saveRaw(String line) {
    int retrial = 1;
    while (_isLocked && retrial < 1000) {
      sleep(Duration(microseconds: retrial * 10));
      retrial++;
    }
    _isLocked = true;
    try {
      if (kIsWeb) {
        AppPreferences.set('log$increment', line);
      } else {
        _logFile!.writeAsStringSync("$line\n", mode: FileMode.append);
      }
      _isLocked = false;
    } catch (e) {
      _isLocked = false;
      rethrow;
    }
  }

  static void save(dynamic content) {
    String line = content.toString();
    if (EncryptionHandler.doEncrypt()) {
      line = EncryptionHandler.encrypt(line);
    }
    saveRaw(line);
    increment++;
  }

  static void init(AppData store, String type, Map<String, dynamic> data) {
    final goal = GoalAppData(title: '', initial: 0.0).getClassName();
    final account = AccountAppData(title: '', type: '').getClassName();
    final bill = BillAppData(title: '', account: '', category: '').getClassName();
    final budget = BudgetAppData(title: '', amountLimit: 0.0).getClassName();
    final currency = CurrencyAppData(title: '').getClassName();
    final invoice = InvoiceAppData(title: '', account: '').getClassName();
    final typeToClass = {
      goal: (data) => GoalAppData.fromJson(data),
      account: (data) => AccountAppData.fromJson(data),
      bill: (data) => BillAppData.fromJson(data)..setState(store),
      budget: (data) => BudgetAppData.fromJson(data),
      currency: (data) => CurrencyAppData.fromJson(data),
      invoice: (data) => InvoiceAppData.fromJson(data),
    };
    final obj = typeToClass[type];
    if (obj != null) {
      final el = obj(data);
      store.update(el.uuid ?? '', el, true);
    }
  }

  static Stream<String> _loadWeb() async* {
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

  static Stream<String> read() async* {
    Stream<String> lines;
    increment = 0;
    if (kIsWeb) {
      lines = _loadWeb();
    } else {
      lines = (await logFle).openRead().transform(utf8.decoder).transform(const LineSplitter());
    }
    await for (var line in lines) {
      if (!kIsWeb) {
        increment++;
      }
      yield line;
    }
  }

  static Future<bool> load(AppData store) async {
    bool isEncrypted = EncryptionHandler.doEncrypt();
    bool isOK = true;
    await for (var line in read()) {
      isOK &= add(store, line, isEncrypted);
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
      if (EncryptionHandler.getHash(obj['data']) == obj['type']['hash'] &&
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
