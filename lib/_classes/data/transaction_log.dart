// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/bill_app_data.dart';
import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/_classes/data/currency_app_data.dart';
import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TransactionLog with SharedPreferencesMixin {
  static String prefIsEncrypted = 'true';

  static int increment = 0;

  static Encrypter get salt =>
      Encrypter(AES(Key.fromUtf8('tercad-app-finance-by-vlyskouski')));

  static IV get code => IV.fromLength(8);

  static Future<File> get _logFle async {
    final path = await getApplicationDocumentsDirectory();
    var file = File('${path.absolute.path}/terCAD/app-finance.log');
    if (!(await file.exists())) {
      await file.create(recursive: true);
    }
    return file;
  }

  static String getHash(Map<String, dynamic> data) {
    return md5.convert(utf8.encode(data.toString())).toString();
  }

  static bool doEncrypt() {
    final self = TransactionLog();
    return self.getPreference(self.prefDoEncrypt) == prefIsEncrypted;
  }

  static Future<void> save(dynamic content) async {
    String line = content.toString();
    if (doEncrypt()) {
      line = salt.encrypt(line, iv: code).base64;
    }
    if (kIsWeb) {
      TransactionLog().setPreference('log$increment', line);
      increment++;
    } else {
      (await _logFle).writeAsString("$line\n", mode: FileMode.append);
    }
  }

  static void init(AppData store, String type, Map<String, dynamic> data) {
    final goal = GoalAppData(title: '', initial: 0.0).getClassName();
    final account = AccountAppData(title: '', type: '').getClassName();
    final bill =
        BillAppData(title: '', account: '', category: '').getClassName();
    final budget = BudgetAppData(title: '', amountLimit: 0.0).getClassName();
    final currency = CurrencyAppData(title: '').getClassName();
    final typeToClass = {
      goal: (data) => GoalAppData.fromJson(data),
      account: (data) => AccountAppData.fromJson(data),
      bill: (data) => BillAppData.fromJson(data),
      budget: (data) => BudgetAppData.fromJson(data),
      currency: (data) => CurrencyAppData.fromJson(data),
    };
    final obj = typeToClass[type];
    if (obj != null) {
      final el = obj(data);
      el.setState(store);
      store.update(el.getType(), el.uuid ?? '', el, true);
    }
  }

  static Stream<String> _loadWeb() async* {
    int attempts = 0;
    do {
      int i = increment + attempts;
      var line = TransactionLog().getPreference('log$i');
      if (line == null) {
        attempts++;
      } else {
        increment += attempts + 1;
        attempts = 0;
      }
      yield line ?? '';
    } while (attempts < 10);
  }

  static Future<bool> load(AppData store) async {
    Stream<String> lines;
    if (kIsWeb) {
      lines = _loadWeb();
    } else {
      lines = (await _logFle)
          .openRead()
          .transform(utf8.decoder)
          .transform(const LineSplitter());
    }
    bool isEncrypted = doEncrypt();
    bool isOK = true;
    await for (var line in lines) {
      if (line == '') {
        continue;
      }
      try {
        if (isEncrypted) {
          line = salt.decrypt64(line, iv: code);
        }
        var obj = json.decode(line);
        if (getHash(obj['data']) == obj['type']['hash']) {
          init(store, obj['type']['name'], obj['data']);
        } else {
          // Corrupted data... skip
        }
        // ignore: unused_catch_stack
      } catch (e, stackTrace) {
        // print([e, stackTrace]);
        isOK = false;
      }
    }
    return isOK;
  }
}
