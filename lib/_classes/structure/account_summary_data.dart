// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class AccountSummaryData {
  String title;
  String description;
  num invoices;
  num bills;
  Currency? currency;

  AccountSummaryData({
    required this.title,
    required this.description,
    this.currency,
    this.invoices = 0,
    this.bills = 0,
  });
}
