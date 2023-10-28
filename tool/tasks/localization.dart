// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:grinder/grinder.dart';
import '../_classes/localization.dart' as locale;

@Task('Update Translations by sorting values alphabetically')
sortTranslations() {
  TaskArgs args = context.invocation.arguments;
  bool isQuiet = args.getFlag('quiet');
  bool isChanged = locale.sortArbKeys('./lib/l10n');
  if (isChanged && !isQuiet) {
    fail('Changes detected');
  }
}

exportTranslations() {
  log('TBD: Messages extracted successfully');
}

importTranslations() {
  log('TBD: Localized files generated successfully');
}
