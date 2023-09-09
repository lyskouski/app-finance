// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_ext/int_ext.dart';
import 'package:flutter/material.dart';

class BudgetAppData extends AbstractAppData {
  double amount;

  BudgetAppData({
    required super.title,
    super.uuid,
    super.progress = 0.0,
    super.color,
    super.icon,
    super.currency,
    super.updatedAt,
    super.createdAt,
    super.createdAtFormatted,
    amountLimit = 0.0,
    this.amount = 0.0,
    super.hidden,
  }) : super(
          details: amountLimit,
        );

  @override
  String getClassName() {
    return 'BudgetAppData';
  }

  @override
  AppDataType getType() => AppDataType.budgets;

  @override
  BudgetAppData clone() {
    return BudgetAppData(
      title: super.title,
      uuid: super.uuid,
      progress: super.progress,
      color: super.color,
      icon: super.icon,
      currency: super.currency,
      createdAt: super.createdAt,
      amountLimit: amountLimit,
      amount: amount,
      hidden: super.hidden,
    );
  }

  factory BudgetAppData.fromJson(Map<String, dynamic> json) {
    return BudgetAppData(
      title: json['title'],
      uuid: json['uuid'],
      progress: 0.0 + json['progress'],
      color: json['color'] != null ? MaterialColor(json['color'], const <int, Color>{}) : null,
      icon: json['icon'] != null ? (json['icon'] as int).toIcon() : null,
      currency: CurrencyProvider.findByCode(json['currency']),
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
      amountLimit: json['amountLimit'],
      hidden: json['hidden'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'amountLimit': amountLimit,
      };

  @override
  double get details => amountLimit > 0 ? amountLimit * (1 - progress) : 0.0;

  String get detailsFormatted {
    if (amountLimit > 0) {
      return '${getNumberFormatted(details)} ${AppLocale.labels.left}';
    } else {
      return '${getNumberFormatted(amount)} ${AppLocale.labels.spent}';
    }
  }

  double get progressLeft => progress < 1 ? 1 - progress : 0.0;

  double get amountLimit => super.details;
  set amountLimit(double value) => super.details = value;

  @override
  String get description =>
      amountLimit > 0 ? '${getNumberFormatted(amountLimit * progress)} / ${getNumberFormatted(amountLimit)}' : '';

  @override
  set description(String? value) => {};
}
