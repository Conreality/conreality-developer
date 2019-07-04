/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_gamepad/conreality_gamepad.dart';

////////////////////////////////////////////////////////////////////////////////

class GamepadScreen extends StatefulWidget {
  static const route = "/widgets/gamepad";

  GamepadScreen({Key key}) : super(key: key);

  @override
  State<GamepadScreen> createState() => _GamepadState();
}

////////////////////////////////////////////////////////////////////////////////

class _GamepadState extends State<GamepadScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gamepad"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Container()), // TODO
    );
  }
}
