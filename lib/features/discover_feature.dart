/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Timer;

import 'package:flutter/material.dart';

import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;
import 'package:timeago/timeago.dart' as timeago;

import '../src/sdk.dart';

////////////////////////////////////////////////////////////////////////////////

class DiscoverFeature extends StatefulWidget {
  static const route = "/features/discover";

  DiscoverFeature({Key key}) : super(key: key);

  @override
  State<DiscoverFeature> createState() => _DiscoverFeatureState();
}

////////////////////////////////////////////////////////////////////////////////

class _DiscoverFeatureState extends State<DiscoverFeature> {
  Timer _timer;
  Set<Peer> _peers;

  @override
  void initState() {
    super.initState();
    _initAdvertisingAndDiscovery();
  }

  void _initAdvertisingAndDiscovery() async {
    print(await PeerMesh.requestPermissions());
    print(await PeerMesh.start());
    _timer = Timer.periodic(Duration(seconds: 1), (final Timer timer) async {
      final peers = await PeerMesh.getPeers();
      print("Current peers: $peers"); // DEBUG
      if (!mounted) return;
      setState(() {
        _peers = peers;
      });
    });
  }

  @override
  void dispose() async {
    super.dispose();
    _timer.cancel();
    //print(await PeerMesh.stop());
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discovery"),
        actions: <Widget>[].where((element) => element != null).toList(),
      ),
      body: Center(
        child: PeerList(_peers?.toList()),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class PeerList extends StatelessWidget {
  PeerList(this.peers, {Key key}) : super(key: key);

  final List<Peer> peers;

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: peers?.length ?? 0,
      itemBuilder: (final BuildContext context, final int index) {
        final peer = peers.elementAt(index);
        return GestureDetector(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(peer.name ?? "Unknown"),
            subtitle: (peer.lastSeen != null) ? Text(timeago.format(peer.lastSeen)) : "N/A",
            trailing: Text(peer.status.toString().substring("PeerStatus.".length)), // TODO
          ),
          onTap: () {},
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }
}
