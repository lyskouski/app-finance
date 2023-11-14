// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

typedef ExchangeMap = Map<String, List<TextEditingController>>;

typedef ExchangeScope = ({
  String from,
  String to,
  TextEditingController rate,
  TextEditingController sum,
});

class ExchangeController extends ValueNotifier<ExchangeMap> {
  final Map<String, CurrencyAppData> rate = {};
  final List<String> pairs = [];
  final AppData store;
  final TextEditingController targetController;
  List<Currency?> source;
  Currency? target;

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

  void restate(List<Currency?> source, Currency? target) {
    this.source = source;
    this.target = target;
    pairs.clear();
    if (source.isEmpty) {
      return;
    }
    _add(target?.code, source.first?.code);
    for (int i = 0; i < source.length - 1; i++) {
      _add(source[i]?.code, source[i + 1]?.code);
    }
    notifyListeners();
  }

  ExchangeScope get(int index) {
    final uuid = pairs[index];
    final keys = uuid.split('-');
    return (
      from: keys[0],
      to: keys[1],
      rate: value[uuid]![0],
      sum: value[uuid]![1],
    );
  }

  void save() {
    for (var uuid in pairs) {
      if (rate[uuid] == null) {
        continue;
      }
      store.update(uuid, rate[uuid]!, true);
    }
  }

  @override
  void dispose() {
    for (var scope in value.values) {
      for (int i = 0; i < source.length - 1; i++) {
        scope[i].dispose();
      }
    }
    value.clear();
    rate.clear();
    pairs.clear();
    super.dispose();
  }

  void _add(String? from, String? to) {
    final uuid = [from, to].map((v) => v ?? '?').toList().join('-');
    pairs.add(uuid);
    rate[uuid] ??= store.getByUuid(uuid) ??
        CurrencyAppData(
          currency: CurrencyProvider.find(to),
          currencyFrom: CurrencyProvider.find(from),
        );
    value[uuid] ??= [
      TextEditingController(text: rate[uuid]!.details.toString())..addListener(() => _updateSum(uuid)),
      TextEditingController(text: _getAmount(uuid)?.toString())..addListener(() => _updateRate(uuid)),
    ];
  }

  void _updateAll() {
    for (String uuid in pairs) {
      _updateSum(uuid);
    }
  }

  void _updateSum(String uuid) {
    List<TextEditingController> pair = value[uuid]!;
    if (pair[0].text != '') {
      rate[uuid]!.details = double.tryParse(pair[0].text);
    }
    final amount = _getAmount(uuid);
    final current = double.tryParse(pair[1].text);
    if (amount != current) {
      pair[1].text = (amount ?? '').toString();
      pair[1].notifyListeners();
    }
  }

  void _updateRate(String uuid) {
    List<TextEditingController> pair = value[uuid]!;
    final sum = _getRate(uuid, double.tryParse(pair[1].text));
    final current = double.tryParse(pair[0].text);
    if (sum != current) {
      if (sum != null) {
        rate[uuid]!.details = sum;
      }
      pair[0].text = (sum ?? '').toString();
      pair[0].notifyListeners();
    }
  }

  double? _getRate(String uuid, double? amount) {
    if (amount == null) return null;
    double? targetAmount = double.tryParse(targetController.text);
    final index = pairs.indexOf(uuid);
    final prev = index > 0 ? double.tryParse(value[pairs[index - 1]]![1].text) ?? 0 : targetAmount ?? 0;
    return prev > 0 ? amount / prev : null;
  }

  double? _getAmount(String uuid) {
    double? result = rate[uuid]?.details;
    double? input = double.tryParse(targetController.text);
    if (result != null && input != null) {
      final index = pairs.indexOf(uuid);
      final amount = index > 0 ? double.tryParse(value[pairs[index - 1]]![1].text) ?? 0 : input;
      result *= amount;
    } else {
      result = null;
    }
    return result;
  }
}
