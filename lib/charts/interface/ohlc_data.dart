// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

class OhlcData {
  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;

  OhlcData({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });
}
