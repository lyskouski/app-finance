// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/integration/akahu/akahu_client.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class AkahuSettings {
  // Akahu account id to the uuid of the application's account
  final Map<String, String> links;

  // Akahu account id to the last day transactions were imported for
  final Map<String, DateTime> imported;

  AkahuSettings({Map<String, String>? links, Map<String, DateTime>? imported})
      : links = links ?? {},
        imported = imported ?? {};

  Map<String, dynamic> toJson() => {
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory AkahuSettings.fromJson(Map<String, dynamic> json) => AkahuSettings(
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static AkahuSettings load() {
    final value = AppPreferences.get(AppPreferences.prefAkahu);
    if (value == null || value.isEmpty) {
      return AkahuSettings();
    }
    try {
      return AkahuSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return AkahuSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefAkahu, jsonEncode(toJson()));

  static AkahuTokens? loadTokens() {
    final value = AppPreferences.get(AppPreferences.prefAkahuTokens);
    if (value == null || value.isEmpty) {
      return null;
    }
    try {
      final json = jsonDecode(EncryptionHandler.decrypt(value)) as Map<String, dynamic>;
      final result = (appToken: (json['appToken'] ?? '').toString(), userToken: (json['userToken'] ?? '').toString());
      return result.appToken.isEmpty || result.userToken.isEmpty ? null : result;
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveTokens(AkahuTokens tokens) => AppPreferences.set(
        AppPreferences.prefAkahuTokens,
        EncryptionHandler.encrypt(jsonEncode({'appToken': tokens.appToken, 'userToken': tokens.userToken})),
      );

  static Future<void> clearTokens() => AppPreferences.clear(AppPreferences.prefAkahuTokens);
}
