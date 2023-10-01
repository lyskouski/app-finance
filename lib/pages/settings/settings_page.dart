// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/widgets/wrapper/tab_widget.dart';
import 'package:app_finance/pages/settings/widgets/import_tab.dart';
import 'package:app_finance/pages/settings/widgets/setting_tab.dart';
import 'package:app_finance/pages/settings/widgets/recover_tab.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends AbstractPageState<SettingsPage> {
  @override
  String getTitle() => AppLocale.labels.settingsHeadline;

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => ThemeHelper.emptyBox;

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return TabWidget(
      focus: 0,
      isLeft: ThemeHelper.isNavRight(context, constraints),
      tabs: [
        Tab(
          icon: const Icon(Icons.settings),
          text: AppLocale.labels.settingsBaseHeadline,
        ),
        Tab(
          icon: const Icon(Icons.health_and_safety),
          text: AppLocale.labels.recoveryHeadline,
        ),
        Tab(
          icon: const Icon(Icons.imagesearch_roller_sharp),
          text: AppLocale.labels.importHeadline,
        ),
      ],
      children: const [
        SettingTab(),
        RecoverTab(),
        ImportTab(),
      ],
    );
  }
}
