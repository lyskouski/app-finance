// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:app_finance/_classes/storage/data_handler.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/transaction_log_data.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<Exchange>()])
import 'data_handler_test.mocks.dart';
@GenerateWithMethodSetters([MockExchange])
import 'data_handler_test.wrapper.dart';

void main() {
  group('DataHandler', () {
    late WrapperMockExchange exchange;

    setUp(() {
      exchange = WrapperMockExchange();
      exchange.mockReform = (double? v, Currency? from, Currency? to) => v ?? 0.0;
    });

    test('generateOhlcSummary (empty)', () {
      expect(DataHandler.generateOhlcSummary([], exchange: exchange), []);
    });

    test('generateOhlcSummary', () {
      final data = [
        [
          TransactionLogData<double>(changedFrom: 0.0, changedTo: 5.0, name: '', timestamp: DateTime(2023, 01, 01, 1)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: -2.0, name: '', timestamp: DateTime(2023, 01, 01, 2)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: 10.0, name: '', timestamp: DateTime(2023, 01, 02)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: 15.0, name: '', timestamp: DateTime(2023, 01, 03, 1)),
        ],
        [
          TransactionLogData<double>(changedFrom: 0.0, changedTo: 4.0, name: '', timestamp: DateTime(2023, 01, 01, 12)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: 10.0, name: '', timestamp: DateTime(2023, 01, 03, 1)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: -1.0, name: '', timestamp: DateTime(2023, 01, 03, 2)),
        ]
      ];
      final result = DataHandler.generateOhlcSummary(data, exchange: exchange);
      expect(result.length, 1);
      expect(result.first.date, DateTime(2022, 12, 31));
      expect(result.first.close, 41.0);
      expect(result.first.high, 42.0);
      expect(result.first.low, 3.0);
      expect(result.first.open, 0.0);
    });

    test('generateOhlcSummary (two months)', () {
      final data = [
        [
          TransactionLogData<double>(changedFrom: 0.0, changedTo: 5.0, name: '', timestamp: DateTime(2023, 01, 01, 1)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: -2.0, name: '', timestamp: DateTime(2023, 01, 01, 2)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: 10.0, name: '', timestamp: DateTime(2023, 01, 02)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: 15.0, name: '', timestamp: DateTime(2023, 01, 03, 1)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: 4.0, name: '', timestamp: DateTime(2023, 02, 01, 12)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: 10.0, name: '', timestamp: DateTime(2023, 02, 03, 1)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: -1.0, name: '', timestamp: DateTime(2023, 02, 03, 2)),
        ]
      ];
      final result = DataHandler.generateOhlcSummary(data, exchange: exchange);
      expect(result.length, 2);
      expect(result.first.date, DateTime(2022, 12, 31));
      expect(result.first.close, 28.0);
      expect(result.first.high, 28.0);
      expect(result.first.low, 3.0);
      expect(result.first.open, 0.0);
      expect(result.last.date, DateTime(2023, 01, 31));
      expect(result.last.close, 41.0);
      expect(result.last.high, 42.0);
      expect(result.last.low, 32.0);
      expect(result.last.open, 28.0);
    });

    test('generateOhlcSummary (negative)', () {
      final data = [
        [
          TransactionLogData<double>(
              changedFrom: 0.0, changedTo: -100.0, name: '', timestamp: DateTime(2023, 01, 01, 1)),
          TransactionLogData<double>(changedFrom: 0.0, changedTo: -2.0, name: '', timestamp: DateTime(2023, 01, 01, 2)),
        ]
      ];
      final result = DataHandler.generateOhlcSummary(data, exchange: exchange);
      expect(result.length, 1);
      expect(result.first.date, DateTime(2022, 12, 31));
      expect(result.first.close, 0.0);
      expect(result.first.high, 2.0);
      expect(result.first.low, 0.0);
      expect(result.first.open, 102.0);
    });
  });
}
