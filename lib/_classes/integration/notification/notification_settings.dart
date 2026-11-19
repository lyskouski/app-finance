// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/integration/notification/notification_parser.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';

class NotificationApp {
  String? account;
  String? category;
  String? pattern;
  // Recognized notifications are imported without a confirmation
  bool auto;

  NotificationApp({this.account, this.category, this.pattern, this.auto = false});

  bool get isLinked => account != null && category != null;

  Map<String, dynamic> toJson() => {
        if (account != null) 'account': account,
        if (category != null) 'category': category,
        if (pattern != null && pattern!.isNotEmpty) 'pattern': pattern,
        if (auto) 'auto': true,
      };

  factory NotificationApp.fromJson(Map<String, dynamic> json) => NotificationApp(
        account: json['account']?.toString(),
        category: json['category']?.toString(),
        pattern: json['pattern']?.toString(),
        auto: json['auto'] == true,
      );
}

class NotificationSettings {
  // Package name of the application => its link to the account
  final Map<String, NotificationApp> apps;
  // Keywords to detect income and to skip balance amounts (for all apps), the built-in ones by default
  List<String> income;
  List<String> balance;

  NotificationSettings({Map<String, NotificationApp>? apps, List<String>? income, List<String>? balance})
      : apps = apps ?? {},
        income = income ?? [...NotificationParser.incomeKeywords],
        balance = balance ?? [...NotificationParser.balanceKeywords];

  NotificationApp get(String package) => apps.putIfAbsent(package, NotificationApp.new);

  Map<String, dynamic> toJson() => {
        'apps': apps.map((key, value) => MapEntry(key, value.toJson())),
        'income': income,
        'balance': balance,
      };

  static List<String>? _toKeywords(dynamic value) =>
      value is List ? NotificationParser.toKeywords(value.map((e) => e.toString())) : null;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) => NotificationSettings(
        apps: (json['apps'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, NotificationApp.fromJson(value as Map<String, dynamic>)),
        ),
        income: _toKeywords(json['income']),
        balance: _toKeywords(json['balance']),
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
