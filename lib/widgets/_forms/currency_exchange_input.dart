// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/data/currency_app_data.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class CurrencyExchangeInput extends StatefulWidget {
  final Currency? target;
  late final List<Currency?> _source;
  final double width;
  final double indent;
  final double? targetAmount;
  final AppData state;
  late final Map<String, CurrencyAppData> rate = <String, CurrencyAppData>{};

  CurrencyExchangeInput({
    super.key,
    required this.state,
    required this.width,
    required this.indent,
    required this.target,
    required this.targetAmount,
    required source,
  }) {
    _source = source.where((elem) => elem?.code != target?.code).toList();

    for (int idx = 0; idx < _source.length; idx++) {
      final String uuid = getKey(idx);
      rate[uuid] = state.getByUuid(uuid) ??
          state.add(
            AppDataType.currencies,
            CurrencyAppData(
              currency: idx > 0 ? _source[idx] : target,
              currencyFrom: idx > 0 ? target : _source[idx],
            ),
          );
    }
  }

  String getKey(int index) {
    final String from = target?.code ?? '?';
    final String to = _source[index]?.code ?? '?';
    return index > 0 ? '$to-$from' : '$from-$to';
  }

  @override
  CurrencyExchangeInputState createState() => CurrencyExchangeInputState();
}

class CurrencyExchangeInputState extends State<CurrencyExchangeInput> {
  late AppData state;

  double getAmount(index) {
    double? value = widget.rate[widget.getKey(index)]?.details;
    if (value != null && widget.targetAmount != null) {
      value *= widget.targetAmount!;
    } else {
      value = 0.0;
    }
    return value;
  }

  @override
  void initState() {
    state = widget.state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._source.isEmpty) {
      return const SizedBox();
    }
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: List<Widget>.generate(widget._source.length, (index) {
        final double taken = getAmount(index);
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
                                : widget._source[index]?.code) ??
                            '?',
                        (index > 0
                                ? widget._source[index]?.code
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
                      maxWidth: widget.width - widget.indent * 2,
                      chunk: const [0.5, 0.49],
                      children: [
                        [
                          Text(
                            AppLocalizations.of(context)!.conversion,
                            style: textTheme.bodyLarge,
                          ),
                          SimpleInput(
                              value: widget.rate[widget.getKey(index)]?.details
                                  .toString(),
                              setState: () => {}),
                        ],
                        [
                          Text(
                            AppLocalizations.of(context)!.conversionMessage(
                                widget._source[index]?.code ?? '?'),
                            style: textTheme.bodyLarge,
                          ),
                          SimpleInput(
                              value: taken.toString(), setState: () => {}),
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
