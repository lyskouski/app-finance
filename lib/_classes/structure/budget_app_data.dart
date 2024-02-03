// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_ext/int_ext.dart';
import 'package:app_finance/_ext/string_ext.dart';
import 'package:app_finance/_mixins/storage_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

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
  String getClassName() => 'BudgetAppData';

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
      amountLimit: super.details,
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
      icon: (json['icon'] as int?)?.toIcon(),
      currency: CurrencyProvider.find(json['currency']),
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
      amountLimit: 0.0 + json['amountLimit'],
      amountSet: json['amountSet'] != null ? json['amountSet'].toString().toMap<int, double>() : {},
      hidden: json['hidden'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson()..remove('description'),
        'amountLimit': amountLimit,
        'amountSet': amountSet.toString(),
      };

  @override
  double get details {
    if (super.details > 0 && super.details < 1) {
      return _relativeAmountLimit() - amount;
    } else if (amountLimit == 0) {
      return -amount;
    } else if (super.details > 0) {
      return amountLimit * (1 - progress);
    } else {
      return 0.0;
    }
  }

  String get detailsFormatted {
    if (super.details > 0 && super.details < 1) {
      final curr = (_relativeAmountLimit() - amount).toCurrency(currency: currency, withPattern: false);
      return '$curr ${AppLocale.labels.left}';
    } else if (super.details > 0) {
      return '${details.toCurrency(currency: currency, withPattern: false)} ${AppLocale.labels.left}';
    } else {
      return '${amount.toCurrency(currency: currency, withPattern: false)} ${AppLocale.labels.spent}';
    }
  }

  String _description() {
    if (super.details > 0 && super.details < 1) {
      final percents = (amountLimit * 100).toStringAsFixed(2);
      return '${(amount).toCurrency(currency: currency, withPattern: false)} /'
          ' ${_relativeAmountLimit().toCurrency(currency: currency, withPattern: false)} ($percents%)';
    } else if (super.details > 0) {
      return '${(amountLimit * progress).toCurrency(currency: currency, withPattern: false)} /'
          ' ${(amountLimit).toCurrency(currency: currency, withPattern: false)}'
          '${multiplication > 1 ? ' (${multiplication.toStringAsFixed(2)} ${AppLocale.labels.coef})' : ''}';
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
            .cast<InvoiceAppData>()
            .where((e) => e.accountFrom == null)
            .fold(0.0, (v, e) => v + ex.reform(e.details, e.currency, currency));
  }

  @override
  String get description => _description();

  @override
  set description(String? value) => {};
}
