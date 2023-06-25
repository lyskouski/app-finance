// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

const String homeRoute = '/app/finance';
const String accountRoute = '/app/finance/account';
const String accountAddRoute = '/app/finance/account/add';
const String accountViewRoute = '/app/finance/account/uuid:';
const String accountEditRoute = '/app/finance/account/uuid:/edit';
const String budgetRoute = '/app/finance/budget';
const String budgetAddRoute = '/app/finance/budget/add';
const String budgetViewRoute = '/app/finance/budget/uuid:';
const String budgetEditRoute = '/app/finance/budget/uuid:/edit';

class AppMenuItem {
  String name;
  IconData icon;
  String route;

  AppMenuItem({
    required this.name,
    required this.icon,
    required this.route,
  });
}

class AppMenu {
  BuildContext context;
  AppLocalizations? locale;

  AppMenu({required this.context}) {
    locale = AppLocalizations.of(context);
  }

  String uuid(String route, String uuid) {
    return route.replaceAll('uuid:', 'uuid:$uuid');
  }

  AppMenuItem getByIndex(int index) {
    return get()[index];
  }

  List<AppMenuItem> get() {
    return [
      AppMenuItem(
        name: locale!.homeHeadline,
        icon: Icons.home,
        route: homeRoute,
      ),
      AppMenuItem(
        name: locale!.goalHeadline,
        icon: Icons.star,
        route: homeRoute,
      ),
      AppMenuItem(
        name: locale!.accountHeadline,
        icon: Icons.credit_card,
        route: accountRoute,
      ),
      AppMenuItem(
        name: locale!.budgetHeadline,
        icon: Icons.calendar_month,
        route: budgetRoute,
      ),
      AppMenuItem(
        name: locale!.billHeadline,
        icon: Icons.money_off,
        route: homeRoute,
      ),
      AppMenuItem(
        name: locale!.metricsHeadline,
        icon: Icons.timeline,
        route: homeRoute,
      ),
      AppMenuItem(
        name: locale!.settingsHeadline,
        icon: Icons.settings,
        route: homeRoute,
      ),
    ];
  }
}
