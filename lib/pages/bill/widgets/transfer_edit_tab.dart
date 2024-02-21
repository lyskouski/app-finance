// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_ext/double_ext.dart';
import 'package:app_finance/pages/bill/widgets/transfer_tab.dart';

class TransferEditTab extends TransferTab {
  final String uuid;

  const TransferEditTab({
    super.key,
    required this.uuid,
    required super.state,
    required super.callback,
    super.accountFrom,
    super.accountTo,
    super.amount,
    super.description,
    super.currency,
    super.createdAt,
  });

  @override
  TransferEditTabState createState() => TransferEditTabState();
}

class TransferEditTabState extends TransferTabState<TransferEditTab> {
  @override
  void updateStorage() {
    exchange.save();
    widget.state.update(
        // ignore: unnecessary_cast
        (widget as TransferEditTab).uuid,
        InvoiceAppData(
          // ignore: unnecessary_cast
          uuid: (widget as TransferEditTab).uuid,
          title: description.text,
          color: widget.state.getByUuid(accountTo!)?.color,
          account: accountTo!,
          accountFrom: accountFrom,
          details: double.tryParse(amount.text)?.toFixed(currency?.decimalDigits) ?? 0.0,
          currency: currency,
          createdAt: createdAt,
        ));
  }

  @override
  String getTitle() => AppLocale.labels.editTransferTooltip;

  @override
  String getButtonName() => AppLocale.labels.editTransferTooltip;
}
