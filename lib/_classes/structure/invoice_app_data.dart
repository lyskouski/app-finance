// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:app_finance/_ext/int_ext.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvoiceAppData extends AbstractAppData {
  String account;
  String? accountFrom;

  InvoiceAppData({
    required super.title,
    required this.account,
    this.accountFrom,
    super.uuid,
    super.details,
    super.progress = 0.0,
    super.description,
    super.color,
    super.icon,
    super.currency,
    super.updatedAt,
    super.createdAt,
    super.createdAtFormatted,
    super.hidden,
  });

  @override
  String getClassName() => 'InvoiceAppData';

  @override
  AppDataType getType() => AppDataType.invoice;

  @override
  InvoiceAppData clone() {
    return InvoiceAppData(
      account: account,
      accountFrom: accountFrom,
      uuid: super.uuid,
      title: super.title,
      details: super.details,
      progress: super.progress,
      description: super.description,
      color: super.color,
      icon: super.icon,
      currency: super.currency,
      createdAt: super.createdAt,
      hidden: super.hidden,
    );
  }

  factory InvoiceAppData.fromJson(Map<String, dynamic> json) {
    return InvoiceAppData(
      uuid: json['uuid'],
      title: json['title'],
      account: json['account'],
      accountFrom: json['accountFrom'],
      details: json['details'],
      progress: 0.0 + json['progress'],
      description: json['description'],
      color: json['color'] != null ? MaterialColor(json['color'], const <int, Color>{}) : null,
      icon: json['icon'] != null ? int.tryParse(json['icon'])?.toIcon() : null,
      currency: CurrencyProvider.findByCode(json['currency']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      hidden: json['hidden'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'account': account,
        'accountFrom': accountFrom,
      };

  String get detailsFormatted => (super.details as double).toCurrency(currency);

  @override
  String get description => DateFormat.MMMMd(AppLocale.code).format(super.createdAt);
}
