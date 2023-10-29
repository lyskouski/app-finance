// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:grinder/grinder.dart';
import 'package:path/path.dart' as path;

installGitHooks() {
  final currDir = Directory('./');
  final hookDir = Directory('./.git/hooks');
  final hookNames = ['pre-commit', 'pre-push'];
  for (final name in hookNames) {
    log('Applying: $name');
    final sourceFile = File(path.join(currDir.absolute.path, name));
    sourceFile.copySync(path.join(hookDir.absolute.path, name));
    if (!Platform.isWindows) {
      Process.runSync('chmod', ['ug+x', './.git/hooks/$name']);
    }
  }
  log('Git Hooks applied!');
}
