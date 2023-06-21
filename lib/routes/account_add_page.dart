// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/routes/abstract_page.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';

class AccountAddPage extends AbstractPage {
  String? selectedType;
  String? selectedCurrency;
  DateTime? validTillDate;
  DateTime balanceDateUpdate = DateTime.now();
  double? actualBalance;

  AccountAddPage({
    required AppData state,
  }) : super(state: state);

  @override
  AccountAddPageState createState() => AccountAddPageState();
}

class AccountAddPageState extends AbstractPageState<AccountAddPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createAccountHeader;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    String title = AppLocalizations.of(context)!.createAccountTooltip;
    return SizedBox(
      width: constraints.maxWidth - helper.getIndent() * 4,
      child: FloatingActionButton(
        onPressed: () => {
          // Do stuff
          Navigator.popAndPushNamed(context, routes.accountRoute)
        },
        tooltip: title,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.save),
              Text(title, style: Theme.of(context).textTheme.headlineMedium)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildContent(
      BuildContext context, BoxConstraints constraints, AppData state) {
    return const Column(
      children: [Text('Form TBD')],
    );
  }
}
