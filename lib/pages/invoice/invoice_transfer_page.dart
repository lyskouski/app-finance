// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:app_finance/design/generic/base_swipe_widget.dart';
import 'package:app_finance/pages/invoice/invoice_page.dart';
import 'package:flutter/material.dart';

class InvoiceTransferPage extends StatefulWidget {
  const InvoiceTransferPage({super.key});

  @override
  InvoiceTransferPageState createState() => InvoiceTransferPageState();
}

class InvoiceTransferPageState extends InvoicePageState<InvoiceTransferPage> {
  @override
  String getTitle() => AppLocale.labels.transfersHeadline;

  @override
  Widget addHeaderWidget() => SliverToBoxAdapter(child: ThemeHelper.emptyBox);

  @override
  bool getContentFilter(InvoiceAppData o) => o.accountFrom == null;

  @override
  Widget addLineWidget(dynamic item) {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    final account = state.getByUuid(item.account);
    final accountFrom = state.getByUuid(item.accountFrom);
    return BaseSwipeWidget(
      routePath: AppRoute.invoiceEditRoute,
      uuid: item.uuid!,
      child: BaseLineWidget(
        uuid: item.uuid!,
        title: item.title,
        description: '${accountFrom?.title ?? '?'} => ${account?.title ?? '?'}',
        details: item.detailsFormatted,
        progress: item.progress,
        color: account.color ?? Colors.transparent,
        icon: account.icon ?? Icons.radio_button_unchecked_sharp,
        hidden: item.hidden,
        width: width,
        route: AppRoute.invoiceViewRoute,
      ),
    );
  }
}
