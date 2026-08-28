// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
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
      heroTag: 'invoice_transfer_search_page',
      onPressed: () => setState(clearState),
      tooltip: getButtonName(),
      child: const Icon(Icons.search),
    );
  }

  @override
  bool getContentFilter(InvoiceAppData o) {
    final descriptionMatch = o.title.toLowerCase().contains(description.text.toLowerCase());
    final accountFromMatch = accountFrom == null || o.accountFrom == accountFrom;
    final accountToMatch = accountTo == null || o.account == accountTo;
    final startDateMatch = startDate == null || o.createdAt.isAfter(startDate!);
    final endDateMatch = endDate == null || o.createdAt.isBefore(endDate!);
    final amountFromMatch = amountFrom.text.isEmpty || o.details >= double.tryParse(amountFrom.text)!;
    final amountToMatch = amountTo.text.isEmpty || o.details <= double.tryParse(amountTo.text)!;
    return !(descriptionMatch &&
            accountFromMatch &&
            accountToMatch &&
            startDateMatch &&
            endDateMatch &&
            amountFromMatch &&
            amountToMatch) ||
        o.accountFrom == null;
  }

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
