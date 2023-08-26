// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/currency/currency_provider.dart';
import 'package:app_finance/_classes/structure/currency_app_data.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

class CurrencyExchangeInput extends StatefulWidget {
  final Currency? target;
  final List<Currency?> source;
  final double width;
  final double indent;
  final double? targetAmount;
  final AppData state;
  final List<List<String?>> conversion = [];

  CurrencyExchangeInput({
    super.key,
    required this.state,
    required this.width,
    required this.indent,
    required this.target,
    required this.targetAmount,
    required this.source,
  }) {
    conversion.add([target?.code, source.first?.code]);
    for (int i = 0; i < source.length - 1; i++) {
      conversion.add([source[i]?.code, source[i + 1]?.code]);
    }
  }

  @override
  CurrencyExchangeInputState createState() => CurrencyExchangeInputState();
}

class CurrencyExchangeInputState extends State<CurrencyExchangeInput> {
  Map<int, CurrencyAppData> rate = <int, CurrencyAppData>{};
  Map<int, double?> amount = <int, double?>{};
  Map<int, List<TextEditingController>> controllers = <int, List<TextEditingController>>{};
  double? targetAmount;
  final delay = DelayedCall(2000);

  @override
  initState() {
    super.initState();
    recalculate();
  }

  @override
  void dispose() {
    delay.cancel();
    super.dispose();
  }

  String getKey(int index) {
    return widget.conversion[index].map((v) => v ?? '?').toList().join('-');
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
            currency: CurrencyProvider.findByCode(widget.conversion[idx][1]),
            currencyFrom: CurrencyProvider.findByCode(widget.conversion[idx][0]),
          );
      amount[idx] = getAmount(idx);
      controllers[idx] = [
        TextEditingController(text: rate[idx]!.details.toString()),
        TextEditingController(text: amount[idx] != null ? amount[idx].toString() : ''),
      ];
    }
  }

  void onUpdate(String? newValue, int index, bool isTotal) {
    if (widget.targetAmount == null && isTotal || controllers[index]![isTotal ? 0 : 1].text == newValue) {
      return;
    }
    delay.run(() {
      if (mounted) {
        setState(() {
          final value = double.tryParse(newValue ?? '') ?? 0.0;
          if (isTotal) {
            amount[index] = value;
            rate[index]!.details =
                value / (index > 0 && amount[index - 1]! > 0 ? amount[index - 1] : widget.targetAmount)!;
            controllers[index]![0].text = rate[index]!.details.toString();
          } else {
            rate[index]!.details = value;
            amount[index] = getAmount(index);
            controllers[index]![1].text = amount[index] != null ? amount[index].toString() : '';
          }
        });
      }
      widget.state.update(rate[index]!.uuid, rate[index], true);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.source.isEmpty) {
      return const SizedBox();
    }
    if (targetAmount != widget.targetAmount) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(recalculate));
    }
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: List<Widget>.generate(widget.source.length, (index) {
        if (widget.source[index] == null || widget.conversion[index][0] == widget.conversion[index][1]) {
          return const SizedBox();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: widget.width,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.6)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      AppLocale.labels.currencyExchange(
                        widget.conversion[index][0] ?? '?',
                        widget.conversion[index][1] ?? '?',
                      ),
                      style: textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(widget.indent, 0, widget.indent, widget.indent),
                    child: RowWidget(
                      indent: widget.indent,
                      maxWidth: widget.width - widget.indent * 3,
                      chunk: const [0.5, 0.49],
                      children: [
                        [
                          Text(
                            AppLocale.labels.conversion,
                            style: textTheme.bodyLarge,
                          ),
                          SimpleInput(
                            controller: controllers[index]![0],
                            type: const TextInputType.numberWithOptions(decimal: true),
                            setState: (v) => onUpdate(v, index, false),
                          )
                        ],
                        [
                          Text(
                            AppLocale.labels.conversionMessage(widget.conversion[index][1] ?? '?'),
                            style: textTheme.bodyLarge,
                          ),
                          SimpleInput(
                            controller: controllers[index]![1],
                            type: const TextInputType.numberWithOptions(decimal: true),
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
