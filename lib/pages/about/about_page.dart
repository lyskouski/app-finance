// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_mixins/launcher_mixin.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/tab_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/about/widgets/members_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  final String? search;

  const AboutPage({super.key, this.search});

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends AbstractPageState<AboutPage> with LauncherMixin {
  String version = '';
  String buildNumber = '';

  @override
  void initState() {
    PackageInfo.fromPlatform().then((PackageInfo value) {
      setState(() {
        version = value.version;
        buildNumber = value.buildNumber;
      });
    });
    super.initState();
  }

  @override
  String? getHelperName() => 'upgrade';

  @override
  String getTitle() => AppLocale.labels.aboutHeadline;

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => ThemeHelper.emptyBox;

  Widget buildMarkdown(String name) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('./assets/l10n/$name.md'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(data: snapshot.data ?? '');
        }
        return Container();
      },
    );
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    double indent = ThemeHelper.getIndent();
    double width = ThemeHelper.getWidth(context, 2, constraints);
    final locale = AppLocale.labels.localeName;
    return Padding(
      padding: EdgeInsets.fromLTRB(indent, indent, indent, 0),
      child: Column(
        children: [
          RowWidget(
            alignment: MainAxisAlignment.spaceEvenly,
            indent: indent,
            maxWidth: width,
            chunk: const [60, null, null],
            children: [
              [
                Image.asset(
                  'assets/images/logo.png',
                  width: 60,
                  height: 60,
                ),
              ],
              [
                TextWrapper(
                  AppLocale.labels.appTitle,
                  style: context.textTheme.headlineLarge,
                ),
              ],
              [
                TextWrapper(AppLocale.labels.appVersion(version)),
                TextWrapper(AppLocale.labels.appBuild(buildNumber)),
              ],
            ],
          ),
          const Divider(),
          RowWidget(
            indent: indent,
            maxWidth: width,
            alignment: MainAxisAlignment.spaceEvenly,
            chunk: const [null, null, null],
            children: [
              [
                ElevatedButton(
                  onPressed: () => openURL('https://github.com/lyskouski/app-finance/releases'),
                  child: TextWrapper(AppLocale.labels.releases),
                ),
              ],
              [
                Center(
                  child: ElevatedButton(
                    onPressed: () => openURL('https://github.com/users/lyskouski/projects/2/views/1'),
                    child: TextWrapper(AppLocale.labels.roadmap),
                  ),
                ),
              ],
              [
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () => openURL('https://github.com/lyskouski/app-finance/milestones'),
                    child: TextWrapper(AppLocale.labels.milestones),
                  ),
                ),
              ],
            ],
          ),
          const Divider(),
          Expanded(
            child: TabWidget(
              type: TabType.secondary,
              focus: double.tryParse(widget.search ?? '0')?.toInt() ?? 0,
              tabs: [
                Tab(text: AppLocale.labels.contributors, icon: const Icon(Icons.people)),
                Tab(text: AppLocale.labels.termPrivacy, icon: const Icon(Icons.privacy_tip)),
                Tab(text: AppLocale.labels.termUse, icon: const Icon(Icons.data_usage)),
              ],
              children: [
                const MembersTab(),
                buildMarkdown('privacy_policy_$locale'),
                buildMarkdown('terms_of_use_$locale'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
