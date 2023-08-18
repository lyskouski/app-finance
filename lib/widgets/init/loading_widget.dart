// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final bool isLoading;

  const LoadingWidget({
    super.key,
    required this.isLoading,
  });

  @override
  LoadingWidgetState createState() => LoadingWidgetState();
}

class LoadingWidgetState extends State<LoadingWidget> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double offset = (height > width ? width : height) * 0.6;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.scale(
                scale: offset / 25,
                child: CircularProgressIndicator(
                  value: _controller.value,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  strokeWidth: 0.2,
                ),
              ),
              Image.asset(
                'assets/images/logo.png',
                width: offset,
                height: offset,
              ),
            ],
          ),
        );
      },
    );
  }
}
