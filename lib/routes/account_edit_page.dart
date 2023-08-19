// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/routes/account_add_page.dart';
import 'package:flutter/material.dart';

class AccountEditPage extends AccountAddPage {
  final String uuid;

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

  void bindState() {
    if (!isFirstRun) {
      return;
    }
    setState(() {
      isFirstRun = false;
      final form = state.getByUuid(uuid) as AccountAppData;
      title.text = form.title;
      description.text = form.description ?? '';
      type = form.type;
      balance.text = form.details != null ? form.details.toString() : '';
      color = form.color;
      currency = form.currency;
      icon = form.icon;
      validTillDate = form.closedAt;
      balanceUpdateDate = form.createdAt;
    });
  }

  @override
  String getTitle() {
    return AppLocale.labels.editAccountHeader;
  }

  @override
  void updateStorage() {
    super.state.update(
        AppDataType.accounts,
        uuid,
        AccountAppData(
          uuid: uuid,
          title: title.text,
          type: type ?? AppAccountType.cash.toString(),
          description: description.text,
          details: double.tryParse(balance.text) ?? 0.0,
          progress: 1.0,
          color: color ?? Colors.red,
          currency: currency,
          hidden: false,
          icon: icon,
          closedAt: validTillDate,
          createdAt: balanceUpdateDate,
        ));
  }

  @override
  String getButtonName(BuildContext context) {
    return AppLocale.labels.updateAccountTooltip;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    WidgetsBinding.instance.addPostFrameCallback((_) => bindState());
    return super.buildContent(context, constraints);
  }
}
