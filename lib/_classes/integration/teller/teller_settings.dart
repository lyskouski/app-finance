// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/deep_link/deep_link_handler.dart';
import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/integration/teller/teller_client.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

// Access granted by Teller Connect for the accounts of one bank login
class TellerEnrollment {
  final String id;
  final String accessToken;
  final String institution;

  const TellerEnrollment({required this.id, required this.accessToken, this.institution = ''});

  Map<String, dynamic> toJson() => {'id': id, 'accessToken': accessToken, 'institution': institution};

  factory TellerEnrollment.fromJson(Map<String, dynamic> json) => TellerEnrollment(
        id: (json['id'] ?? '').toString(),
        accessToken: (json['accessToken'] ?? '').toString(),
        institution: (json['institution'] ?? '').toString(),
      );

  // Teller Connect hands the result over by the deep link of [TellerSettings.connectPage], or it is pasted manually
  static TellerEnrollment? fromLink(Uri uri) {
    final params = {...uri.queryParameters, ...Uri.splitQueryString(uri.fragment)};
    final token = params['token']?.trim() ?? '';
    if (token.isEmpty) {
      return null;
    }
    return TellerEnrollment(
        id: params['enrollment'] ?? '', accessToken: token, institution: params['institution'] ?? '');
  }

  static TellerEnrollment? parse(String input) {
    final value = input.trim();
    if (value.isEmpty) {
      return null;
    }
    final uri = Uri.tryParse(value);
    if (uri != null && uri.hasScheme) {
      return fromLink(uri);
    }
    return TellerEnrollment(id: '', accessToken: value);
  }
}

class TellerSettings {
  // Hosts Teller Connect (a JavaScript widget) and returns the enrollment to [callbackUrl]
  static const defaultConnectPage = 'https://lyskouski.github.io/app-finance/teller.html';

  static const callbackUrl = '${DeepLinkHandler.scheme}://integration${DeepLinkHandler.tellerPath}';

  String applicationId;
  TellerEnvironment environment;
  String connectPage;

  // Teller account id to the uuid of the application's account
  final Map<String, String> links;

  // Teller account id to the last day transactions were imported for
  final Map<String, DateTime> imported;

  TellerSettings({
    this.applicationId = '',
    this.environment = TellerEnvironment.sandbox,
    this.connectPage = '',
    Map<String, String>? links,
    Map<String, DateTime>? imported,
  })  : links = links ?? {},
        imported = imported ?? {};

  Uri connectUrl({String? enrollmentId}) {
    final page = Uri.parse(connectPage.isEmpty ? defaultConnectPage : connectPage);
    return page.replace(queryParameters: {
      ...page.queryParameters,
      'app': applicationId,
      'env': environment.name,
      if (enrollmentId != null && enrollmentId.isNotEmpty) 'enrollment': enrollmentId,
    });
  }

  Map<String, dynamic> toJson() => {
        'applicationId': applicationId,
        'environment': environment.name,
        'connectPage': connectPage,
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory TellerSettings.fromJson(Map<String, dynamic> json) => TellerSettings(
        applicationId: json['applicationId'] ?? '',
        environment: TellerEnvironment.parse(json['environment']),
        connectPage: json['connectPage'] ?? '',
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static TellerSettings load() {
    final value = AppPreferences.get(AppPreferences.prefTeller);
    if (value == null || value.isEmpty) {
      return TellerSettings();
    }
    try {
      return TellerSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return TellerSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefTeller, jsonEncode(toJson()));

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

  static Future<void> _encrypt(String key, String value) => AppPreferences.set(key, EncryptionHandler.encrypt(value));

  static String? loadCertificate() => _decrypt(AppPreferences.prefTellerCertificate);

  static Future<void> saveCertificate(String pem) => _encrypt(AppPreferences.prefTellerCertificate, pem);

  static String? loadKey() => _decrypt(AppPreferences.prefTellerKey);

  static Future<void> saveKey(String pem) => _encrypt(AppPreferences.prefTellerKey, pem);

  static Future<void> clearCertificate() async {
    await AppPreferences.clear(AppPreferences.prefTellerCertificate);
    await AppPreferences.clear(AppPreferences.prefTellerKey);
  }

  static List<TellerEnrollment> loadEnrollments() {
    final value = _decrypt(AppPreferences.prefTellerEnrollments);
    if (value == null) {
      return [];
    }
    try {
      return (jsonDecode(value) as List)
          .whereType<Map<String, dynamic>>()
          .map(TellerEnrollment.fromJson)
          .where((e) => e.accessToken.isNotEmpty)
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveEnrollments(List<TellerEnrollment> enrollments) => enrollments.isEmpty
      ? AppPreferences.clear(AppPreferences.prefTellerEnrollments)
      : _encrypt(AppPreferences.prefTellerEnrollments, jsonEncode(enrollments.map((e) => e.toJson()).toList()));

  // A repaired enrollment keeps its id (and the token): the entry is replaced
  static List<TellerEnrollment> merge(List<TellerEnrollment> enrollments, TellerEnrollment item) => [
        for (final e in enrollments)
          if (e.accessToken != item.accessToken && (item.id.isEmpty || e.id != item.id)) e,
        item,
      ];
}
