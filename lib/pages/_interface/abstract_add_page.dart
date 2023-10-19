// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/pages/_interface/abstract_page_state.dart';
import 'package:flutter/material.dart';

abstract class AbstractAddPage<T> extends StatefulWidget {
  const AbstractAddPage({super.key});
}

abstract class AbstractAddPageState<T extends AbstractAddPage> extends AbstractPageState<T> {
  bool hasError = false;

  bool hasFormErrors();

  void updateStorage();

  void triggerActionButton(NavigatorState nav) {
    setState(() {
      if (hasFormErrors()) {
        return;
      }
      updateStorage();
      nav.pop();
      nav.pop();
    });
  }
}
