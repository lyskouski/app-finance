// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'package:app_finance/_classes/data/transaction_log.dart';
import 'package:app_finance/data.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class AbstractAppData {
  double _amount = 0.0;
  DateTime _createdAt;
  BuildContext? _context;
  AppData? _state;
  String title;
  double progress;
  bool hidden;
  String? uuid;
  String? description;
  MaterialColor? color;
  IconData? icon;
  Currency? currency;

  AbstractAppData({
    required this.title,
    this.uuid,
    this.description,
    this.color,
    this.icon,
    this.currency,
    DateTime? createdAt,
    String? createdAtFormatted,
    details = 0.0,
    this.progress = 1.0,
    this.hidden = false,
  })  : _createdAt = createdAt ??
            (createdAtFormatted != null
                ? DateTime.parse(createdAtFormatted)
                : DateTime.now()),
        _amount = details;

  AbstractAppData clone();

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'title': title,
        'description': description,
        'color': color?.value,
        'icon': icon?.codePoint,
        'currency': currency?.toJson(),
        'createdAt': createdAt.toIso8601String(),
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

  dynamic updateContext(BuildContext context) {
    _context = context;
    return this;
  }

  BuildContext? getContext() => _context;

  dynamic setState(AppData state) {
    _state = state;
    return this;
  }

  AppData? getState() => _state;

  String getDateFormatted(DateTime date) {
    final locale = Localizations.localeOf(_context!).toString();
    final DateFormat formatterDate = DateFormat.yMEd(locale);
    return formatterDate.format(date);
  }

  String getNumberFormatted(double value) {
    final locale = Localizations.localeOf(_context!).toString();
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: currency?.symbol ?? '?',
      decimalDigits: 2,
    );
    return formatter.format(value);
  }

  dynamic get details => _amount;
  set details(dynamic value) => _amount = value;

  DateTime get createdAt => _createdAt;
  set createdAt(DateTime value) => _createdAt = value;
  String get createdAtFormatted => getDateFormatted(_createdAt);
  set createdAtFormatted(String value) => _createdAt = DateTime.parse(value);
}
