// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/app_locale.dart';
import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:flutter/material.dart';

enum AppAccountType {
  account,
  cash,
  debitCard,
  creditCard,
  deposit,
  credit,
}

class AccountType {
  final BuildContext context;

  AccountType(this.context);

  List<ListSelectorItem> toList() {
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
