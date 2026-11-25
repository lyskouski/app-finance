// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class StarlingSettings {
  // Starling account uid to the uuid of the application's account
  final Map<String, String> links;

  // Starling account uid to the last day transactions were imported for
  final Map<String, DateTime> imported;

  StarlingSettings({Map<String, String>? links, Map<String, DateTime>? imported})
      : links = links ?? {},
        imported = imported ?? {};

  Map<String, dynamic> toJson() => {
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory StarlingSettings.fromJson(Map<String, dynamic> json) => StarlingSettings(
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static StarlingSettings load() {
    final value = AppPreferences.get(AppPreferences.prefStarling);
    if (value == null || value.isEmpty) {
      return StarlingSettings();
    }
    try {
      return StarlingSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return StarlingSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefStarling, jsonEncode(toJson()));

  static String? loadToken() {
    final value = AppPreferences.get(AppPreferences.prefStarlingToken);
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
      AppPreferences.set(AppPreferences.prefStarlingToken, EncryptionHandler.encrypt(token));

  static Future<void> clearToken() => AppPreferences.clear(AppPreferences.prefStarlingToken);
}
