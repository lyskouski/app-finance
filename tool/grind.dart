// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:grinder/grinder.dart';
import './tasks/mock.dart' as m;
import './tasks/test.dart' as t;
import './tasks/coverage.dart' as c;
import './tasks/hook.dart' as h;
import './tasks/release.dart' as r;
import './tasks/localization.dart' as l;
import './tasks/dependency.dart' as d;

main(args) => grind(args);

@DefaultTask()
void defaultTask() {
  log('Run `dart run grinder -h` to view the list');
  log('Run `dart run grinder <taskName>` to execute the task');
}

@Task('Generate Mocks')
mock() => m.mock();

@Task('Fix Mocks by Dart Format')
fixMock() => m.fixMock();

@Task('Run tests')
@Depends(mock)
test() => t.test();

@Task('Generate file with all lib/**.dart-files included')
fullCoverage() => c.fullCoverage();

@Task('Generate Coverage Badge for README.md file')
coverageBadge() => c.coverageBadge();

@Task('Generate Dependency Graph')
generateClassGraph() => d.generateClassGraph();

@Task('Create Dependency Graph\n'
    '    To show the diff on pull-request use: --diff --from=hash --to=hash\n'
    '    Sample: --diff --from=\${{ github.event.pull_request.base.sha }}'
    ' --to=\${{ github.event.pull_request.head.sha }}')
@Depends(generateClassGraph)
createClassGraph() => d.createClassGraph();

@Task('Create Dependency Graph from existing .dot-file\n    Required: --file="{path}"')
createClassGraphFromDot() => d.createClassGraphFromDot();

@Task('Install Git Hooks')
installGitHooks() => h.installGitHooks();

@Task('Generate Release Notes')
releaseNotes() => r.releaseNotes();

@Task('Patch Config Files')
pubspecUpdate() => r.pubspecUpdate();

@Task('Update Translations by sorting values alphabetically')
sortTranslations() => l.sortTranslations();

@Task('Export Translations\n    To limit the scope use: --filter={language}\n    Sample: --filter="en|be"')
exportTranslations() => l.exportTranslations();

@Task('Import Translations\n    Required: --file="{path}"')
importTranslations() => l.importTranslations();
