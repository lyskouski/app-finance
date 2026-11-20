// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

typedef _Sample = ({String category, Set<String> words, String? account, String? range});

class _Feature {
  final _counts = <String, Map<String, int>>{};

  void add(String? key, String category, int delta) {
    if (key == null) return;
    final scope = _counts.putIfAbsent(key, () => {});
    final value = (scope[category] ?? 0) + delta;
    if (value > 0) {
      scope[category] = value;
    } else {
      scope.remove(category);
      if (scope.isEmpty) _counts.remove(key);
    }
  }

  // P(category | key)
  Map<String, double> probability(String? key) {
    final scope = key != null ? _counts[key] : null;
    if (scope == null) return const {};
    final total = scope.values.fold(0, (a, b) => a + b);
    return scope.map((category, count) => MapEntry(category, count / total));
  }
}

class BudgetPrediction {
  static const weightDescription = 0.5;
  static const weightAccount = 0.3;
  static const weightAmount = 0.2;
  static const threshold = 0.25;
  static const limit = 3;

  static final _separator = RegExp(r'[^\p{L}\p{N}]+', unicode: true);

  final bool Function(String category)? isValid;

  final _words = _Feature();
  final _accounts = _Feature();
  final _ranges = _Feature();
  final _samples = <String, _Sample>{};

  BudgetPrediction({this.isValid});

  static Set<String> _tokenize(String? value) =>
      (value ?? '').toLowerCase().split(_separator).where((e) => e.length > 2).toSet();

  static String? _range(double? amount, Currency? currency) {
    if (amount == null || amount == 0) return null;
    return '${amount.abs().round().toString().length}${currency?.code ?? ''}';
  }

  void _apply(_Sample sample, int delta) {
    for (final word in sample.words) {
      _words.add(word, sample.category, delta);
    }
    _accounts.add(sample.account, sample.category, delta);
    _ranges.add(sample.range, sample.category, delta);
  }

  void remove(BillAppData item) {
    final previous = item.uuid != null ? _samples.remove(item.uuid) : null;
    if (previous != null) {
      _apply(previous, -1);
    }
  }

  void add(BillAppData item) {
    remove(item);
    if (item.hidden || item.category.isEmpty) return;
    final sample = (
      category: item.category,
      words: _tokenize(item.title),
      account: item.account.isNotEmpty ? item.account : null,
      range: _range(item.details, item.currency),
    );
    _apply(sample, 1);
    if (item.uuid != null) {
      _samples[item.uuid!] = sample;
    }
  }

  List<String> predict(BillAppData item) {
    final scores = <String, double>{};
    void score(Map<String, double> probability, double weight) =>
        probability.forEach((category, value) => scores[category] = (scores[category] ?? 0) + value * weight);

    final words = _tokenize(item.title);
    if (words.isNotEmpty) {
      final description = <String, double>{};
      for (final word in words) {
        _words
            .probability(word)
            .forEach((category, value) => description[category] = (description[category] ?? 0) + value);
      }
      score(description.map((category, value) => MapEntry(category, value / words.length)), weightDescription);
    }
    score(_accounts.probability(item.account.isNotEmpty ? item.account : null), weightAccount);
    score(_ranges.probability(_range(item.details, item.currency)), weightAmount);

    final result = scores.entries.where((e) => e.value >= threshold && (isValid?.call(e.key) ?? true)).toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return result.take(limit).map((e) => e.key).toList();
  }
}
