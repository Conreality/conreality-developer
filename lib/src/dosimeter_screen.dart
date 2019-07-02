/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_dosimeter/conreality_dosimeter.dart' show Dosimeter;

////////////////////////////////////////////////////////////////////////////////

class DosimeterScreen extends StatefulWidget {
  static const route = "/widgets/dosimeter";

  DosimeterScreen({Key key}) : super(key: key);

  @override
  State<DosimeterScreen> createState() => _DosimeterState();
}

////////////////////////////////////////////////////////////////////////////////

class _DosimeterState extends State<DosimeterScreen> {
  Stream<double> _stream;

  @override
  void initState() {
    super.initState();
    _stream = Stream<double>.periodic(Duration(seconds: 1), (int computationCount) {
      return computationCount.toDouble(); // TODO
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
        title: Text("Dosimeter"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(
        child: Dosimeter(
          unit: "mrem/h",
          stream: _stream,
        ),
      ),
    );
  }
}
