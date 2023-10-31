import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:flutter/material.dart';

class ConfirmationWrapper {
  static void show(BuildContext context, Function callback) {
    final popAction = Navigator.of(context).pop;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocale.labels.confirmHeader),
          content: Text(AppLocale.labels.confirmTooltip),
          actions: <Widget>[
            TextButton(
              onPressed: popAction,
              child: Text(AppLocale.labels.btnCancel),
            ),
            TextButton(
              onPressed: () {
                popAction();
                callback();
              },
              child: Text(AppLocale.labels.btnConfirm),
            ),
          ],
        );
      },
    );
  }
}
