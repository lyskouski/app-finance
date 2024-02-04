// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/transaction_log/abstract_protocol.dart';
import 'package:app_finance/_classes/storage/transaction_log/interface_protocol.dart';
import 'package:app_finance/_classes/storage/transaction_log/web_dav_data.dart';
import 'package:flutter/foundation.dart';
import 'package:webdav_client/webdav_client.dart';

class WebDavProtocol extends AbstractProtocol implements InterfaceProtocol {
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

  Future<Client?> _connect(WebDavData data) async {
    if (data.isEmpty()) {
      callbackMessage(message = AppLocale.labels.isRequired);
      return null;
    }
    callbackProgress(inProgress = true);
    Client? client = newClient(data.link, user: data.username, password: data.password);
    client = await client.ping().then((_) => client).onError((error, _) {
      callbackMessage(message = AppLocale.labels.error(error.toString()));
      callbackProgress(inProgress = false);
      return null;
    });
    return client;
  }

  @override
  Future<void> save(data) async {
    final client = await _connect(data);
    if (client == null) {
      return;
    }
    final codeUnits = await exportTransactions();
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
  Future<void> load(data, [bool isEncrypted = true, bool isCleaned = false]) async {
    final client = await _connect(data);
    if (client == null) {
      return;
    }
    final content = await client.read(data.path).catchError((err) {
      callbackMessage(message = AppLocale.labels.error(err.toString()));
      callbackProgress(inProgress = false);
      return Future<List<int>>.value([]);
    });
    if (isCleaned) {
      clearTransactions();
    }
    importTransactions(content, isEncrypted);
    callbackProgress(inProgress = false);
    if (message == '') {
      callbackMessage(message = AppLocale.labels.success);
    }
  }
}
