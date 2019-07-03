/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'main_drawer.dart' show MainDrawer;

import 'src/plugin_list.dart' show PluginList;

////////////////////////////////////////////////////////////////////////////////

class PluginsScreen extends StatefulWidget {
  static const route = "/plugins";

  PluginsScreen({Key key}) : super(key: key);

  @override
  State<PluginsScreen> createState() => _PluginsState();
}

////////////////////////////////////////////////////////////////////////////////

class _PluginsState extends State<PluginsScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plugins"),
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
      body: Center(child: PluginList()),
    );
  }
}
