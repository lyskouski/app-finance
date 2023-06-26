// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/classes/bill_app_data.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/classes/app_route.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BillAddPage extends AbstractPage {
  BillAddPage() : super();

  @override
  BillAddPageState createState() => BillAddPageState();
}

class BillAddPageState<T extends BillAddPage>
    extends AbstractPageState<BillAddPage> {
  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.createAccountHeader;
  }

  bool hasFormErrors() {
    bool isError = false;
    return isError;
  }

  void updateStorage() {
    // widget.state?.add(AppDataType.bills, BillAppData());
  }

  String getButtonName() {
    return AppLocalizations.of(context)!.createBillTooltip;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    String title = getButtonName();
    return SizedBox(
      width: constraints.maxWidth - helper.getIndent() * 4,
      child: FloatingActionButton(
        onPressed: () => {
          setState(() {
            if (hasFormErrors()) {
              return;
            }
            updateStorage();
            Navigator.popAndPushNamed(context, AppRoute.homeRoute);
          })
        },
        tooltip: title,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.save),
              SizedBox(height: helper.getIndent()),
              Text(title, style: Theme.of(context).textTheme.headlineMedium)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
        child: Text('test'),

      ),
    );
  }
}
