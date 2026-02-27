// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/generic/base_swipe_widget.dart';
import 'package:app_finance/design/wrapper/background_wrapper.dart';
import 'package:app_finance/design/wrapper/number_wrapper.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/bill/widgets/bill_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillScopeViewPage extends StatefulWidget {
  final String search;
  final String uuid;

  const BillScopeViewPage({
    super.key,
    required this.search,
    required this.uuid,
  });

  @override
  BillScopeViewPageState createState() => BillScopeViewPageState();
}

class BillScopeViewPageState extends AbstractPageState<BillScopeViewPage> {
  @override
  String getTitle() => DateFormat.yMMMM().format(DateTime.parse(widget.search));

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => const SizedBox.shrink();

  bool getContentFilter(BillAppData item) {
    final budgetMatch = item.category == widget.uuid;
    final startDate = DateTime.parse(widget.search);
    final startDateMatch = item.createdAt.isAfter(startDate);
    final endDate = DateTime(startDate.year, startDate.month + 1, startDate.day);
    final endDateMatch = item.createdAt.isBefore(endDate);
    return !(budgetMatch && startDateMatch && endDateMatch);
  }

  List<BillAppData> getContent() =>
      state.getStream<BillAppData>(AppDataType.bills, filter: getContentFilter).toList().cast<BillAppData>();

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final item = (state.getByUuid(widget.uuid) as BudgetAppData).clone();
    final items = getContent();
    final width = ThemeHelper.getWidth(context, 2, constraints);
    final textTheme = context.textTheme;
    final indent = ThemeHelper.getIndent();
    final txtWidth = ThemeHelper.getTextWidth(Text(item.detailsFormatted, style: textTheme.numberMedium));
    return Padding(
      padding: EdgeInsets.all(indent),
      child: Column(
        children: [
          Column(
            children: [
              RowWidget(
                indent: indent,
                alignment: AppDesign.getAlignment<MainAxisAlignment>(),
                maxWidth: width,
                chunk: [null, txtWidth + 2 * indent],
                children: [
                  [
                    Row(
                      children: [
                        Icon(item.icon, color: item.color, size: 20),
                        ThemeHelper.wIndent,
                        TextWrapper(
                          item.title,
                          style: textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    if (item.description.isNotEmpty)
                      TextWrapper(
                        item.description,
                        style: textTheme.numberSmall,
                      ),
                  ],
                  [
                    Align(
                      alignment: Alignment.centerRight,
                      child: NumberWidget(
                        item.detailsFormatted,
                        colorScheme: context.colorScheme,
                        style: textTheme.numberMedium,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
          ThemeHelper.hIndent05,
          const Divider(height: 2),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.length + 1,
              itemBuilder: (BuildContext context, index) {
                if (index >= items.length) {
                  return ThemeHelper.formEndBox;
                }
                BillAppData item = items[index];
                final account = state.getByUuid(item.account);
                final budget = state.getByUuid(item.category);
                return BackgroundWrapper(
                  index: index,
                  child: BaseSwipeWidget(
                    routePath: AppRoute.billEditRoute,
                    uuid: item.uuid!,
                    child: TapWidget(
                      tooltip: '',
                      route: RouteSettings(name: AppRoute.billViewRoute, arguments: {routeArguments.uuid: item.uuid}),
                      child: BillLineWidget(
                        width: width - 2 * indent,
                        uuid: item.uuid ?? '',
                        title: item.title,
                        details: item.detailsFormatted,
                        description: item.description,
                        color: item.color ?? Colors.transparent,
                        icon: item.icon ?? Icons.question_mark,
                        descriptionColor: account?.color ?? Colors.transparent,
                        iconTooltip: budget?.title ?? '?',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
