// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/components/_core/components_builder.dart';
import 'package:app_finance/components/_core/component_data.dart';
import 'package:app_finance/components/_core/list_component_registry.dart';
import 'package:app_finance/design/wrapper/confirmation_wrapper.dart';
import 'package:app_finance/design/button/toolbar_button_widget.dart';
import 'package:flutter/material.dart';

class HomeEditPage extends StatefulWidget {
  final Function callback;

  const HomeEditPage({super.key, required this.callback});

  @override
  HomeEditPageState createState() => HomeEditPageState();
}

class HomeEditPageState extends State<HomeEditPage> {
  List<ComponentData> data = [];
  late String key;

  Future<void> _save() async {
    await AppPreferences.set(key, data.toString());
    setState(() {});
  }

  Future<void> save() async {
    await _save();
    widget.callback();
  }

  Future<void> drop() async {
    await AppPreferences.clear(key);
    widget.callback();
  }

  Future<void> add(String key) async {
    data.add({
      componentData.key: key,
      componentData.startX: 0,
      componentData.startY: 0,
      componentData.endX: 4,
      componentData.endY: 4,
    });
    await _save();
  }

  Future<void> adjust(int index, ComponentData change) async {
    data[index] = change;
    await _save();
  }

  Future<void> delete(int index) async {
    data.removeAt(index);
    await _save();
  }

  @override
  Widget build(BuildContext context) {
    key = ComponentsBuilder.getKey(context);
    data = ComponentsBuilder.getData(context) ?? [];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
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
                onPressed: () => ConfirmationWrapper.show(context, drop),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 140,
            padding: EdgeInsets.all(ThemeHelper.getIndent(0.5)),
            child: ListComponentRegistry(
              setState: add,
              hintText: AppLocale.labels.customAddTooltip,
              hintStyle: context.textTheme.numberSmall.copyWith(color: Colors.white70),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(ThemeHelper.getIndent(3)),
        child: ComponentsBuilder(data, editMode: true, adjust: adjust, delete: delete),
      ),
    );
  }
}
