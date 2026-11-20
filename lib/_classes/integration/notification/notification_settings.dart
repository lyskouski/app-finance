// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/integration/notification/notification_parser.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class NotificationApp {
  String? account;
  String? category;
  // Currency (code) of amounts without one, and the preferred one for ambiguous symbols ($, kr)
  String? currency;

  NotificationApp({this.account, this.category, this.currency});

  bool get isLinked => account != null && category != null;

  Map<String, dynamic> toJson() => {
        if (account != null) 'account': account,
        if (category != null) 'category': category,
        if (currency != null) 'currency': currency,
      };

  factory NotificationApp.fromJson(Map<String, dynamic> json) => NotificationApp(
        account: json['account']?.toString(),
        category: json['category']?.toString(),
        currency: json['currency']?.toString(),
      );
}

class NotificationSettings {
  // Package name of the application => its link to the account
  final Map<String, NotificationApp> apps;
  // Keywords to detect income, to skip balance amounts and to find a merchant (for all apps), the built-in ones by default
  List<String> income;
  List<String> balance;
  List<String> merchant;
  // Keywords to recognize the account (uuid) of a transaction, otherwise the default one of the app is taken
  Map<String, List<String>> accounts;

  NotificationSettings({
    Map<String, NotificationApp>? apps,
    List<String>? income,
    List<String>? balance,
    List<String>? merchant,
    Map<String, List<String>>? accounts,
  })  : apps = apps ?? {},
        accounts = accounts ?? {},
        income = income ?? [...NotificationParser.incomeKeywords],
        balance = balance ?? [...NotificationParser.balanceKeywords],
        merchant = merchant ?? [...NotificationParser.merchantLabels];

  NotificationApp get(String package) => apps.putIfAbsent(package, NotificationApp.new);

  Map<String, dynamic> toJson() => {
        'apps': apps.map((key, value) => MapEntry(key, value.toJson())),
        'income': income,
        'balance': balance,
        'merchant': merchant,
        'accounts': {
          for (final entry in accounts.entries)
            if (entry.value.isNotEmpty) entry.key: entry.value,
        },
      };

  static List<String>? _toKeywords(dynamic value) =>
      value is List ? NotificationParser.toKeywords(value.map((e) => e.toString())) : null;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) => NotificationSettings(
        apps: (json['apps'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, NotificationApp.fromJson(value as Map<String, dynamic>)),
        ),
        income: _toKeywords(json['income']),
        balance: _toKeywords(json['balance']),
        merchant: _toKeywords(json['merchant']),
        accounts: (json['accounts'] as Map<String, dynamic>? ?? {})
            .map((key, value) => MapEntry(key, _toKeywords(value) ?? <String>[])),
      );

  static NotificationSettings load() {
    final value = AppPreferences.get(AppPreferences.prefNotification);
    if (value == null || value.isEmpty) {
      return NotificationSettings();
    }
    try {
      return NotificationSettings.fromJson(jsonDecode(value));
    } on FormatException {
      return NotificationSettings();
    } on TypeError {
      return NotificationSettings();
    }
  }

  Future<void> save() => AppPreferences.set(AppPreferences.prefNotification, jsonEncode(toJson()));
}
