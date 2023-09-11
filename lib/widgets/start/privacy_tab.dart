// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/widgets/start/abstract_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyTab extends AbstractTab {
  const PrivacyTab({
    super.key,
    required super.setState,
    required super.isFirstBoot,
  });

  @override
  PrivacyTabState createState() => PrivacyTabState();
}

class PrivacyTabState extends AbstractTabState<PrivacyTab> {
  @override
  String getButtonTitle() {
    return AppLocale.labels.acknowledgeTooltip;
  }

  @override
  void updateState() {
    AppPreferences.set(AppPreferences.prefPrivacyPolicy, 'true');
    super.updateState();
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final locale = AppLocale.labels.localeName;
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('./assets/l10n/privacy_policy_$locale.md'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(data: snapshot.data ?? '');
        }
        return Container();
      },
    );
  }
}
