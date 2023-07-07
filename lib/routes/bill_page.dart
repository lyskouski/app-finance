// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/home/bill_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BillPage extends AbstractPage {
  @override
  BillPageState createState() => BillPageState();
}

class BillPageState extends AbstractPageState<BillPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.billHeadline;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, AppRoute.billAddRoute),
      tooltip: AppLocalizations.of(context)!.addMainTooltip,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    return Column(
      children: [
        BillWidget(
          margin: EdgeInsets.all(helper.getIndent()),
          title: AppLocalizations.of(context)!.billHeadline,
          state: super.state.get(AppDataType.bills),
          offset: MediaQuery.of(context).size.width - helper.getIndent() * 2,
        )
      ],
    );
  }
}
