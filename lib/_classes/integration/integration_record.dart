// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

typedef IntegrationImportResult = ({int added, int skipped, int pending});

class IntegrationRecord {
  static InterfaceAppData toAppData({
    required double amount,
    required String? currency,
    required DateTime date,
    required String title,
    required String account,
    required String category,
  }) {
    final code = currency != null ? CurrencyProvider.find(currency) : null;
    if (amount < 0) {
      return BillAppData(
        account: account,
        category: category,
        title: title,
        details: amount.abs(),
        currency: code,
        createdAt: date,
        updatedAt: date,
        hidden: false,
      );
    }
    return InvoiceAppData(
      account: account,
      title: title,
      details: amount,
      currency: code,
      createdAt: date,
      updatedAt: date,
      hidden: false,
    );
  }
}
