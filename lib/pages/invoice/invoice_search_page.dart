// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/invoice/invoice_page.dart';
import 'package:flutter/material.dart';

class InvoiceSearchPage extends StatefulWidget {
  const InvoiceSearchPage({super.key});

  @override
  InvoiceSearchPageState createState() => InvoiceSearchPageState();
}

class InvoiceSearchPageState extends InvoicePageState<InvoiceSearchPage> {
  String? account;
  late TextEditingController description;

  late List<ListAccountSelectorItem> accountList =
      state.getList(AppDataType.accounts).map((item) => ListAccountSelectorItem(item: item)).toList();

  @override
  void initState() {
    description = TextEditingController();
    final runner = DelayedCall(1500);
    bool isFocused = false;
    changeState() => setState(clearState);
    description.addListener(() => isFocused ? runner.run(changeState) : isFocused = true);
    super.initState();
  }

  @override
  dispose() {
    description.dispose();
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
    final accountMatch = account == null || o.account == account;
    return !(descriptionMatch && accountMatch) || o.accountFrom != null;
  }

  @override
  InterfaceIterator getContentStream() =>
      state.getStream<InvoiceAppData>(AppDataType.invoice, filter: getContentFilter);

  @override
  Widget addHeaderWidget() {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    return SliverToBoxAdapter(
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
            value: account != null ? state.getByUuid(account!) : null,
            title: AppLocale.labels.account,
            tooltip: AppLocale.labels.titleAccountTooltip,
            state: state,
            options: accountList,
            onChange: (value) => setState(() {
              clearState();
              account = value?.uuid;
            }),
            width: width,
          ),
        ],
      ),
    );
  }
}
