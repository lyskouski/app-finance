// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

const bool isTellerCertificateSupported = true;

// Mutual TLS: the certificate and the private key issued in the Teller Dashboard identify the application
http.Client createTellerHttpClient({String? certificate, String? privateKey}) {
  if (certificate == null || privateKey == null) {
    return http.Client();
  }
  final context = SecurityContext(withTrustedRoots: true)
    ..useCertificateChainBytes(utf8.encode(certificate))
    ..usePrivateKeyBytes(utf8.encode(privateKey));
  return IOClient(HttpClient(context: context));
}
