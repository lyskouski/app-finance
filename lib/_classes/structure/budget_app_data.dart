// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:app_finance/_ext/int_ext.dart';
import 'package:app_finance/_mixins/storage_mixin.dart';
import 'package:flutter/material.dart';

class BudgetAppData extends AbstractAppData with StorageMixin {
  double amount;
  Map<int, double> amountSet;
  final int _month = DateTime.now().month;

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
    this.amountSet = const {},
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
      amountSet: amountSet,
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
      amountSet: json['amountSet'] != null ? json['amountSet'].toMap<int, double>() : {},
      hidden: json['hidden'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'amountLimit': amountLimit,
        'amountSet': amountSet,
      };

  @override
  double get details => amountLimit > 0 ? amountLimit * (1 - progress) : 0.0;

  String get detailsFormatted {
    if (amountLimit > 0 && amountLimit < 1) {
      return '${(_relativeAmountLimit() - amount).toCurrency(currency)} ${AppLocale.labels.left}';
    } else if (amountLimit > 0) {
      return '${details.toCurrency(currency)} ${AppLocale.labels.left}';
    } else {
      return '${amount.toCurrency(currency)} ${AppLocale.labels.spent}';
    }
  }

  String _description() {
    if (amountLimit > 0 && amountLimit < 1) {
      final percents = (amountLimit * 100).toStringAsFixed(2);
      return '${(amount).toCurrency(currency)} / ${_relativeAmountLimit().toCurrency(currency)} ($percents%)';
    } else if (amountLimit > 0) {
      return '${(amountLimit * progress).toCurrency(currency)} / ${(amountLimit).toCurrency(currency)}';
    } else {
      return '';
    }
  }

  double get progressLeft => progress < 1 ? 1 - progress : 0.0;

  double get multiplication => amountSet[_month] ?? 1.0;

  double get amountLimit => super.details * multiplication;
  set amountLimit(double value) => super.details = value;

  double _relativeAmountLimit() {
    final ex = Exchange(store: super.getState());
    return amountLimit *
        getState()
            .getActualList(AppDataType.invoice)
            .fold(0.0, (v, e) => v + ex.reform(e.details, e.currency, currency));
  }

  @override
  String get description => _description();

  @override
  set description(String? value) => {};
}
