// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/currency_app_data.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/delayed_call.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class CurrencyExchangeInput extends StatefulWidget {
  final Currency? target;
  final List<Currency?> source;
  final double width;
  final double indent;
  final double? targetAmount;
  final AppData state;

  const CurrencyExchangeInput({
    super.key,
    required this.state,
    required this.width,
    required this.indent,
    required this.target,
    required this.targetAmount,
    required this.source,
  });

  @override
  CurrencyExchangeInputState createState() => CurrencyExchangeInputState();
}

class CurrencyExchangeInputState extends State<CurrencyExchangeInput> {
  Map<int, CurrencyAppData> rate = <int, CurrencyAppData>{};
  Map<int, double?> amount = <int, double?>{};
  double? targetAmount;

  String getKey(int index) {
    final String from = widget.target?.code ?? '?';
    final String to = widget.source[index]?.code ?? '?';
    return index > 0 ? '$from-$to' : '$to-$from';
  }

  double? getAmount(index) {
    double? value = rate[index]?.details;
    if (value != null && widget.targetAmount != null) {
      value *= (index > 0 ? amount[index - 1] : widget.targetAmount)!;
    } else {
      value = null;
    }
    return value;
  }

  void recalculate() {
    targetAmount = widget.targetAmount;
    for (int idx = 0; idx < widget.source.length; idx++) {
      final String uuid = getKey(idx);
      rate[idx] = widget.state.getByUuid(uuid) ??
          CurrencyAppData(
            currency: idx > 0 ? widget.source[idx] : widget.target,
            currencyFrom: idx > 0 ? widget.target : widget.source[idx],
          );
      amount[idx] = getAmount(idx);
    }
  }

  void onUpdate(String? newValue, int index, bool isTotal) {
    if (widget.targetAmount == null && isTotal) {
      return;
    }
    final delay = DelayedCall(1000);
    delay.run(() => setState(() {
          final value = double.tryParse(newValue ?? '') ?? 0.0;
          if (isTotal) {
            amount[index] = value;
            rate[index]?.details = value /
                (index > 0 && amount[index - 1]! > 0
                    ? amount[index - 1]
                    : widget.targetAmount)!;
          } else {
            rate[index]?.details = value;
            amount[index] = getAmount(index);
          }
          widget.state.update(
              AppDataType.currencies, rate[index]!.uuid, rate[index], true);
        }));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.source.isEmpty) {
      return const SizedBox();
    }
    if (targetAmount != widget.targetAmount) {
      Future.delayed(Duration.zero, () => setState(recalculate));
    }
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: List<Widget>.generate(widget.source.length, (index) {
        if (widget.source[index] == null ||
            widget.source[index]?.code == widget.target?.code) {
          return const SizedBox();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: widget.width,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withOpacity(0.6)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      AppLocalizations.of(context)!.currencyExchange(
                        (index > 0
                                ? widget.target?.code
                                : widget.source[index]?.code) ??
                            '?',
                        (index > 0
                                ? widget.source[index]?.code
                                : widget.target?.code) ??
                            '?',
                      ),
                      style: textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        widget.indent, 0, widget.indent, widget.indent),
                    child: RowWidget(
                      indent: widget.indent,
                      maxWidth: widget.width - widget.indent * 3,
                      chunk: const [0.5, 0.49],
                      children: [
                        [
                          Text(
                            AppLocalizations.of(context)!.conversion,
                            style: textTheme.bodyLarge,
                          ),
                          SimpleInput(
                            value: rate[index]?.details.toString(),
                            type: const TextInputType.numberWithOptions(
                                decimal: true),
                            setState: (v) => onUpdate(v, index, false),
                          )
                        ],
                        [
                          Text(
                            AppLocalizations.of(context)!.conversionMessage(
                                widget.source[index]?.code ?? '?'),
                            style: textTheme.bodyLarge,
                          ),
                          SimpleInput(
                            value: amount[index] != null
                                ? amount[index].toString()
                                : '',
                            type: const TextInputType.numberWithOptions(
                                decimal: true),
                            setState: (v) => onUpdate(v, index, true),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: widget.indent),
          ],
        );
      }),
    );
  }
}
