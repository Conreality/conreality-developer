/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////

class ScriptsScreen extends StatefulWidget {
  static const route = "/scripts";

  ScriptsScreen({Key key}) : super(key: key);

  @override
  State<ScriptsScreen> createState() => _ScriptsState();
}

////////////////////////////////////////////////////////////////////////////////

class _ScriptsState extends State<ScriptsScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scripts"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Text("TODO")), // TODO
    );
  }
}
