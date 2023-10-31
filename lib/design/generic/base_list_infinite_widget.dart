// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/iterator_controller.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/wrapper/keep_alive_wrapper.dart';
import 'package:flutter/material.dart';

typedef FnListWidget = Widget Function(dynamic item, BuildContext context);

class BaseListInfiniteWidget extends StatefulWidget {
  final InterfaceIterator? stream;
  final int batch;
  final double width;
  final FnListWidget buildListWidget;

  const BaseListInfiniteWidget({
    super.key,
    required this.stream,
    required this.width,
    required this.buildListWidget,
    this.batch = 25,
  });

  @override
  BaseListInfiniteWidgetState createState() => BaseListInfiniteWidgetState();
}

class BaseListInfiniteWidgetState extends State<BaseListInfiniteWidget> {
  final ScrollController scrollController = ScrollController();
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
        _addItems();
      });
    });
  }

  void _addItems() {
    if (widget.stream != null) {
      items.addAll(widget.stream!.chunk(widget.batch));
    }
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 200 &&
        !isLoading &&
        widget.stream != null &&
        !widget.stream!.isFinished) {
      _loadItems();
    }
  }

  void clearState() {
    setState(() {
      scrollController.jumpTo(0);
      items.clear();
      _addItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.stream!.isEmpty) {
      return ThemeHelper.emptyBox;
    }
    if (widget.stream != null && widget.stream!.isFirst) {
      WidgetsBinding.instance.addPostFrameCallback((_) => clearState());
    }
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      controller: scrollController,
      itemCount: items.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ThemeHelper.hIndent;
        } else if (index == items.length + 1) {
          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ThemeHelper.formEndBox;
          }
        } else {
          return KeepAliveWrapper(
            child: widget.buildListWidget(
              items[index - 1],
              context,
            ),
          );
        }
      },
    );
  }
}
