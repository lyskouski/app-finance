// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/forms/list_account_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

class ExpensesTab extends StatefulWidget {
  AppData? state;
  String? account;
  String accountErrorMessage = '';

  ExpensesTab({
    super.key,
  });

  @override
  ExpensesTabState createState() => ExpensesTabState();
}

class ExpensesTabState extends State<ExpensesTab> {
  List<ListAccountSelectorItem> getAccountList(BuildContext context) {
    return widget.state
        ?.get(AppDataType.accounts)
        .list
        .map((account) => ListAccountSelectorItem(
              id: account.uuid ?? '',
              account: account,
            ))
        .cast<ListAccountSelectorItem>()
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    double offset = MediaQuery.of(context).size.width - indent * 3;
    return Consumer<AppData>(builder: (context, appState, _) {
      widget.state = appState;
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.account}*',
                    style: textTheme.bodyLarge,
                  ),
                  Text(
                    widget.accountErrorMessage,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
              ListAccountSelector(
                value: widget.account,
                options: getAccountList(context),
                setState: (value) => setState(() => widget.account = value),
                style: textTheme.numberMedium,
                indent: indent,
                width: offset,
              ),
            ],
          ),
        ),
      );
    });
  }
}
