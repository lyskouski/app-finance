// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/herald/app_start_of_month.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:app_finance/pages/bill/bill_page.dart';
import 'package:app_finance/design/generic/base_header_widget.dart';
import 'package:app_finance/design/generic/base_swipe_widget.dart';
import 'package:flutter/material.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  InvoicePageState createState() => InvoicePageState();
}

class InvoicePageState<T extends StatefulWidget> extends BillPageState<T> {
  @override
  Widget addHeaderWidget() {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    DateTime startingDay = DateTime.now().getStartingDay(AppStartOfMonth.get());
    return SliverToBoxAdapter(
      child: BaseHeaderWidget(
        route: AppRoute.homeRoute,
        tooltip: AppLocale.labels.homeTooltip,
        width: width,
        total: state.getTotal(AppDataType.invoice),
        title: '${AppLocale.labels.invoiceHeadline}, ${startingDay.fullMonth()}',
      ),
    );
  }

  @override
  Widget addLineWidget(dynamic item) {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    final account = state.getByUuid(item.account);
    return BaseSwipeWidget(
      routePath: AppRoute.invoiceEditRoute,
      uuid: item.uuid!,
      child: BaseLineWidget(
        uuid: item.uuid!,
        title: item.title,
        description: account != null ? '${account.title} (${account.description})' : '',
        details: item.detailsFormatted,
        progress: item.progress,
        color: item.color ?? Colors.transparent,
        icon: item.icon ?? Icons.radio_button_unchecked_sharp,
        hidden: item.hidden,
        width: width,
        route: AppRoute.invoiceViewRoute,
      ),
    );
  }

  @override
  String getTitle() => AppLocale.labels.invoiceHeadline;

  bool getContentFilter(InvoiceAppData o) => o.accountFrom != null;

  @override
  InterfaceIterator getContentStream() =>
      state.getStream<InvoiceAppData>(AppDataType.invoice, filter: getContentFilter);
}
