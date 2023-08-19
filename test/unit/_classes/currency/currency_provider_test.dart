import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyProvider', () {
    group('findByCode', () {
      final testCases = [
        (code: null, result: null),
        (code: 'USD', result: 'USD'),
        (code: 'ABC', result: null),
      ];

      for (var v in testCases) {
        test('$v', () {
          expect(CurrencyProvider.findByCode(v.code)?.code, v.result);
        });
      }
    });

    test('getAll', () {
      final result = CurrencyProvider.getAll();
      expect(result.isNotEmpty, true);
    });
  });
}
