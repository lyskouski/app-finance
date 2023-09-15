// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:app_finance/_mixins/storage_mixin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillAppData extends AbstractAppData with StorageMixin {
  String account;
  String category;

  BillAppData({
    required this.account,
    required this.category,
    super.uuid,
    super.title = '',
    super.details,
    super.currency,
    super.updatedAt,
    super.createdAt,
    super.createdAtFormatted,
    super.hidden,
  });

  @override
  String getClassName() {
    return 'BillAppData';
  }

  @override
  AppDataType getType() => AppDataType.bills;

  @override
  BillAppData clone() {
    return BillAppData(
      uuid: super.uuid,
      account: account,
      category: category,
      title: super.title,
      details: super.details,
      currency: super.currency,
      createdAt: super.createdAt,
      hidden: super.hidden,
    );
  }

  factory BillAppData.fromJson(Map<String, dynamic> json) {
    return BillAppData(
      uuid: json['uuid'],
      account: json['account'],
      category: json['category'],
      title: json['title'],
      details: json['details'],
      currency: CurrencyProvider.findByCode(json['currency']),
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
      hidden: json['hidden'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'account': account,
        'category': category,
      };

  String get detailsFormatted => (super.details as double).toCurrency(currency);

  @override
  String get description {
    final DateFormat formatterDate = DateFormat.MMMMd(AppLocale.code);
    AccountAppData? type = getState().getByUuid(account);
    return formatterDate.format(super.createdAt) +
        (type?.description != null ? ' (${AppLocale.labels.from} "${type?.description}")' : '');
  }

  @override
  MaterialColor? get color {
    BudgetAppData? budget = getState().getByUuid(category);
    return budget?.color;
  }
}
