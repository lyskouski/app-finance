// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/abstract_app_data.dart';
import 'package:app_finance/data.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

class GoalAppData extends AbstractAppData {
  DateTime _closedAt;

  GoalAppData({
    required super.title,
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
  }) : _closedAt = closedAt ??
            (closedAtFormatted != null
                ? DateTime.parse(closedAtFormatted)
                : DateTime.now());

  @override
  AppDataType getType() => AppDataType.goals;

  @override
  GoalAppData clone() {
    return GoalAppData(
      title: super.title,
      uuid: super.uuid,
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

  factory GoalAppData.fromJson(Map<String, dynamic> json) {
    return GoalAppData(
      title: json['title'],
      uuid: json['uuid'],
      details: json['details'],
      progress: json['progress'],
      description: json['description'],
      color: json['color'] != null
          ? MaterialColor(json['color'], const <int, Color>{})
          : null,
      icon: json['icon'] != null
          ? IconData(json['icon'], fontFamily: 'MaterialIcons')
          : null,
      currency: json['currency'] != null
          ? CurrencyService().findByCode(json['currency'])
          : null,
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
      closedAt: DateTime.parse(json['closedAt']),
      hidden: json['hidden'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'closedAt': closedAt.toIso8601String(),
      };

  DateTime get closedAt => _closedAt;
  set closedAt(DateTime value) => _closedAt = value;
  String get closedAtFormatted => getDateFormatted(_closedAt);
  set closedAtFormatted(String value) => _closedAt = DateTime.parse(value);

  double get state {
    DateTime currentDate = DateTime.now();
    if (closedAt.isBefore(currentDate) ||
        closedAt.isAtSameMomentAs(currentDate)) {
      return 1.0;
    } else if (currentDate.isBefore(super.createdAt) ||
        super.createdAt.isAtSameMomentAs(currentDate)) {
      return 0.0;
    } else {
      double totalDays = closedAt.difference(super.createdAt).inDays.toDouble();
      double currentDays =
          currentDate.difference(super.createdAt).inDays.toDouble();
      return currentDays / totalDays;
    }
  }
}
