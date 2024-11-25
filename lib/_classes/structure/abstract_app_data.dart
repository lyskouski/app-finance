// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';
import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/structure/interface_app_data.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

abstract class AbstractAppData implements InterfaceAppData {
  @override
  String? uuid;
  double _amount = 0.0;
  DateTime _createdAt;
  DateTime _updatedAt;
  @override
  String title;
  double progress;
  @override
  bool hidden;
  @override
  bool skip;
  String? description;
  @override
  MaterialColor? color;
  @override
  IconData? icon;
  @override
  Currency? currency;
  String? payment;

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
    this.skip = false,
    this.payment,
  })  : _createdAt = createdAt ?? (createdAtFormatted != null ? DateTime.parse(createdAtFormatted) : DateTime.now()),
        _updatedAt = updatedAt ?? DateTime.now(),
        _amount = 0.0 + (details ?? 0.0);

  AbstractAppData clone();

  @override
  void deactivate() => hidden = true;

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
        'skip': skip,
        'payment': payment,
      };

  Map<String, Map<String, dynamic>> toFile() {
    var data = {...toJson()};
    return {
      'type': {
        'name': getClassName(),
        'hash': EncryptionHandler.getHash(data),
      },
      'data': data,
    };
  }

  String toStream() => EncryptionHandler.encrypt(toString());

  @override
  String toString() => json.encode(toFile());

  @override
  dynamic get details => _amount;

  set details(dynamic value) => _amount = value;

  Widget? get error => null;

  // ignore: unnecessary_getters_setters
  DateTime get updatedAt => _updatedAt;
  set updatedAt(DateTime value) => _updatedAt = value;
  String get updatedAtFormatted => _updatedAt.yMEd();
  set updatedAtFormatted(String value) => _updatedAt = DateTime.parse(value);

  // ignore: unnecessary_getters_setters
  @override
  DateTime get createdAt => _createdAt;
  @override
  set createdAt(DateTime value) => _createdAt = value;
  String get createdAtFormatted => _createdAt.yMEd();
  set createdAtFormatted(String value) => _createdAt = DateTime.parse(value);
}
