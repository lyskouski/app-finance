// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/simplefin/simplefin_client.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:uuid/uuid.dart';

class SimpleFinImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;

  const SimpleFinImporter({required this.exists, required this.add});

  IntegrationImportResult run({
    required SimpleFinAccount source,
    required String account,
    required String category,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    for (final transaction in source.transactions) {
      final date = transaction.date;
      if (transaction.pending || date == null) {
        pending++;
        continue;
      }
      final uuid = const Uuid().v5(Namespace.url.value, 'simplefin:${source.id}:${transaction.id}');
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      add(
        IntegrationRecord.toAppData(
          amount: transaction.amount,
          currency: source.currency,
          date: date,
          title: transaction.description,
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
