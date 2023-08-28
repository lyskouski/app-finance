// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_generic/base_line_widget.dart';
import 'package:app_finance/widgets/_generic/base_list_infinite_widget.dart';
import 'package:flutter/material.dart';

class SummaryTab extends StatelessWidget {
  final String uuid;
  final AppData state;

  const SummaryTab({
    super.key,
    required this.uuid,
    required this.state,
  });

  Widget buildListWidget(item, BuildContext context) {
    final obj = state.getByUuid(item.ref ?? '');
    return BaseLineWidget(
      uuid: '',
      title: obj?.title ?? '',
      description: item.getDateFormatted(item.timestamp),
      progress: 1.0,
      details: item.getNumberFormatted(item.changedTo - item.changedFrom),
      color: obj?.color ?? Colors.transparent,
      width: ThemeHelper.getWidth(context, 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent();
    double width = ThemeHelper.getWidth(context, 3);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(indent, 0, indent, 0),
        child: BaseListInfiniteWidget(
          state: HistoryData.getLog(uuid),
          width: width - indent,
          buildListWidget: buildListWidget,
        ),
      ),
    );
  }
}
