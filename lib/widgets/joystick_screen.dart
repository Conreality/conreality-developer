/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_joystick/conreality_joystick.dart';

////////////////////////////////////////////////////////////////////////////////

class JoystickScreen extends StatefulWidget {
  static const route = "/widgets/joystick";

  JoystickScreen({Key key}) : super(key: key);

  @override
  State<JoystickScreen> createState() => _JoystickState();
}

////////////////////////////////////////////////////////////////////////////////

class _JoystickState extends State<JoystickScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joystick"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Container()), // TODO
    );
  }
}
