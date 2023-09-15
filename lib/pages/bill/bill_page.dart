// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/pages/home/widgets/bill_widget.dart';
import 'package:flutter/material.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  BillPageState createState() => BillPageState();
}

class BillPageState extends AbstractPageState<BillPage> {
  dynamic items;

  @override
  String getTitle() {
    return AppLocale.labels.billHeadline;
  }

  @override
  String getButtonName() => AppLocale.labels.addMainTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'bill_page',
      onPressed: () => nav.pushNamed(AppRoute.billAddRoute),
      tooltip: getButtonName(),
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if (items == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() => items = super.state.get(AppDataType.bills)));
      return ThemeHelper.emptyBox;
    }
    return Column(
      children: [
        BillWidget(
          margin: EdgeInsets.all(ThemeHelper.getIndent()),
          title: AppLocale.labels.billHeadline,
          state: items,
          width: ThemeHelper.getWidth(context, 3),
        )
      ],
    );
  }
}
