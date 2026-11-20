// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class MonobankSettings {
  final Map<String, String> links;
  final Map<String, DateTime> imported;
  final Map<String, int> records;
  static const recordsLimit = 1000;

  MonobankSettings({Map<String, String>? links, Map<String, DateTime>? imported, Map<String, int>? records})
      : links = links ?? {},
        imported = imported ?? {},
        records = records ?? {};

  void addRecords(Map<String, int> value) {
    for (final entry in value.entries) {
      records.remove(entry.key);
      records[entry.key] = entry.value;
    }
    final extra = records.length - recordsLimit;
    if (extra > 0) {
      records.keys.take(extra).toList().forEach(records.remove);
    }
  }

  Map<String, dynamic> toJson() => {
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
        'records': records,
      };

  factory MonobankSettings.fromJson(Map<String, dynamic> json) => MonobankSettings(
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
        records: {
          for (final entry in (json['records'] as Map<String, dynamic>? ?? {}).entries)
            if (entry.value is num) entry.key: (entry.value as num).toInt(),
        },
      );

  static MonobankSettings load() {
    final value = AppPreferences.get(AppPreferences.prefMonobank);
    if (value == null || value.isEmpty) {
      return MonobankSettings();
    }
    try {
      return MonobankSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return MonobankSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefMonobank, jsonEncode(toJson()));

  static String? loadToken() {
    final value = AppPreferences.get(AppPreferences.prefMonobankToken);
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
      AppPreferences.set(AppPreferences.prefMonobankToken, EncryptionHandler.encrypt(token));

  static Future<void> clearToken() => AppPreferences.clear(AppPreferences.prefMonobankToken);
}
