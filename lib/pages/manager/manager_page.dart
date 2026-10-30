// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/design/wrapper/background_wrapper.dart';
import 'package:app_finance/design/wrapper/confirmation_wrapper.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/manager/widgets/log_entry.dart';
import 'package:app_finance/pages/manager/widgets/log_entry_widget.dart';
import 'package:flutter/material.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({super.key});

  @override
  ManagerPageState createState() => ManagerPageState();
}

class ManagerPageState extends AbstractPageState<ManagerPage> {
  static const batch = 25;
  final ScrollController scrollController = ScrollController();
  final List<LogEntry> entries = [];
  int visible = batch;
  bool isLoading = true;
  bool isChanged = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    _load();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final lines = <LogEntry>[];
    int index = 0;
    await for (final line in TransactionLog.read()) {
      if (line.trim().isNotEmpty) {
        lines.add(LogEntry(index, line));
      }
      index++;
    }
    if (!mounted) {
      return;
    }
    setState(() {
      entries.addAll(lines.reversed);
      isLoading = false;
    });
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 200 && visible < entries.length) {
      setState(() => visible += batch);
    }
  }

  void _reorder(int oldIndex, int newIndex) {
    if (oldIndex == newIndex) {
      return;
    }
    setState(() {
      entries.insert(newIndex, entries.removeAt(oldIndex));
      isChanged = true;
    });
  }

  void _delete(LogEntry entry) {
    setState(() {
      entries.remove(entry);
      isChanged = true;
    });
  }

  Future<void> _save(NavigatorState nav) async {
    setState(() => isLoading = true);
    TransactionLog.rewrite(entries.reversed.map((e) => e.raw).toList());
    await super.state.flush();
    nav.pushNamedAndRemoveUntil(AppRoute.homeRoute, (_) => false);
  }

  @override
  String getTitle() => AppLocale.labels.managerHeadline;

  @override
  String getButtonName() => isChanged ? AppLocale.labels.saveSettingsTooltip : '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    if (!isChanged || isLoading) {
      return ThemeHelper.emptyBox;
    }
    final nav = Navigator.of(context);
    return FloatingActionButton(
      heroTag: 'manager_page',
      onPressed: () => ConfirmationWrapper.show(context, () => _save(nav)),
      tooltip: getButtonName(),
      child: const Icon(Icons.save),
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    if (isLoading) {
      return Center(child: LoadingWidget(isLoading: isLoading));
    }
    final count = min(visible, entries.length);
    return ReorderableListView.builder(
      scrollController: scrollController,
      buildDefaultDragHandles: false,
      itemCount: count,
      onReorderItem: _reorder,
      footer: visible < entries.length ? const Center(child: CircularProgressIndicator()) : ThemeHelper.formEndBox,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return BackgroundWrapper(
          key: ValueKey(entry.index),
          index: index,
          child: LogEntryWidget(
            entry: entry,
            position: index,
            onToggle: () => setState(() => entry.isExpanded = !entry.isExpanded),
            onDelete: () => _delete(entry),
          ),
        );
      },
    );
  }
}
