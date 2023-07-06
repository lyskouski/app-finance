// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/routes/account_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AccountEditPage extends AccountAddPage {
  String uuid;

  AccountEditPage({
    required this.uuid,
  }) : super();

  @override
  AccountEditPageState createState() => AccountEditPageState();
}

class AccountEditPageState extends AccountAddPageState<AccountEditPage> {
  late String uuid;
  bool isFirstRun = true;

  @override
  void initState() {
    uuid = (widget as AccountEditPage).uuid;
    super.initState();
  }

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.editAccountHeader;
  }

  @override
  void updateStorage() {
    super.state.update(
        AppDataType.accounts,
        uuid,
        AccountAppData(
          uuid: uuid,
          title: super.title ?? '',
          type: super.type ?? AppAccountType.cash.toString(),
          description: super.description ?? '',
          details: super.balance ?? 0.0,
          progress: 1.0,
          color: super.color ?? Colors.red,
          currency: super.currency,
          hidden: false,
          icon: super.icon,
          closedAt: super.validTillDate,
          createdAt: super.balanceUpdateDate,
        ));
  }

  @override
  String getButtonName() {
    return AppLocalizations.of(context)!.updateAccountTooltip;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if (isFirstRun) {
      isFirstRun = false;
      var form = super.state.getByUuid(uuid) as AccountAppData;
      super.title = form.title;
      super.description = form.description;
      super.type = form.type;
      super.balance = form.details;
      super.color = form.color;
      super.currency = form.currency;
      super.icon = form.icon;
      super.validTillDate = form.closedAt;
      super.balanceUpdateDate = form.createdAt;
    }
    return super.buildContent(context, constraints);
  }
}
