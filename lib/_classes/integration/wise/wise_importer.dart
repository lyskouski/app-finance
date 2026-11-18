// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/integration_record.dart';
import 'package:app_finance/_classes/integration/wise/wise_client.dart';
import 'package:app_finance/_classes/math/budget_prediction.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:uuid/uuid.dart';

// Another balance of the same profile linked to an application's account
typedef WiseCounterpart = ({String balanceId, String account});

class WiseImporter {
  final bool Function(String uuid) exists;
  final void Function(InterfaceAppData item, String uuid) add;
  final void Function(CurrencyAppData rate) setRate;

  const WiseImporter({required this.exists, required this.add, required this.setRate});

  static String _uuid(String value) => const Uuid().v5(Namespace.url.value, value);

  static String recordUuid(String balanceId, String type, String reference) =>
      _uuid('wise:$balanceId:$type:$reference');

  static String conversionUuid(int profileId, String reference) => _uuid('wise:$profileId:conversion:$reference');

  IntegrationImportResult run({
    required int profileId,
    required WiseBalance balance,
    required List<WiseTransaction> transactions,
    required String account,
    required String category,
    BudgetPrediction? prediction,
    Map<String, WiseCounterpart> counterparts = const {},
  }) {
    var added = 0;
    var skipped = 0;
    for (final transaction in transactions) {
      final own = recordUuid('${balance.id}', transaction.type, transaction.referenceNumber);
      final counterpart = _counterpart(transaction, balance, counterparts);
      if (counterpart != null) {
        final other = recordUuid(
            counterpart.balanceId, transaction.type == 'DEBIT' ? 'CREDIT' : 'DEBIT', transaction.referenceNumber);
        final uuid = conversionUuid(profileId, transaction.referenceNumber);
        if (exists(uuid) || exists(own) || exists(other)) {
          skipped++;
          continue;
        }
        _addTransfer(transaction, balance, account, counterpart.account, uuid);
        added++;
        continue;
      }
      if (exists(own) || exists(conversionUuid(profileId, transaction.referenceNumber))) {
        skipped++;
        continue;
      }
      add(
        IntegrationRecord.toAppData(
          amount: transaction.amount.value,
          currency: transaction.amount.currency.isNotEmpty ? transaction.amount.currency : balance.currency,
          date: transaction.date,
          title: transaction.description,
          account: account,
          category: category,
          prediction: prediction,
        ),
        own,
      );
      added++;
    }
    return (added: added, skipped: skipped, pending: 0);
  }

  WiseCounterpart? _counterpart(
      WiseTransaction transaction, WiseBalance balance, Map<String, WiseCounterpart> counterparts) {
    if (!transaction.isConversion) {
      return null;
    }
    final source = transaction.sourceAmount!.currency;
    final target = transaction.targetAmount!.currency;
    if (source == target || (source != balance.currency && target != balance.currency)) {
      return null;
    }
    final result = counterparts[source == balance.currency ? target : source];
    return result != null && result.balanceId != '${balance.id}' ? result : null;
  }

  void _addTransfer(WiseTransaction transaction, WiseBalance balance, String account, String other, String uuid) {
    final source = transaction.sourceAmount!;
    final target = transaction.targetAmount!;
    final isOutgoing = source.currency == balance.currency;
    final from = CurrencyProvider.find(source.currency);
    final to = CurrencyProvider.find(target.currency);
    if (from != null && to != null && target.value != 0) {
      // A transfer is kept in the target currency, the source account is charged by the rate
      setRate(CurrencyAppData(currencyFrom: to, currency: from, details: source.value.abs() / target.value.abs()));
    }
    add(
      InvoiceAppData(
        title: transaction.description,
        account: isOutgoing ? other : account,
        accountFrom: isOutgoing ? account : other,
        details: target.value.abs(),
        currency: to,
        createdAt: transaction.date,
        updatedAt: transaction.date,
        hidden: false,
      ),
      uuid,
    );
  }
}
