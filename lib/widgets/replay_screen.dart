/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_replay/conreality_replay.dart';

////////////////////////////////////////////////////////////////////////////////

class ReplayScreen extends StatefulWidget {
  static const route = "/widgets/replay";

  ReplayScreen({Key key}) : super(key: key);

  @override
  State<ReplayScreen> createState() => _ReplayState();
}

////////////////////////////////////////////////////////////////////////////////

class _ReplayState extends State<ReplayScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Replay"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Container()), // TODO
    );
  }
}
