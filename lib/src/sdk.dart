/* This is free and unencumbered software released into the public domain. */

import 'package:meta/meta.dart' show required;

////////////////////////////////////////////////////////////////////////////////

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

class Peer {
  Peer({@required this.id, this.name, this.status});

  final String id;
  final String name;
  final PeerStatus status;

  factory Peer.fromMap(final Map<dynamic, dynamic> map) {
    return Peer(id: map['id'], name: map['name'], status: PeerStatus.values[map['status'] ?? 0]);
  }

  @override
  String toString() {
    return "Peer(id: $id, name: $name, status: $status)";
  }
}
