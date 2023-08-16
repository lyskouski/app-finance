// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/data/currency_app_data.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_forms/notification_bar.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class CurrencyPage extends AbstractPage {
  CurrencyPage() : super();

  @override
  CurrencyPageState createState() => CurrencyPageState();
}

class CurrencyPageState extends AbstractPageState<CurrencyPage> {
  List<dynamic>? scope;

  @override
  String getTitle(context) {
    return AppLocalizations.of(context)!.currencyHeadline;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return FloatingActionButton(
      heroTag: 'currency_page',
      onPressed: () => updateAllRates(context),
      tooltip: AppLocalizations.of(context)!.currencyUpdateTooltip,
      child: const Icon(Icons.save),
    );
  }

  void updateAllRates(context) {
    for (CurrencyAppData rate in scope!) {
      super.state.update(AppDataType.currencies, rate.uuid, rate);
    }
    NotificationBar.showSnackBar(context, AppLocalizations.of(context)!.saveNotification);
  }

  void updateRate(CurrencyAppData initial, double? value) {
    if (value != null) {
      initial.details = value;
    }
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final helper = ThemeHelper(windowType: getWindowType(context));
    final TextTheme textTheme = Theme.of(context).textTheme;
    final indent = helper.getIndent();
    final double maxWidth = MediaQuery.of(context).size.width - indent * 2;
    scope ??=
        super.state.getList(AppDataType.currencies).where((v) => v.currency?.code != v.currencyFrom?.code).toList();

    return ListView.builder(
        itemCount: scope?.length,
        itemBuilder: (context, index) {
          final item = scope![index];
          item.setContext(context);
          return Padding(
            padding: EdgeInsets.all(indent),
            child: RowWidget(
              indent: indent,
              maxWidth: maxWidth - indent * 2,
              chunk: const [0.2, 0.8],
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
              ],
            ),
          );
        });
  }
}
