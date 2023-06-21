// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/home/account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class AccountPage extends AbstractPage {
  AccountPage({
    required AppData state,
  }) : super(state: state);

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends AbstractPageState<AccountPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.accountHeadline;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, routes.accountAddRoute),
      tooltip: AppLocalizations.of(context)!.addAccountTooltip,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(
      BuildContext context, BoxConstraints constraints, AppData state) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    return Column(
      children: [
        AccountWidget(
          margin: EdgeInsets.all(helper.getIndent()),
          title: AppLocalizations.of(context)!.accountHeadline,
          state: state.state['accounts'],
          offset: MediaQuery.of(context).size.width - helper.getIndent() * 2,
        )
      ],
    );
  }
}
