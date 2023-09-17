// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/widgets/wrapper/full_sized_button_widget.dart';
import 'package:app_finance/widgets/wrapper/tab_widget.dart';
import 'package:app_finance/pages/start/widgets/account_tab.dart';
import 'package:app_finance/pages/start/widgets/budget_tab.dart';
import 'package:app_finance/pages/start/widgets/privacy_tab.dart';
import 'package:app_finance/pages/start/widgets/setting_tab.dart';
import 'package:app_finance/widgets/wrapper/toolbar_button_widget.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends AbstractPageState<StartPage> {
  int currentStep = 0;
  Widget button = ThemeHelper.emptyBox;
  List<Widget> barActions = [];
  String buttonName = AppLocale.labels.goNextTooltip;

  @override
  String getTitle() => AppLocale.labels.appStartHeadline;

  @override
  String getButtonName() => buttonName;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => button;

  @override
  List<Widget> getBarActions(NavigatorState nav) => barActions;

  @override
  Widget? getBarLeading(NavigatorState nav) => null;

  void updateState(Widget? btn, NavigatorState nav) {
    if (btn != null) {
      setState(() {
        button = btn;
        buttonName = (btn as FullSizedButtonWidget).title;
      });
    } else if (currentStep > 2) {
      nav.popAndPushNamed(AppRoute.homeRoute);
    } else {
      setState(() {
        button = ThemeHelper.emptyBox;
        currentStep += 1;
        if (barActions.isEmpty && currentStep > 1) {
          barActions = [
            ToolbarButtonWidget(
              child: IconButton(
                hoverColor: Colors.transparent,
                icon: const Icon(
                  Icons.skip_next,
                  color: Colors.white70,
                ),
                tooltip: AppLocale.labels.skipTooltip,
                onPressed: () => nav.pushNamed(AppRoute.homeRoute),
              ),
            )
          ];
        }
      });
    }
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    fn([Widget? btn]) => updateState(btn, nav);
    final isEmpty = button == ThemeHelper.emptyBox;
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: TabWidget(
        asDots: true,
        focus: currentStep,
        children: [
          SettingTab(setState: fn, isFirstBoot: currentStep < 1 && isEmpty),
          PrivacyTab(setState: fn, isFirstBoot: currentStep < 2 && isEmpty),
          AccountTab(setState: fn, isFirstBoot: currentStep < 3 && isEmpty),
          BudgetTab(setState: fn, isFirstBoot: isEmpty),
        ],
      ),
    );
  }
}
