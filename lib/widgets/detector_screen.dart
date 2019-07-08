/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_detector/conreality_detector.dart';

////////////////////////////////////////////////////////////////////////////////

class DetectorScreen extends StatefulWidget {
  static const route = "/widgets/detector";

  DetectorScreen({Key key}) : super(key: key);

  @override
  State<DetectorScreen> createState() => _DetectorState();
}

////////////////////////////////////////////////////////////////////////////////

class _DetectorState extends State<DetectorScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detector"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Container()), // TODO
    );
  }
}
