import 'package:app_finance/classes/appMenuItem.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

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
        route: routes.homeRoute,
      ),
      AppMenuItem(
        name: locale!.goalHeadline,
        icon: Icons.star,
        route: routes.homeRoute,
      ),
      AppMenuItem(
        name: locale!.accountHeadline,
        icon: Icons.credit_card,
        route: routes.accountRoute,
      ),
      AppMenuItem(
        name: locale!.budgetHeadline,
        icon: Icons.calendar_month,
        route: routes.budgetRoute,
      ),
      AppMenuItem(
        name: locale!.billHeadline,
        icon: Icons.money_off,
        route: routes.homeRoute,
      ),
      AppMenuItem(
        name: locale!.metricsHeadline,
        icon: Icons.timeline,
        route: routes.homeRoute,
      ),
      AppMenuItem(
        name: locale!.settingsHeadline,
        icon: Icons.settings,
        route: routes.homeRoute,
      ),
    ];
  }
}
