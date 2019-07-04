/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_icons/conreality_icons.dart';

////////////////////////////////////////////////////////////////////////////////

class IconsScreen extends StatefulWidget {
  static const route = "/widgets/icons";

  IconsScreen({Key key}) : super(key: key);

  @override
  State<IconsScreen> createState() => _IconsState();
}

////////////////////////////////////////////////////////////////////////////////

class _IconsState extends State<IconsScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icons"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Container()), // TODO
    );
  }
}
