// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_mixins/formatter_mixin.dart';
import 'package:flutter/material.dart';

class InvoiceAppData extends AbstractAppData {
  String account;

  InvoiceAppData({
    required super.title,
    required this.account,
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
      details: json['details'],
      progress: json['progress'],
      description: json['description'],
      color: json['color'] != null ? MaterialColor(json['color'], const <int, Color>{}) : null,
      icon: json['icon'] != null ? FormatterMixin.getIconFromString(json['icon']) : null,
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
      };
}
