// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_classes/structure/goal_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/payment_app_data.dart';

extension DataExt on String {
  AbstractAppData? toDataObject(Map<String, dynamic> data, AppData store) => switch (this) {
        'GoalAppData' => GoalAppData.fromJson(data),
        'AccountAppData' => AccountAppData.fromJson(data),
        'BillAppData' => BillAppData.fromJson(data)..setState(store),
        'BudgetAppData' => BudgetAppData.fromJson(data)..setState(store),
        'CurrencyAppData' => CurrencyAppData.fromJson(data),
        'InvoiceAppData' => InvoiceAppData.fromJson(data)..setState(store),
        'PaymentAppData' => PaymentAppData.fromJson(data),
        _ => null,
      };
}
