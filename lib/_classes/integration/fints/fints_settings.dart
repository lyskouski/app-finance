// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:fints/fints.dart';

// Connection details of a FinTS 4.1 bank access, kept between sessions
// The PIN is never part of it - asked for on each connection
class FinTsSettings {
  // Product registration ID of the Deutsche Kreditwirtschaft
  // TBD: inject on build `--dart-define=FINTS_PRODUCT_ID=...`
  static const defaultProductId = String.fromEnvironment('FINTS_PRODUCT_ID');

  static const namespaces = {
    '4.1.1': FinTs4Namespaces.v411,
    '4.1': FinTs4Namespaces.v41,
  };

  String url;
  String bankCode;
  String userId;
  String customerId;
  String productId;
  String version;

  /// Bank account (accountKey) to the uuid of the application's account
  final Map<String, String> links;

  /// Bank account (accountKey) to the last day transactions were imported for
  final Map<String, DateTime> imported;

  FinTsSettings({
    this.url = '',
    this.bankCode = '',
    this.userId = '',
    this.customerId = '',
    this.productId = defaultProductId,
    this.version = '4.1.1',
    Map<String, String>? links,
    Map<String, DateTime>? imported,
  })  : links = links ?? {},
        imported = imported ?? {};

  bool get isComplete => url.isNotEmpty && bankCode.isNotEmpty && userId.isNotEmpty && productId.isNotEmpty;

  FinTs4Namespaces get namespace => namespaces[version] ?? FinTs4Namespaces.v411;

  FinTsConfig toConfig() => FinTsConfig(
        url: Uri.parse(url.trim()),
        bankCode: bankCode.trim(),
        userId: userId.trim(),
        customerId: customerId.trim().isEmpty ? null : customerId.trim(),
        productId: productId.trim(),
      );

  static String accountKey(Account account) {
    final iban = account.iban?.replaceAll(' ', '').toUpperCase();
    if (iban != null && iban.isNotEmpty) {
      return iban;
    }
    return [account.bankCode, account.accountNumber ?? '', account.subAccount ?? ''].join(':');
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'bankCode': bankCode,
        'userId': userId,
        'customerId': customerId,
        'productId': productId,
        'version': version,
        'links': links,
        'imported': imported.map((key, value) => MapEntry(key, value.toIso8601String())),
      };

  factory FinTsSettings.fromJson(Map<String, dynamic> json) => FinTsSettings(
        url: json['url'] ?? '',
        bankCode: json['bankCode'] ?? '',
        userId: json['userId'] ?? '',
        customerId: json['customerId'] ?? '',
        productId: (json['productId'] as String?)?.isNotEmpty == true ? json['productId'] : defaultProductId,
        version: namespaces.containsKey(json['version']) ? json['version'] : '4.1.1',
        links: (json['links'] as Map<String, dynamic>? ?? {}).map((key, value) => MapEntry(key, value.toString())),
        imported: (json['imported'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, DateTime.parse(value.toString())),
        ),
      );

  static FinTsSettings load() {
    final value = AppPreferences.get(AppPreferences.prefFinTs);
    if (value == null || value.isEmpty) {
      return FinTsSettings();
    }
    try {
      return FinTsSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return FinTsSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefFinTs, jsonEncode(toJson()));

  static String? loadState() {
    final value = AppPreferences.get(AppPreferences.prefFinTsState);
    if (value == null || value.isEmpty) {
      return null;
    }
    try {
      return EncryptionHandler.decrypt(value);
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveState(String state) =>
      AppPreferences.set(AppPreferences.prefFinTsState, EncryptionHandler.encrypt(state));

  static Future<void> clearState() => AppPreferences.clear(AppPreferences.prefFinTsState);
}
