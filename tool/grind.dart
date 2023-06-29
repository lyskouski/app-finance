// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:grinder/grinder.dart';
import './localization.dart' as locale;

main(args) => grind(args);

@DefaultTask()
void defaultTask() {
  log('Run `dart run grinder -h` to view the list');
  log('Run `dart run grinder <taskName>` to execute the task');
}

@Task('Update Translations by sorting values alphabetically')
sortTranslations() {
  locale.sortArbKeys('./lib/l10n');
  log('Labels reordered');
}

@Task('Export Translations')
exportTranslations() {
  log('TBD: Messages extracted successfully');
}

@Task('Update Localized Files')
importTranslations() {
  log('TBD: Localized files generated successfully');
}
