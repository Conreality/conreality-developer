/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_logo/conreality_logo.dart';

////////////////////////////////////////////////////////////////////////////////

class LogoScreen extends StatefulWidget {
  static const route = "/widgets/logo";

  LogoScreen({Key key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoState();
}

////////////////////////////////////////////////////////////////////////////////

class _LogoState extends State<LogoScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logo"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Container()), // TODO
    );
  }
}
