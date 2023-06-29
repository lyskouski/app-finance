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
  bool isFirstRun = true;

  AccountEditPage({
    required this.uuid,
  }) : super();

  @override
  AccountEditPageState createState() => AccountEditPageState();
}

class AccountEditPageState extends AccountAddPageState<AccountEditPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.editAccountHeader;
  }

  @override
  void updateStorage() {
    String uuid = (widget as AccountEditPage).uuid;
    widget.state?.update(AppDataType.accounts, uuid, AccountAppData(
      uuid: uuid,
      title: widget.title ?? '',
      type: widget.type ?? AppAccountType.cash.toString(),
      description: widget.description ?? '',
      details: widget.balance ?? 0.0,
      progress: 1.0,
      color: widget.color ?? Colors.red,
      currency: widget.currency,
      hidden: false,
      icon: widget.icon,
      closedAt: widget.validTillDate,
      createdAt: widget.balanceUpdateDate,
    ));
  }

  @override
  String getButtonName() {
    return AppLocalizations.of(context)!.updateAccountTooltip;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if ((widget as AccountEditPage).isFirstRun) {
      (widget as AccountEditPage).isFirstRun = false;
      var form =
          widget.state?.getByUuid((widget as AccountEditPage).uuid) as AccountAppData;
      widget.title = form.title;
      widget.description = form.description;
      widget.type = form.type;
      widget.balance = form.details;
      widget.color = form.color;
      widget.currency = form.currency;
      widget.icon = form.icon;
      widget.validTillDate = form.closedAt;
      widget.balanceUpdateDate = form.createdAt;
    }
    return super.buildContent(context, constraints);
  }
}
