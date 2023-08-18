// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'package:app_finance/_classes/structure/currency/crypto_list.dart';
import 'package:app_finance/_classes/structure/currency/currency_list.dart';
import 'package:app_finance/_classes/structure/currency/currency_template.dart';
import 'package:currency_picker/currency_picker.dart';

class CurrencyProvider {
  static final _currencies = HashMap<String?, Currency>();
  static final List<Currency> _list = [];

  static void _convert(List<Map<String, dynamic>> scope) {
    for (final code in scope) {
      final currency = Currency.from(json: code);
      _list.add(currency);
      _currencies[currency.code] = currency;
    }
  }

  static void _check() {
    if (_currencies.isEmpty) {
      _convert(currencyList);
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
    return _list;
  }

  static Currency? findByCode(String? code) {
    _check();
    return _currencies[_key(code)];
  }
}
