// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:app_finance/_ext/int_ext.dart';
import 'package:flutter/material.dart';

class AccountAppData extends AbstractAppData {
  DateTime _closedAt;
  String type;

  AccountAppData({
    required super.title,
    required this.type,
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
    DateTime? closedAt,
    String? closedAtFormatted,
    super.hidden,
  }) : _closedAt = closedAt ?? (closedAtFormatted != null ? DateTime.parse(closedAtFormatted) : DateTime.now());

  @override
  String getClassName() {
    return 'AccountAppData';
  }

  @override
  AppDataType getType() => AppDataType.accounts;

  @override
  AccountAppData clone() {
    return AccountAppData(
      uuid: super.uuid,
      title: super.title,
      type: type,
      details: super.details,
      progress: super.progress,
      description: super.description,
      color: super.color,
      icon: super.icon,
      currency: super.currency,
      createdAt: super.createdAt,
      closedAt: closedAt,
      hidden: super.hidden,
    );
  }

  factory AccountAppData.fromJson(Map<String, dynamic> json) {
    return AccountAppData(
      uuid: json['uuid'],
      title: json['title'],
      type: json['type'],
      details: json['details'],
      progress: 0.0 + json['progress'],
      description: json['description'],
      color: json['color'] != null ? MaterialColor(json['color'], const <int, Color>{}) : null,
      icon: json['icon'] != null ? (json['icon'] as int).toIcon() : null,
      currency: CurrencyProvider.findByCode(json['currency']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      closedAt: DateTime.parse(json['closedAt']),
      hidden: json['hidden'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'type': type,
        'closedAt': closedAt.toIso8601String(),
      };

  DateTime get closedAt => _closedAt;
  set closedAt(DateTime value) => _closedAt = value;
  String get closedAtFormatted => _closedAt.yMEd();
  set closedAtFormatted(String value) => _closedAt = DateTime.parse(value);

  String get detailsFormatted => (super.details as double).toCurrency(currency);
}
