// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

class OhlcData {
  final DateTime date;
  double open;
  double high;
  double low;
  double close;

  OhlcData({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  @override
  String toString() => json.encode({
        'date': date.toIso8601String(),
        'open': open,
        'high': high,
        'low': low,
        'close': close,
      });
}
