// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/routes/account_add_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountTab extends AccountAddPage {
  final bool isFirstBoot;
  final Function([Widget? btn]) setState;

  const AccountTab({
    super.key,
    required this.isFirstBoot,
    required this.setState,
  });

  @override
  AccountTabState createState() => AccountTabState();
}

class AccountTabState extends AccountAddPageState<AccountTab> {
  @override
  void triggerActionButton(NavigatorState nav) {
    setState(() {
      if (hasFormErrors()) {
        return;
      }
      updateStorage();
      AppPreferences.set(AppPreferences.prefAccount, super.state.getList(AppDataType.accounts).first?.uuid);
      (widget as AccountTab).setState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      return Padding(
        padding: EdgeInsets.only(top: ThemeHelper.getIndent(2)),
        child: LayoutBuilder(builder: (context, constraints) {
          if ((widget as AccountTab).isFirstBoot) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              (widget as AccountTab).setState(buildButton(context, constraints));
            });
            return ThemeHelper.emptyBox;
          }
          return buildContent(context, constraints);
        }),
      );
    });
  }
}
