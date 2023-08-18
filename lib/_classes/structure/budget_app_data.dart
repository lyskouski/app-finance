// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_mixins/formatter_mixin.dart';
import 'package:flutter/material.dart';

class BudgetAppData extends AbstractAppData {
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
      hidden: super.hidden,
    );
  }

  factory BudgetAppData.fromJson(Map<String, dynamic> json) {
    return BudgetAppData(
      title: json['title'],
      uuid: json['uuid'],
      progress: json['progress'],
      color: json['color'] != null ? MaterialColor(json['color'], const <int, Color>{}) : null,
      icon: json['icon'] != null ? FormatterMixin.getIconFromString(json['icon']) : null,
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
  double get details => super.details > 0 ? super.details * (1 - super.progress) : 0.0;

  String get detailsFormatted {
    return '${getNumberFormatted(details)} ${AppLocale.labels.left}';
  }

  double get amountLimit => super.details;
  set amountLimit(double value) => super.details = value;

  @override
  String get description => super.details > 0
      ? '${getNumberFormatted(super.details * super.progress)} / ${getNumberFormatted(super.details)}'
      : '';

  @override
  set description(String? value) => {};
}
