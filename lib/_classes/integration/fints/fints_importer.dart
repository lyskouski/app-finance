// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:fints/fints.dart';
import 'package:uuid/uuid.dart';

typedef FinTsImportResult = IntegrationImportResult;

class FinTsImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;

  const FinTsImporter({required this.exists, required this.add});

  FinTsImportResult run({
    required String accountKey,
    required List<Transaction> transactions,
    required String account,
    required String category,
  }) {
    var added = 0;
    var skipped = 0;
    var pending = 0;
    final occurrences = <String, int>{};
    for (final transaction in transactions) {
      if (transaction.isPending) {
        pending++;
        continue;
      }
      final fingerprint = _fingerprint(accountKey, transaction);
      final index = occurrences.update(fingerprint, (value) => value + 1, ifAbsent: () => 0);
      final uuid = const Uuid().v5(Namespace.url.value, 'fints:$fingerprint#$index');
      if (exists(uuid)) {
        skipped++;
        continue;
      }
      add(convert(transaction, account: account, category: category), uuid);
      added++;
    }
    return (added: added, skipped: skipped, pending: pending);
  }

  static InterfaceAppData convert(Transaction transaction, {required String account, required String category}) =>
      IntegrationRecord.toAppData(
        amount: transaction.amount.value,
        currency: transaction.amount.currency,
        date: transaction.bookingDate ?? transaction.valueDate,
        title: getTitle(transaction),
        account: account,
        category: category,
      );

  static String getTitle(Transaction transaction) {
    final parts = [transaction.counterpartyName, transaction.purpose]
        .map((e) => e?.trim() ?? '')
        .where((e) => e.isNotEmpty)
        .toList();
    return parts.isNotEmpty ? parts.join(' — ') : (transaction.bookingText?.trim() ?? '');
  }

  static String _fingerprint(String accountKey, Transaction transaction) {
    final reference = transaction.endToEndId ?? transaction.bankReference ?? transaction.customerReference ?? '';
    return [
      accountKey,
      transaction.valueDate.toIso8601String().substring(0, 10),
      transaction.amount.minorUnits,
      transaction.amount.scale,
      transaction.amount.currency,
      reference == 'NOTPROVIDED' ? '' : reference,
      transaction.counterpartyIban ?? '',
      transaction.purpose ?? '',
    ].join('|');
  }
}
