import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/customTheme.dart';
import 'package:app_finance/routes/home/accountWidget.dart';
import 'package:app_finance/routes/home/billWidget.dart';
import 'package:app_finance/routes/home/budgetWidget.dart';
import 'package:app_finance/routes/home/goalWidget.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/routes/menuWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get tabBarView => null;
  int selectedMenu = 0;

  void _openAddTab() => Navigator.pushNamed(context, routes.homeRoute);

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme(windowType: getWindowType(context));
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    double indent = theme.getIndent();
    EdgeInsets single = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets middleLeft = EdgeInsets.fromLTRB(indent, indent, 0, 0);
    EdgeInsets middleRight = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets bottom = EdgeInsets.fromLTRB(indent, indent, indent, indent);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        toolbarHeight: 40,
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.title,
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.subscriptions),
            tooltip: AppLocalizations.of(context)!.subscriptionTooltip,
            onPressed: () => Navigator.pushNamed(context, routes.homeRoute),
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 0, // Remove the elevation (shadow) of the drawer
        shape: Border.all(width: 0), // Set a border without any width
        child: Container(
          color: colorScheme.onBackground,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: theme.getIndent() * 4),
            separatorBuilder: (context, index) =>
                SizedBox(height: theme.getIndent() * 2),
            itemCount: routes.menuList.length,
            itemBuilder: (context, index) => MenuWidget(
              index: index,
              setState: () => setState(() => selectedMenu = index),
              selectedIndex: selectedMenu,
            ),
          ),
        ),
      ),
      body: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            if (theme.isLower(AdaptiveWindowType.small) &&
                constraints.maxWidth < constraints.maxHeight) {
              return Column(
                children: [
                  GoalWidget(
                    margin: single,
                    title:
                        'Implement new functionality to reach the goal of MVP',
                    startDate: '2022-01-01 00:00',
                    endDate: '2024-09-01 00:00',
                  ),
                  BillWidget(
                      margin: single,
                      title: AppLocalizations.of(context)!.billHeadline),
                  AccountWidget(
                    margin: single,
                    title: AppLocalizations.of(context)!.accountHeadline,
                  ),
                  BudgetWidget(
                      margin: bottom,
                      title: AppLocalizations.of(context)!.budgetHeadline),
                ],
              );
            } else {
              double offsetWidth =
                  MediaQuery.of(context).size.width / 2 - indent * 4;
              return Column(
                children: [
                  GoalWidget(
                    margin: single,
                    title:
                        'Implement new functionality to reach the goal of MVP',
                    startDate: '2022-01-01',
                    endDate: '2023-09-01',
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        AccountWidget(
                          margin: middleLeft,
                          offset: offsetWidth,
                          title: AppLocalizations.of(context)!.accountHeadline,
                        ),
                        BillWidget(
                          margin: middleRight,
                          offset: offsetWidth,
                          title: AppLocalizations.of(context)!.billHeadline,
                        ),
                      ],
                    ),
                  ),
                  BudgetWidget(
                      margin: bottom,
                      title: AppLocalizations.of(context)!.budgetHeadline),
                ],
              );
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTab,
        tooltip: AppLocalizations.of(context)!.addMainTooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}
