// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/teller/teller_client.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:uuid/uuid.dart';

class TellerImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;

  const TellerImporter({required this.exists, required this.add});

  static String uuidOf(String accountId, String transactionId) =>
      const Uuid().v5(Namespace.url.value, 'teller:$accountId:$transactionId');

  IntegrationImportResult run({
    required TellerAccount source,
    required List<TellerTransaction> transactions,
    required String account,
    required String category,
    BudgetPrediction? prediction,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    for (final transaction in transactions) {
      final date = transaction.date;
      // Pending transactions may change (or get a new id) when posted
      if (transaction.pending || date == null) {
        pending++;
        continue;
      }
      final uuid = uuidOf(source.id, transaction.id);
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      add(
        IntegrationRecord.toAppData(
          amount: transaction.amount,
          currency: source.currency.isEmpty ? null : source.currency,
          date: date,
          title: transaction.description,
          account: account,
          category: category,
          prediction: prediction,
        ),
        uuid,
      );
      added++;
    }
    return (added: added, skipped: skipped, pending: pending);
  }
}
