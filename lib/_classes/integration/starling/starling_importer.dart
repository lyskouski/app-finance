// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/starling/starling_client.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:uuid/uuid.dart';

class StarlingImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;

  const StarlingImporter({required this.exists, required this.add});

  static String uuidOf(String accountId, String feedItemId) =>
      const Uuid().v5(Namespace.url.value, 'starling:$accountId:$feedItemId');

  IntegrationImportResult run({
    required String accountId,
    required List<StarlingFeedItem> items,
    required String account,
    required String category,
    BudgetPrediction? prediction,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    for (final item in items) {
      if (item.status == StarlingStatus.ignored) {
        continue;
      }
      if (item.status == StarlingStatus.pending) {
        pending++;
        continue;
      }
      final uuid = uuidOf(accountId, item.id);
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      add(
        IntegrationRecord.toAppData(
          amount: item.amount,
          currency: item.currency,
          date: item.date,
          title: item.title,
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
