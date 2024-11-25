// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/design/form/list_selector_item.dart';

enum AppPaymentType { bill, invoice, transfer }

class PaymentType {
  static List<ListSelectorItem> getList() {
    return [
      ListSelectorItem(id: AppPaymentType.bill.name, name: AppLocale.labels.bill),
      ListSelectorItem(id: AppPaymentType.invoice.name, name: AppLocale.labels.flowTypeInvoice),
      ListSelectorItem(id: AppPaymentType.transfer.name, name: AppLocale.labels.transferHeadline),
    ];
  }

  static String getLabel(String id) => getList().firstWhere((e) => e.id == id).name;

  static bool contains(String id, List<AppPaymentType> type) => type.map((e) => e.toString()).contains(id);
}
