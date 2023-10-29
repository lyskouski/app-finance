// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/pages/bill/widgets/income_tab.dart';

class IncomeEditTab extends IncomeTab {
  final String uuid;

  const IncomeEditTab({
    super.key,
    required this.uuid,
    required super.state,
    required super.callback,
    super.account,
    super.description,
    super.currency,
    super.amount,
    super.createdAt,
  });

  @override
  IncomeEditTabState createState() => IncomeEditTabState();
}

class IncomeEditTabState extends IncomeTabState<IncomeEditTab> {
  @override
  void updateStorage() {
    String uuid = account ?? '';
    exchange.save();
    widget.state.update(
        (widget as IncomeEditTab).uuid,
        InvoiceAppData(
          uuid: (widget as IncomeEditTab).uuid,
          title: description.text,
          color: widget.state.getByUuid(uuid)?.color,
          account: uuid,
          details: double.tryParse(amount.text),
          currency: currency,
          createdAt: createdAt,
        ));
  }

  @override
  String getTitle() => AppLocale.labels.editInvoiceTooltip;

  @override
  String getButtonName() => AppLocale.labels.editInvoiceTooltip;
}
