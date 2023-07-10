// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/abstract_app_data.dart';
import 'package:currency_picker/currency_picker.dart';

class CurrencyAppData extends AbstractAppData {
  Currency? currencyFrom;

  CurrencyAppData({
    super.title = '',
    super.uuid = '',
    super.details = 1.0,
    super.description,
    this.currencyFrom,
    super.currency,
    super.hidden,
  }) {
    super.description = DateTime.now().toString();
  }

  @override
  CurrencyAppData clone() {
    return CurrencyAppData(
      title: super.title,
      uuid: super.uuid,
      details: super.details,
      currency: super.currency,
      currencyFrom: currencyFrom,
    );
  }

  String get detailsFormatted => getNumberFormatted(super.details);

  String get descriptionFormatted =>
      getDateFormatted(DateTime.parse(super.description ?? ''));

  @override
  String get title => '${currencyFrom?.code} -> ${currency?.code}';

  @override
  String get uuid => '${currencyFrom?.code}-${currency?.code}';
}
