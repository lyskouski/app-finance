// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'package:app_finance/_classes/data/transaction_log.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_mixins/formatter_mixin.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

abstract class AbstractAppData with FormatterMixin {
  double _amount = 0.0;
  DateTime _createdAt;
  DateTime _updatedAt;
  AppData? _state;
  String title;
  double progress;
  bool hidden;
  String? uuid;
  String? _ref;
  String? description;
  MaterialColor? color;
  IconData? icon;
  @override
  // ignore: overridden_fields
  Currency? currency;

  AbstractAppData({
    required this.title,
    this.uuid,
    this.description,
    this.color,
    this.icon,
    this.currency,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? createdAtFormatted,
    details = 0.0,
    this.progress = 1.0,
    this.hidden = false,
  })  : _createdAt = createdAt ??
            (createdAtFormatted != null
                ? DateTime.parse(createdAtFormatted)
                : DateTime.now()),
        _updatedAt = updatedAt ?? DateTime.now(),
        _amount = details;

  AbstractAppData clone();

  AppDataType getType();

  factory AbstractAppData.fromJson(Map<String, dynamic> json) {
    throw Exception('Implement by extending');
  }

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'title': title,
        'description': description,
        'color': color?.value,
        'icon': icon?.codePoint,
        'currency': currency?.code,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'details': details,
        'progress': progress,
        'hidden': hidden,
      };

  Map<String, Map<String, dynamic>> toFile() {
    var data = {...toJson()};
    return {
      'type': {
        'name': runtimeType.toString(),
        'hash': TransactionLog.getHash(data),
      },
      'data': data,
    };
  }

  @override
  String toString() {
    return json.encode(toFile());
  }

  dynamic setState(AppData state) {
    _state = state;
    return this;
  }

  AppData? getState() => _state;

  set ref(String value) => _ref = value;

  dynamic get details => _amount;

  set details(dynamic value) {
    _state?.addLog(uuid, currency, _amount, value, _ref, _updatedAt);
    _ref = null;
    _amount = value;
  }

  // ignore: unnecessary_getters_setters
  DateTime get updatedAt => _updatedAt;
  set updatedAt(DateTime value) => _updatedAt = value;
  String get updatedAtFormatted => getDateFormatted(_updatedAt);
  set updatedAtFormatted(String value) => _updatedAt = DateTime.parse(value);

  // ignore: unnecessary_getters_setters
  DateTime get createdAt => _createdAt;
  set createdAt(DateTime value) => _createdAt = value;
  String get createdAtFormatted => getDateFormatted(_createdAt);
  set createdAtFormatted(String value) => _createdAt = DateTime.parse(value);
}
