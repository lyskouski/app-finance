// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_classes/storage/transaction_log/interface_protocol.dart';
import 'package:app_finance/_classes/storage/transaction_log/web_dav_data.dart';
import 'package:flutter/foundation.dart';
import 'package:webdav_client/webdav_client.dart';

class WebDavProtocol implements InterfaceProtocol {
  @override
  final Function callbackMessage;
  @override
  final Function callbackProgress;
  String message = '';
  bool inProgress = false;

  WebDavProtocol({
    required this.callbackMessage,
    required this.callbackProgress,
  });

  Client? _connect(WebDavData data) {
    if (data.isEmpty()) {
      callbackMessage(message = AppLocale.labels.isRequired);
      return null;
    }
    callbackProgress(inProgress = true);
    return newClient(data.link, user: data.username, password: data.password);
  }

  @override
  Future<void> save(data) async {
    final client = _connect(data);
    if (client == null) {
      return;
    }
    List<int> codeUnits = [];
    await for (String line in TransactionLog.read()) {
      codeUnits.addAll(line.codeUnits);
      codeUnits.addAll('\n'.codeUnits);
    }
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    callbackMessage(message = '');
    await client.write(data.path, unit8List).catchError((err) {
      callbackMessage(message = AppLocale.labels.error(err.toString()));
      callbackProgress(inProgress = false);
    });
    callbackProgress(inProgress = false);
    if (message == '') {
      callbackMessage(message = AppLocale.labels.success);
    }
  }

  @override
  Future<void> load(data) async {
    final client = _connect(data);
    if (client == null) {
      return;
    }
    List<int> uint8list = await client.read(data.path);
    List<String> lines = String.fromCharCodes(uint8list).split('\n');
    for (String line in lines) {
      TransactionLog.save(line, true);
    }
    callbackProgress(inProgress = false);
    callbackMessage(message = AppLocale.labels.success);
  }
}
