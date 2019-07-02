/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'main_drawer.dart' show MainDrawer;

import 'src/sensor_list.dart' show SensorList;

////////////////////////////////////////////////////////////////////////////////

class SensorsScreen extends StatefulWidget {
  static const route = "/sensors";

  SensorsScreen({Key key}) : super(key: key);

  @override
  State<SensorsScreen> createState() => _SensorsState();
}

////////////////////////////////////////////////////////////////////////////////

class _SensorsState extends State<SensorsScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sensors"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      drawer: MainDrawer(),
      body: Center(child: SensorList()),
    );
  }
}
