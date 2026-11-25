// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/monzo/monzo_client.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:uuid/uuid.dart';

class MonzoImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;

  const MonzoImporter({required this.exists, required this.add});

  static String uuidOf(String accountId, String transactionId) =>
      const Uuid().v5(Namespace.url.value, 'monzo:$accountId:$transactionId');

  IntegrationImportResult run({
    required String accountId,
    required List<MonzoTransaction> transactions,
    required String account,
    required String category,
    BudgetPrediction? prediction,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    for (final transaction in transactions) {
      // Declined transactions moved no money
      if (transaction.declined) {
        continue;
      }
      if (transaction.pending) {
        pending++;
        continue;
      }
      final uuid = uuidOf(accountId, transaction.id);
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      add(
        IntegrationRecord.toAppData(
          amount: transaction.amount,
          currency: transaction.currency,
          date: transaction.created,
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
