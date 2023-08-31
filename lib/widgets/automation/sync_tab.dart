// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_sync.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_forms/simple_input.dart';
import 'package:app_finance/widgets/_wrappers/table_widget.dart';
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
  late final id = runtimeType.toString();
  late AppSync sync;
  List<String> request = [];

  @override
  void dispose() {
    _controller.dispose();
    AppSync.unfollow(id);
    super.dispose();
  }

  @override
  void initState() {
    AppSync.followBinary(id, (Uint8List id) {
      final uuid = String.fromCharCodes(id);
      if (sync.getPeers().where((e) => e.id == uuid).isEmpty) {
        setState(() => request.add(uuid));
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocale.labels.pongStatus(uuid))),
      );
    });
    super.initState();
  }

  void disconnect(String uuid) => sync.del(uuid);
  void closeConnection() => sync.disable();
  void reconnect() => sync.enable();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Consumer<AppSync>(builder: (context, appSync, _) {
      sync = appSync;
      final data = sync.getPeers();
      return SingleChildScrollView(
        controller: _scroll,
        child: Padding(
          padding: EdgeInsets.all(ThemeHelper.getIndent()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppLocale.labels.peerId,
                style: textTheme.bodyLarge,
              ),
              Container(
                padding: EdgeInsets.all(ThemeHelper.getIndent()),
                color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
                child: SelectableText(sync.getUuid(), style: textTheme.bodyLarge),
              ),
              ThemeHelper.hIndent4x,
              TableWidget(
                width: ThemeHelper.getWidth(context),
                shadowColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                chunk: const [80, null, 80, 90],
                data: [
                  [
                    Center(child: Text(AppLocale.labels.peerAction)),
                    Text(AppLocale.labels.peerDevice),
                    Text(AppLocale.labels.peerStatus),
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
                      Text(data[index].id, maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text(status),
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
                      Text(request[index], maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text(AppLocale.labels.peerPending),
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
              ThemeHelper.formEndBox,
            ],
          ),
        ),
      );
    });
  }
}
