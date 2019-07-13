/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_beacon/conreality_beacon.dart' show ConrealityBeacon;
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

////////////////////////////////////////////////////////////////////////////////

class BeaconScreen extends StatefulWidget {
  static const route = "/plugins/beacon";

  BeaconScreen({Key key}) : super(key: key);

  @override
  State<BeaconScreen> createState() => _BeaconState();
}

////////////////////////////////////////////////////////////////////////////////

class _BeaconState extends State<BeaconScreen> {
  @override
  void initState() {
    super.initState();
    // TODO
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beacon"),
        actions: <Widget>[
          IconButton(
            icon: Text(ConrealityBeacon.version),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      body: Center(
        child: Icon(ConrealityIcons.beacon, size: 320), // TODO
      ),
    );
  }
}
