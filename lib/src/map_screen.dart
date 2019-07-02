/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_map/conreality_map.dart' show LatLng, Map;

////////////////////////////////////////////////////////////////////////////////

class MapScreen extends StatefulWidget {
  static const route = "/widgets/map";

  MapScreen({Key key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapState();
}

////////////////////////////////////////////////////////////////////////////////

class _MapState extends State<MapScreen> {
  final LatLng _initialLocation = LatLng(49.807051, 24.080894);
  Stream<LatLng> _currentLocation;

  @override
  void initState() {
    super.initState();
    _currentLocation = Stream<LatLng>.periodic(Duration(seconds: 1), (int computationCount) {
      return LatLng(_initialLocation.latitude + ((computationCount / 10000.0) % 360).toDouble(), _initialLocation.longitude + ((computationCount / 10000.0) % 360).toDouble()); // TODO
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
          initialLocation: _initialLocation,
          currentLocation: _currentLocation,
        ),
      ),
    );
  }
}
