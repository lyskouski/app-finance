// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/keep_alive_wrapper.dart';
import 'package:flutter/material.dart';

class BaseListInfiniteWidget extends StatefulWidget {
  final dynamic state;
  final int batch;
  final double width;
  final Function buildListWidget;

  const BaseListInfiniteWidget({
    super.key,
    required this.state,
    required this.width,
    required this.buildListWidget,
    this.batch = 25,
  });

  @override
  BaseListInfiniteWidgetState createState() => BaseListInfiniteWidgetState();
}

class BaseListInfiniteWidgetState extends State<BaseListInfiniteWidget> {
  final ScrollController scrollController = ScrollController();
  int currentPage = 0;
  bool isLoading = false;
  dynamic state;
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    state = widget.state;
    _loadItems();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _loadItems() {
    setState(() => isLoading = true);
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        isLoading = false;
        _addItems();
      });
    });
  }

  void _addItems() {
    if (state == null) {
      return;
    }
    int endIndex = currentPage + widget.batch;
    if (endIndex > state.length) {
      endIndex = state.length;
    }
    items.addAll(state.sublist(currentPage, endIndex));
  }

  void _scrollListener() {
    if (state != null &&
        scrollController.position.extentAfter < 200 &&
        !isLoading &&
        currentPage + widget.batch < state.length) {
      currentPage += widget.batch;
      _loadItems();
    }
  }

  void clearState() {
    setState(() {
      state = widget.state;
      currentPage = 0;
      scrollController.jumpTo(0);
      items.clear();
      _addItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state != state) {
      WidgetsBinding.instance.addPostFrameCallback((_) => clearState());
    }
    return ListView.builder(
        controller: scrollController,
        itemCount: items.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(height: ThemeHelper.getIndent());
          } else if (index == items.length + 1) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return KeepAliveWrapper(
              child: widget.buildListWidget(
                items[index - 1],
                context,
                widget.width,
              ),
            );
          }
        });
  }
}
