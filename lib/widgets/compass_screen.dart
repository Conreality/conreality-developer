/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_compass/conreality_compass.dart' show Compass;
import 'package:conreality_fonts/conreality_fonts.dart' show B612;

////////////////////////////////////////////////////////////////////////////////

class CompassScreen extends StatefulWidget {
  static const route = "/widgets/compass";

  CompassScreen({Key key}) : super(key: key);

  @override
  State<CompassScreen> createState() => _CompassState();
}

////////////////////////////////////////////////////////////////////////////////

class _CompassState extends State<CompassScreen> {
  Stream<int> _stream;

  @override
  void initState() {
    super.initState();
    _stream = Stream<int>.periodic(Duration(seconds: 1), (int computationCount) {
      return computationCount % 360; // TODO
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
        title: Text("Compass"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(
        child: Compass(
          stream: _stream,
          fontFamily: B612.fontFamily,
        ),
      ),
    );
  }
}
