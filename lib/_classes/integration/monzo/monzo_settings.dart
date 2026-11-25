// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/deep_link/deep_link_handler.dart';
import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_settings.dart';
import 'package:app_finance/_classes/integration/monzo/monzo_client.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class MonzoSettings {
  // Native applications are opened by Monzo's redirect directly (deep link)
  static const callbackUrl = '${DeepLinkHandler.scheme}://integration${DeepLinkHandler.monzoPath}';

  // The web page "callback.html" is shared with Enable Banking: it recognizes Monzo by the prefix of the state
  static const statePrefix = 'monzo.';

  static String get defaultRedirectUrl => redirectUrlFor(kIsWeb ? Uri.base : null);

  @visibleForTesting
  static String redirectUrlFor(Uri? base) {
    if (base != null && (base.scheme == 'https' || base.scheme == 'http') && base.host.isNotEmpty) {
      return base.resolve(EnableBankingSettings.callbackPage).toString();
    }
    return callbackUrl;
  }

  static String newState() => '$statePrefix${const Uuid().v4()}';

  String clientId;
  String redirectUrl;
  String authorizationState;

  // First successful request after the approval in the Monzo app: the full history is readable for a few minutes
  DateTime? approvedAt;

  // Monzo account id to the uuid of the application's account
  final Map<String, String> links;

  // Monzo account id to the last day transactions were imported for
  final Map<String, DateTime> imported;

  MonzoSettings({
    this.clientId = '',
    this.redirectUrl = '',
    this.authorizationState = '',
    this.approvedAt,
    Map<String, String>? links,
    Map<String, DateTime>? imported,
  })  : links = links ?? {},
        imported = imported ?? {};

  DateTime? get fullHistoryUntil => approvedAt?.add(MonzoClient.fullHistoryWindow);

  Map<String, dynamic> toJson() => {
        'clientId': clientId,
        'redirectUrl': redirectUrl,
        'authorizationState': authorizationState,
        'approvedAt': approvedAt?.toIso8601String(),
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory MonzoSettings.fromJson(Map<String, dynamic> json) => MonzoSettings(
        clientId: json['clientId'] ?? '',
        redirectUrl: json['redirectUrl'] ?? '',
        authorizationState: json['authorizationState'] ?? '',
        approvedAt: DateTime.tryParse((json['approvedAt'] ?? '').toString()),
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static MonzoSettings load() {
    final value = AppPreferences.get(AppPreferences.prefMonzo);
    if (value == null || value.isEmpty) {
      return MonzoSettings();
    }
    try {
      return MonzoSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return MonzoSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefMonzo, jsonEncode(toJson()));

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

  static String? loadSecret() => _decrypt(AppPreferences.prefMonzoSecret);

  static Future<void> saveSecret(String secret) =>
      AppPreferences.set(AppPreferences.prefMonzoSecret, EncryptionHandler.encrypt(secret));

  static Future<void> clearSecret() => AppPreferences.clear(AppPreferences.prefMonzoSecret);

  static MonzoTokens? loadTokens() {
    final value = _decrypt(AppPreferences.prefMonzoTokens);
    if (value == null) {
      return null;
    }
    try {
      final tokens = MonzoTokens.fromJson(jsonDecode(value));
      return tokens.accessToken.isEmpty ? null : tokens;
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveTokens(MonzoTokens tokens) =>
      AppPreferences.set(AppPreferences.prefMonzoTokens, EncryptionHandler.encrypt(jsonEncode(tokens.toJson())));

  static Future<void> clearTokens() => AppPreferences.clear(AppPreferences.prefMonzoTokens);
}
