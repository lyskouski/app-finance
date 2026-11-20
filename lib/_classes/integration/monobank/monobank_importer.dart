// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/monobank/monobank_client.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:uuid/uuid.dart';

class MonobankImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;
  final Map<int, String> categories;
  final Map<String, int> records = {};
  DateTime? pendingSince;

  MonobankImporter({required this.exists, required this.add, Map<int, String>? categories})
      : categories = categories ?? {};

  static String recordUuid(String account, String id) => const Uuid().v5(Namespace.url.value, 'monobank:$account:$id');

  static Map<int, String> learn(Map<String, int> records, String? Function(String uuid) categoryOf) {
    final votes = <int, Map<String, int>>{};
    records.forEach((uuid, mcc) {
      final category = categoryOf(uuid);
      if (category != null) {
        final scope = votes.putIfAbsent(mcc, () => {});
        scope[category] = (scope[category] ?? 0) + 1;
      }
    });
    return votes.map((mcc, scope) => MapEntry(mcc, scope.entries.reduce((a, b) => b.value > a.value ? b : a).key));
  }

  IntegrationImportResult run({
    required String id,
    required List<MonobankTransaction> transactions,
    required String account,
    required String category,
    required String currency,
    BudgetPrediction? prediction,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    for (final transaction in transactions) {
      if (transaction.amount == 0) {
        continue;
      }
      if (transaction.isHold) {
        pending++;
        if (pendingSince == null || transaction.date.isBefore(pendingSince!)) {
          pendingSince = transaction.date;
        }
        continue;
      }
      final uuid = recordUuid(id, transaction.id);
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      final item = IntegrationRecord.toAppData(
        amount: MonobankClient.fromMinor(transaction.amount, currency),
        currency: currency,
        date: transaction.date,
        title: transaction.title,
        account: account,
        category: category,
        prediction: prediction,
      );
      final mcc = transaction.mcc;
      if (item is BillAppData && mcc != null) {
        final known = categories[mcc];
        if (known != null) {
          item.category = known;
        }
        records[uuid] = mcc;
      }
      add(item, uuid);
      added++;
    }
    return (added: added, skipped: skipped, pending: pending);
  }
}
