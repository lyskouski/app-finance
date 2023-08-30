// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_wrappers/tab_widget.dart';
import 'package:app_finance/widgets/start/account_tab.dart';
import 'package:app_finance/widgets/start/budget_tab.dart';
import 'package:app_finance/widgets/start/privacy_tab.dart';
import 'package:app_finance/widgets/start/setting_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartPage extends AbstractPage {
  StartPage() : super();

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends AbstractPageState<StartPage> {
  int currentStep = 0;

  @override
  AppBar buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      toolbarHeight: 40,
      automaticallyImplyLeading: false,
      actions: const [],
      title: Center(
        child: Text(
          getTitle(),
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
    );
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  void updateState(NavigatorState nav) {
    if (currentStep > 2) {
      nav.popAndPushNamed(AppRoute.homeRoute);
    } else {
      setState(() => currentStep += 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);
    fn() => updateState(nav);
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      return Scaffold(
        appBar: buildBar(context),
        body: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: TabWidget(
            asDots: true,
            focus: currentStep,
            children: [
              SettingTab(setState: fn),
              PrivacyTab(setState: fn),
              AccountTab(setState: fn),
              BudgetTab(setState: fn),
            ],
          ),
        ),
      );
    });
  }

  @override
  String getTitle() {
    return AppLocale.labels.appStartHeadline;
  }
}
