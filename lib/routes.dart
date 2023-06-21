// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

const String homeRoute = '/app/finance';
const String accountRoute = '/app/finance/account';

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
