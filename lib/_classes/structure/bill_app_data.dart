// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/_mixins/storage_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

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
  String getClassName() => 'BillAppData';

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
      details: 0.0 + json['details'],
      currency: CurrencyProvider.find(json['currency']),
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

  String get detailsFormatted => (super.details as double).toCurrency(currency: currency, withPattern: false);

  @override
  String get description {
    AccountAppData? type = getState().getByUuid(account);
    return super.createdAt.monthDay() + (type != null ? ' (${type.title})' : '');
  }

  String get accountNamed => getState().getByUuid(account)?.title ?? '?';

  @override
  MaterialColor? get color {
    BudgetAppData? budget = getState().getByUuid(category);
    return budget?.color;
  }

  @override
  IconData? get icon {
    BudgetAppData? budget = getState().getByUuid(category);
    return budget?.icon;
  }
}
