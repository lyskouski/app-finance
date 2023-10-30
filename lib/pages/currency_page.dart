// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/charts/trade_chart.dart';
import 'package:app_finance/pages/_interface/abstract_page_state.dart';
import 'package:app_finance/widgets/generic/notification_bar.dart';
import 'package:app_finance/widgets/form/simple_input.dart';
import 'package:app_finance/widgets/wrapper/focus_wrapper.dart';
import 'package:app_finance/widgets/wrapper/row_widget.dart';
import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  CurrencyPageState createState() => CurrencyPageState();
}

class CurrencyPageState extends AbstractPageState<CurrencyPage> {
  final focus = FocusController();
  List<dynamic>? scope;

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  String getTitle() => AppLocale.labels.currencyHeadline;

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

  void updateAllRates(BuildContext context) {
    for (CurrencyAppData rate in scope!) {
      if ((state.getByUuid(rate.uuid) as CurrencyAppData).details != rate.details) {
        state.update(rate.uuid, rate);
      }
    }
    NotificationBar.showSnackBar(context, AppLocale.labels.saveNotification);
  }

  void changeRate(CurrencyAppData initial, double? value) {
    if (value != null) {
      initial.details = value;
    }
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final TextTheme textTheme = context.textTheme;
    final indent = ThemeHelper.getIndent();
    final now = DateTime.now();
    final cutDate = DateTime(now.year, now.month - 2);
    if (scope == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
            var tmp = state
                .getList(AppDataType.currencies)
                .where((v) => v.currencyFrom != null && v.currency != null && v.currency.code != v.currencyFrom.code)
                .toList();
            tmp.sort((a, b) => a.currencyFrom.code.toString().compareTo(b.currencyFrom.code));
            scope = tmp;
          }));
      return ThemeHelper.emptyBox;
    }
    final crossAxisCount = ThemeHelper.getWidthCount(null, context);
    return FocusWrapper(
      controller: focus,
      child: Padding(
        padding: EdgeInsets.all(indent),
        child: Wrap(
          spacing: indent,
          runSpacing: indent * 2,
          children: scope!.map((item) {
            final history = HistoryData.getStream(item.uuid, filter: (e) => e.timestamp.isBefore(cutDate))?.toList();
            return RowWidget(
              indent: indent,
              maxWidth: ThemeHelper.getWidth(context, 4, constraints) / crossAxisCount,
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
                    setState: (value) => changeRate(item, double.tryParse(value)),
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
            );
          }).toList(),
        ),
      ),
    );
  }
}
