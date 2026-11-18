// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/storage/app_preferences.dart';

class NotificationApp {
  String? account;
  String? category;
  String? pattern;
  // Additional keywords (comma separated) to detect income and to skip balance amounts
  String? income;
  String? balance;
  // Recognized notifications are imported without a confirmation
  bool auto;

  NotificationApp({this.account, this.category, this.pattern, this.income, this.balance, this.auto = false});

  bool get isLinked => account != null && category != null;

  Map<String, dynamic> toJson() => {
        if (account != null) 'account': account,
        if (category != null) 'category': category,
        if (pattern != null && pattern!.isNotEmpty) 'pattern': pattern,
        if (income != null && income!.isNotEmpty) 'income': income,
        if (balance != null && balance!.isNotEmpty) 'balance': balance,
        if (auto) 'auto': true,
      };

  factory NotificationApp.fromJson(Map<String, dynamic> json) => NotificationApp(
        account: json['account']?.toString(),
        category: json['category']?.toString(),
        pattern: json['pattern']?.toString(),
        income: json['income']?.toString(),
        balance: json['balance']?.toString(),
        auto: json['auto'] == true,
      );
}

class NotificationSettings {
  // Package name of the application => its link to the account
  final Map<String, NotificationApp> apps;

  NotificationSettings({Map<String, NotificationApp>? apps}) : apps = apps ?? {};

  NotificationApp get(String package) => apps.putIfAbsent(package, NotificationApp.new);

  Map<String, dynamic> toJson() => {
        'apps': apps.map((key, value) => MapEntry(key, value.toJson())),
      };

  factory NotificationSettings.fromJson(Map<String, dynamic> json) => NotificationSettings(
        apps: (json['apps'] as Map<String, dynamic>? ?? {}).map(
          (key, value) => MapEntry(key, NotificationApp.fromJson(value as Map<String, dynamic>)),
        ),
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
