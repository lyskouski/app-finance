// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/pages/invoice/invoice_transfer_page.dart';
import 'package:flutter/material.dart';

class InvoiceTransferSearchPage extends StatefulWidget {
  const InvoiceTransferSearchPage({super.key});

  @override
  InvoiceTransferSearchPageState createState() => InvoiceTransferSearchPageState();
}

class InvoiceTransferSearchPageState extends InvoiceTransferPageState<InvoiceTransferSearchPage> {
  String? accountFrom;
  String? accountTo;
  late TextEditingController description;
  late FocusController focus;

  late List<ListAccountSelectorItem> accountList =
      state.getList(AppDataType.accounts).map((item) => ListAccountSelectorItem(item: item)).toList();

  @override
  void initState() {
    description = TextEditingController();
    focus = FocusController();
    final runner = DelayedCall(1500);
    changeState() => setState(clearState);
    String previousText = '';
    description.addListener(() {
      if (description.text != previousText) {
        previousText = description.text;
        runner.run(changeState);
      }
    });
    super.initState();
  }

  @override
  dispose() {
    description.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.searchTooltip;

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => ThemeHelper.emptyBox;

  @override
  bool getContentFilter(InvoiceAppData o) {
    final descriptionMatch = o.title.toLowerCase().contains(description.text.toLowerCase());
    final accountFromMatch = accountFrom == null || o.accountFrom == accountFrom;
    final accountToMatch = accountTo == null || o.account == accountTo;
    return !(descriptionMatch && accountFromMatch && accountToMatch) || o.accountFrom == null;
  }

  @override
  Widget addHeaderWidget() {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    return SliverToBoxAdapter(
      child: SingleScrollWrapper(
        controller: focus,
        child: Column(
          crossAxisAlignment: AppDesign.getAlignment(),
          children: [
            InputWrapper.text(
              title: AppLocale.labels.description,
              controller: description,
              tooltip: AppLocale.labels.descriptionTooltip,
            ),
            InputWrapper(
              type: NamedInputType.accountSelector,
              value: accountTo != null ? state.getByUuid(accountTo!) : null,
              title: AppLocale.labels.accountTo,
              tooltip: AppLocale.labels.titleAccountTooltip,
              state: state,
              options: accountList,
              onChange: (value) => setState(() {
                if (value?.uuid != accountTo) clearState();
                accountTo = value?.uuid;
              }),
              width: width,
            ),
            InputWrapper(
              type: NamedInputType.accountSelector,
              value: accountFrom != null ? state.getByUuid(accountFrom!) : null,
              title: AppLocale.labels.accountFrom,
              tooltip: AppLocale.labels.titleAccountTooltip,
              state: state,
              options: accountList,
              onChange: (value) => setState(() {
                if (value?.uuid != accountFrom) clearState();
                accountFrom = value?.uuid;
              }),
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}
