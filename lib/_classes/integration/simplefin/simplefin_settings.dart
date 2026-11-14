// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class SimpleFinSettings {
  // SimpleFIN account id to the uuid of the application's account
  final Map<String, String> links;

  // SimpleFIN account id to the last day transactions were imported for
  final Map<String, DateTime> imported;

  SimpleFinSettings({Map<String, String>? links, Map<String, DateTime>? imported})
      : links = links ?? {},
        imported = imported ?? {};

  Map<String, dynamic> toJson() => {
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory SimpleFinSettings.fromJson(Map<String, dynamic> json) => SimpleFinSettings(
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static SimpleFinSettings load() {
    final value = AppPreferences.get(AppPreferences.prefSimpleFin);
    if (value == null || value.isEmpty) {
      return SimpleFinSettings();
    }
    try {
      return SimpleFinSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return SimpleFinSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefSimpleFin, jsonEncode(toJson()));

  static Uri? loadAccess() {
    final value = AppPreferences.get(AppPreferences.prefSimpleFinAccess);
    if (value == null || value.isEmpty) {
      return null;
    }
    try {
      return Uri.parse(EncryptionHandler.decrypt(value));
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveAccess(Uri access) =>
      AppPreferences.set(AppPreferences.prefSimpleFinAccess, EncryptionHandler.encrypt(access.toString()));

  static Future<void> clearAccess() => AppPreferences.clear(AppPreferences.prefSimpleFinAccess);
}
