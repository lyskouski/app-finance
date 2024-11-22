// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/abstract_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/payment_type.dart';

class PaymentAppData extends AbstractAppData {
  Map<String, dynamic> data;

  PaymentAppData({
    required super.title,
    required this.data,
    super.uuid,
    super.updatedAt,
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
      data: data,
    );
  }

  factory PaymentAppData.fromJson(Map<String, dynamic> json) {
    return PaymentAppData(
      title: json['title'],
      uuid: json['uuid'],
      updatedAt: DateTime.parse(json['updatedAt']),
      data: json['data'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'title': title,
        'updatedAt': updatedAt.toIso8601String(),
        'data': data,
      };

  @override
  String get description => '${AppLocale.labels.paymentType}: ${PaymentType.getLabel(title)}';
}
