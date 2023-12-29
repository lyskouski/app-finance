// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_sync.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/table_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SyncTab extends StatefulWidget {
  const SyncTab({
    super.key,
  });

  @override
  SyncTabState createState() => SyncTabState();
}

class SyncTabState extends State<SyncTab> {
  final _controller = TextEditingController();
  final _scroll = ScrollController();
  late AppSync sync;
  late AppData dataProvider;
  List<String> request = [];
  bool loading = false;

  @override
  void dispose() {
    _controller.dispose();
    sync.unfollow(runtimeType);
    super.dispose();
  }

  void ping(Uint8List id) {
    final uuid = String.fromCharCodes(id);
    if (sync.getPeers().where((e) => e.id == uuid).isEmpty) {
      setState(() => request.add(uuid));
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocale.labels.pongStatus(uuid))),
    );
  }

  void synchronize() {
    setState(() => loading = true);
    dataProvider.getList(AppDataType.bills).forEach((o) => sync.send(o.toStream()));
    dataProvider.getList(AppDataType.invoice).forEach((o) => sync.send(o.toStream()));
    dataProvider.getList(AppDataType.budgets).forEach((o) => sync.send(o.toStream()));
    dataProvider.getList(AppDataType.accounts).forEach((o) => sync.send(o.toStream()));
    dataProvider.getList(AppDataType.currencies).forEach((o) => sync.send(o.toStream()));
    setState(() => loading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocale.labels.peerSent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final indent = ThemeHelper.getIndent();
    return Consumer<AppSync>(builder: (context, appSync, _) {
      sync = appSync..followBinary(runtimeType, ping);
      dataProvider = Provider.of<AppData>(context, listen: false);
      final data = sync.getPeers();
      return LayoutBuilder(builder: (context, constraints) {
        double width = ThemeHelper.getWidth(context, 4, constraints);
        if (ThemeHelper.isNavRight(context, constraints)) {
          width -= ThemeHelper.barHeight;
        }
        return SingleChildScrollView(
          controller: _scroll,
          child: Padding(
            padding: EdgeInsets.all(indent),
            child: Column(
              mainAxisAlignment: AppDesign.getAlignment<MainAxisAlignment>(),
              children: [
                RowWidget(
                  maxWidth: width,
                  alignment: MainAxisAlignment.spaceBetween,
                  indent: indent,
                  chunk: const [null, 85],
                  children: [
                    [
                      Text(
                        AppLocale.labels.peerId,
                        style: textTheme.bodyLarge,
                      ),
                      Container(
                        padding: EdgeInsets.all(indent),
                        color: context.colorScheme.fieldBackground,
                        child: SelectableText(
                          sync.getUuid() ?? AppLocale.labels.pearDisabled,
                          style: textTheme.bodyLarge,
                        ),
                      ),
                    ],
                    [
                      Text(
                        sync.isActive() ? AppLocale.labels.peerOnline : AppLocale.labels.peerClosed,
                        style: textTheme.bodyLarge,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Switch(
                          value: sync.isActive(),
                          onChanged: (value) => setState(() => value ? sync.enable() : sync.disable()),
                        ),
                      ),
                    ],
                  ],
                ),
                ThemeHelper.hIndent2x,
                if (sync.isActive())
                  loading
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(AppLocale.labels.pearLoading),
                            LoadingWidget(isLoading: loading, size: const Size(48, 48)),
                          ],
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: FloatingActionButton(
                            heroTag: 'sync_tab_sync',
                            onPressed: synchronize,
                            tooltip: AppLocale.labels.peerSync,
                            child: Text(AppLocale.labels.peerSync),
                          ),
                        ),
                ThemeHelper.hIndent4x,
                TableWidget(
                  width: width,
                  shadowColor: context.colorScheme.onBackground.withOpacity(0.1),
                  chunk: const [80, null, 80, 90],
                  data: [
                    [
                      Center(child: Text(AppLocale.labels.peerAction)),
                      TextWrapper(AppLocale.labels.peerDevice),
                      TextWrapper(AppLocale.labels.peerStatus),
                      Center(child: Text(AppLocale.labels.peerAction)),
                    ],
                    ...List.generate(data.length, (index) {
                      String status = switch (data[index].status) {
                        true => AppLocale.labels.peerOnline,
                        false => AppLocale.labels.peerClosed,
                        _ => AppLocale.labels.peerOffline,
                      };
                      return <Widget>[
                        ElevatedButton(
                          onPressed: () => sync.del(data[index].id),
                          child: Text(AppLocale.labels.peerDelete),
                        ),
                        TextWrapper(data[index].id),
                        TextWrapper(status),
                        data[index].status == true
                            ? ElevatedButton(
                                onPressed: () => sync.ping(data[index].id),
                                child: Text(AppLocale.labels.peerPing),
                              )
                            : ElevatedButton(
                                onPressed: () => sync.trace(data[index].id),
                                child: Text(AppLocale.labels.peerConnectBtn),
                              ),
                      ];
                    }),
                    ...List.generate(request.length, (index) {
                      return <Widget>[
                        ElevatedButton(
                          onPressed: () => setState(() => request.remove(request[index])),
                          child: Text(AppLocale.labels.peerDelete),
                        ),
                        TextWrapper(request[index]),
                        TextWrapper(AppLocale.labels.peerPending),
                        ElevatedButton(
                          onPressed: () => setState(() {
                            sync.add(request[index]);
                            request.remove(request[index]);
                          }),
                          child: Text(AppLocale.labels.peerAccept),
                        ),
                      ];
                    }),
                  ],
                ),
                if (sync.isActive()) ...[
                  ThemeHelper.hIndent4x,
                  Text(
                    AppLocale.labels.peerOtherId,
                    style: textTheme.bodyLarge,
                  ),
                  SimpleInput(controller: _controller),
                  ThemeHelper.hIndent2x,
                  SizedBox(
                    width: double.infinity,
                    child: FloatingActionButton(
                      heroTag: 'sync_tab_add',
                      onPressed: () => sync.add(_controller.text),
                      tooltip: AppLocale.labels.peerConnect,
                      child: Text(AppLocale.labels.peerConnect),
                    ),
                  ),
                ],
                ThemeHelper.formEndBox,
              ],
            ),
          ),
        );
      });
    });
  }
}
