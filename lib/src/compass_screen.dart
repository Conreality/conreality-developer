/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_compass/conreality_compass.dart';

////////////////////////////////////////////////////////////////////////////////

class CompassScreen extends StatefulWidget {
  static const route = "/widgets/compass";

  CompassScreen({Key key}) : super(key: key);

  @override
  State<CompassScreen> createState() => _CompassState();
}

////////////////////////////////////////////////////////////////////////////////

class _CompassState extends State<CompassScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compass"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Text("TODO")), // TODO
    );
  }
}
