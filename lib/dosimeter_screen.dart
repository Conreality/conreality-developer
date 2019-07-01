/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_dosimeter/dosimeter.dart' show Dosimeter;

////////////////////////////////////////////////////////////////////////////////

class DosimeterScreen extends StatefulWidget {
  static const route = "/widgets/dosimeter";

  DosimeterScreen({Key key}) : super(key: key);

  @override
  State<DosimeterScreen> createState() => _DosimeterState();
}

////////////////////////////////////////////////////////////////////////////////

class _DosimeterState extends State<DosimeterScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dosimeter"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Dosimeter()), // TODO
    );
  }
}
