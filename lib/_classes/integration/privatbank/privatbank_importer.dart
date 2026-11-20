// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/privatbank/privatbank_client.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:uuid/uuid.dart';

class PrivatBankImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;

  const PrivatBankImporter({required this.exists, required this.add});

  static String recordUuid(String iban, String id) => const Uuid().v5(Namespace.url.value, 'privatbank:$iban:$id');

  IntegrationImportResult run({
    required String iban,
    required List<PrivatBankTransaction> transactions,
    required String account,
    required String category,
    String? currency,
    BudgetPrediction? prediction,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    for (final transaction in transactions) {
      if (transaction.isPending) {
        pending++;
        continue;
      }
      // Reversed and rejected operations are not a part of the balance
      if (!transaction.isBooked) {
        continue;
      }
      final uuid = recordUuid(iban, transaction.id);
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      add(
        IntegrationRecord.toAppData(
          amount: transaction.amount,
          currency: transaction.currency.isNotEmpty ? transaction.currency : currency,
          date: transaction.date,
          title: transaction.title,
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
