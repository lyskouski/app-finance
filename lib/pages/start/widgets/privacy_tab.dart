// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/design/wrapper/markdown_builder_wrapper.dart';
import 'package:app_finance/pages/start/widgets/abstract_tab.dart';
import 'package:flutter/material.dart';

class PrivacyTab extends AbstractTab {
  const PrivacyTab({
    super.key,
    required super.setState,
    required super.setButton,
    required super.isFirstBoot,
  });

  @override
  PrivacyTabState createState() => PrivacyTabState();
}

class PrivacyTabState extends AbstractTabState<PrivacyTab> {
  @override
  String getButtonTitle() => AppLocale.labels.acknowledgeTooltip;

  @override
  IconData getButtonIcon() => Icons.library_add_check;

  @override
  void updateState() {
    AppPreferences.set(AppPreferences.prefPrivacyPolicy, 'true');
    super.updateState();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final locale = AppLocale.labels.localeName;
    return MarkdownBuilderWrapper(url: './assets/l10n/privacy_policy_$locale.md');
  }
}
