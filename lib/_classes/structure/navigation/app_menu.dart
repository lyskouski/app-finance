// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu_item.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:flutter/material.dart';

class AppMenu {
  static String uuid(String route, String uuid) {
    return route.replaceAll('uuid:', 'uuid:$uuid');
  }

  static String metrics(String? route) {
    String target = AppRoute.metricsRoute;
    switch (route) {
      case AppRoute.accountRoute:
        return '$target/search:1';
      case AppRoute.budgetRoute:
        return '$target/search:0';
      case AppRoute.billRoute:
      default:
        return '$target/search:2';
    }
  }

  static String viewRoute2Edit(String route) => '$route/edit';

  static String search(String route, String title) {
    return '${route.replaceAll('uuid:', 'search:')}$title';
  }

  static AppMenuItem getByIndex(int index) {
    return get()[index];
  }

  static List<AppMenuItem> get() {
    return [
      AppMenuItem(
        name: AppLocale.labels.homeHeadline,
        icon: Icons.home,
        route: AppRoute.homeRoute,
      ),
      AppMenuItem(
        name: AppLocale.labels.goalHeadline,
        icon: Icons.star,
        route: AppRoute.goalRoute,
      ),
      AppMenuItem(
        name: AppLocale.labels.accountHeadline,
        icon: Icons.credit_card,
        route: AppRoute.accountRoute,
      ),
      AppMenuItem(
        name: AppLocale.labels.budgetHeadline,
        icon: Icons.calendar_month,
        route: AppRoute.budgetRoute,
      ),
      AppMenuItem(
        name: AppLocale.labels.billHeadline,
        icon: Icons.money_off,
        route: AppRoute.billRoute,
      ),
      AppMenuItem(
        name: AppLocale.labels.currencyHeadline,
        icon: Icons.currency_exchange,
        route: AppRoute.currencyRoute,
      ),
      AppMenuItem(
        name: AppLocale.labels.metricsHeadline,
        icon: Icons.timeline,
        route: AppRoute.metricsRoute,
      ),
      AppMenuItem(
        name: AppLocale.labels.automationHeadline,
        icon: Icons.access_alarms,
        route: AppRoute.automationRoute,
      ),
      AppMenuItem(
        name: AppLocale.labels.settingsHeadline,
        icon: Icons.settings,
        route: AppRoute.settingsRoute,
      ),
      AppMenuItem(
        name: AppLocale.labels.subscriptionHeadline,
        icon: Icons.switch_access_shortcut_add_outlined,
        route: AppRoute.subscriptionRoute,
      ),
      AppMenuItem(
        name: AppLocale.labels.aboutHeadline,
        icon: Icons.question_answer_outlined,
        route: AppRoute.aboutRoute,
      ),
    ];
  }
}
