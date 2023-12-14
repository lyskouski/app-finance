// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/exchange_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';

class CurrencyExchangeInput extends StatefulWidget {
  final Currency? target;
  final List<Currency?> source;
  final double width;
  final double indent;
  final ExchangeController controller;

  const CurrencyExchangeInput({
    super.key,
    required this.width,
    required this.indent,
    required this.target,
    required this.controller,
    required this.source,
  });

  @override
  CurrencyExchangeInputState createState() => CurrencyExchangeInputState();
}

class CurrencyExchangeInputState extends State<CurrencyExchangeInput> {
  Currency? target;
  List<Currency?> source = [];

  @override
  initState() {
    _update();
    super.initState();
  }

  void _update() {
    target = widget.target;
    source = widget.source;
    widget.controller.restate(source, target);
  }

  String _convert(List<Currency?> val) => val.map((e) => e?.code ?? '-').join('');

  @override
  Widget build(BuildContext context) {
    if (target?.code != widget.target?.code || _convert(source) != _convert(widget.source)) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(_update));
      return ThemeHelper.emptyBox;
    }
    if (target == null || source.isEmpty || source.where((v) => v != null).isEmpty) {
      return ThemeHelper.emptyBox;
    }
    final TextTheme textTheme = context.textTheme;
    return Column(
      children: List<Widget>.generate(widget.source.length, (index) {
        final scope = widget.controller.get(index);
        if (source[index] == null || scope.from == scope.to) {
          return ThemeHelper.emptyBox;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: widget.width,
              decoration: BoxDecoration(
                border: Border.all(color: context.colorScheme.inversePrimary.withOpacity(0.6)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(AppLocale.labels.currencyExchange(scope.from, scope.to),
                      style: textTheme.bodyLarge?.copyWith(
                        color: context.colorScheme.primary,
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(widget.indent, 0, widget.indent, 0),
                    child: RowWidget(
                      indent: widget.indent,
                      maxWidth: widget.width - 2 * widget.indent - 2,
                      chunk: const [0.5, null],
                      children: [
                        [
                          InputWrapper.text(
                            title: AppLocale.labels.conversion,
                            controller: scope.rate,
                            tooltip: '${scope.to} ${AppLocale.labels.conversion}',
                            inputType: const TextInputType.numberWithOptions(decimal: true),
                            formatter: [SimpleInputFormatter.filterDouble],
                          ),
                        ],
                        [
                          InputWrapper.text(
                            title: AppLocale.labels.conversionMessage(scope.to),
                            controller: scope.sum,
                            tooltip: '${scope.from} ${AppLocale.labels.conversionMessage(scope.to)}',
                            inputType: const TextInputType.numberWithOptions(decimal: true),
                            formatter: [SimpleInputFormatter.filterDouble],
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
