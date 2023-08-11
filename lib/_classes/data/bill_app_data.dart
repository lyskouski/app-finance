// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/currency/currency_provider.dart';
import 'package:app_finance/_classes/data/abstract_app_data.dart';
import 'package:app_finance/_classes/data/account_app_data.dart';
import 'package:app_finance/_classes/data/budget_app_data.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';

class BillAppData extends AbstractAppData {
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

  String get detailsFormatted => getNumberFormatted(super.details);

  @override
  String get description {
    if (getContext() == null) {
      return '';
    }
    final locale = Localizations.localeOf(getContext()!).toString();
    final DateFormat formatterDate = DateFormat.MMMMd(locale);
    AccountAppData? type = getState()?.getByUuid(account);
    String from = AppLocalizations.of(getContext()!)!.from;
    return formatterDate.format(super.createdAt) + (type?.description != null ? ' ($from "${type?.description}")' : '');
  }

  @override
  MaterialColor? get color {
    BudgetAppData? budget = getState()?.getByUuid(category);
    return budget?.color;
  }
}
