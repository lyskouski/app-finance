// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notifications/notifications.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({
    super.key,
  });

  @override
  NotificationTabState createState() => NotificationTabState();
}

class NotificationTabState extends State<NotificationTab> {
  Notifications? _notifications;
  StreamSubscription<NotificationEvent>? _subscription;

  void onData(NotificationEvent event) {
    print(event);
  }

  void stopListening() {
    _subscription?.cancel();
  }

  void startListening() {
    _notifications = Notifications();
    try {
      _subscription = _notifications!.notificationStream!.listen(onData);
    } on NotificationException catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
