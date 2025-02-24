// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_classes/herald/app_start_of_month.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/design/generic/base_line_widget.dart';
import 'package:app_finance/design/wrapper/background_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/bill/widgets/sliver_header_delegate.dart';
import 'package:app_finance/design/generic/base_header_widget.dart';
import 'package:app_finance/design/generic/base_swipe_widget.dart';
import 'package:flutter/material.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  InvoicePageState createState() => InvoicePageState();
}

class InvoicePageState<T extends StatefulWidget> extends AbstractPageState<T> {
  InterfaceIterator? stream;
  List<Widget> itemsShown = [];
  DateTime timer = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final _scrollController = ScrollController();
  final batch = 25;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter < 200 && !stream!.isFinished) {
        setState(() => _addItems());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget addHeaderWidget() {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    DateTime startingDay = DateTime.now().getStartingDay(AppStartOfMonth.get());
    return SliverToBoxAdapter(
      child: BaseHeaderWidget(
        route: AppRoute.homeRoute,
        tooltip: AppLocale.labels.homeTooltip,
        width: width,
        total: state.getTotal(AppDataType.invoice),
        title: '${AppLocale.labels.invoiceHeadline}, ${startingDay.fullMonth()}',
      ),
    );
  }

  Widget addLineWidget(dynamic item) {
    final width = ScreenHelper.state().width - ThemeHelper.getIndent(4);
    final account = state.getByUuid(item.account);
    return BaseSwipeWidget(
      routePath: AppRoute.invoiceEditRoute,
      uuid: item.uuid!,
      child: BaseLineWidget(
        uuid: item.uuid!,
        title: item.title,
        description: account != null ? '${account.title} (${account.description})' : '',
        details: item.detailsFormatted,
        progress: item.progress,
        color: item.color ?? Colors.transparent,
        icon: item.icon ?? Icons.radio_button_unchecked_sharp,
        hidden: item.hidden,
        width: width,
        route: AppRoute.invoiceViewRoute,
      ),
    );
  }

  void _addItems() {
    if (itemsShown.isEmpty) {
      itemsShown.add(addHeaderWidget());
    }
    if (stream == null || stream?.isFinished == true) {
      return;
    }
    String marker = '';
    List<InvoiceAppData> items = [];
    do {
      marker = timer.yMEd();
      items = stream!.getTill(0.0 + timer.millisecondsSinceEpoch) as List<InvoiceAppData>;
      timer = timer.add(const Duration(days: -1));
    } while (items.isEmpty && !stream!.isFinished);

    itemsShown.add(
      SliverMainAxisGroup(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate(marker),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: ThemeHelper.getIndent(0.5)),
            sliver: SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, int index) {
                final item = items[index];
                return BackgroundWrapper(
                  index: index,
                  child: addLineWidget(item),
                );
              },
            ),
          ),
        ],
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.position.maxScrollExtent == 0) {
        setState(() => _addItems());
      }
    });
  }

  @override
  String getTitle() => AppLocale.labels.invoiceHeadline;

  @override
  String getButtonName() => AppLocale.labels.addMainTooltip;

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    NavigatorState nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'invoice_page',
      onPressed: () => nav.pushNamed(AppRoute.billAddRoute),
      tooltip: getButtonName(),
      child: const Icon(Icons.add),
    );
  }

  bool getContentFilter(InvoiceAppData o) => o.accountFrom != null;

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    state.addListener(() {
      itemsShown = [];
      final now = DateTime.now();
      timer = DateTime(now.year, now.month, now.day);
      stream = null;
    });
    if (stream == null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => setState(() {
          stream = state.getStream<InvoiceAppData>(AppDataType.invoice, filter: getContentFilter);
          _addItems();
        }),
      );
    }
    return Padding(
      padding: EdgeInsets.all(ThemeHelper.getIndent()),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: itemsShown,
      ),
    );
  }
}
