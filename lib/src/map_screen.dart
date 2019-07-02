/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_map/conreality_map.dart' show Map;
import 'package:latlong/latlong.dart' show LatLng;

////////////////////////////////////////////////////////////////////////////////

class MapScreen extends StatefulWidget {
  static const route = "/widgets/map";

  MapScreen({Key key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapState();
}

////////////////////////////////////////////////////////////////////////////////

class _MapState extends State<MapScreen> {
  Stream<LatLng> _stream;

  @override
  void initState() {
    super.initState();
    _stream = Stream<LatLng>.periodic(Duration(seconds: 1), (int computationCount) {
      return LatLng((computationCount % 360).toDouble(), 0); // TODO
    });
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(
        child: Map(
          stream: _stream,
        ),
      ),
    );
  }
}
