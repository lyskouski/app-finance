// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/deep_link/deep_link_handler.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/notification/notification_channel.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:app_finance/pages/integration/widgets/enablebanking_widget.dart';
import 'package:app_finance/pages/integration/widgets/fints_widget.dart';
import 'package:app_finance/pages/integration/widgets/monobank_widget.dart';
import 'package:app_finance/pages/integration/widgets/notification_widget.dart';
import 'package:app_finance/pages/integration/widgets/privatbank_widget.dart';
import 'package:app_finance/pages/integration/widgets/simplefin_widget.dart';
import 'package:app_finance/pages/integration/widgets/wise_widget.dart';
import 'package:material_ui/material_ui.dart';

typedef IntegrationItem = ({String id, String title, IconData icon, WidgetBuilder builder});

class IntegrationPage extends StatefulWidget {
  const IntegrationPage({super.key});

  @override
  IntegrationPageState createState() => IntegrationPageState();
}

class IntegrationPageState extends AbstractPageState<IntegrationPage> {
  static List<IntegrationItem> getProtocols() => [
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
        (
          id: 'enablebanking',
          title: AppLocale.labels.enableBankingHeadline,
          icon: Icons.euro,
          builder: (_) => const EnableBankingWidget(),
        ),
      ];

  static List<IntegrationItem> getServices() => [
        (
          id: 'privatbank',
          title: AppLocale.labels.privatBankHeadline,
          icon: Icons.business_center_outlined,
          builder: (_) => const PrivatBankWidget(),
        ),
        (
          id: 'monobank',
          title: AppLocale.labels.monobankHeadline,
          icon: Icons.credit_card,
          builder: (_) => const MonobankWidget(),
        ),
        (
          id: 'wise',
          title: AppLocale.labels.wiseHeadline,
          icon: Icons.currency_exchange,
          builder: (_) => const WiseWidget(),
        ),
      ];

  Widget buildItem(BuildContext context, IntegrationItem item) {
    final indent = ThemeHelper.getIndent();
    return Card(
      key: ValueKey('integration_${item.id}'),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        leading: Icon(item.icon),
        title: Text(item.title, style: context.textTheme.titleMedium),
        maintainState: true,
        initiallyExpanded: item.id == 'enablebanking' && DeepLinkHandler.enableBankingCallback.value != null,
        childrenPadding: EdgeInsets.fromLTRB(indent * 2, 0, indent * 2, indent * 2),
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Builder(builder: item.builder)],
      ),
    );
  }

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
        for (final item in getProtocols()) buildItem(context, item),
        Divider(key: const ValueKey('integration_divider'), height: indent * 4),
        if (NotificationChannel.isSupported) ...[
          buildItem(context, (
            id: 'notification',
            title: AppLocale.labels.notifyHeadline,
            icon: Icons.notifications_active_outlined,
            builder: (_) => const NotificationWidget(),
          )),
          Divider(key: const ValueKey('integration_divider_end'), height: indent * 4),
        ],
        for (final item in getServices()) buildItem(context, item),
      ],
    );
  }
}
