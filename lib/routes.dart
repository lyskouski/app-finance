// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

const String homeRoute = '/app/finance';
const String accountRoute = '/app/finance/account';
const String accountAddRoute = '/app/finance/account/add';
const String accountViewRoute = '/app/finance/account/uuid:';
const String accountEditRoute = '/app/finance/account/uuid:/edit';
const String budgetRoute = '/app/finance/budget';
const String budgetAddRoute = '/app/finance/budget/add';

var menuList = [
  (
    name: 'Home',
    icon: Icons.home,
    route: homeRoute,
  ),
  (
    name: 'Goals',
    icon: Icons.star,
    route: homeRoute,
  ),
  (
    name: 'Accounts',
    icon: Icons.credit_card,
    route: accountRoute,
  ),
  (
    name: 'Budgets',
    icon: Icons.calendar_month,
    route: budgetRoute,
  ),
  (
    name: 'Bills',
    icon: Icons.money_off,
    route: homeRoute,
  ),
  (
    name: 'Metrics',
    icon: Icons.timeline,
    route: homeRoute,
  ),
  (
    name: 'Settings',
    icon: Icons.settings,
    route: homeRoute,
  ),
];
