// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_mixins/launcher_mixin.dart';
import 'package:app_finance/pages/start/widgets/abstract_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

class AccountAboutTab extends AbstractTab {
  const AccountAboutTab({
    super.key,
    required super.setState,
    required super.setButton,
    super.isFirstBoot = true,
  });

  @override
  AccountAboutTabState createState() => AccountAboutTabState();
}

class AccountAboutTabState<T extends AccountAboutTab> extends AbstractTabState<T> with LauncherMixin {
  @override
  String getButtonTitle() => '';

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final locale = Provider.of<AppLocale>(context, listen: false);
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('./assets/l10n/about_account_${locale.value!}.md'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Markdown(data: snapshot.data!.replaceAll('../images', 'resource:assets/images'));
        }
        return Container();
      },
    );
  }
}
