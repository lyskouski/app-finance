// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_wrappers/tab_widget.dart';
import 'package:app_finance/widgets/settings/import_tab.dart';
import 'package:app_finance/widgets/settings/setting_tab.dart';
import 'package:app_finance/widgets/settings/recover_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class SettingsPage extends AbstractPage {
  SettingsPage() : super();

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends AbstractPageState<SettingsPage> {
  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return const SizedBox();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return TabWidget(
      focus: 0,
      tabs: [
        Tab(
          icon: const Icon(Icons.settings),
          text: AppLocalizations.of(context)!.settingsBaseHeadline,
        ),
        Tab(
          icon: const Icon(Icons.health_and_safety),
          text: AppLocalizations.of(context)!.recoveryHeadline,
        ),
        Tab(
          icon: const Icon(Icons.imagesearch_roller_sharp),
          text: AppLocalizations.of(context)!.importHeadline,
        ),
      ],
      children: [
        SettingTab(),
        const RecoverTab(),
        const ImportTab(),
      ],
    );
  }

  @override
  String getTitle(BuildContext context) {
    return AppLocalizations.of(context)!.settingsHeadline;
  }
}
