// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/enablebanking/enablebanking_client.dart';
import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:uuid/uuid.dart';

class EnableBankingImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;

  const EnableBankingImporter({required this.exists, required this.add});

  IntegrationImportResult run({
    required String accountKey,
    required List<EnableBankingTransaction> transactions,
    required String account,
    required String category,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    final occurrences = <String, int>{};
    for (final transaction in transactions) {
      final date = transaction.date;
      if (!transaction.isBooked || date == null) {
        pending++;
        continue;
      }
      final reference = transaction.reference ??
          [date.toIso8601String().substring(0, 10), transaction.amount, transaction.currency, transaction.title]
              .join('|');
      final index = occurrences.update(reference, (value) => value + 1, ifAbsent: () => 0);
      final uuid = const Uuid().v5(Namespace.url.value, 'enablebanking:$accountKey:$reference#$index');
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      add(
        IntegrationRecord.toAppData(
          amount: transaction.amount,
          currency: transaction.currency,
          date: date,
          title: transaction.title,
          account: account,
          category: category,
        ),
        uuid,
      );
      added++;
    }
    return (added: added, skipped: skipped, pending: pending);
  }
}
