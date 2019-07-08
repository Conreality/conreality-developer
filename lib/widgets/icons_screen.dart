/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

////////////////////////////////////////////////////////////////////////////////

class IconsScreen extends StatelessWidget {
  static const route = "/widgets/icons";

  IconsScreen({Key key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icons"),
        actions: <Widget>[
          IconButton(
            icon: Text(ConrealityIcons.version),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      body: Center(
        child: Container(), // TODO
      ),
    );
  }
}
