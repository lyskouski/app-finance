// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class AbstractAppData {
  final String uuid;
  double _amount = 0.0;
  DateTime _createdAt;
  BuildContext? _context;
  String title;
  double progress;
  bool hidden;
  String? description;
  Color? color;
  IconData? icon;
  Currency? currency;

  AbstractAppData({
    required this.uuid,
    required this.title,
    this.description,
    this.color,
    this.icon,
    this.currency,
    DateTime? createdAt,
    String? createdAtFormatted,
    details = 0.0,
    this.progress = 1.0,
    this.hidden = false,
  }) : _createdAt = createdAt ?? (createdAtFormatted != null ? DateTime.parse(createdAtFormatted) : DateTime.now());

  dynamic updateContext(BuildContext context) {
    _context = context;
    return this;
  }

  String getDateFormatted(DateTime date) {
    final locale = Localizations.localeOf(_context!).toString();
    final DateFormat formatterDate = DateFormat.yMEd(locale);
    return formatterDate.format(date);
  }

  dynamic get details => _amount;
  set details(dynamic value) => _amount = value;

  DateTime get createdAt => _createdAt;
  set createdAt(DateTime value) => _createdAt = value;
  String get createdAtFormatted => getDateFormatted(_createdAt);
  set createdAtFormatted(String value) => _createdAt = DateTime.parse(value);
}
