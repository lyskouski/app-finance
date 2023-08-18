// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/widgets/_generic/abstract_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyTab extends AbstractTab {
  PrivacyTab({
    required super.setState,
  }) : super();

  @override
  PrivacyTabState createState() => PrivacyTabState();
}

class PrivacyTabState extends AbstractTabState<PrivacyTab> with SharedPreferencesMixin {
  @override
  String getButtonTitle() {
    return AppLocale.labels.acknowledgeTooltip;
  }

  @override
  void updateState() {
    setPreference(prefPrivacyPolicy, 'true');
    super.updateState();
  }

  @override
  Widget buildContent(BuildContext context) {
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
