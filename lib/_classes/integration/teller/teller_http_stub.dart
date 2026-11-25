// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:http/http.dart' as http;

// Browsers cannot present a client certificate: only the sandbox is reachable (if CORS allows it)
const bool isTellerCertificateSupported = false;

http.Client createTellerHttpClient({String? certificate, String? privateKey}) => http.Client();
