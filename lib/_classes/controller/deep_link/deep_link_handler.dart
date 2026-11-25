// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';

import 'package:app_finance/_classes/controller/deep_link/url_scheme.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';

// Links opening the application
// > fingrom://integration/enablebanking?... sent back by the bank's authorization
// > fingrom://integration/teller?token=... sent back by the Teller Connect page
// > fingrom://integration/monzo?code=...&state=... sent back by the Monzo sign-in
class DeepLinkHandler {
  static const scheme = 'fingrom';
  static const enableBankingPath = '/enablebanking';
  static const tellerPath = '/teller';
  static const monzoPath = '/monzo';

  static final enableBankingCallback = ValueNotifier<Uri?>(null);
  static final tellerCallback = ValueNotifier<Uri?>(null);
  static final monzoCallback = ValueNotifier<Uri?>(null);
  static StreamSubscription<Uri>? _subscription;

  static Future<void> init({Stream<Uri>? links}) async {
    unawaited(registerUrlScheme(scheme).catchError((_) {}));
    await _subscription?.cancel();
    try {
      _subscription = (links ?? AppLinks().uriLinkStream).listen(handle, onError: (_) {});
    } catch (_) {
      // Platform without link support
    }
  }

  static bool isEnableBankingCallback(Uri uri) =>
      uri.scheme == scheme && uri.host == 'integration' && uri.path == enableBankingPath;

  static bool isTellerCallback(Uri uri) => uri.scheme == scheme && uri.host == 'integration' && uri.path == tellerPath;

  static bool isMonzoCallback(Uri uri) => uri.scheme == scheme && uri.host == 'integration' && uri.path == monzoPath;

  static bool handle(Uri uri) {
    if (isEnableBankingCallback(uri)) {
      enableBankingCallback.value = uri;
      return true;
    }
    if (isTellerCallback(uri)) {
      tellerCallback.value = uri;
      return true;
    }
    if (isMonzoCallback(uri)) {
      monzoCallback.value = uri;
      return true;
    }
    return false;
  }

  static Uri? takeEnableBankingCallback() {
    final value = enableBankingCallback.value;
    enableBankingCallback.value = null;
    return value;
  }

  static Uri? takeTellerCallback() {
    final value = tellerCallback.value;
    tellerCallback.value = null;
    return value;
  }

  static Uri? takeMonzoCallback() {
    final value = monzoCallback.value;
    monzoCallback.value = null;
    return value;
  }
}
