// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:app_finance/_classes/storage/transaction_log/interface_storage.dart';
import 'package:app_finance/_ext/int_ext.dart';
import 'package:path_provider/path_provider.dart';

abstract class AbstractStorage implements InterfaceStorage {
  static File? _logFile;
  static bool _isLocked = false;

  static const filePath = '.terCAD/app-finance.log';

  static Future<File> get logFle async {
    if (_logFile != null) {
      return Future.value(_logFile);
    }
    List<File> scope = [
      await getApplicationDocumentsDirectory(),
      await getApplicationSupportDirectory(),
      Directory.systemTemp,
      await getTemporaryDirectory(),
    ].map((dir) => File('${dir.absolute.path}/$filePath')).toList();
    File? file = scope.where((f) => f.existsSync()).firstOrNull;
    int i = 0;
    while (i < scope.length && file == null) {
      try {
        File tmp = scope[i];
        if (!tmp.existsSync()) {
          tmp.createSync(recursive: true);
          tmp.writeAsString("\n", mode: FileMode.append);
        }
        file = tmp;
      } catch (e) {
        i++;
      }
    }
    if (file == null) {
      throw Exception('Write access denied for: $scope.');
    }
    return _logFile = file;
  }

  static Future<String> getSize() async {
    int size = (await logFle).lengthSync();
    return size.toByteSize();
  }

  static void saveRaw(String line) {
    int retrial = 1;
    while (_isLocked && retrial < 1000) {
      sleep(Duration(microseconds: retrial * 10));
      retrial++;
    }
    _isLocked = true;
    _logFile!.writeAsStringSync("$line\n", mode: FileMode.append);
    _isLocked = false;
  }

  static Stream<String> read() async* {
    Stream<String> lines = (await logFle).openRead().transform(utf8.decoder).transform(const LineSplitter());

    await for (var line in lines) {
      yield line;
    }
  }

  static void clear() {
    _logFile?.deleteSync();
    _logFile?.createSync();
  }
}
