// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/pages/start/widgets/abstract_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class UsageTab extends AbstractTab {
  const UsageTab({
    super.key,
    required super.setState,
    required super.setButton,
    required super.isFirstBoot,
  });

  @override
  UsageTabState createState() => UsageTabState();
}

class UsageTabState extends AbstractTabState<UsageTab> {
  @override
  String getButtonTitle() => AppLocale.labels.acknowledgeTooltip;

  @override
  IconData getButtonIcon() => Icons.library_add_check;

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final locale = AppLocale.labels.localeName;
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('./assets/l10n/terms_of_use_$locale.md'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(data: snapshot.data ?? '');
        }
        return Container();
      },
    );
  }
}
