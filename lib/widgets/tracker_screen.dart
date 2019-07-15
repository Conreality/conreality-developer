/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Stream;

import 'package:flutter/material.dart';

import 'package:conreality_beacon/conreality_beacon.dart';
import 'package:conreality_fonts/conreality_fonts.dart' show B612;
import 'package:conreality_tracker/conreality_tracker.dart' show DistanceTracker;

////////////////////////////////////////////////////////////////////////////////

class TrackerScreen extends StatefulWidget {
  static const route = "/widgets/tracker";

  TrackerScreen({Key key}) : super(key: key);

  @override
  State<TrackerScreen> createState() => _TrackerState();
}

////////////////////////////////////////////////////////////////////////////////

class _TrackerState extends State<TrackerScreen> {
  Stream<double> _stream;

  @override
  void initState() {
    super.initState();
    _initStream();
  }

  void _initStream() async {
    final Stream<BeaconScan> stream = await Beacons.scan();
    if (stream == null) return;
    setState(() {
      _stream = stream
          .where((final BeaconScan scan) => scan.isNotEmpty)
          .map((final BeaconScan scan) {
            final beacons = scan.beacons;
            beacons.sort(
                (b1, b2) => b1.estimatedDistance.compareTo(b2.estimatedDistance));
            return beacons.first.estimatedDistance;
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _stream = null;
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tracker"),
        actions: <Widget>[].where((element) => element != null).toList(),
      ),
      body: Center(
        child: DistanceTracker(
          unit: "meters",
          stream: _stream,
          fontFamily: B612.fontFamily,
        ),
      ),
    );
  }
}
