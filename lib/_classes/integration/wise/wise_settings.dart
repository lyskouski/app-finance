// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class WiseSettings {
  int? profile;
  final Map<String, String> links;
  final Map<String, DateTime> imported;

  WiseSettings({this.profile, Map<String, String>? links, Map<String, DateTime>? imported})
      : links = links ?? {},
        imported = imported ?? {};

  Map<String, dynamic> toJson() => {
        'profile': profile,
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory WiseSettings.fromJson(Map<String, dynamic> json) => WiseSettings(
        profile: (json['profile'] as num?)?.toInt(),
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static WiseSettings load() {
    final value = AppPreferences.get(AppPreferences.prefWise);
    if (value == null || value.isEmpty) {
      return WiseSettings();
    }
    try {
      return WiseSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return WiseSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefWise, jsonEncode(toJson()));

  static String? loadToken() {
    final value = AppPreferences.get(AppPreferences.prefWiseToken);
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
      AppPreferences.set(AppPreferences.prefWiseToken, EncryptionHandler.encrypt(token));

  static Future<void> clearToken() => AppPreferences.clear(AppPreferences.prefWiseToken);
}
