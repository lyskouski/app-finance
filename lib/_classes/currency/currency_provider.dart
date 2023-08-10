// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:app_finance/_classes/currency/cryptocurrencies.dart';
import 'package:currency_picker/currency_picker.dart';
// ignore: implementation_imports
import 'package:currency_picker/src/currencies.dart';

class CurrencyProvider {
  static final _currencies = HashMap<String?, Currency>();

  static void _convert(List<Map<String, dynamic>> scope) {
    for (final currency in scope) {
      _currencies[currency['code']] = Currency.from(json: currency);
    }
  }

  static void _check() {
    if (_currencies.isEmpty) {
      _convert(currencies);
      List<Map<String, dynamic>> cryptocurrencies = cryptoList.map((e) {
        return {
          ...tplCurrency,
          "name": e.first,
          "name_plural": e.first,
          "code": e.last,
          "symbol": e.last,
        };
      }).toList();
      _convert(cryptocurrencies);
    }
  }

  static String? _key(String? code) {
    return code?.toUpperCase();
  }

  static List<Currency> getAll() {
    _check();
    return _currencies.values.toList();
  }

  static Currency? findByCode(String? code) {
    _check();
    return _currencies[_key(code)];
  }
}
