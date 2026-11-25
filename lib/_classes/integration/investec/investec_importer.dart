// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/investec/investec_client.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:uuid/uuid.dart';

class InvestecImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;

  const InvestecImporter({required this.exists, required this.add});

  // Without an identifier of the bank, the transaction is recognized by its attributes
  static String referenceOf(InvestecTransaction transaction) =>
      transaction.uuid ??
      [
        transaction.postingDate?.toIso8601String().substring(0, 10),
        transaction.transactionDate?.toIso8601String().substring(0, 10),
        transaction.signedAmount,
        transaction.description,
      ].join('|');

  IntegrationImportResult run({
    required String accountId,
    required String currency,
    required List<InvestecTransaction> transactions,
    required String account,
    required String category,
    BudgetPrediction? prediction,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    // Equal transactions of the same day (e.g. two coffees) are told apart by their order
    final occurrences = <String, int>{};
    for (final transaction in transactions) {
      final date = transaction.date;
      if (transaction.pending || date == null) {
        pending++;
        continue;
      }
      final reference = referenceOf(transaction);
      final index = occurrences.update(reference, (value) => value + 1, ifAbsent: () => 0);
      final key = transaction.uuid != null ? reference : '$reference#$index';
      final uuid = const Uuid().v5(Namespace.url.value, 'investec:$accountId:$key');
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      add(
        IntegrationRecord.toAppData(
          amount: transaction.signedAmount,
          currency: currency,
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
