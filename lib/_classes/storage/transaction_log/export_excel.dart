// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_start_of_month.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/_mixins/file/file_export_mixin_web.dart'
    if (dart.library.io) 'package:app_finance/_mixins/file/file_export_mixin.dart';
import 'package:excel/excel.dart';

class ExportExcel with FileExportMixin {
  final AppData state;
  late final Excel excel;
  late final Exchange exchange;

  ExportExcel(this.state) {
    excel = Excel.createExcel();
    exchange = Exchange(store: state);
  }

  Future<void> exportAll() async {
    DateTime now = DateTime.now();
    int startingDay = AppStartOfMonth.get();
    DateTime curr = now.getStartingDay(startingDay);
    final invoiceStream = state.getStream(AppDataType.invoice, filter: (o) => o.accountFrom != null);
    final billStream = state.getStream(AppDataType.bills);
    int increment = 0;
    while (!(billStream.isFinished && invoiceStream.isFinished)) {
      var tabName = curr.yearMonth().replaceAll('/', '-');
      _addHeader(tabName);
      var boundary = curr.millisecondsSinceEpoch.toDouble();
      var invoiceList = invoiceStream.getTill(boundary);
      for (var invoice in invoiceList) {
        _addInvoiceRow(tabName, invoice);
      }
      var billList = billStream.getTill(boundary);
      for (var bill in billList) {
        _addBillRow(tabName, bill);
      }
      increment++;
      curr = DateTime(now.year, now.month - increment, now.day).getStartingDay(startingDay);
    }
    excel.delete('Sheet1');
    List<int>? fileBytes = excel.save();
    if (fileBytes != null) {
      await exportFile(fileBytes, 'fingrom_export.xlsx');
    }
  }

  _addHeader(String name) {
    final sheet = excel[name];
    sheet.appendRow([
      TextCellValue(AppLocale.labels.uuid),
      TextCellValue(AppLocale.labels.balanceDate),
      TextCellValue(AppLocale.labels.flowTypeTooltip),
      TextCellValue(AppLocale.labels.title),
      TextCellValue(AppLocale.labels.account),
      TextCellValue(AppLocale.labels.budget),
      TextCellValue(AppLocale.labels.currency),
      TextCellValue(AppLocale.labels.details),
      TextCellValue(AppLocale.labels.currencyIn(exchange.getDefaultCurrency()?.code ?? '?')),
    ]);
    CellStyle cellStyle = CellStyle(
      bold: true,
      bottomBorder: Border(borderStyle: BorderStyle.Thin),
    );
    sheet.cell(CellIndex.indexByString("A1")).cellStyle = cellStyle;
    sheet.cell(CellIndex.indexByString("B1")).cellStyle = cellStyle;
    sheet.cell(CellIndex.indexByString("C1")).cellStyle = cellStyle;
    sheet.cell(CellIndex.indexByString("D1")).cellStyle = cellStyle;
    sheet.cell(CellIndex.indexByString("E1")).cellStyle = cellStyle;
    sheet.cell(CellIndex.indexByString("F1")).cellStyle = cellStyle;
    sheet.cell(CellIndex.indexByString("G1")).cellStyle = cellStyle;
    sheet.cell(CellIndex.indexByString("H1")).cellStyle = cellStyle;
    sheet.cell(CellIndex.indexByString("I1")).cellStyle = cellStyle;
  }

  void _addInvoiceRow(String name, InvoiceAppData data) {
    final sheet = excel[name];
    sheet.appendRow([
      TextCellValue(data.uuid ?? '?'),
      DateTimeCellValue.fromDateTime(data.createdAt),
      TextCellValue(AppLocale.labels.flowTypeInvoice),
      TextCellValue(data.title),
      TextCellValue(data.accountNamed),
      TextCellValue(' '),
      TextCellValue(data.currency?.code ?? '?'),
      DoubleCellValue(data.details),
      DoubleCellValue(exchange.reform(data.details ?? 0.0, data.currency, exchange.getDefaultCurrency())),
    ]);
  }

  void _addBillRow(String name, BillAppData data) {
    final sheet = excel[name];
    sheet.appendRow([
      TextCellValue(data.uuid ?? '?'),
      DateTimeCellValue.fromDateTime(data.createdAt),
      TextCellValue(AppLocale.labels.bill),
      TextCellValue(data.title),
      TextCellValue(data.accountNamed),
      TextCellValue(state.getByUuid(data.category)?.title ?? '?'),
      TextCellValue(data.currency?.code ?? '?'),
      DoubleCellValue(data.details),
      DoubleCellValue(exchange.reform(data.details ?? 0.0, data.currency, exchange.getDefaultCurrency())),
    ]);
  }
}
