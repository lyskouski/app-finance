// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/pages/home/widgets/account_widget.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  final String? search;

  const AccountPage({
    super.key,
    this.search,
  });

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends AbstractPageState<AccountPage> {
  late AppDataGetter items;

  dynamic _getItems() {
    if (widget.search != null) {
      final scope = state.getList(AppDataType.accounts).where((e) => e.title.toString().startsWith(widget.search!));
      final ex = Exchange(store: super.state);
      return (
        total: scope.fold(0.0, (v, e) => v + ex.reform(e.details, e.currency, ex.getDefaultCurrency())),
        list: scope.toList()
      );
    }
    return state.get(AppDataType.accounts);
  }

  @override
  String getTitle() {
    if (widget.search != null) {
      return AppLocale.labels.search(widget.search!);
    }
    return AppLocale.labels.accountHeadline;
  }

  @override
  String getButtonName() => AppLocale.labels.addAccountTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'account_page',
      onPressed: () => nav.pushNamed(AppRoute.accountAddRoute),
      tooltip: getButtonName(),
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    items = _getItems();
    return Column(
      children: [
        AccountWidget(
          margin: EdgeInsets.all(ThemeHelper.getIndent()),
          title: AppLocale.labels.accountHeadline,
          state: items,
          width: ThemeHelper.getWidth(context, 3, constraints),
        )
      ],
    );
  }
}
