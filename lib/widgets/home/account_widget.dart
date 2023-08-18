// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_classes/structure/account_type.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/widgets/_generic/base_group_widget.dart';
import 'package:app_finance/widgets/_generic/base_line_widget.dart';
import 'package:app_finance/widgets/_generic/base_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

class AccountWidget extends BaseWidget with SharedPreferencesMixin {
  late final Exchange exchange;

  AccountWidget({
    super.key,
    required super.title,
    required super.margin,
    required super.offset,
    super.state,
    super.limit,
    super.tooltip,
    super.route,
    String routeList = AppRoute.accountViewRoute,
    super.hasExpand,
    super.toExpand,
    super.callback,
  }) : super(
          routeList: routeList,
        );

  @override
  dynamic get state {
    Map<String, List<dynamic>> pile = {};
    for (dynamic item in super.state.list) {
      String name = getName(item);
      if (limit == null) {
        name = item.uuid;
      }
      if (pile[name] == null) {
        pile[name] = [];
      }
      pile[name]!.add(item);
      pile[name]!.sort((a, b) => a.title.toString().compareTo(b.title.toString()));
    }
    return (
      list: pile.entries.map((e) => e.value).toList(),
      total: super.state.total,
    );
  }

  String getName(dynamic item) {
    return item.title.toString().split('/').first.trim();
  }

  dynamic wrapBySingleEntity(List<dynamic> items) {
    Currency? def = CurrencyProvider.findByCode(getPreference(prefCurrency));
    return AccountAppData(
      title: getName(items.first),
      type: AppAccountType.account.toString(),
      currency: def,
      details: items.fold(0.0, (value, e) => value + exchange.reform(e.details, e.currency, def)),
    );
  }

  @override
  Widget buildListWidget(item, BuildContext context, double offset) {
    return item.length == 1
        ? buildSingleListWidget(item, context, offset)
        : buildGroupedListWidget(item, context, offset);
  }

  List<dynamic> updateItems(items, summaryItem) {
    return items.map((o) {
      o.progress = summaryItem.details > 0
          ? exchange.reform(o.details, o.currency, exchange.getDefaultCurrency()) / summaryItem.details
          : o.progress;
      return o;
    }).toList();
  }

  Widget buildGroupedListWidget(List<dynamic> items, BuildContext context, double offset) {
    final item = wrapBySingleEntity(items);
    final scope = updateItems(items, item);
    return BaseGroupWidget(
      title: item.title,
      total: item.details,
      description: item.detailsFormatted,
      progress: scope.map((e) => e.progress).cast<double>().toList(),
      color: scope.map((e) => e.color).cast<Color>().toList(),
      offset: offset,
      items: scope,
      route: routeList,
    );
  }

  Widget buildSingleListWidget(item, BuildContext context, double offset) {
    item = item.first;
    return BaseLineWidget(
      uuid: item.uuid,
      title: item.title,
      description: item.description ?? '',
      details: item.detailsFormatted,
      progress: item.progress,
      color: item.color ?? Colors.transparent,
      hidden: item.hidden,
      offset: offset,
      route: routeList,
    );
  }
}
