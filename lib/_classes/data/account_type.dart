// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/widgets/_forms/list_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

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
      ListSelectorItem(id: AppAccountType.account.toString(), name: AppLocalizations.of(context)!.bankAccount),
      ListSelectorItem(id: AppAccountType.cash.toString(), name: AppLocalizations.of(context)!.cash),
      ListSelectorItem(id: AppAccountType.debitCard.toString(), name: AppLocalizations.of(context)!.debitCard),
      ListSelectorItem(id: AppAccountType.creditCard.toString(), name: AppLocalizations.of(context)!.creditCard),
      ListSelectorItem(id: AppAccountType.deposit.toString(), name: AppLocalizations.of(context)!.deposit),
      ListSelectorItem(id: AppAccountType.credit.toString(), name: AppLocalizations.of(context)!.credit),
    ];
  }
}
