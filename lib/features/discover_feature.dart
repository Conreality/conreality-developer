/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Timer;

import 'package:flutter/material.dart';

import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

import '../src/gdk.dart' show GDK;

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
  Map<String, String> _peers;

  @override
  void initState() {
    super.initState();
    _initAdvertisingAndDiscovery();
  }

  void _initAdvertisingAndDiscovery() async {
    print(await GDK.requestPermissions());
    print(await GDK.start());
    _timer = Timer.periodic(Duration(seconds: 1), (final Timer timer) async {
      final peers = await GDK.getPeers();
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
    print(await GDK.stop());
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discovery"),
        actions: <Widget>[].where((element) => element != null).toList(),
      ),
      body: Center(
        child: PeerList(_peers),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class PeerList extends StatelessWidget {
  PeerList(this.peers, {Key key}) : super(key: key);

  Map<String, String> peers;

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: peers?.length ?? 0,
      itemBuilder: (final BuildContext context, final int index) {
        final peerID = peers.keys.elementAt(index);
        final peerName = peers[peerID];
        return GestureDetector(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(peerName ?? "Unknown"),
            subtitle: Text(peerID ?? "N/A"),
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
