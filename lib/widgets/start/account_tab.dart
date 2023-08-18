// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes/account_add_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountTab extends AccountAddPage {
  final Function() setState;

  AccountTab({
    required this.setState,
  }) : super();

  @override
  AccountTabState createState() => AccountTabState();
}

class AccountTabState extends AccountAddPageState<AccountTab> with SharedPreferencesMixin {
  @override
  void triggerActionButton(NavigatorState nav) {
    setState(() {
      if (hasFormErrors()) {
        return;
      }
      updateStorage();
      setPreference(prefAccount, super.state.getList(AppDataType.accounts).first?.uuid);
      (widget as AccountTab).setState();
    });
  }

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      return Padding(
        padding: EdgeInsets.only(top: indent),
        child: LayoutBuilder(builder: (context, constraints) {
          return Scaffold(
            floatingActionButton: buildButton(context, constraints),
            body: buildContent(context, constraints),
          );
        }),
      );
    });
  }
}
