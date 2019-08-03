/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel, PlatformException;
import 'package:meta/meta.dart' show required;

////////////////////////////////////////////////////////////////////////////////

const MethodChannel _global = const MethodChannel('app.conreality/developer');

////////////////////////////////////////////////////////////////////////////////

/// PeerStatus
enum PeerStatus {
  Unknown,
  Discovered,
  Connecting,
  Connected,
  ConnectionRejected,
  ConnectionFailed,
  Disconnected,
  Lost
}

////////////////////////////////////////////////////////////////////////////////

/// Peer
class Peer {
  Peer({@required this.id, this.name, this.status, this.lastSeen});

  final String id;
  final String name;
  final PeerStatus status;
  final DateTime lastSeen;

  factory Peer.fromMap(final Map<dynamic, dynamic> map) {
    return Peer(
      id: map['id'],
      name: map['name'],
      status: PeerStatus.values[map['status'] ?? 0],
      lastSeen: map.containsKey('lastSeen') ? DateTime.fromMillisecondsSinceEpoch(map['lastSeen'], isUtc: true) : null,
    );
  }

  @override
  String toString() {
    return "Peer(id: $id, name: $name, status: $status, lastSeen: $lastSeen)";
  }
}

////////////////////////////////////////////////////////////////////////////////

/// PeerMesh
abstract class PeerMesh {
  static Future<Set<Peer>> getPeers() async {
    return (await _global.invokeMethod('PeerMesh.getPeers') as List<dynamic>)
        .cast<Map<dynamic, dynamic>>()
        .map((map) => Peer.fromMap(map))
        .toSet();
  }

  static Future<bool> requestPermissions() {
    return _global.invokeMethod('PeerMesh.requestPermissions');
  }

  static Future<bool> start() {
    return _global.invokeMethod('PeerMesh.start');
  }

  static Future<bool> stop() {
    return _global.invokeMethod('PeerMesh.stop');
  }

  static Future<bool> startAdvertising() {
    return _global.invokeMethod('PeerMesh.startAdvertising');
  }

  static Future<bool> stopAdvertising() {
    return _global.invokeMethod('PeerMesh.stopAdvertising');
  }

  static Future<bool> startDiscovery() {
    return _global.invokeMethod('PeerMesh.startDiscovery');
  }

  static Future<bool> stopDiscovery() {
    return _global.invokeMethod('PeerMesh.stopDiscovery');
  }
}
