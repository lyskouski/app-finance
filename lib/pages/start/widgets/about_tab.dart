// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_mixins/launcher_mixin.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/markdown_builder_wrapper.dart';
import 'package:app_finance/l10n/index.dart';
import 'package:app_finance/pages/start/widgets/abstract_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutTab extends AbstractTab {
  const AboutTab({
    super.key,
    required super.setState,
    required super.setButton,
    super.isFirstBoot = true,
  });

  @override
  AboutTabState createState() => AboutTabState();
}

class AboutTabState<T extends AboutTab> extends AbstractTabState<T> with LauncherMixin {
  late AppLocale locale;
  late AppDesign design;
  late AppData state;

  final languages = languageList.map((e) => ListSelectorItem(id: e.id, name: e.name)).toList();

  Future<void> saveLocale(String value) async {
    await locale.set(value);
    await design.set(AppDesign.fromLocale(AppLocale.fromCode(value)));
    setState(() {});
  }

  @override
  String getButtonTitle() => '';

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    locale = Provider.of<AppLocale>(context, listen: false);
    design = Provider.of<AppDesign>(context, listen: false);
    state = Provider.of<AppData>(context, listen: true);

    return Column(
      crossAxisAlignment: AppDesign.getAlignment(),
      children: [
        ThemeHelper.hIndent2x,
        InputWrapper.select(
          title: AppLocale.labels.language,
          tooltip: AppLocale.labels.language,
          value: AppLocale.code,
          options: languages,
          onChange: (v) => saveLocale(v ?? AppLocale.code),
        ),
        Expanded(
          child: MarkdownBuilderWrapper(
            url: './assets/l10n/about_${locale.value!}.md',
            onTapLink: (_, link, __) => link != null && link.contains('https://')
                ? openURL(link)
                : saveLocale(link?.replaceFirst('./about_', '').replaceFirst('.md', '') ?? AppLocale.code),
          ),
        ),
      ],
    );
  }
}
