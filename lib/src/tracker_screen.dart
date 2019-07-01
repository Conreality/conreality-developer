/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_tracker/conreality_tracker.dart';

////////////////////////////////////////////////////////////////////////////////

class TrackerScreen extends StatefulWidget {
  static const route = "/widgets/tracker";

  TrackerScreen({Key key}) : super(key: key);

  @override
  State<TrackerScreen> createState() => _TrackerState();
}

////////////////////////////////////////////////////////////////////////////////

class _TrackerState extends State<TrackerScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tracker"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Text("TODO")), // TODO
    );
  }
}
