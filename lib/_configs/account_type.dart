// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/widgets/form/list_selector.dart';

enum AppAccountType {
  account,
  cash,
  debitCard,
  creditCard,
  deposit,
  credit,
}

class AccountType {
  static List<ListSelectorItem> getList() {
    return [
      ListSelectorItem(id: AppAccountType.account.toString(), name: AppLocale.labels.bankAccount),
      ListSelectorItem(id: AppAccountType.cash.toString(), name: AppLocale.labels.cash),
      ListSelectorItem(id: AppAccountType.debitCard.toString(), name: AppLocale.labels.debitCard),
      ListSelectorItem(id: AppAccountType.creditCard.toString(), name: AppLocale.labels.creditCard),
      ListSelectorItem(id: AppAccountType.deposit.toString(), name: AppLocale.labels.deposit),
      ListSelectorItem(id: AppAccountType.credit.toString(), name: AppLocale.labels.credit),
    ];
  }
}
