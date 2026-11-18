// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class NotificationRecord {
  final String id;
  final String package;
  final String title;
  final String text;
  final DateTime time;

  const NotificationRecord({
    required this.id,
    required this.package,
    required this.title,
    required this.text,
    required this.time,
  });

  factory NotificationRecord.fromMap(Map<dynamic, dynamic> map) => NotificationRecord(
        id: map['id'].toString(),
        package: map['package'].toString(),
        title: map['title']?.toString() ?? '',
        text: map['text']?.toString() ?? '',
        time: DateTime.fromMillisecondsSinceEpoch((map['time'] as num?)?.toInt() ?? 0),
      );
}

// Bridge to the Android notification listener (`NotificationParserService`)
class NotificationChannel {
  static const channel = MethodChannel('com.tercad.fingrom/notifications');

  static bool get isSupported => !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  const NotificationChannel();

  Future<bool> isGranted() async => await channel.invokeMethod<bool>('isGranted') ?? false;

  Future<void> openSettings() => channel.invokeMethod<void>('openSettings');

  // Applications that have posted notifications: package => label
  Future<Map<String, String>> getApps() async {
    final result = await channel.invokeMapMethod<String, dynamic>('getApps') ?? {};
    return result.map((key, value) => MapEntry(key, value.toString()));
  }

  Future<Set<String>> getPackages() async =>
      (await channel.invokeListMethod<String>('getPackages') ?? const <String>[]).toSet();

  Future<void> setPackages(Iterable<String> packages) =>
      channel.invokeMethod<void>('setPackages', {'packages': packages.toList()});

  Future<List<NotificationRecord>> getNotifications() async {
    final result = await channel.invokeListMethod<Map<dynamic, dynamic>>('getNotifications') ?? const [];
    return result.map(NotificationRecord.fromMap).toList();
  }

  Future<void> removeNotifications(Iterable<String> ids) =>
      channel.invokeMethod<void>('removeNotifications', {'ids': ids.toList()});
}
