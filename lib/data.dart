// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  final _data = {
    'goals': [
      (
        uuid: 'xxxxxxxx-xxxx-0xxx-yxxx-xxxxxxxxxxxx',
        title: 'Implement new functionality to reach the goal of MVP',
        startDate: '2022-01-01 00:00',
        endDate: '2024-09-01 00:00',
      )
    ],
    'bills': {
      'total': 123456.789,
      'list': [
        (
          uuid: 'xxxxxxxx-xxxx-01xx-yxxx-xxxxxxxxxxxx',
          title: 'Description BILLS with a long explanation',
          description: '2023-06-17',
          details: 12345789.098,
          progress: 0.5,
          color: Colors.red,
          hidden: false,
        ),
        (
          uuid: 'xxxxxxxx-xxxx-02xx-yxxx-xxxxxxxxxxxx',
          title: 'Description BILLS 2',
          description: '2023-06-16 22:10',
          details: 1234.789,
          progress: 0.8,
          color: Colors.green,
          hidden: false,
        ),
        (
          uuid: 'xxxxxxxx-xxxx-03xx-yxxx-xxxxxxxxxxxx',
          title: 'Description BILLS 3',
          description: '2023-06-15',
          details: 123.789,
          progress: 1.0,
          color: Colors.yellow,
          hidden: false,
        ),
      ]
    },
    'accountTypes': {
      'account': (),
      'cash': (),
      'debitCard': (),
      'creditCard': (),
      'deposit': (),
      'credit': (),
    },
    'accounts': {
      'total': 123456.789,
      'list': [
        (
          uuid: 'xxxxxxxx-xxxx-1xxx-yxxx-xxxxxxxxxxxx',
          title: 'Description of Account with a long explanation',
          description: '****1234',
          details: 12345789.098,
          progress: 0.5,
          color: Colors.red,
          hidden: false,
        ),
        (
          uuid: 'xxxxxxxx-xxxx-2xxx-yxxx-xxxxxxxxxxxx',
          title: 'MasterCard',
          description: '*****5432',
          details: 1234.789,
          progress: 0.8,
          color: Colors.green,
          hidden: false,
        ),
        (
          uuid: 'xxxxxxxx-xxxx-3xxx-yxxx-xxxxxxxxxxxx',
          title: 'Visa Credit Card',
          description: '****3224',
          details: 123.789,
          progress: 1.0,
          color: Colors.yellow,
          hidden: false,
        ),
      ],
    },
    'budgets': {
      'total': 123456.789,
      'list': [
        (
          uuid: 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx',
          title: 'Description budgets with a long explanation',
          description: '1,234 / 1,233,241.44',
          details: 12345789.098,
          progress: 0.5,
          color: Colors.red,
          hidden: false,
        ),
        (
          uuid: 'xxxxxxxx-xxxx-5xxx-yxxx-xxxxxxxxxxxx',
          title: 'Description budgets 2',
          description: '1,234 / 3,241.44',
          details: 1234.789,
          progress: 0.8,
          color: Colors.green,
          hidden: false,
        ),
        (
          uuid: 'xxxxxxxx-xxxx-6xxx-yxxx-xxxxxxxxxxxx',
          title: 'Description budgets 3',
          description: '134 / 33,241.44',
          details: 123.789,
          progress: 1.0,
          color: Colors.yellow,
          hidden: false,
        ),
      ],
    },
  };

  Map<String, dynamic> get state => _data;

  void set(String property, dynamic value) {
    if (_data.containsKey(property)) {
      _data[property] = value;
      notifyListeners();
    } else {
      throw ArgumentError('Invalid property: $property');
    }
  }

  get(String property, String uuid) {
    if (_data.containsKey(property)) {
      var scope = (_data[property] as Map)['list'];
      return scope.firstWhere((item) => item.uuid == uuid);
    } else {
      throw ArgumentError('Invalid property: $property');
    }
  }
}
