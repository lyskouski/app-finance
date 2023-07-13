// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

class TransactionLogData<T> {
  final String name;
  final T changedFrom;
  final T changedTo;
  final String? ref;
  final DateTime _time;

  TransactionLogData({
    DateTime? timestamp,
    required this.name,
    this.ref,
    required this.changedFrom,
    required this.changedTo,
  }) : _time = timestamp ?? DateTime.now();

  DateTime get timestamp => _time;
}
