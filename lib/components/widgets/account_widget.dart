// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/currency/exchange.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/design/generic/base_group_widget.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:app_finance/design/generic/base_swipe_widget.dart';
import 'package:app_finance/design/generic/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class AccountWidget extends BaseWidget {
  late final Exchange exchange;

  // ignore: prefer_const_constructors_in_immutables
  AccountWidget({
    super.key,
    required super.title,
    required super.margin,
    required super.width,
    required super.state,
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
  AppDataGetter get state {
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
      stream: super.state.stream,
    );
  }

  String getName(dynamic item) {
    return item.title.toString().split('/').first.trim();
  }

  dynamic wrapBySingleEntity(List<dynamic> items) {
    Currency? def = CurrencyProvider.find(AppPreferences.get(AppPreferences.prefCurrency));
    return AccountAppData(
      title: getName(items.first),
      type: AppAccountType.account.toString(),
      currency: def,
      details: items.fold(0.0, (value, e) => value + exchange.reform(e.details, e.currency, def)),
    );
  }

  @override
  Widget buildListWidget(item, BuildContext context) {
    return item is List && item.length > 1
        ? buildGroupedListWidget(item, context)
        : buildSingleListWidget(item, context);
  }

  List<dynamic> updateItems(items, summaryItem) {
    return items.map((o) {
      if (o is AccountAppData) {
        if (summaryItem.details == 0) {
          o.progress = 0;
        } else {
          o.progress = exchange.reform(o.details, o.currency, exchange.getDefaultCurrency()) / summaryItem.details;
        }
      }
      return o;
    }).toList();
  }

  Widget buildGroupedListWidget(List<dynamic> items, BuildContext context) {
    final item = wrapBySingleEntity(items);
    final scope = updateItems(items, item);
    return BaseGroupWidget(
      title: item.title,
      total: item.details,
      description: item.detailsFormatted,
      progress: scope.map((e) => e.progress).cast<double>().toList(),
      color: scope.map((e) => e.color).cast<Color>().toList(),
      width: width - ThemeHelper.getIndent() / 2,
      items: scope,
      route: AppRoute.accountRoute,
    );
  }

  Widget buildSingleListWidget(item, BuildContext context) {
    item = item is List ? item.first : item;
    return BaseSwipeWidget(
      routePath: AppRoute.accountEditRoute,
      uuid: item.uuid,
      child: BaseLineWidget(
        uuid: item.uuid,
        title: item.title,
        description: item.description ?? '',
        details: item.detailsFormatted,
        progress: item.progress,
        color: item.color ?? Colors.transparent,
        icon: item.icon ?? Icons.radio_button_unchecked_sharp,
        hidden: item.hidden,
        skip: item.skip,
        width: width,
        route: routeList,
        error: item.error,
      ),
    );
  }
}
