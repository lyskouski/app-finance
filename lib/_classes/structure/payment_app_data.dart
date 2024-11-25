// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/budget_type.dart';

class PaymentAppData extends AbstractAppData {
  Map<String, dynamic> data;

  PaymentAppData({
    required super.title,
    required this.data,
    super.uuid,
    super.updatedAt,
    super.hidden,
  });

  @override
  String getClassName() => 'PaymentAppData';

  @override
  AppDataType getType() => AppDataType.payments;

  @override
  PaymentAppData clone() {
    return PaymentAppData(
      title: super.title,
      uuid: super.uuid,
      updatedAt: super.updatedAt,
      hidden: super.hidden,
      data: data,
    );
  }

  factory PaymentAppData.fromJson(Map<String, dynamic> json) {
    return PaymentAppData(
      title: json['title'],
      uuid: json['uuid'],
      updatedAt: DateTime.parse(json['updatedAt']),
      hidden: json['hidden'],
      data: json['data'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'title': title,
        'updatedAt': updatedAt.toIso8601String(),
        'hidden': hidden,
        'data': data,
      };

  @override
  String get description => BudgetType.getLabel(title);
}