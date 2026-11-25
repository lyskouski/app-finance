// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/integration/investec/investec_client.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class InvestecSettings {
  // Test data of openapisandbox.investec.com instead of the real accounts
  bool sandbox;

  // Investec account id to the uuid of the application's account
  final Map<String, String> links;

  // Investec account id to the last day transactions were imported for
  final Map<String, DateTime> imported;

  InvestecSettings({this.sandbox = false, Map<String, String>? links, Map<String, DateTime>? imported})
      : links = links ?? {},
        imported = imported ?? {};

  Map<String, dynamic> toJson() => {
        'sandbox': sandbox,
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory InvestecSettings.fromJson(Map<String, dynamic> json) => InvestecSettings(
        sandbox: json['sandbox'] == true,
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static InvestecSettings load() {
    final value = AppPreferences.get(AppPreferences.prefInvestec);
    if (value == null || value.isEmpty) {
      return InvestecSettings();
    }
    try {
      return InvestecSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return InvestecSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefInvestec, jsonEncode(toJson()));

  static InvestecCredentials? loadCredentials() {
    final value = AppPreferences.get(AppPreferences.prefInvestecCredentials);
    if (value == null || value.isEmpty) {
      return null;
    }
    try {
      final json = jsonDecode(EncryptionHandler.decrypt(value)) as Map<String, dynamic>;
      final result = (
        clientId: (json['clientId'] ?? '').toString(),
        secret: (json['secret'] ?? '').toString(),
        apiKey: (json['apiKey'] ?? '').toString(),
      );
      return result.clientId.isEmpty || result.secret.isEmpty || result.apiKey.isEmpty ? null : result;
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveCredentials(InvestecCredentials credentials) => AppPreferences.set(
        AppPreferences.prefInvestecCredentials,
        EncryptionHandler.encrypt(jsonEncode({
          'clientId': credentials.clientId,
          'secret': credentials.secret,
          'apiKey': credentials.apiKey,
        })),
      );

  static Future<void> clearCredentials() => AppPreferences.clear(AppPreferences.prefInvestecCredentials);
}
