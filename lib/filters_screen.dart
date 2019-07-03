/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'main_drawer.dart' show MainDrawer;

import 'filters.dart' show FilterList;

////////////////////////////////////////////////////////////////////////////////

class FiltersScreen extends StatefulWidget {
  static const route = "/filters";

  FiltersScreen({Key key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersState();
}

////////////////////////////////////////////////////////////////////////////////

class _FiltersState extends State<FiltersScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
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
      body: Center(child: FilterList()),
    );
  }
}
