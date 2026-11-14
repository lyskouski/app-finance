// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_client.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class EnableBankingSettings {
  String applicationId;
  String redirectUrl;
  String country;
  String aspsp;

  // Bank account (IBAN, else uid) to the uuid of the application's account
  final Map<String, String> links;

  // Bank account (IBAN, else uid) to the last day transactions were imported for
  final Map<String, DateTime> imported;

  EnableBankingSettings({
    this.applicationId = '',
    this.redirectUrl = '',
    this.country = '',
    this.aspsp = '',
    Map<String, String>? links,
    Map<String, DateTime>? imported,
  })  : links = links ?? {},
        imported = imported ?? {};

  Map<String, dynamic> toJson() => {
        'applicationId': applicationId,
        'redirectUrl': redirectUrl,
        'country': country,
        'aspsp': aspsp,
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory EnableBankingSettings.fromJson(Map<String, dynamic> json) => EnableBankingSettings(
        applicationId: json['applicationId'] ?? '',
        redirectUrl: json['redirectUrl'] ?? '',
        country: json['country'] ?? '',
        aspsp: json['aspsp'] ?? '',
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static EnableBankingSettings load() {
    final value = AppPreferences.get(AppPreferences.prefEnableBanking);
    if (value == null || value.isEmpty) {
      return EnableBankingSettings();
    }
    try {
      return EnableBankingSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return EnableBankingSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefEnableBanking, jsonEncode(toJson()));

  static String? _decrypt(String key) {
    final value = AppPreferences.get(key);
    if (value == null || value.isEmpty) {
      return null;
    }
    try {
      return EncryptionHandler.decrypt(value);
    } catch (_) {
      return null;
    }
  }

  static String? loadKey() => _decrypt(AppPreferences.prefEnableBankingKey);

  static Future<void> saveKey(String pem) =>
      AppPreferences.set(AppPreferences.prefEnableBankingKey, EncryptionHandler.encrypt(pem.trim()));

  static Future<void> clearKey() => AppPreferences.clear(AppPreferences.prefEnableBankingKey);

  static EnableBankingSession? loadSession() {
    final value = _decrypt(AppPreferences.prefEnableBankingSession);
    if (value == null) {
      return null;
    }
    try {
      final session = EnableBankingSession.fromJson(jsonDecode(value));
      return session.isValid ? session : null;
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveSession(EnableBankingSession session) => AppPreferences.set(
      AppPreferences.prefEnableBankingSession, EncryptionHandler.encrypt(jsonEncode(session.toJson())));

  static Future<void> clearSession() => AppPreferences.clear(AppPreferences.prefEnableBankingSession);
}
