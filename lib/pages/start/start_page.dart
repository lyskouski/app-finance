// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/start/widgets/about_tab.dart';
import 'package:app_finance/pages/start/widgets/account_about_tab.dart';
import 'package:app_finance/pages/start/widgets/budget_about_tab.dart';
import 'package:app_finance/pages/start/widgets/usage_tab.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/wrapper/tab_widget.dart';
import 'package:app_finance/pages/start/widgets/account_tab.dart';
import 'package:app_finance/pages/start/widgets/budget_tab.dart';
import 'package:app_finance/pages/start/widgets/privacy_tab.dart';
import 'package:app_finance/pages/start/widgets/setting_tab.dart';
import 'package:app_finance/design/button/toolbar_button_widget.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends AbstractPageState<StartPage> {
  int currentStep = 0;
  static const acknowledgeTaken = 3;
  static const finalStep = 4;
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
  Widget? buildNavigation() => null;

  @override
  Widget? getBarLeading(NavigatorState nav) => ThemeHelper.emptyBox;

  void _setButton(Widget btn, NavigatorState nav) => setState(() {
        button = btn;
        buttonName = (btn as FullSizedButtonWidget).title;
        if (barActions.isEmpty && currentStep > acknowledgeTaken) {
          barActions = [
            ToolbarButtonWidget(
              icon: Icons.skip_next,
              color: Colors.white70,
              tooltip: AppLocale.labels.skipTooltip,
              onPressed: () => nav.pushNamed(AppRoute.homeRoute),
            ),
          ];
        }
      });

  void _goNext(int step) => setState(() {
        button = ThemeHelper.emptyBox;
        currentStep = step + 1;
      });

  void _finalize(NavigatorState nav) => nav.popAndPushNamed(AppRoute.homeRoute);

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    fn(Widget btn) => _setButton(btn, nav);
    final isEmpty = button == ThemeHelper.emptyBox;
    int i = 0;
    return Padding(
      padding: EdgeInsets.only(top: ThemeHelper.getIndent(0.5)),
      child: TabWidget(
        type: TabType.dots,
        callback: (i) => _goNext(--i),
        focus: currentStep,
        children: [
          AboutTab(
            setButton: fn,
            setState: () => _goNext(0),
            isFirstBoot: currentStep == i++ && isEmpty,
          ),
          PrivacyTab(
            setButton: fn,
            setState: () => _goNext(1),
            isFirstBoot: currentStep == i++ && isEmpty,
          ),
          UsageTab(
            setButton: fn,
            setState: () => _goNext(2),
            isFirstBoot: currentStep == i++ && isEmpty,
          ),
          SettingTab(
            setButton: fn,
            setState: () => _goNext(3),
            isFirstBoot: currentStep == i++ && isEmpty,
          ),
          AccountAboutTab(
            setButton: fn,
            setState: () => _goNext(4),
            isFirstBoot: currentStep == i++ && isEmpty,
          ),
          AccountTab(
            setButton: fn,
            setState: () => _goNext(5),
            isFirstBoot: currentStep == i++ && isEmpty,
          ),
          BudgetAboutTab(
            setButton: fn,
            setState: () => _goNext(6),
            isFirstBoot: currentStep == i++ && isEmpty,
          ),
          BudgetTab(
            setButton: fn,
            setState: () => _finalize(nav),
            isFirstBoot: currentStep == i++ && isEmpty,
          ),
        ],
      ),
    );
  }
}
