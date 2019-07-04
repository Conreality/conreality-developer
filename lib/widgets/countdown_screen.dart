/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_countdown/conreality_countdown.dart';

////////////////////////////////////////////////////////////////////////////////

class CountdownScreen extends StatefulWidget {
  static const route = "/widgets/countdown";

  CountdownScreen({Key key}) : super(key: key);

  @override
  State<CountdownScreen> createState() => _CountdownState();
}

////////////////////////////////////////////////////////////////////////////////

class _CountdownState extends State<CountdownScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countdown"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Container()), // TODO
    );
  }
}
