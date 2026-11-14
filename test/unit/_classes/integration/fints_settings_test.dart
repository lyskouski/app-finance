// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/fints/fints_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:fints/fints.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('FinTsSettings', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      AppPreferences.pref = await SharedPreferences.getInstance();
    });

    test('is empty without saved settings', () {
      final settings = FinTsSettings.load();

      expect(settings.isComplete, isFalse);
      expect(settings.version, '4.1.1');
      expect(settings.namespace, FinTs4Namespaces.v411);
    });

    test('saves and loads settings, links and import dates', () async {
      final settings = FinTsSettings(
        url: 'https://fints.example-bank.de/fints',
        bankCode: '12030000',
        userId: 'alice',
        productId: 'PRODUCT',
        version: '4.1',
      );
      settings.links['DE02120300000000202051'] = 'account-uuid';
      settings.imported['DE02120300000000202051'] = DateTime(2026, 11, 14);
      await settings.save();

      final loaded = FinTsSettings.load();
      expect(loaded.isComplete, isTrue);
      expect(loaded.namespace, FinTs4Namespaces.v41);
      expect(loaded.links, {'DE02120300000000202051': 'account-uuid'});
      expect(loaded.imported, {'DE02120300000000202051': DateTime(2026, 11, 14)});
      expect(AppPreferences.get(AppPreferences.prefFinTs), isNot(contains('pin')));
    });

    test('falls back to defaults for an unreadable value', () async {
      await AppPreferences.set(AppPreferences.prefFinTs, '{broken');

      expect(FinTsSettings.load().url, '');
    });

    test('builds a FinTS configuration, leaving out an empty customer ID', () {
      final config = FinTsSettings(
        url: ' https://fints.example-bank.de/fints ',
        bankCode: '12030000',
        userId: 'alice',
        productId: 'PRODUCT',
      ).toConfig();

      expect(config.url.host, 'fints.example-bank.de');
      expect(config.customerId, 'alice');
    });

    test('refuses a URL other than https', () {
      final settings = FinTsSettings(
        url: 'http://fints.example-bank.de',
        bankCode: '12030000',
        userId: 'alice',
        productId: 'PRODUCT',
      );

      expect(settings.toConfig, throwsArgumentError);
    });

    test('keeps the client state encrypted', () async {
      await FinTsSettings.saveState('{"bpd":"secret"}');

      expect(AppPreferences.get(AppPreferences.prefFinTsState), isNot(contains('secret')));
      expect(FinTsSettings.loadState(), '{"bpd":"secret"}');

      await FinTsSettings.clearState();
      expect(FinTsSettings.loadState(), isNull);
    });

    test('identifies accounts by IBAN, else by account number', () {
      expect(
        FinTsSettings.accountKey(Account(bankCode: '12030000', iban: 'de02 1203 0000 0000 2020 51')),
        'DE02120300000000202051',
      );
      expect(FinTsSettings.accountKey(Account(bankCode: '12030000', accountNumber: '202051')), '12030000:202051:');
    });
  });
}
