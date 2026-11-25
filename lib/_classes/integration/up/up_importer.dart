// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/up/up_client.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:uuid/uuid.dart';

class UpImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;

  const UpImporter({required this.exists, required this.add});

  static String uuidOf(String transactionId) => const Uuid().v5(Namespace.url.value, 'up:$transactionId');

  // A transfer between Up accounts is listed in both of them (with different ids). When both are linked to the
  // application's accounts, it is recorded once, by the receiving one: the sending side is left out. Round Ups
  // are listed only in the receiving saver, so they are recorded as transfers as well.
  // [links] maps Up account ids to the application's accounts.
  IntegrationImportResult run({
    required UpAccount source,
    required List<UpTransaction> transactions,
    required String account,
    required String category,
    Map<String, String> links = const {},
    BudgetPrediction? prediction,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    for (final transaction in transactions) {
      if (transaction.held) {
        pending++;
        continue;
      }
      final other = transaction.transferAccount != null ? links[transaction.transferAccount] : null;
      if (other != null && other != account && transaction.amount.value < 0) {
        continue;
      }
      final uuid = uuidOf(transaction.id);
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      final value = transaction.amount;
      add(
        other != null && other != account
            ? InvoiceAppData(
                title: transaction.description,
                account: account,
                accountFrom: other,
                details: value.value.abs(),
                currency: CurrencyProvider.find(value.currency),
                createdAt: transaction.date,
                updatedAt: transaction.date,
                hidden: false,
              )
            : IntegrationRecord.toAppData(
                amount: value.value,
                currency: value.currency,
                date: transaction.date,
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
