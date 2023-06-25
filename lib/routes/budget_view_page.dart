// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/classes/appMenu.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/home/base_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';

class BudgetViewPage extends AbstractPage {
  String uuid;

  BudgetViewPage({
    required this.uuid,
  }) : super();

  @override
  BudgetViewPageState createState() => BudgetViewPageState();
}

class BudgetViewPageState extends AbstractPageState<BudgetViewPage> {
  @override
  String getTitle(context) {
    final item = widget.state?.getByUuid(AppDataType.budgets, widget.uuid);
    String? title = item!.title;
    return title ?? '';
  }

  void deactivateAccount(BuildContext context) {
    var data = widget.state?.getByUuid(AppDataType.budgets, widget.uuid);
    widget.state?.update(AppDataType.budgets, widget.uuid, (
      uuid: data.uuid,
      title: data.title,
      description: data.description,
      details: data.details,
      progress: data.progress,
      color: data.color,
      hidden: true,
    ));
    Navigator.pop(context);
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    String route =
        AppMenu(context: context).uuid(routes.budgetEditRoute, widget.uuid);
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 4;
    return Container(
      margin: EdgeInsets.only(left: indent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        FloatingActionButton(
          onPressed: () => deactivateAccount(context),
          tooltip: AppLocalizations.of(context)!.deleteBudgetTooltip,
          child: const Icon(Icons.delete),
        ),
        FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, route),
          tooltip: AppLocalizations.of(context)!.editBudgetTooltip,
          child: const Icon(Icons.edit),
        ),
      ]),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final item = widget.state?.getByUuid(AppDataType.budgets, widget.uuid);
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;
    final locale = Localizations.localeOf(context).toString();
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: '\$',
      decimalDigits: 2,
    );
    return Column(
      children: [
        BaseLineWidget(
          uuid: item.uuid,
          title: item.title,
          description: item.description,
          details: formatter.format(item.details),
          progress: item.progress,
          color: item.color,
          offset: offset,
          route: routes.budgetViewRoute,
        )
      ],
    );
  }
}
