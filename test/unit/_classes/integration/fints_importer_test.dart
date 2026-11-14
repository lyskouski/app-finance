// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/fints/fints_importer.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:fints/fints.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Transaction tx(
  int cents, {
  TransactionStatus status = TransactionStatus.booked,
  String? name,
  String? purpose,
  String? reference,
  DateTime? date,
}) =>
    Transaction(
      status: status,
      valueDate: date ?? DateTime(2026, 11, 2),
      bookingDate: date ?? DateTime(2026, 11, 3),
      amount: Amount(cents, 2, 'EUR'),
      counterpartyName: name,
      purpose: purpose,
      endToEndId: reference,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FinTsImporter', () {
    late Map<String, InterfaceAppData> store;
    late FinTsImporter importer;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      store = {};
      importer = FinTsImporter(
        exists: store.containsKey,
        add: (item, uuid) => store[uuid] = item..uuid = uuid,
      );
    });

    FinTsImportResult run(List<Transaction> transactions) => importer.run(
          accountKey: 'DE02120300000000202051',
          transactions: transactions,
          account: 'account-uuid',
          category: 'budget-uuid',
        );

    test('converts debits into bills and credits into invoices', () {
      final result = run([
        tx(-1250, name: 'Bakery', purpose: 'Bread'),
        tx(250000, name: 'Employer', purpose: 'Salary 11/2026'),
      ]);

      expect(result, (added: 2, skipped: 0, pending: 0));
      final bill = store.values.whereType<BillAppData>().single;
      expect(bill.details, 12.5);
      expect(bill.title, 'Bakery — Bread');
      expect(bill.account, 'account-uuid');
      expect(bill.category, 'budget-uuid');
      expect(bill.currency?.code, 'EUR');
      expect(bill.createdAt, DateTime(2026, 11, 3));
      final invoice = store.values.whereType<InvoiceAppData>().single;
      expect(invoice.details, 2500.0);
      expect(invoice.title, 'Employer — Salary 11/2026');
    });

    test('leaves pending transactions out', () {
      final result = run([tx(-100, status: TransactionStatus.pending), tx(-200)]);

      expect(result, (added: 1, skipped: 0, pending: 1));
    });

    test('skips transactions imported before', () {
      final first = [tx(-100, reference: 'E2E-1'), tx(-200, reference: 'E2E-2')];
      expect(run(first), (added: 2, skipped: 0, pending: 0));

      final overlapping = [...first, tx(-300, reference: 'E2E-3')];
      expect(run(overlapping), (added: 1, skipped: 2, pending: 0));
      expect(store.length, 3);
    });

    test('keeps identical transactions of one day apart', () {
      final coffee = [tx(-350, purpose: 'Coffee'), tx(-350, purpose: 'Coffee')];

      expect(run(coffee), (added: 2, skipped: 0, pending: 0));
      expect(run(coffee), (added: 0, skipped: 2, pending: 0));
    });

    test('derives the same uuid for other accounts differently', () {
      run([tx(-100, reference: 'E2E-1')]);
      final other = importer.run(
        accountKey: 'DE89370400440532013000',
        transactions: [tx(-100, reference: 'E2E-1')],
        account: 'account-uuid',
        category: 'budget-uuid',
      );

      expect(other.added, 1);
      expect(store.length, 2);
    });

    test('falls back to the booking text for a title', () {
      final item = FinTsImporter.convert(
        Transaction(valueDate: DateTime(2026), amount: Amount(-100, 2, 'EUR'), bookingText: 'Fee'),
        account: 'a',
        category: 'b',
      );

      expect(item.title, 'Fee');
    });
  });
}
