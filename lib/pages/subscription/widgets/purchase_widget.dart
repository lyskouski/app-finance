// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/purchase_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/_widgets/generic/loading_widget.dart';
import 'package:app_finance/pages/_widgets/generic/notification_bar.dart';
import 'package:app_finance/pages/_widgets/wrapper/row_widget.dart';
import 'package:app_finance/pages/_widgets/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter_grid_layout/flutter_grid_layout.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseWidget extends StatefulWidget {
  final String path;
  final ProductDetails? product;
  final List<PurchaseDetails>? purchase;
  final double size;
  final String title;

  const PurchaseWidget(this.path, {super.key, required this.title, this.product, this.purchase, this.size = 150});

  @override
  PurchaseWidgetState createState() => PurchaseWidgetState();
}

class PurchaseWidgetState extends State<PurchaseWidget> {
  bool isLoading = false;

  Future<void> _purchase() async {
    if (widget.product == null) {
      NotificationBar.showSnackBar(context, AppLocale.labels.subscriptionInactive, true);
    } else {
      setState(() => isLoading = true);
      await PurchaseController.buy(widget.product!);
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent(0.5);
    final cost = widget.product?.rawPrice.toCurrency(code: widget.product?.currencyCode, withPattern: false) ?? '---';
    final costWidth = ThemeHelper.getTextWidth(Text(cost));
    return InkWell(
      onTap: _purchase,
      child: Container(
        width: widget.size,
        height: widget.size,
        margin: EdgeInsets.all(indent),
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.secondary.withOpacity(0.1),
              spreadRadius: indent / 2,
              blurRadius: indent,
              offset: Offset(0, indent / 2),
            ),
          ],
        ),
        child: isLoading
            ? LoadingWidget(isLoading: isLoading, size: Size(widget.size, widget.size))
            : GridContainer(
                rows: const [40, null, 40],
                columns: const [40, null, 34],
                children: [
                  GridItem(
                    start: const Size(0, 0),
                    end: const Size(4, 4),
                    child: SizedBox(
                      child: ClipPath(
                        clipper: _TopRightClipper(),
                        child: Image.asset(widget.path),
                      ),
                    ),
                  ),
                  GridItem(
                    start: const Size(2, 0),
                    end: const Size(3, 1),
                    child: Icon(
                      switch (widget.purchase?.last.status) {
                        PurchaseStatus.purchased => Icons.check,
                        PurchaseStatus.pending => Icons.pending,
                        _ => Icons.add
                      },
                      color: context.colorScheme.secondary.withOpacity(0.3),
                    ),
                  ),
                  GridItem(
                    start: const Size(0, 2),
                    end: const Size(3, 3),
                    order: 2,
                    child: Container(
                        color: context.colorScheme.background.withOpacity(0.9),
                        padding: EdgeInsets.all(indent),
                        child: RowWidget(
                          chunk: [null, costWidth],
                          indent: indent,
                          alignment: MainAxisAlignment.spaceBetween,
                          maxWidth: widget.size - indent * 2,
                          children: [
                            [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextWrapper(widget.title, maxLines: 2, style: context.textTheme.bodySmall)),
                            ],
                            [
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextWrapper(cost, style: context.textTheme.numberMedium),
                              ),
                            ],
                          ],
                        )),
                  ),
                ],
              ),
      ),
    );
  }
}

class _TopRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width / 3, 0)
      ..quadraticBezierTo(size.width * 3 / 4, 0, size.width, size.height / 2.5)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
