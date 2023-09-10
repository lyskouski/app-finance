// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/charts/trade_chart.dart';
import 'package:app_finance/routes/abstract_page_state.dart';
import 'package:app_finance/widgets/_generic/notification_bar.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  CurrencyPageState createState() => CurrencyPageState();
}

class CurrencyPageState extends AbstractPageState<CurrencyPage> {
  List<dynamic>? scope;

  @override
  String getTitle() {
    return AppLocale.labels.currencyHeadline;
  }

  @override
  String getButtonName() => AppLocale.labels.currencyUpdateTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return FloatingActionButton(
      heroTag: 'currency_page',
      onPressed: () => updateAllRates(context),
      tooltip: getButtonName(),
      child: const Icon(Icons.save),
    );
  }

  void updateAllRates(context) {
    for (CurrencyAppData rate in scope!) {
      super.state.update(rate.uuid, rate);
    }
    NotificationBar.showSnackBar(context, AppLocale.labels.saveNotification);
  }

  void updateRate(CurrencyAppData initial, double? value) {
    if (value != null) {
      initial.details = value;
    }
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final indent = ThemeHelper.getIndent();
    final now = DateTime.now();
    final cutDate = DateTime(now.year, now.month - 2);
    if (scope == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() => scope = state
          .getList(AppDataType.currencies)
          .where((v) => v.currencyFrom != null && v.currency != null && v.currency.code != v.currencyFrom.code)
          .toList()));
      return ThemeHelper.emptyBox;
    }
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: scope?.length,
        itemBuilder: (context, index) {
          final item = scope![index];
          final history = HistoryData.getLog(item.uuid)?.where((e) => e.timestamp.isAfter(cutDate)).toList();
          return Padding(
            padding: EdgeInsets.all(indent),
            child: RowWidget(
              indent: indent,
              maxWidth: ThemeHelper.getWidth(context, 4),
              chunk: const [85, null, 100],
              children: [
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.uuid,
                        style: textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        item.updatedAtFormatted,
                        style: textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
                [
                  SimpleInput(
                    controller: TextEditingController(text: item.details.toString()),
                    type: TextInputType.number,
                    setState: (value) => updateRate(item, double.tryParse(value)),
                  )
                ],
                [
                  Padding(
                    padding: EdgeInsets.only(top: indent),
                    child: TradeChart(
                      data: history ?? [],
                      width: 100,
                      height: 40,
                    ),
                  ),
                ],
              ],
            ),
          );
        });
  }
}
