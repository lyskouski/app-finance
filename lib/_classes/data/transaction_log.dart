// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:app_finance/_classes/data/goal_app_data.dart';
import 'package:app_finance/data.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:path_provider/path_provider.dart';

class TransactionLog {
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

  static void save(dynamic content) async {
    (await _logFle).writeAsString(
        "${salt.encrypt(content.toString(), iv: code).base64}\n",
        mode: FileMode.append);
  }

  static void init(AppData store, String type, Map<String, dynamic> data) {
    switch (type) {
      case 'GoalAppData':
        var el = GoalAppData.fromJson(data);
        store.update(AppDataType.goals, el.uuid ?? '', el, true);
        break;
    }
  }

  static Future<bool> load(AppData store) async {
    Stream<String> lines = (await _logFle)
        .openRead()
        .transform(utf8.decoder)
        .transform(const LineSplitter());
    try {
      await for (var line in lines) {
        var obj = json.decode(salt.decrypt64(line, iv: code));
        if (getHash(obj['data']) == obj['type']['hash']) {
          init(store, obj['type']['name'], obj['data']);
        } else {
          // Corrupted data... skip
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
