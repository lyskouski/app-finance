// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:flutter/foundation.dart';
import 'package:peerdart/peerdart.dart';
import 'package:uuid/uuid.dart';

class SyncStatus {
  final String id;
  bool? status;
  SyncStatus(this.id, [this.status]);
}

class SyncPeer extends SyncStatus {
  DataConnection connection;
  SyncPeer(super.id, this.connection);
}

class AppSync extends ChangeNotifier with SharedPreferencesMixin {
  late Peer peer;
  final Map<String, SyncPeer> _status = {};
  final Map<Type, Function> _cb = {};
  final Map<Type, Function> _cbBin = {};

  AppSync() : super() {
    final id = getUuid();
    if (id != null && id.isNotEmpty) {
      enable(id);
      connect();
    }
  }

  List<String> _get() {
    return getPreference(prefP2P)?.split(',').where((e) => e.isNotEmpty).toList() ?? [];
  }

  void add(String uuid) {
    List<String> peers = _get();
    peers.add(uuid);
    setPreference(prefP2P, (<String>{}..addAll(peers)).toList().join(',')).then((_) => connect());
  }

  void del(String uuid) {
    _status[uuid]!.connection.dispose();
    _status.remove(uuid);
    setPreference(prefP2P, (_get()..remove(uuid)).join(',')).then((_) => notifyListeners());
  }

  void connect() {
    List<String> peers = _get();
    for (int i = 0; i < peers.length; i++) {
      trace(peers[i]);
    }
  }

  void trace(String id) {
    if (!peer.open) {
      peer.reconnect();
    }
    if (_status[id] == null) {
      _status[id] = SyncPeer(id, peer.connect(id));
    } else if (!_status[id]!.connection.open) {
      peer.removeConnection(_status[id]!.connection);
      _status[id]!.connection = peer.connect(id);
    }
    // TBD: when connected, verify postponed messages
    _status[id]!.connection.once('open').then((v) {
      _status[id]!.status = true;
      notifyListeners();
    });
    _status[id]!.connection.once('close').then((v) {
      _status[id]!.status = false;
      notifyListeners();
    });
  }

  List<SyncStatus> getPeers() {
    return _status.values.map((e) => SyncStatus(e.id, e.status)).toList();
  }

  void follow(Type type, Function callback) => _cb[type] = callback;

  void followBinary(Type type, Function callback) => _cbBin[type] = callback;

  void unfollow(Type type) {
    _cb.remove(type);
    _cbBin.remove(type);
  }

  bool isActive() {
    return getPreference(prefPeer) != null;
  }

  void disable() {
    clearPreference(prefPeer);
    clearPreference(prefP2P);
    peer.dispose();
  }

  void enable([String? id]) {
    id ??= getUuid(true);
    peer = Peer(id: id); //, options: PeerOptions(debug: LogLevel.All));
    peer.on<DataConnection>('connection').listen(_listen);
  }

  _listen(DataConnection conn) {
    conn.on('data').listen((data) {
      _cb.forEach((_, callback) => callback(data));
    });
    conn.on('binary').listen((data) {
      _cbBin.forEach((_, callback) => callback(data));
    });
  }

  send(String data, [String? uuid]) {
    if (uuid != null) {
      if (_status[uuid] != null && _status[uuid]!.status == true) {
        _status[uuid]!.connection.send(data);
      }
    } else {
      final keyList = _status.keys.toList();
      for (int i = 0; i < keyList.length; i++) {
        if (_status[keyList[i]]!.status == true && _status[keyList[i]]!.connection.open) {
          _status[keyList[i]]!.connection.send(data);
        } else {
          // .. postpone message
        }
      }
    }
  }

  ping(String uuid) {
    if (_status[uuid] != null && _status[uuid]!.status == true) {
      _status[uuid]!.connection.sendBinary(Uint8List.fromList(getUuid()!.codeUnits));
    }
  }

  String getNewUuid() {
    return const Uuid().v4();
  }

  String? getUuid([bool force = false]) {
    String? id = getPreference(prefPeer);
    if (force) {
      setPreference(prefPeer, id = getNewUuid());
    }
    return id;
  }
}
