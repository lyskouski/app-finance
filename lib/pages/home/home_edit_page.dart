// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/components/components_builder.dart';
import 'package:app_finance/widgets/wrapper/confirmation_wrapper.dart';
import 'package:app_finance/widgets/wrapper/toolbar_button_widget.dart';
import 'package:flutter/material.dart';

class HomeEditPage extends StatefulWidget {
  final Function callback;

  const HomeEditPage({super.key, required this.callback});

  @override
  HomeEditPageState createState() => HomeEditPageState();
}

class HomeEditPageState extends State<HomeEditPage> {
  List<ComponentData> data = [];

  Future<void> save() async {
    await AppPreferences.set(ComponentsBuilder.getKey(context), data.toString());
    widget.callback();
  }

  Future<void> delete() async {
    await AppPreferences.clear(ComponentsBuilder.getKey(context));
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: context.colorScheme.primary,
        title: Text(ComponentsBuilder.getKey(context)),
        titleTextStyle: context.textTheme.numberMedium,
        centerTitle: true,
        leadingWidth: 120,
        leading: Row(
          children: [
            ToolbarButtonWidget(
              child: IconButton(
                hoverColor: Colors.transparent,
                icon: const Icon(
                  Icons.save,
                  color: Colors.white70,
                ),
                tooltip: AppLocale.labels.customSaveTooltip,
                onPressed: save,
              ),
            ),
            ToolbarButtonWidget(
              child: IconButton(
                hoverColor: Colors.transparent,
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.white70,
                ),
                tooltip: AppLocale.labels.customDeleteTooltip,
                onPressed: () => ConfirmationWrapper.show(context, delete),
              ),
            ),
          ],
        ),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.all(ThemeHelper.getIndent(3)),
        child: ComponentsBuilder(ComponentsBuilder.getData(context) ?? [], true),
      ),
    );
  }
}
