/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Stream, StreamSubscription;

import 'package:flutter/material.dart';

import 'package:conreality_beacon/conreality_beacon.dart';
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;

////////////////////////////////////////////////////////////////////////////////

class BeaconScreen extends StatefulWidget {
  static const route = "/plugins/beacon";

  BeaconScreen({Key key}) : super(key: key);

  @override
  State<BeaconScreen> createState() => _BeaconState();
}

////////////////////////////////////////////////////////////////////////////////

class _BeaconState extends State<BeaconScreen> {
  StreamSubscription<BeaconScan> _subscription;
  BeaconScan _latestScan;

  @override
  void initState() {
    super.initState();
    _initSubscription();
  }

  void _initSubscription() async {
    final Stream<BeaconScan> stream = await Beacons.scan();
    if (stream != null) {
      _subscription = stream.listen((final BeaconScan scan) {
        print(scan); // DEBUG
        if (scan.isEmpty) return;
        if (mounted) {
          setState(() {
            _latestScan = scan;
          });
        }
      });
    }
  }

  @override
  void dispose() async {
    super.dispose();
    await _subscription?.cancel();
    _subscription = null;
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
      body: Center(child: (_latestScan != null) ? BeaconList(scan: _latestScan) : Container()),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class BeaconList extends StatelessWidget {
  BeaconList({@required this.scan});

  final BeaconScan scan;

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: scan.beacons.length,
      itemBuilder: (final BuildContext context, final int index) {
        final beacon = scan.beacons[index];
        final beaconProtocolLabel = getBeaconProtocolLabel(beacon.protocol);
        return GestureDetector(
          child: ListTile(
            leading: Icon(ConrealityIcons.beacon),
            subtitle: Text("$beaconProtocolLabel (${beacon.measuredRSSI.toStringAsFixed(0)} dBm)"),
            title: Row(
              children: <Widget>[
                Text("${beacon.id2} ${beacon.id3}"),
                Icon(MdiIcons.circleMedium, color: beacon.signalColor),
              ],
            ),
            trailing: Text("${beacon.estimatedDistance.toStringAsFixed(1)} m"),
            dense: true,
          ),
          onTap: () {}, // TODO
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }
}
