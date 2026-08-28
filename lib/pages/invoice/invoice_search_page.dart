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
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/date_range_input.dart';
import 'package:app_finance/design/form/list_account_selector.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/single_scroll_wrapper.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/invoice/invoice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class InvoiceSearchPage extends StatefulWidget {
  const InvoiceSearchPage({super.key});

  @override
  InvoiceSearchPageState createState() => InvoiceSearchPageState();
}

class InvoiceSearchPageState extends InvoicePageState<InvoiceSearchPage> {
  String? account;
  String? type;
  Currency? currency;
  DateTime? startDate;
  DateTime? endDate;
  late TextEditingController description;
  late TextEditingController amountFrom;
  late TextEditingController amountTo;
  late FocusController focus;

  late List<ListAccountSelectorItem> accountList =
      state.getList(AppDataType.accounts).map((item) => ListAccountSelectorItem(item: item)).toList();

  @override
  void initState() {
    description = TextEditingController();
    amountFrom = TextEditingController();
    amountTo = TextEditingController();
    focus = FocusController();
    super.initState();
  }

  @override
  dispose() {
    description.dispose();
    amountFrom.dispose();
    amountTo.dispose();
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
    final currencyMatch = currency == null || o.currency == currency;
    final startDateMatch = startDate == null || o.createdAt.isAfter(startDate!);
    final endDateMatch = endDate == null || o.createdAt.isBefore(endDate!);
    final amountFromMatch = amountFrom.text.isEmpty || o.details >= double.tryParse(amountFrom.text)!;
    final amountToMatch = amountTo.text.isEmpty || o.details <= double.tryParse(amountTo.text)!;

    return !(descriptionMatch &&
            accountMatch &&
            typeMatch &&
            currencyMatch &&
            startDateMatch &&
            endDateMatch &&
            amountFromMatch &&
            amountToMatch) ||
        o.accountFrom != null;
  }

  @override
  InterfaceIterator getContentStream() =>
      state.getStream<InvoiceAppData>(AppDataType.invoice, filter: getContentFilter);

  @override
  Widget addHeaderWidget() {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    final indent = ThemeHelper.getIndent(2);
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
            RowWidget(
              indent: indent,
              maxWidth: width + indent,
              chunk: const [0.5, 0.5],
              children: [
                [
                  InputWrapper.text(
                    title: AppLocale.labels.amountFrom,
                    tooltip: AppLocale.labels.billSetTooltip,
                    controller: amountFrom,
                    inputType: const TextInputType.numberWithOptions(decimal: true),
                    formatter: [
                      SimpleInputFormatter.filterDouble,
                    ],
                  ),
                ],
                [
                  InputWrapper.text(
                    title: AppLocale.labels.amountTo,
                    tooltip: AppLocale.labels.billSetTooltip,
                    controller: amountTo,
                    inputType: const TextInputType.numberWithOptions(decimal: true),
                    formatter: [
                      SimpleInputFormatter.filterDouble,
                    ],
                  ),
                ],
              ],
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
            InputWrapper.currency(
              value: currency,
              title: AppLocale.labels.currency,
              tooltip: AppLocale.labels.currencyTooltip,
              onChange: (value) => setState(() {
                if (value != currency) clearState();
                currency = value;
              }),
            ),
            TextWrapper(
              AppLocale.labels.dateRange,
              style: context.textTheme.bodyLarge,
            ),
            DateRangeInput(
              valueFrom: startDate,
              value: endDate,
              setState: (start, end) => setState(() {
                startDate = start;
                endDate = end;
                clearState();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
