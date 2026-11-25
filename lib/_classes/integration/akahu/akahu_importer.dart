// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/akahu/akahu_client.dart';
import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:uuid/uuid.dart';

class AkahuImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;
  // Budget category of the application named as the category of Akahu (e.g. "Supermarkets", "Food")
  final String? Function(String name)? budgetOf;

  const AkahuImporter({required this.exists, required this.add, this.budgetOf});

  static String uuidOf(String accountId, String transactionId) =>
      const Uuid().v5(Namespace.url.value, 'akahu:$accountId:$transactionId');

  IntegrationImportResult run({
    required AkahuAccount source,
    required List<AkahuTransaction> transactions,
    required String account,
    required String category,
    int pending = 0,
    BudgetPrediction? prediction,
  }) {
    var added = 0;
    var skipped = 0;
    for (final transaction in transactions) {
      final uuid = uuidOf(source.id, transaction.id);
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      final matched = transaction.categories.map((e) => budgetOf?.call(e)).whereType<String>().firstOrNull;
      add(
        IntegrationRecord.toAppData(
          amount: transaction.amount,
          currency: source.currency,
          date: transaction.date,
          title: transaction.description,
          account: account,
          category: matched ?? category,
          // A matching budget category is preferred to the prediction
          prediction: matched == null ? prediction : null,
        ),
        uuid,
      );
      added++;
    }
    return (added: added, skipped: skipped, pending: pending);
  }
}
