// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/keep_alive_wrapper.dart';
import 'package:flutter/material.dart';

class BaseListInfiniteWidget extends StatefulWidget {
  final dynamic state;
  final int batch;
  final double offset;
  final Function buildListWidget;

  const BaseListInfiniteWidget({
    super.key,
    required this.state,
    required this.offset,
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
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
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
        if (widget.state != null) {
          int endIndex = currentPage + widget.batch;
          if (endIndex > widget.state.length) {
            endIndex = widget.state.length;
          }
          items.addAll(widget.state.sublist(currentPage, endIndex));
        }
      });
    });
  }

  void _scrollListener() {
    if (widget.state != null &&
        scrollController.position.extentAfter < 200 &&
        !isLoading &&
        currentPage + widget.batch < widget.state.length) {
      currentPage += widget.batch;
      _loadItems();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                widget.offset - 40,
              ),
            );
          }
        });
  }
}
