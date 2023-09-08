// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_mixins/formatter_mixin.dart';
import 'package:currency_picker/currency_picker.dart';

class TransactionLogData<T> with FormatterMixin {
  final String name;
  final T changedFrom;
  final T changedTo;
  final String? ref;
  final DateTime _time;
  @override
  // ignore: overridden_fields
  Currency? currency;

  TransactionLogData({
    DateTime? timestamp,
    required this.name,
    this.ref,
    this.currency,
    required this.changedFrom,
    required this.changedTo,
  }) : _time = timestamp ?? DateTime.now();

  DateTime get timestamp => _time;

  double get delta => (double.tryParse(changedTo.toString()) ?? 0.0) - (double.tryParse(changedFrom.toString()) ?? 0.0);

  TransactionLogData clone() {
    return TransactionLogData(
      name: name,
      changedFrom: changedFrom,
      changedTo: changedTo,
      ref: ref,
      timestamp: timestamp,
      currency: currency,
    );
  }

  @override
  String toString() {
    return json.encode({
      'ref': ref,
      'timestamp': timestamp.toString(),
      'changedFrom': changedFrom,
      'changedTo': changedTo,
      'currency': currency?.code,
    });
  }
}
