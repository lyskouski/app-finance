// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class UpSettings {
  // Up account id to the uuid of the application's account
  final Map<String, String> links;

  // Up account id to the last day transactions were imported for
  final Map<String, DateTime> imported;

  UpSettings({Map<String, String>? links, Map<String, DateTime>? imported})
      : links = links ?? {},
        imported = imported ?? {};

  Map<String, dynamic> toJson() => {
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory UpSettings.fromJson(Map<String, dynamic> json) => UpSettings(
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static UpSettings load() {
    final value = AppPreferences.get(AppPreferences.prefUp);
    if (value == null || value.isEmpty) {
      return UpSettings();
    }
    try {
      return UpSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return UpSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefUp, jsonEncode(toJson()));

  static String? loadToken() {
    final value = AppPreferences.get(AppPreferences.prefUpToken);
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
      AppPreferences.set(AppPreferences.prefUpToken, EncryptionHandler.encrypt(token));

  static Future<void> clearToken() => AppPreferences.clear(AppPreferences.prefUpToken);
}
