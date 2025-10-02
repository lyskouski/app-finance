// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/pages/invoice/invoice_page.dart';
import 'package:flutter/material.dart';

class InvoiceSearchPage extends StatefulWidget {
  const InvoiceSearchPage({super.key});

  @override
  InvoiceSearchPageState createState() => InvoiceSearchPageState();
}

class InvoiceSearchPageState extends InvoicePageState<InvoiceSearchPage> {
  String? account;
  String? type;
  late TextEditingController description;
  late FocusController focus;

  late List<ListAccountSelectorItem> accountList =
      state.getList(AppDataType.accounts).map((item) => ListAccountSelectorItem(item: item)).toList();

  @override
  void initState() {
    description = TextEditingController();
    focus = FocusController();
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
  String getButtonName() => AppLocale.labels.searchTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return FloatingActionButton(
      heroTag: 'invoice_search_page',
      onPressed: () => setState(clearState),
      tooltip: getButtonName(),
      child: const Icon(Icons.search),
    );
  }

  @override
  bool getContentFilter(InvoiceAppData o) {
    final descriptionMatch = o.title.toLowerCase().contains(description.text.toLowerCase());
    final accountMatch = account == null || o.account == account;
    final typeMatch = type == null || state.getByUuid(o.account)?.type == type;
    return !(descriptionMatch && accountMatch && typeMatch) || o.accountFrom != null;
  }

  @override
  InterfaceIterator getContentStream() =>
      state.getStream<InvoiceAppData>(AppDataType.invoice, filter: getContentFilter);

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
            InputWrapper.select(
              value: type,
              title: AppLocale.labels.accountType,
              tooltip: AppLocale.labels.accountTypeTooltip,
              options: AccountType.getList(),
              onChange: (value) => setState(() {
                if (value != type) clearState();
                type = value;
              }),
            ),
            InputWrapper(
              type: NamedInputType.accountSelector,
              value: account != null ? state.getByUuid(account!) : null,
              title: AppLocale.labels.account,
              tooltip: AppLocale.labels.titleAccountTooltip,
              state: state,
              options: accountList,
              onChange: (value) => setState(() {
                if (value?.uuid != account) clearState();
                account = value?.uuid;
              }),
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}
