// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/start/setting_tab.dart';
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
    return SettingTab(setState: () {}, title: '');
  }

  @override
  String getTitle(BuildContext context) {
    return AppLocalizations.of(context)!.settingsHeadline;
  }
}
