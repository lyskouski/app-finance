import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/customTheme.dart';
import 'package:app_finance/routes/home/accountWidget.dart';
import 'package:app_finance/routes/home/billWidget.dart';
import 'package:app_finance/routes/home/budgetWidget.dart';
import 'package:app_finance/routes/home/goalWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get tabBarView => null;

  void _openAddTab() {
    setState(() {
      // ...
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme(windowType: getWindowType(context));
    double indent = theme.getIndent();
    EdgeInsets single = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets middleLeft = EdgeInsets.fromLTRB(indent, indent, 0, 0);
    EdgeInsets middleRight = EdgeInsets.fromLTRB(indent, indent, indent, 0);
    EdgeInsets bottom = EdgeInsets.fromLTRB(indent, indent, indent, indent);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'terCAD: Finance',
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
      ),
      body: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            if (theme.isLower(AdaptiveWindowType.small)) {
              return Column(
                children: [
                  GoalWidget(
                    margin: single,
                    title: 'Implement new functionality',
                    startDate: '2022-01-01 00:00',
                    endDate: '2024-09-01 00:00',
                  ),
                  BillWidget(margin: single),
                  AccountWidget(margin: single),
                  BudgetWidget(margin: bottom),
                ],
              );
            } else {
              return Column(
                children: [
                  GoalWidget(
                    margin: single,
                    title: 'Implement new functionality',
                    startDate: '2022-01-01',
                    endDate: '2023-09-01',
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        AccountWidget(margin: middleLeft),
                        BillWidget(margin: middleRight),
                      ],
                    ),
                  ),
                  BudgetWidget(margin: bottom),
                ],
              );
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTab,
        tooltip: 'Add Bill, Income or Transfer',
        child: const Icon(Icons.add),
      ),
    );
  }
}
