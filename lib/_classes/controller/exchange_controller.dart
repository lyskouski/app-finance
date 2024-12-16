// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

typedef ExchangeScope = ({
  String from,
  String to,
  CurrencyAppData currency,
  TextEditingController rate,
  TextEditingController sum,
});

typedef ExchangeMap = Map<String, ExchangeScope>;

class ExchangeController extends ValueNotifier<ExchangeMap> {
  final AppData store;
  final TextEditingController targetController;
  Currency? target;
  List<Currency?> source;

  ExchangeController(
    super.value, {
    required this.store,
    required this.target,
    required this.targetController,
    required this.source,
  }) {
    restate(source, target);
    targetController.addListener(_updateAll);
  }

  int get length => value.length;

  @override
  void dispose() {
    clear();
    super.dispose();
  }

  void clear() {
    for (var scope in value.values) {
      scope.rate.dispose();
      scope.sum.dispose();
    }
    value.clear();
  }

  void restate(List<Currency?> source, Currency? target) {
    this.source = source;
    this.target = target;
    clear();

    if (source.isEmpty) {
      return;
    }

    for (int i = 0; i < source.length; i++) {
      final uuid = [target, source[i]].map((v) => v?.code ?? '?').toList().join('-');
      if (target == null || source[i] == null || target.code == source[i]!.code || value[uuid] != null) {
        continue;
      }
      final currency = store.getByUuid(uuid) ?? CurrencyAppData(currency: target, currencyFrom: source[i]);
      final amount = (double.tryParse(targetController.text) ?? 0.0) * currency.details;
      value[uuid] = (
        from: target.code,
        to: source[i]!.code,
        currency: currency,
        rate: TextEditingController(text: currency.details.toString())..addListener(() => _updateSum(uuid)),
        sum: TextEditingController(text: amount.toString())..addListener(() => _updateRate(uuid)),
      );
    }
    notifyListeners();
  }

  ExchangeScope get(int index) => value.values.elementAt(index);

  void save() {
    for (var item in value.values) {
      double rate = double.tryParse(item.rate.text) ?? 0.0;
      item.currency.details = rate;
      store.update(item.currency.uuid, item.currency, true);
    }
  }

  void _updateAll() {
    for (var uuid in value.keys) {
      _updateSum(uuid);
    }
  }

  int _findDecimals(String? value) {
    return (value ?? '').contains('.') ? value!.split('.')[1].length : 0;
  }

  int? _getDecimals(String uuid) {
    int decimals = CurrencyProvider.find(uuid.split('-')[1])?.decimalDigits ?? 0;
    final rateDecimals = _findDecimals(value[uuid]?.rate.text);
    if (rateDecimals > decimals) {
      decimals = rateDecimals;
    }
    final sumDecimals = _findDecimals(value[uuid]?.sum.text);
    if (sumDecimals > decimals) {
      decimals = sumDecimals;
    }
    return decimals;
  }

  void _updateSum(String uuid) {
    ExchangeScope pair = value[uuid]!;
    double rate = double.tryParse(pair.rate.text) ?? 0.0;
    double amount = (double.tryParse(targetController.text) ?? 0.0) * rate;
    double? current = double.tryParse(pair.sum.text);
    final decimals = _getDecimals(uuid);
    if (targetController.text != '' && amount.toFixed(decimals).isNotEqual(current?.toFixed(decimals))) {
      pair.sum.text = amount.toString();
      // pair.sum.notifyListeners();
    }
  }

  void _updateRate(String uuid) {
    ExchangeScope pair = value[uuid]!;
    double rate = double.tryParse(pair.rate.text) ?? 0.0;
    double val = double.tryParse(targetController.text) ?? 0.0;
    double amount = double.tryParse(pair.sum.text) ?? 0.0;
    double newRate = val > 0 ? amount / val : 0.0;
    final decimals = _getDecimals(uuid);
    if (targetController.text != '' && rate.toFixed(decimals).isNotEqual(newRate.toFixed(decimals))) {
      pair.rate.text = newRate.toString();
      // pair.rate.notifyListeners();
    }
  }
}
