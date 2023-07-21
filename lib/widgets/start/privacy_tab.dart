// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/widgets/start/abstract_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyTab extends AbstractTab {
  PrivacyTab({
    super.setState,
  }) : super();

  @override
  PrivacyTabState createState() => PrivacyTabState();
}

class PrivacyTabState extends AbstractTabState<PrivacyTab> {
  @override
  String getButtonTitle() {
    return AppLocalizations.of(context)!.acknowledgeTooltip;
  }

  @override
  Widget buildContent(BuildContext context) {
    final locale = AppLocalizations.of(context)!.localeName;
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('./assets/l10n/privacy_policy_$locale.md'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(data: snapshot.data ?? '');
        }
        return Container();
      },
    );
  }
}
