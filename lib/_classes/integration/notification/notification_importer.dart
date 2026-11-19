// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/notification/notification_channel.dart';
import 'package:app_finance/_classes/integration/notification/notification_parser.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:uuid/uuid.dart';

typedef NotificationImportResult = ({int added, int skipped, int pending, List<String> processed});

class NotificationImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;

  const NotificationImporter({required this.exists, required this.add});

  static String recordUuid(NotificationRecord record) => const Uuid().v5(
        Namespace.url.value,
        'notification:${record.package}:${record.time.millisecondsSinceEpoch}:${record.title}:${record.text}',
      );

  // Processed (imported or already present) notifications are returned to be removed from the buffer,
  // not recognized ones are kept as pending to be adjusted by a custom pattern
  NotificationImportResult run({
    required List<NotificationRecord> records,
    required String account,
    required String category,
    required DateTime from,
    Currency? currency,
    String? pattern,
    List<String> income = NotificationParser.incomeKeywords,
    List<String> balance = NotificationParser.balanceKeywords,
    BudgetPrediction? prediction,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    final processed = <String>[];
    for (final record in records) {
      if (record.time.isBefore(from)) {
        continue;
      }
      final uuid = recordUuid(record);
      if (exists(uuid)) {
        skipped++;
        processed.add(record.id);
        continue;
      }
      final parsed = NotificationParser.parse(
        record.title,
        record.text,
        pattern: pattern,
        fallback: currency,
        income: income,
        balance: balance,
      );
      if (parsed == null) {
        pending++;
        continue;
      }
      add(
        IntegrationRecord.toAppData(
          amount: parsed.amount,
          currency: parsed.currency ?? currency?.code,
          date: record.time,
          title: parsed.title,
          account: account,
          category: category,
          prediction: prediction,
        ),
        uuid,
      );
      added++;
      processed.add(record.id);
    }
    return (added: added, skipped: skipped, pending: pending, processed: processed);
  }
}
