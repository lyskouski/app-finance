// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/math/abstract_recalculation.dart';
import 'package:app_finance/_classes/storage/history_data.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/invoice_app_data.dart';

class InvoiceRecalculation extends AbstractRecalculation {
  InvoiceAppData change;
  InvoiceAppData? initial;

  InvoiceRecalculation(this.change, [this.initial]);

  @override
  double getDelta() => throw UnimplementedError();

  double getPrevDelta() => initial?.hidden == true ? 0.0 : initial?.details;

  double getStateDelta(dynamic prev, dynamic curr) {
    double delta = change.hidden ? 0.0 : change.details;
    if (initial != null && prev?.uuid == curr?.uuid) {
      delta =
          change.hidden ? -initial?.details : (initial!.hidden ? change.details : change.details - initial?.details);
    }
    return delta;
  }

  void updateAccount(AccountAppData accountChange, AccountAppData? accountInitial, [bool reverse = false]) {
    double plex = reverse ? -1 : 1;
    double? diffDelta;
    if (accountInitial != null && initial != null && accountChange.uuid != accountInitial.uuid) {
      diffDelta = plex * getPrevDelta();
      HistoryData.addLog(accountInitial.uuid!, initial, 0.0, -diffDelta, initial!.uuid);
    }
    double delta = getStateDelta(accountInitial, accountChange);
    HistoryData.addLog(accountChange.uuid!, change, 0.0, delta * plex, change.uuid);
    if (diffDelta != null && accountInitial?.createdAt.isBefore(initial?.createdAt ?? DateTime.now()) == true) {
      accountInitial!.details -= plex * super.exchange.reform(diffDelta, initial?.currency, accountInitial.currency);
    }
    if (accountChange.createdAt.isBefore(change.createdAt)) {
      accountChange.details += plex * super.exchange.reform(delta, change.currency, accountChange.currency);
    }
  }
}
