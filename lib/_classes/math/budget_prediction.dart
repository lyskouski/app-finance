// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class BudgetPrediction {
  final Map<String, Map<String, int>> _descriptionPatterns = {};
  final Map<String, Map<String, int>> _accountCategories = {};
  final Map<String, Map<String, int>> _amountRanges = {};

  BudgetPrediction();

  void add(BillAppData item) {
    final category = item.category;
    _learnDescriptionPatterns(item.title, category);
    _learnAccountCategories(item.account, category);
    _learnAmountRanges(item.details, item.currency, category);
  }

  void _learnDescriptionPatterns(String? description, String category) {
    if (description == null || description.isEmpty) return;

    final words = description.toLowerCase().split(RegExp(r'\W+'));
    _descriptionPatterns.putIfAbsent(category, () => {});

    for (final word in words) {
      if (word.length > 2) {
        _descriptionPatterns[category]![word] = (_descriptionPatterns[category]![word] ?? 0) + 1;
      }
    }
  }

  void _learnAccountCategories(String? account, String category) {
    if (account == null) return;

    _accountCategories.putIfAbsent(category, () => {});
    _accountCategories[category]![account] = (_accountCategories[category]![account] ?? 0) + 1;
  }

  void _learnAmountRanges(double? amount, Currency? currency, String category) {
    if (amount == null) return;

    final range = _getAmountRange(amount, currency);
    _amountRanges.putIfAbsent(category, () => {});
    _amountRanges[category]![range] = (_amountRanges[category]![range] ?? 0) + 1;
  }

  String _getAmountRange(double amount, Currency? currency) {
    return amount.toStringAsFixed(6).length.toString() + (currency?.code ?? '');
  }

  List<String> predict(BillAppData item) {
    final scores = <String, double>{};
    _scoreByDescription(item.title, scores);
    _scoreByAccount(item.account, scores);
    _scoreByAmount(item.details, item.currency, scores);

    if (scores.isEmpty) return [];

    final sortedEntries = scores.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    return sortedEntries.take(3).map((e) => e.key).toList();
  }

  void _scoreByDescription(String? description, Map<String, double> scores) {
    if (description == null || description.isEmpty) return;

    final words = description.toLowerCase().split(RegExp(r'\W+'));

    for (final category in _descriptionPatterns.keys) {
      double score = 0;
      int totalWords = _descriptionPatterns[category]!.values.fold(0, (a, b) => a + b);

      for (final word in words) {
        if (word.length > 2 && _descriptionPatterns[category]!.containsKey(word)) {
          score += _descriptionPatterns[category]![word]! / totalWords;
        }
      }

      scores[category] = (scores[category] ?? 0) + score * 0.5; // 50% weight
    }
  }

  void _scoreByAccount(String? account, Map<String, double> scores) {
    if (account == null) return;

    for (final category in _accountCategories.keys) {
      if (_accountCategories[category]!.containsKey(account)) {
        final occurrences = _accountCategories[category]![account]!;
        final totalForCategory = _accountCategories[category]!.values.fold(0, (a, b) => a + b);
        scores[category] = (scores[category] ?? 0) + (occurrences / totalForCategory) * 0.3; // 30% weight
      }
    }
  }

  void _scoreByAmount(double? amount, Currency? currency, Map<String, double> scores) {
    if (amount == null) return;

    final range = _getAmountRange(amount, currency);

    for (final category in _amountRanges.keys) {
      if (_amountRanges[category]!.containsKey(range)) {
        final occurrences = _amountRanges[category]![range]!;
        final totalForCategory = _amountRanges[category]!.values.fold(0, (a, b) => a + b);
        scores[category] = (scores[category] ?? 0) + (occurrences / totalForCategory) * 0.2; // 20% weight
      }
    }
  }
}
