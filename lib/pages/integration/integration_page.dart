// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/integration/widgets/fints_widget.dart';
import 'package:app_finance/pages/integration/widgets/simplefin_widget.dart';
import 'package:material_ui/material_ui.dart';

typedef IntegrationItem = ({String id, String title, IconData icon, WidgetBuilder builder});

class IntegrationPage extends StatefulWidget {
  const IntegrationPage({super.key});

  @override
  IntegrationPageState createState() => IntegrationPageState();
}

class IntegrationPageState extends AbstractPageState<IntegrationPage> {
  static List<IntegrationItem> getIntegrations() => [
        (
          id: 'fints',
          title: AppLocale.labels.finTsHeadline,
          icon: Icons.account_balance,
          builder: (_) => const FinTsWidget(),
        ),
        (
          id: 'simplefin',
          title: AppLocale.labels.simpleFinHeadline,
          icon: Icons.account_balance_wallet,
          builder: (_) => const SimpleFinWidget(),
        ),
      ];

  @override
  String getTitle() => AppLocale.labels.integrationHeadline;

  @override
  String getButtonName() => '';

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) => ThemeHelper.emptyBox;

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    final indent = ThemeHelper.getIndent();
    return ListView(
      padding: EdgeInsets.all(indent),
      children: [
        for (final item in getIntegrations())
          Card(
            key: ValueKey('integration_${item.id}'),
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              leading: Icon(item.icon),
              title: Text(item.title, style: context.textTheme.titleMedium),
              maintainState: true,
              childrenPadding: EdgeInsets.fromLTRB(indent * 2, 0, indent * 2, indent * 2),
              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Builder(builder: item.builder)],
            ),
          ),
      ],
    );
  }
}
