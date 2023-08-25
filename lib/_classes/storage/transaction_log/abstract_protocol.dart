// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/transaction_log.dart';

abstract class AbstractProtocol {
  Future<List<int>> exportTransactions() async {
    List<int> codeUnits = [];
    await for (String line in TransactionLog.read()) {
      codeUnits.addAll(line.codeUnits);
      codeUnits.addAll('\n'.codeUnits);
    }
    return codeUnits;
  }

  void importTransactions(List<int> codeUnits) {
    List<String> lines = String.fromCharCodes(codeUnits).split('\n');
    for (String line in lines) {
      if (line.trim() == '') {
        continue;
      }
      TransactionLog.save(line, true);
    }
  }
}
