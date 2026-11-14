// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';

// Android, iOS, macOS (Info.plist / manifest), Linux (desktop file) and the MSIX package declare the scheme on install.
// The unpackaged Windows build registers it for the current user, pointing at its own executable.
Future<void> registerUrlScheme(String scheme) async {
  if (!Platform.isWindows) {
    return;
  }
  final executable = Platform.resolvedExecutable;
  if (executable.toLowerCase().contains(r'\windowsapps\')) {
    return;
  }
  final key = r'HKCU\Software\Classes\' + scheme;
  for (final arguments in [
    ['add', key, '/ve', '/d', 'URL:Fingrom', '/f'],
    ['add', key, '/v', 'URL Protocol', '/d', '', '/f'],
    ['add', '$key\\shell\\open\\command', '/ve', '/d', '"$executable" "%1"', '/f'],
  ]) {
    await Process.run('reg', arguments);
  }
}
