// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class PrivatBankSettings {
  // IBANs entered by a user (the API provides no list of accounts)
  final List<String> accounts;
  final Map<String, String> links;
  final Map<String, DateTime> imported;

  PrivatBankSettings({List<String>? accounts, Map<String, String>? links, Map<String, DateTime>? imported})
      : accounts = accounts ?? [],
        links = links ?? {},
        imported = imported ?? {};

  Map<String, dynamic> toJson() => {
        'accounts': accounts,
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory PrivatBankSettings.fromJson(Map<String, dynamic> json) => PrivatBankSettings(
        accounts: (json['accounts'] as List<dynamic>? ?? []).map((e) => e.toString()).toList(),
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static PrivatBankSettings load() {
    final value = AppPreferences.get(AppPreferences.prefPrivatBank);
    if (value == null || value.isEmpty) {
      return PrivatBankSettings();
    }
    try {
      return PrivatBankSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return PrivatBankSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefPrivatBank, jsonEncode(toJson()));

  static String? loadToken() {
    final value = AppPreferences.get(AppPreferences.prefPrivatBankToken);
    if (value == null || value.isEmpty) {
      return null;
    }
    try {
      return EncryptionHandler.decrypt(value);
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveToken(String token) =>
      AppPreferences.set(AppPreferences.prefPrivatBankToken, EncryptionHandler.encrypt(token));

  static Future<void> clearToken() => AppPreferences.clear(AppPreferences.prefPrivatBankToken);
}
