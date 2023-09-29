// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/pages/abstract_page_state.dart';
import 'package:app_finance/pages/bill/widgets/bill_line_widget.dart';
import 'package:app_finance/pages/bill/widgets/header_delegate.dart';
import 'package:app_finance/widgets/generic/base_swipe_widget.dart';
import 'package:flutter/material.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  BillPageState createState() => BillPageState();
}

class BillPageState extends AbstractPageState<BillPage> {
  List<dynamic>? items;
  List<Widget> itemsShown = [];
  DateTime timer = DateTime.now();
  Queue<String> title = Queue();
  final _scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 0;
  final batch = 25;
  bool isTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 10) {
        _update(null);
        setState(() => isTop = true);
      } else if (isTop) {
        setState(() => isTop = false);
      }
      if (_scrollController.position.extentAfter < 200 && !isLoading && currentPage + batch < items!.length) {
        currentPage += batch;
        setState(() => _addItems());
      }
    });
  }

  void _addItems() {
    int endIndex = currentPage + batch;
    if (endIndex > items!.length) {
      endIndex = items!.length;
    }

    for (final item in items!.sublist(currentPage, endIndex)) {
      item as BillAppData;
      if (timer.isAfter(item.createdAt)) {
        timer = DateTime(item.createdAt.year, item.createdAt.month, item.createdAt.day);
        itemsShown.add(SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: HeaderDelegate(
            timer.yMEd(),
            callback: _update,
          ),
        ));
      }
      final account = state.getByUuid(item.account);
      final budget = state.getByUuid(item.category);
      itemsShown.add(SliverToBoxAdapter(
        child: BaseSwipeWidget(
          routePath: AppRoute.billEditRoute,
          uuid: item.uuid!,
          child: BillLineWidget(
            uuid: item.uuid!,
            title: item.title,
            description: account != null ? '${account.title} (${account.description})' : '',
            descriptionColor: account?.color ?? Colors.transparent,
            details: item.detailsFormatted,
            progress: item.progress,
            color: budget?.color ?? Colors.transparent,
            icon: budget?.icon ?? Icons.radio_button_unchecked_sharp,
            iconTooltip: budget?.title ?? '?',
            hidden: item.hidden,
            route: AppRoute.billViewRoute,
          ),
        ),
      ));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _update(String? value) => WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
        if (value == null) {
          title.clear();
        } else if (title.isNotEmpty && title.last == value) {
          title.removeLast();
        } else {
          title.addLast(value);
        }
      }));

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
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
            items = super.state.getList(AppDataType.bills).cast();
            _addItems();
          }));
      return ThemeHelper.emptyBox;
    }
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        if (!isTop)
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: HeaderDelegate(
              title.lastOrNull ?? '',
              callback: (_) => _update(null),
            ),
          ),
        ...itemsShown,
      ],
    );
  }
}
