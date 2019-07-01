/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_map/conreality_map.dart';

////////////////////////////////////////////////////////////////////////////////

class MapScreen extends StatefulWidget {
  static const route = "/widgets/map";

  MapScreen({Key key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapState();
}

////////////////////////////////////////////////////////////////////////////////

class _MapState extends State<MapScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Text("TODO")), // TODO
    );
  }
}
