// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:grinder/grinder.dart';
import './localization.dart' as locale;

main(args) => grind(args);

@DefaultTask()
void defaultTask() {
  log('Run `dart run grinder -h` to view the list');
  log('Run `dart run grinder <taskName>` to execute the task');
}

@Task('Install Git Hooks')
installGitHooks() {
  final currDir = Directory('./');
  final hookDir = Directory('./.git/hooks');
  final hookNames = ['pre-commit', 'pre-push'];
  for (final name in hookNames) {
    log('Applying: $name');
    final sourceFile = File(path.join(currDir.absolute.path, name));
    sourceFile.copySync(path.join(hookDir.absolute.path, name));
  }
  log('Git Hooks applied!');
}

@Task('Update Translations by sorting values alphabetically')
sortTranslations() {
  TaskArgs args = context.invocation.arguments;
  bool isQuiet = args.getFlag('quiet');
  bool isChanged = locale.sortArbKeys('./lib/l10n');
  if (isChanged && !isQuiet) {
    fail('Changes detected');
  }
}

@Task('Export Translations')
exportTranslations() {
  log('TBD: Messages extracted successfully');
}

@Task('Update Localized Files')
importTranslations() {
  log('TBD: Localized files generated successfully');
}
