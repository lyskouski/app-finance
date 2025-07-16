// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

const routeArguments = (
  uuid: 'uuid',
  search: 'search',
);

abstract class AppRoute {
  static String current = homeRoute;
  static const String aboutRoute = '/app/finance/about';
  static const String accountRoute = '/app/finance/account';
  static const String accountAddRoute = '/app/finance/account/add';
  static const String accountViewRoute = '/app/finance/account/view';
  static const String accountSearchRoute = '/app/finance/account/search';
  static const String accountEditRoute = '/app/finance/account/edit';
  static const String automationRoute = '/app/finance/automation';
  static const String automationPaymentRoute = '/app/finance/automation/payment';
  static const String automationPaymentEditRoute = '/app/finance/automation/payment/edit';
  static const String automationPaymentViewRoute = '/app/finance/automation/payment/view';
  static const String billRoute = '/app/finance/bill';
  static const String billAddRoute = '/app/finance/bill/add';
  static const String billViewRoute = '/app/finance/bill/view';
  static const String billEditRoute = '/app/finance/bill/edit';
  static const String billSearchRoute = '/app/finance/bill/search';
  static const String budgetRoute = '/app/finance/budget';
  static const String budgetAddRoute = '/app/finance/budget/add';
  static const String budgetViewRoute = '/app/finance/budget/view';
  static const String budgetSearchRoute = '/app/finance/budget/search';
  static const String budgetEditRoute = '/app/finance/budget/edit';
  static const String currencyRoute = '/app/finance/currency';
  static const String currencyAddRoute = '/app/finance/currency/add';
  static const String goalRoute = '/app/finance/goal';
  static const String goalAddRoute = '/app/finance/goal/add';
  static const String goalViewRoute = '/app/finance/goal/view';
  static const String goalEditRoute = '/app/finance/goal/edit';
  static const String invoiceRoute = '/app/finance/invoice';
  static const String invoiceViewRoute = '/app/finance/invoice/view';
  static const String invoiceEditRoute = '/app/finance/invoice/edit';
  static const String invoiceSearchRoute = '/app/finance/invoice/search';
  static const String invoiceTransferRoute = '/app/finance/invoice-transfer';
  static const String homeRoute = '/app/finance/main';
  static const String metricsRoute = '/app/finance/metrics';
  static const String metricsSearchRoute = '/app/finance/metrics/search';
  static const String settingsRoute = '/app/finance/settings';
  static const String startRoute = '/app/finance/start';
  static const String subscriptionRoute = '/app/finance/subscription';
}
