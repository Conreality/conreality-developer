/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'main_drawer.dart' show MainDrawer;

////////////////////////////////////////////////////////////////////////////////

class WidgetsScreen extends StatefulWidget {
  static const route = "/widgets";

  WidgetsScreen({Key key}) : super(key: key);

  @override
  State<WidgetsScreen> createState() => _WidgetsState();
}

////////////////////////////////////////////////////////////////////////////////

class _WidgetsState extends State<WidgetsScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
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
      drawer: MainDrawer(),
      body: Center(child: Text("TODO")), // TODO
    );
  }
}
