// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';

import 'package:app_finance/_classes/controller/fallback_localization_delegate.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_palette.dart';
import 'package:app_finance/_classes/herald/app_purchase.dart';
import 'package:app_finance/_classes/herald/app_sync.dart';
import 'package:app_finance/_classes/herald/app_theme.dart';
import 'package:app_finance/_classes/herald/app_zoom.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/navigation/app_page_route.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/firebase_options.dart';
import 'package:app_finance/pages/about/about_page.dart';
import 'package:app_finance/pages/account/account_add_page.dart';
import 'package:app_finance/pages/account/account_edit_page.dart';
import 'package:app_finance/pages/account/account_view_page.dart';
import 'package:app_finance/pages/account/account_page.dart';
import 'package:app_finance/pages/automation/automation_page.dart';
import 'package:app_finance/pages/bill/bill_add_page.dart';
import 'package:app_finance/pages/bill/bill_edit_page.dart';
import 'package:app_finance/pages/bill/bill_page.dart';
import 'package:app_finance/pages/bill/bill_view_page.dart';
import 'package:app_finance/pages/budget/budget_page.dart';
import 'package:app_finance/pages/budget/budget_add_page.dart';
import 'package:app_finance/pages/budget/budget_edit_page.dart';
import 'package:app_finance/pages/budget/budget_view_page.dart';
import 'package:app_finance/pages/currency/currency_page.dart';
import 'package:app_finance/pages/goal/goal_add_page.dart';
import 'package:app_finance/pages/goal/goal_edit_page.dart';
import 'package:app_finance/pages/goal/goal_page.dart';
import 'package:app_finance/pages/goal/goal_view_page.dart';
import 'package:app_finance/pages/home/home_page.dart';
import 'package:app_finance/pages/invoice/invoice_edit_page.dart';
import 'package:app_finance/pages/invoice/invoice_view_page.dart';
import 'package:app_finance/pages/metrics/metrics_page.dart';
import 'package:app_finance/pages/settings/settings_page.dart';
import 'package:app_finance/pages/start/start_page.dart';
import 'package:app_finance/pages/subscription/subscription_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final platform = DefaultFirebaseOptions.currentPlatform;
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (platform != null) {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      FirebaseAnalytics.instance.logAppOpen();
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseAnalytics.instance.logEvent(
          name: 'platform-error',
          parameters: {'error': error.toString(), 'trace': stack.toString()},
        );
        return true;
      };
      if (kIsWeb) {
        FlutterError.onError = (details) {
          FlutterError.presentError(details);
          FirebaseAnalytics.instance.logEvent(name: 'flutter-error', parameters: {'error': details.toString()});
        };
      } else {
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      }
    }
    AppPreferences.pref = await SharedPreferences.getInstance();
    CurrencyDefaults.cache = AppPreferences.pref;
    final appSync = AppSync();
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppSync>(
            create: (_) => appSync,
          ),
          ChangeNotifierProvider<AppData>(
            create: (_) => AppData(appSync),
          ),
          ChangeNotifierProvider<AppTheme>(
            create: (_) => AppTheme(ThemeMode.system),
          ),
          ChangeNotifierProvider<AppLocale>(
            create: (_) => AppLocale(),
          ),
          ChangeNotifierProvider<AppDesign>(
            create: (_) => AppDesign(),
          ),
          ChangeNotifierProvider<AppZoom>(
            create: (_) => AppZoom(),
          ),
          ChangeNotifierProvider<AppPalette>(
            create: (_) => AppPalette(),
          ),
          ChangeNotifierProvider<AppPurchase>(
            create: (_) => AppPurchase(),
          ),
        ],
        child: MyApp(platform: platform),
      ),
    );
  }, (error, stack) {
    if (platform != null) {
      if (kIsWeb) {
        FirebaseAnalytics.instance.logEvent(name: 'flutter-error', parameters: {'error': error.toString()});
      } else {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
    }
    FlutterError.presentError(FlutterErrorDetails(exception: error, stack: stack));
    // SystemNavigator.pop();
  });
}

class MyApp extends StatefulWidget {
  final FirebaseOptions? platform;
  const MyApp({super.key, this.platform});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  WidgetBuilder? getPage(String route, Object? arguments) {
    AppRoute.current = route;
    if (widget.platform != null) {
      FirebaseAnalytics.instance.logSelectContent(
        contentType: route,
        itemId: arguments != null ? 'dynamic' : 'static',
      );
    }
    final args = arguments as Map<String, dynamic>?;
    final String key = args?['uuid'] ?? args?['search'] ?? '';

    final routes = <String, WidgetBuilder>{
      AppRoute.aboutRoute: (context) => AboutPage(search: key),
      AppRoute.accountRoute: (context) => const AccountPage(),
      AppRoute.accountAddRoute: (context) => const AccountAddPage(),
      AppRoute.accountViewRoute: (context) => AccountViewPage(uuid: key),
      AppRoute.accountSearchRoute: (context) => AccountPage(search: key),
      AppRoute.accountEditRoute: (context) => AccountEditPage(uuid: key),
      AppRoute.automationRoute: (context) => const AutomationPage(),
      AppRoute.billRoute: (context) => const BillPage(),
      AppRoute.billAddRoute: (context) => const BillAddPage(),
      AppRoute.billViewRoute: (context) => BillViewPage(uuid: key),
      AppRoute.billEditRoute: (context) => BillEditPage(uuid: key),
      AppRoute.budgetRoute: (context) => const BudgetPage(),
      AppRoute.budgetAddRoute: (context) => const BudgetAddPage(),
      AppRoute.budgetViewRoute: (context) => BudgetViewPage(uuid: key),
      AppRoute.budgetSearchRoute: (context) => BudgetPage(search: key),
      AppRoute.budgetEditRoute: (context) => BudgetEditPage(uuid: key),
      AppRoute.currencyRoute: (context) => const CurrencyPage(),
      AppRoute.goalRoute: (context) => const GoalPage(),
      AppRoute.goalAddRoute: (context) => const GoalAddPage(),
      AppRoute.goalViewRoute: (context) => GoalViewPage(uuid: key),
      AppRoute.goalEditRoute: (context) => GoalEditPage(uuid: key),
      AppRoute.invoiceViewRoute: (context) => InvoiceViewPage(uuid: key),
      AppRoute.invoiceEditRoute: (context) => InvoiceEditPage(uuid: key),
      AppRoute.homeRoute: (context) => const HomePage(),
      AppRoute.metricsRoute: (context) => const MetricsPage(),
      AppRoute.metricsSearchRoute: (context) => MetricsPage(search: key),
      AppRoute.settingsRoute: (context) => const SettingsPage(),
      AppRoute.startRoute: (context) => const StartPage(),
      AppRoute.subscriptionRoute: (context) => const SubscriptionPage(),
    };
    return routes[route] ?? (context) => const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<AppPalette>().value;
    final text = Theme.of(context).textTheme.withCustom(palette, Brightness.light);
    final textDark = Theme.of(context).textTheme.withCustom(palette, Brightness.dark);
    final sheet = Theme.of(context).bottomSheetTheme.copyWith(
          constraints: const BoxConstraints(maxWidth: double.infinity),
        );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
        FallbackLocalizationDelegate(),
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<AppLocale>().value,
      theme: ThemeData(
        colorScheme: const ColorScheme.light().withCustom(palette),
        floatingActionButtonTheme: const FloatingActionButtonThemeData().withCustom(palette, Brightness.light),
        brightness: Brightness.light,
        textTheme: text,
        datePickerTheme: DatePickerTheme.of(context).withCustom(palette, text, Brightness.light),
        timePickerTheme: TimePickerTheme.of(context).withCustom(palette, text, Brightness.light),
        dividerTheme: CustomDividerTheme(palette, Brightness.light),
        bottomSheetTheme: sheet,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark().withCustom(palette),
        floatingActionButtonTheme: const FloatingActionButtonThemeData().withCustom(palette, Brightness.dark),
        brightness: Brightness.dark,
        textTheme: textDark,
        datePickerTheme: DatePickerTheme.of(context).withCustom(palette, textDark, Brightness.dark),
        timePickerTheme: TimePickerTheme.of(context).withCustom(palette, textDark, Brightness.dark),
        dividerTheme: CustomDividerTheme(palette, Brightness.dark),
        bottomSheetTheme: sheet,
        useMaterial3: true,
      ),
      themeMode: context.watch<AppTheme>().value,
      home: const HomePage(),
      onGenerateRoute: (settings) => AppPageRoute(builder: getPage(settings.name ?? '', settings.arguments)!),
    );
  }
}
